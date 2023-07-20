<?php
include 'config.php';
session_start();
$db = new Database();

$val_id=urlencode($_POST['val_id']);
$store_id=urlencode("shopp64a062df12730");
$store_passwd=urlencode("shopp64a062df12730@ssl");
$requested_url = ("https://sandbox.sslcommerz.com/validator/api/validationserverAPI.php?val_id=".$val_id."&store_id=".$store_id."&store_passwd=".$store_passwd."&v=1&format=json");

$handle = curl_init();
curl_setopt($handle, CURLOPT_URL, $requested_url);
curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
curl_setopt($handle, CURLOPT_SSL_VERIFYHOST, false); # IF YOU RUN FROM LOCAL PC
curl_setopt($handle, CURLOPT_SSL_VERIFYPEER, false); # IF YOU RUN FROM LOCAL PC

$result = curl_exec($handle);

$code = curl_getinfo($handle, CURLINFO_HTTP_CODE);
if($code == 200 && !( curl_errno($handle)))
{

	# TO CONVERT AS OBJECT
	$result = json_decode($result);
    // echo "<pre>";
    // print_r( $result);
    // echo "</pre>";
	// die();
	$params1 = [
		'item_number' => $_SESSION['product_id'],
		'txn_id' => $tran_id = $result->tran_id,
		'payment_gross' =>$result->amount,
		'currency_code'=>$result->currency,
		'payment_status' => $status = $result->status,
	];

	$params2 = [
		'product_id' => $_SESSION['product_id'],
		'product_qty' => $_SESSION['product_qty'],
		'total_amount' => $result->amount,
		'product_user' => $_SESSION['user_id'],
		'order_date' => date('Y-m-d'),
		'pay_req_id' => $tran_id = $result->tran_id,
	];

	$db = new Database();
	$db->insert('payments',$params1);
	$db->insert('order_products',$params2);
	$db->getResult();
    

    
}
if(isset($result->tran_id) && $result->status == 'VALID'){
	$title = 'Payment Successful';
	$response = '<div class="panel-body">
				  	<i class="fa fa-check-circle text-success"></i>
				    <h3>Payment Successful</h3>
				    <p>Your Product Will be Delivered within 4 to 7 days.</p>
				  	<a href="'.$hostname.'" class="btn btn-md btn-primary">Continue Shopping</a>
				  </div>';

	  // reduce purchased quantity from products
	    $db = new Database();
	    $db->select('order_products','product_id,product_qty',null,"pay_req_id ='$result->tran_id'",null,null);
	    $result = $db->getResult();
	    $products = array_filter(explode(',',$result[0]['product_id']));
	    $qty = array_filter(explode(',',$result[0]['product_qty']));
	    for($i=0;$i<count($products);$i++){
	    	$db->sql("UPDATE products SET qty = qty - '{$qty[$i]}' WHERE product_id = '{$products[$i]}'");
	    }
	    $res = $db->getResult();


	  // remove cart items
	  	if(isset($_COOKIE['user_cart'])){
	        setcookie('cart_count','',time() - (180),'/','','',TRUE);
			setcookie('user_cart','',time() - (180),'/','','',TRUE);
	    }
}else{
	$title = 'Payment UnSuccessful';
	$response = '<div class="panel-body">
				  	<i class="fa fa-times-circle text-danger"></i>
				    <h3>Payment Unsuccessful</h3>
				  	<a href="'.$hostname.'" class="btn btn-md btn-primary">Continue Shopping</a>
				  </div>';
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><?php echo $title; ?></title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/font-awesome.css">
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div class="payment-response">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-3 col-md-6">
					<div class="panel panel-default">
					  <?php echo $response; ?>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
