-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2023 at 01:28 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `com_logo` varchar(100) DEFAULT NULL,
  `com_name` varchar(100) NOT NULL,
  `com_email` varchar(60) NOT NULL,
  `com_phone` varchar(15) DEFAULT NULL,
  `com_address` varchar(255) DEFAULT NULL,
  `cur_format` varchar(10) NOT NULL,
  `admin_role` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `username`, `password`, `com_logo`, `com_name`, `com_email`, `com_phone`, `com_address`, `cur_format`, `admin_role`) VALUES
(2, 'ashraful', 'admin', '21232f297a57a5a743894a0e4a801fc3', NULL, 'Inventory', 'ashrfulislam222@gmail.com', NULL, NULL, 't', 1);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_title` text NOT NULL,
  `brand_cat` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`, `brand_cat`) VALUES
(13, 'Realme', 9),
(12, 'Lenovo', 9),
(11, 'LG', 9),
(10, 'Samsung', 9),
(14, 'Apple', 9),
(15, 'Lavender', 10);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL,
  `products` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`, `products`) VALUES
(9, 'Electronics', 0),
(10, 'Men', 0),
(11, 'Women', 0),
(12, 'Furniture', 0);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `s_no` int(11) NOT NULL,
  `site_name` varchar(100) NOT NULL,
  `site_title` varchar(100) DEFAULT NULL,
  `site_logo` varchar(100) NOT NULL,
  `site_desc` varchar(255) DEFAULT NULL,
  `footer_text` varchar(100) NOT NULL,
  `currency_format` varchar(20) NOT NULL,
  `contact_phone` varchar(15) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `contact_address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`s_no`, `site_name`, `site_title`, `site_logo`, `site_desc`, `footer_text`, `currency_format`, `contact_phone`, `contact_email`, `contact_address`) VALUES
(1, 'shopping', 'Online Shopping Project for Mobiles, Clothes, Electronics and many more....', '1687462594Screenshot-5.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequuntur, perspiciatis quia repudiandae sapiente sed sunt.', 'Copyright 2023', 'Tk.', '01863840470', 'ashrfulislam222@gmail.com', 'Dhaka');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_id` int(11) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `product_qty` varchar(100) NOT NULL,
  `total_amount` varchar(10) NOT NULL,
  `product_user` int(11) NOT NULL,
  `order_date` varchar(11) NOT NULL,
  `pay_req_id` varchar(100) DEFAULT NULL,
  `confirm` tinyint(4) NOT NULL DEFAULT 0,
  `delivery` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_id`, `product_id`, `product_qty`, `total_amount`, `product_user`, `order_date`, `pay_req_id`, `confirm`, `delivery`) VALUES
(1369, '14,', '1,', '132000.00', 16, '2023-07-16', 'SSLCZ_TEST_64b43561d16b7', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `item_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `txn_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `payment_gross` float(10,2) NOT NULL,
  `currency_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `item_number`, `txn_id`, `payment_gross`, `currency_code`, `payment_status`) VALUES
(1362, '14,', 'SSLCZ_TEST_64b43561d16b7', 132000.00, 'BDT', 'VALID');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_code` varchar(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_sub_cat` int(11) NOT NULL,
  `product_brand` int(100) DEFAULT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` varchar(100) NOT NULL,
  `product_desc` text NOT NULL,
  `featured_image` text NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `product_keywords` text DEFAULT NULL,
  `product_views` int(11) DEFAULT 0,
  `product_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_code`, `product_cat`, `product_sub_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `featured_image`, `qty`, `product_keywords`, `product_views`, `product_status`) VALUES
(14, '64b434ac4e789', 9, 18, 14, 'Apple iPhone 14 Pro Max', '132000', '&lt;p dir=&quot;ltr&quot;&gt;iPhone 14 Pro Max- the latest name of Apple’s Pro Max lineup. Gives you a magical interaction with its groundbreaking features, innovative camera functionality, and outstanding outlook. All these specs are combined together and make the iPhone 14 Pro Max one of the best iPhone to date.&amp;nbsp;&lt;/p&gt;&lt;p dir=&quot;ltr&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;h2 dir=&quot;ltr&quot;&gt;&lt;span style=&quot;font-size: 18pt;&quot;&gt;&lt;b&gt;Apple iPhone 14 Pro Max Key Features&amp;nbsp;&lt;/b&gt;&lt;/span&gt;&lt;/h2&gt;&lt;ul&gt;&lt;li dir=&quot;ltr&quot;&gt;Innovative Dynamic island&lt;/li&gt;&lt;li dir=&quot;ltr&quot;&gt;Emergency SOS via satellite&amp;nbsp;&lt;/li&gt;&lt;li dir=&quot;ltr&quot;&gt;48MP triple camera with bigger lenses&lt;/li&gt;&lt;li dir=&quot;ltr&quot;&gt;Action Mode Steady Videos&lt;/li&gt;&lt;li dir=&quot;ltr&quot;&gt;Always On display&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p dir=&quot;ltr&quot;&gt;iPhone 14 Pro Max is filled with some excellent features. The most attractive ones are- its always-on display and 48MP camera with bigger lenses. This leading-edge camera packs some pro-grade camera features that offer you to traverse through a beautiful photographic experience.&lt;/p&gt;&lt;p dir=&quot;ltr&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;h4 dir=&quot;ltr&quot;&gt;&lt;span style=&quot;font-size: 14pt;&quot;&gt;&lt;b&gt;What’s New??&lt;/b&gt;&lt;/span&gt;&lt;/h4&gt;&lt;p dir=&quot;ltr&quot;&gt;Apple also introduces the dynamic island. Dynamic island replaces the notch but in a very smart and attractive way. It shows everything about your phone\'s activities Such as calls, music, popup messages, etc. Aside from the DI, Apple also introduces two emergency life-saving features. First, SOS from satellites, and the second is Crash detection. These out-of-ordinary features make the iPhone 14 pro max one of the best smartphones in current times.&amp;nbsp;&lt;/p&gt;&lt;p dir=&quot;ltr&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;h2 dir=&quot;ltr&quot;&gt;&lt;span style=&quot;font-size: 18pt;&quot;&gt;&lt;b&gt;iPhone 14 pro max - Overview&lt;/b&gt;&lt;/span&gt;&amp;nbsp;&lt;/h2&gt;&lt;h3 dir=&quot;ltr&quot;&gt;&amp;nbsp;&lt;/h3&gt;&lt;h3 dir=&quot;ltr&quot;&gt;&lt;b&gt;Astounding Camera&lt;/b&gt;&lt;/h3&gt;&lt;p dir=&quot;ltr&quot;&gt;The camera of the iPhone 14 pro-max comes with an exclusive avatar. It contains a 48-megapixel AI triple camera with larger optics. Its larger-than-ever optics make it a genuine pro-grade camera. This magnificent camera of iPhone 14 pro max is an option for individuals who enjoy taking photos and making videos themselves.&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p dir=&quot;ltr&quot;&gt;Here are the astounding Camera Specs of the iPhone 14 pro max&amp;nbsp;&lt;/p&gt;&lt;p dir=&quot;ltr&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;h5 dir=&quot;ltr&quot;&gt;&lt;b&gt;Main Camera&amp;nbsp;&lt;/b&gt;&lt;/h5&gt;&lt;p dir=&quot;ltr&quot;&gt;48 MP (wide)&amp;nbsp; 24mM&amp;nbsp; dual pixel PDAF&amp;nbsp; sensor-shift OIS&lt;/p&gt;&lt;p dir=&quot;ltr&quot;&gt;12 MP(telephoto) 77mm PDAF OIS 3x optical zoom&lt;/p&gt;&lt;p dir=&quot;ltr&quot;&gt;12 MP(ultrawide) 120?&amp;nbsp; dual pixel PDAF&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;br&gt;&lt;/p&gt;&lt;h5 dir=&quot;ltr&quot;&gt;&lt;b&gt;Selfie Camera&lt;/b&gt;&lt;/h5&gt;&lt;p dir=&quot;ltr&quot;&gt;12 MP (wide) PADF 23 mm SL 3D sensors&lt;/p&gt;&lt;p dir=&quot;ltr&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;h4 dir=&quot;ltr&quot;&gt;&lt;b&gt;Photography Features&lt;/b&gt;&lt;/h4&gt;&lt;ol&gt;&lt;li dir=&quot;ltr&quot;&gt;Raise the resolution 4 times.&lt;/li&gt;&lt;li dir=&quot;ltr&quot;&gt;TOF 3D LiDAR scanner.&lt;/li&gt;&lt;li dir=&quot;ltr&quot;&gt;2X Optical quality Telephoto.&lt;/li&gt;&lt;li dir=&quot;ltr&quot;&gt;3X better low-light photography.&lt;/li&gt;&lt;li dir=&quot;ltr&quot;&gt;Smart HDR Recognition.&lt;/li&gt;&lt;li dir=&quot;ltr&quot;&gt;More Effective Portrait Mode.&lt;/li&gt;&lt;li dir=&quot;ltr&quot;&gt;2X faster Night Mode Exposure.&lt;/li&gt;&lt;li dir=&quot;ltr&quot;&gt;Unique Ultrawide Camera Mode.&lt;/li&gt;&lt;/ol&gt;&lt;p dir=&quot;ltr&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;h4 dir=&quot;ltr&quot;&gt;&lt;b&gt;Videography Features&lt;/b&gt;&lt;/h4&gt;&lt;ul style=&quot;list-style-type: circle;&quot;&gt;&lt;li dir=&quot;ltr&quot;&gt;Exclusive Action Mode for Super Smooth Steady Videos.&lt;/li&gt;&lt;li dir=&quot;ltr&quot;&gt;High-resolution movie-like video-capturing ability.&lt;/li&gt;&lt;li dir=&quot;ltr&quot;&gt;4K Videography 24/25/30/60fps&lt;/li&gt;&lt;li dir=&quot;ltr&quot;&gt;1080p videography at 25/30/60/120/240fps&lt;/li&gt;&lt;li dir=&quot;ltr&quot;&gt;10-bit HDR&lt;/li&gt;&lt;li dir=&quot;ltr&quot;&gt;Dolby Vision HDR (up to 60fps) ProRes&lt;/li&gt;&lt;li dir=&quot;ltr&quot;&gt;Cinematic mode (4K Videography 30fps)&lt;/li&gt;&lt;li dir=&quot;ltr&quot;&gt;Stereo sound rec&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;h3 dir=&quot;ltr&quot;&gt;&lt;b&gt;Stunning Dynamic Island&lt;/b&gt;&lt;/h3&gt;&lt;p dir=&quot;ltr&quot;&gt;In the Pro series, Apple just removed the notch with an exclusively designed hole punch and connected it with the system. They named it Dynamic Island. This versatile Dynamic Island continuously transforms. The cutout will roll, rattle, and tremble as it transmits messages and notifications. Everything that is displayed on this little island including the alarm clock,&amp;nbsp; device connection, and musical notation while music is playing, is for your use. Dynamic Island appears whenever your iPhone is unlocked. It appears on the Home Screen or in any app. In a nutshell, the dynamic island is a brilliant and cutting-edge innovation from Apple that will undoubtedly please customers.&lt;/p&gt;&lt;p dir=&quot;ltr&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;h3 dir=&quot;ltr&quot;&gt;&lt;b&gt;Marvelous Design&lt;/b&gt;&lt;/h3&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p dir=&quot;ltr&quot;&gt;The design of the newest iPhone 14 Pro Max is simple yet attractive. It is full of elegance. A metal bezel connects two glass bodies. The Super Retina OLED Display is on the top and scratch-resistant ceramic glass is on the back. The buttons are simply placed for cosmetic purposes. The camera is perfectly fitted in the upper back corner better than the previous models. It was filled with four really lovely hues thanks to the colors which accomplish the design and makes the phone more attractive than ever. The colors are- Deep Purple, Space Black, Silver, and Gold.&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p dir=&quot;ltr&quot;&gt;Alluring Colors&lt;/p&gt;&lt;ul style=&quot;list-style-type: square;&quot;&gt;&lt;li dir=&quot;ltr&quot;&gt;Super Retina OLED display&lt;/li&gt;&lt;li dir=&quot;ltr&quot;&gt;Strong Aluminum Band&lt;/li&gt;&lt;li dir=&quot;ltr&quot;&gt;Scratch Resistant Ceramic Glass&lt;/li&gt;&lt;li dir=&quot;ltr&quot;&gt;HD resolution&lt;/li&gt;&lt;li dir=&quot;ltr&quot;&gt;Perfect Display and body ratio&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;h3 dir=&quot;ltr&quot;&gt;&lt;b&gt;Life-Saving Features&lt;/b&gt;&lt;/h3&gt;&lt;p dir=&quot;ltr&quot;&gt;&lt;b&gt;Crash Detection&lt;/b&gt;&amp;nbsp;&lt;/p&gt;&lt;p dir=&quot;ltr&quot;&gt;iPhone 14 Pro Max can offer aid in times of need with its innovative safety feature named&amp;nbsp; Crash Detection. When a user is unconscious or unable to reach their iPhone, the iPhone\'s crash detection feature may now identify serious traffic accidents and promptly notify emergency services by itself.&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p dir=&quot;ltr&quot;&gt;&lt;b&gt;SOS via Satellite&lt;/b&gt;&lt;/p&gt;&lt;p dir=&quot;ltr&quot;&gt;Another innovative feature of the iPhone 14 pro max. It is introduced as Emergency SOS via satellite.&amp;nbsp; Through the service, the phone connects directly to a satellite, enabling messaging with emergency services even if there is no cellular or Wi-Fi coverage available.&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;h3 dir=&quot;ltr&quot;&gt;&lt;b&gt;Extraordinary Performance&lt;/b&gt;&lt;/h3&gt;&lt;p dir=&quot;ltr&quot;&gt;iPhone 14 pro max packs some serious level of hardware into it. It holds the new A16 bionic chipset. The latest and the most advanced from Apple. Alongside the chipset, the iOS 16 also delivers a great service.&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;ol style=&quot;list-style-type: upper-alpha;&quot;&gt;&lt;li dir=&quot;ltr&quot;&gt;Apple A16 Bionic (4 nm)&lt;/li&gt;&lt;li dir=&quot;ltr&quot;&gt;Hexa-core&lt;/li&gt;&lt;li dir=&quot;ltr&quot;&gt;3.46 GHz Avalanche (2)&amp;nbsp;&amp;nbsp;&lt;/li&gt;&lt;li dir=&quot;ltr&quot;&gt;Blizzard (4)&lt;/li&gt;&lt;li dir=&quot;ltr&quot;&gt;Apple GPU (5-core graphics)&lt;/li&gt;&lt;li dir=&quot;ltr&quot;&gt;iOS 16&lt;/li&gt;&lt;/ol&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p dir=&quot;ltr&quot;&gt;The collaboration of iPhone high-end hardware and software makes the iPhone 14 pro max the best performer yet. The operation speed is as fast as a flash yet smooth like butter.&amp;nbsp;&lt;/p&gt;&lt;p dir=&quot;ltr&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;h3 dir=&quot;ltr&quot;&gt;&lt;b&gt;The list is not finished yet….&lt;/b&gt;&lt;/h3&gt;&lt;p dir=&quot;ltr&quot;&gt;iPhone 14 Pro max is full of smart features. The bucket is filled with some more outstanding features.&amp;nbsp; This staggering is capable of attracting you to grab the pro max version of the iPhone 14 series.&amp;nbsp;&lt;/p&gt;&lt;p dir=&quot;ltr&quot;&gt;Here are some more magnificent&amp;nbsp; iPhone 14 features:&lt;/p&gt;&lt;p dir=&quot;ltr&quot;&gt;IP68 Dust/Water Resistant&lt;/p&gt;&lt;p dir=&quot;ltr&quot;&gt;Ultra Wideband&amp;nbsp;&lt;/p&gt;&lt;p dir=&quot;ltr&quot;&gt;Super fast Face ID&lt;/p&gt;&lt;p dir=&quot;ltr&quot;&gt;Compass&lt;/p&gt;&lt;p dir=&quot;ltr&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;h2 dir=&quot;ltr&quot;&gt;&lt;span style=&quot;font-size: 18pt;&quot;&gt;&lt;b&gt;Apple iPhone 14 Pro Max Price in Bangladesh&lt;/b&gt;&lt;/span&gt;&lt;/h2&gt;&lt;p dir=&quot;ltr&quot;&gt;The Current price of the iPhone 14 Pro Max in Bangladesh is &lt;b&gt;&lt;span id=&quot;prod__19174&quot;&gt;132000&lt;/span&gt;&lt;/b&gt; BDT. This is the latest updated price of this phone. The phone was officially released in Bangladesh on September 17, 2022. From that time it gained huge popularity among iPhone users.&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;h2 dir=&quot;ltr&quot;&gt;&lt;span style=&quot;font-size: 18pt;&quot;&gt;&lt;b&gt;Where to buy Apple iPhone 14 Pro Max in Bangladesh?&lt;/b&gt;&lt;/span&gt;&lt;/h2&gt;&lt;p dir=&quot;ltr&quot;&gt;Apple Gadgets is the best choice for buying an iPhone 14 Pro Max in BD. Apple Gadgets are familiar with their reasonable price and after-service. Surely you will get your iPhone 14 Pro Max at the lowest available price in BD&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p dir=&quot;ltr&quot;&gt;So, don’t be late. Explore&amp;nbsp; Apple Gadgets and grab the iPhone 14 Pro Max at a very affordable price and the best after-service.&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;br&gt;&lt;/p&gt;&lt;p dir=&quot;ltr&quot;&gt;&lt;br&gt;&lt;/p&gt;', '1689531564iPhone-14-Pro-Max-9907.jpg', 7, NULL, 8, 1),
(15, '64b4363161ffd', 9, 19, 14, 'Apple MacBook Pro M1 Max chip 16 inch 10-core CPU 32-core GPU with 8 performance cores 32GB RAM 1TB SSD', '351,900', '&lt;p class=&quot;woocommerce-product-details__short-description&quot;&gt;&lt;/p&gt;&lt;ul class=&quot;as-macbundle-modelspecs&quot;&gt;&lt;li&gt;&lt;b&gt;&lt;span style=&quot;color: #ff0000;&quot;&gt;Apple M1 Max chip 10-Core CPU 32-Core&lt;/span&gt;&lt;span style=&quot;color: #000000;&quot;&gt;&lt;span style=&quot;color: #ff0000;&quot;&gt; GPU&lt;/span&gt; with 8 performance cores and 2 efficiency cores&lt;/span&gt;&lt;/b&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: #000000;&quot;&gt;&lt;b&gt;32GB unified memory&lt;/b&gt;&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: #000000;&quot;&gt;&lt;b&gt;1TB SSD Storage¹&lt;/b&gt;&lt;/span&gt;&lt;/li&gt;&lt;li&gt;16-core Neural Engine&lt;/li&gt;&lt;li&gt;400GB/s memory bandwidth&lt;/li&gt;&lt;li&gt;16.2-inch Liquid Retina XDR display&lt;/li&gt;&lt;li&gt;Three Thunderbolt 4 ports, HDMI port, SDXC card slot, MagSafe 3 port&lt;/li&gt;&lt;li&gt;Magic Keyboard with Touch ID&lt;/li&gt;&lt;li&gt;Force Touch trackpad&lt;/li&gt;&lt;li&gt;140W USB-C Power Adapter&lt;/li&gt;&lt;li&gt;1 Year Apple Warranty&lt;/li&gt;&lt;li&gt;&lt;h1&gt;Apple MacBook Pro M1 Max Price in Bangladesh 2022 &amp;amp; Specs&lt;/h1&gt;&lt;h2&gt;Specifications&lt;/h2&gt;&lt;table class=&quot;table-data-sheet&quot;&gt;&lt;tbody&gt;&lt;tr class=&quot;odd&quot;&gt;&lt;td&gt;CPU / Processor&lt;/td&gt;&lt;td&gt;&lt;p class=&quot;techspecs-subheader&quot;&gt;&lt;b&gt;Apple&amp;nbsp;M1&amp;nbsp;Max chip 10.-core CPU with 8 performance cores&lt;/b&gt;&lt;br class=&quot;large&quot;&gt;&lt;b&gt;and 2 efficiency cores 32-core GPU 16-core Neural Engine 400GB/s memory bandwidth&lt;/b&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr class=&quot;even&quot;&gt;&lt;td&gt;Memory&lt;/td&gt;&lt;td&gt;&lt;b&gt;32 GB unified memory – &lt;span style=&quot;color: #ff0000;&quot;&gt;Up To 32GB 64GB (M1 Max)&lt;/span&gt;&lt;/b&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr class=&quot;odd&quot;&gt;&lt;td&gt;Storage&lt;/td&gt;&lt;td&gt;&lt;b&gt;1TB SSD storage- &lt;span style=&quot;color: #ff0000;&quot;&gt;(&lt;/span&gt;&lt;span style=&quot;color: #ff0000;&quot;&gt;Configurable to: 1TB, 2TB, 4TB or 8TB)&lt;/span&gt;&lt;/b&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr class=&quot;even&quot;&gt;&lt;td&gt;Display Screen / Design / Resolution&lt;/td&gt;&lt;td&gt;&lt;p class=&quot;techspecs-subheader&quot;&gt;display 16.2-inch (diagonal) Liquid&amp;nbsp;Retina&amp;nbsp;XDR display;&amp;nbsp;3456×2234 native&lt;br class=&quot;large&quot;&gt;resolution at 254 pixels per inch Liquid Retina XDR&lt;/p&gt;&lt;p class=&quot;techspecs-subheader&quot;&gt;XDR (Extreme Dynamic Range)&lt;/p&gt;&lt;p&gt;Up to 1,000&amp;nbsp;nits sustained (full-screen) brightness, 1,600&amp;nbsp;nits peak brightness&lt;/p&gt;&lt;p&gt;1,000,000:1 contrast ratio&lt;/p&gt;&lt;p class=&quot;techspecs-subheader&quot;&gt;Colour 1 billion colours Wide colour (P3)&lt;/p&gt;&lt;p&gt;True Tone technology Refresh rates ProMotion technology for adaptive refresh rates up to&amp;nbsp;120Hz&lt;/p&gt;&lt;p&gt;Fixed refresh rates: 47.95Hz, 48.00Hz, 50.00Hz, 59.94Hz, 60.00Hz&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr class=&quot;odd&quot;&gt;&lt;td&gt;Camera&lt;/td&gt;&lt;td&gt;1080p&amp;nbsp;FaceTime HD&amp;nbsp;camera&lt;br&gt;Advanced image signal processor with computational video&lt;/td&gt;&lt;/tr&gt;&lt;tr class=&quot;even&quot;&gt;&lt;td&gt;Operation System&lt;/td&gt;&lt;td&gt;&lt;p class=&quot;techspecs-subheader&quot;&gt;macOS&lt;/p&gt;&lt;p&gt;macOS is the most advanced desktop operating system in the world. macOS&amp;nbsp;Monterey introduces powerful new features to help you connect, share and create like never before.&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr class=&quot;odd&quot;&gt;&lt;td&gt;Audio &amp;amp; Video&lt;/td&gt;&lt;td&gt;High-fidelity, six-speaker sound system with force-canceling woofers&lt;p&gt;&lt;/p&gt;&lt;p&gt;Wide stereo sound&lt;/p&gt;&lt;p&gt;Support for spatial audio when playing music or video with Dolby&amp;nbsp;Atmos on built-in speakers&lt;/p&gt;&lt;p&gt;Spatial audio with dynamic head tracking when using AirPods (3rd&amp;nbsp;generation), AirPods&amp;nbsp;Pro and AirPods&amp;nbsp;Max&lt;/p&gt;&lt;p&gt;Studio-quality three-mic array with high signal-to-noise ratio and directional beamforming&lt;/p&gt;&lt;p&gt;3.5mm headphone jack with advanced support for high-impedance headphones&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr class=&quot;even&quot;&gt;&lt;td&gt;Network / Connectivity Technology&lt;/td&gt;&lt;td&gt;&lt;p class=&quot;techspecs-subheader&quot;&gt;Wi-Fi&lt;/p&gt;&lt;p&gt;802.11ax Wi-Fi&amp;nbsp;6 wireless networking&lt;br&gt;IEEE 802.11a/b/g/n/ac compatible&lt;/p&gt;&lt;p&gt;Bluetooth&amp;nbsp;5.0 wireless technology&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr class=&quot;odd&quot;&gt;&lt;td&gt;Keyboard Feature&lt;/td&gt;&lt;td&gt;&lt;p class=&quot;techspecs-subheader&quot;&gt;Backlit Magic&amp;nbsp;Keyboard with:&lt;/p&gt;&lt;p&gt;78 (US) or 79 (ISO) keys including 12&amp;nbsp;full-height function keys and 4&amp;nbsp;arrow keys in an inverted-T arrangement&lt;/p&gt;&lt;p&gt;&lt;b&gt;&lt;span style=&quot;color: #ff0000;&quot;&gt;Touch&amp;nbsp;ID&lt;/span&gt;&lt;/b&gt;&lt;/p&gt;&lt;p&gt;Ambient light sensor&lt;/p&gt;&lt;p&gt;Force&amp;nbsp;Touch trackpad for precise cursor control and pressure-sensing capabilities; enables Force clicks, accelerators, pressure-sensitive drawing and Multi-Touch gestures&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr class=&quot;even&quot;&gt;&lt;td&gt;Interface&lt;/td&gt;&lt;td&gt;&lt;span class=&quot;techspecs-subheader&quot;&gt;SDXC card slot&lt;/span&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;span class=&quot;techspecs-subheader&quot;&gt;HDMI port&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span class=&quot;techspecs-subheader&quot;&gt;3.5mm headphone jack&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span class=&quot;techspecs-subheader&quot;&gt;MagSafe&amp;nbsp;3 port&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span class=&quot;techspecs-subheader&quot;&gt;Three Thunderbolt&amp;nbsp;4 (USB-C) ports with support for:&lt;/span&gt;&lt;/p&gt;&lt;p&gt;Charging&lt;/p&gt;&lt;p&gt;DisplayPort&lt;/p&gt;&lt;p&gt;Thunderbolt&amp;nbsp;4 (up to 40Gbps)&lt;/p&gt;&lt;p&gt;USB&amp;nbsp;4 (up to 40Gbps)&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr class=&quot;odd&quot;&gt;&lt;td&gt;Battery / Power Supply&lt;/td&gt;&lt;td&gt;Up to 21&amp;nbsp;hours Apple&amp;nbsp;TV app movie playback&lt;p&gt;&lt;/p&gt;&lt;p&gt;Up to 14&amp;nbsp;hours wireless web&lt;/p&gt;&lt;p&gt;100-watt-hour lithium-polymer battery&lt;/p&gt;&lt;p&gt;140W USB-C Power Adapter&lt;/p&gt;&lt;p&gt;USB-C to MagSafe&amp;nbsp;3 Cable&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr class=&quot;even&quot;&gt;&lt;td&gt;Dimensions&lt;/td&gt;&lt;td&gt;&lt;b class=&quot;techspecs-subheader&quot;&gt;Height&lt;/b&gt;&amp;nbsp;1.68cm&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;b class=&quot;techspecs-subheader&quot;&gt;Width:&lt;/b&gt;&amp;nbsp;35.57cm&lt;/p&gt;&lt;p&gt;&lt;b class=&quot;techspecs-subheader&quot;&gt;Depth:&lt;/b&gt;&amp;nbsp;24.81cm&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr class=&quot;odd&quot;&gt;&lt;td&gt;Weight&lt;/td&gt;&lt;td&gt;2.2kg&lt;/td&gt;&lt;/tr&gt;&lt;tr class=&quot;even&quot;&gt;&lt;td&gt;Remark&lt;/td&gt;&lt;td&gt;1 Year &lt;br&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;h3&gt;Description&lt;/h3&gt;&lt;h1&gt;Apple MacBook Pro M1 Max&lt;/h1&gt;&lt;p&gt;M1 Max is the most powerful chip ever created for a pro notebook, with 10 CPU cores, up to 32 GPU cores, and a 16-core Neural Engine. It delivers two times faster graphics processing and double the memory bandwidth of M1 Pro. And it has a dedicated media engine for decode and two for encode — with up to two times faster video encoding — and two ProRes accelerators for even higher multistream performance.&lt;/p&gt;&lt;p&gt;At its peak, M1 Max delivers more performance — and consumes 40 percent less power — than a compact pro laptop with a high-performing discrete GPU. And compared with a high-end laptop with discrete graphics, M1 Max delivers similar performance with 100 watts less power.&lt;/p&gt;&lt;h3&gt;MacBook Pro M1 Max chip 16 inch&lt;/h3&gt;&lt;p&gt;Offers unprecedented levels of pro performance. So you can manipulate millions of polygons in Cinema 4D, edit up to seven streams of 8K Pro Res video in Final Cut Pro, or grade color in HDR on 8K 4×4 ProRes video — all miles away from the edit bay, 1 Years Apple International Warranty, MacBook price in bd, Apple MacBook price in bd, MC Solution BD.&lt;/p&gt;&lt;p&gt;Powerful M1 Max, which has the same 10-core CPU configuration, with eight performance cores and two efficiency cores. But the M1 Max doubles the memory bandwidth (to 400GB/s), RAM (up to 64GB of memory) and GPU (with 32 cores, 4,096 execution units and four times the GPU performance of the original M1). The M1 Max features 57 billion transistors, making it the largest M1 Max chip.&lt;/p&gt;&lt;h3 class=&quot;pd-col-title&quot;&gt;Unified Memory&lt;/h3&gt;&lt;p class=&quot;pd-util-compact-right-small-14&quot;&gt;The more unified memory (RAM) you choose, the more apps you can run simultaneously and the better they will perform.&lt;/p&gt;&lt;p class=&quot;pd-util-expand-right-large-7 pd-util-compact-right-small-14&quot;&gt;Unified memory on MacBook&amp;nbsp;Pro allows you to use up to 64GB of memory for graphics tasks — an unprecedented amount for a notebook.&lt;/p&gt;&lt;h3 class=&quot;pd-col-title&quot;&gt;Storage&lt;/h3&gt;&lt;p class=&quot;pd-util-compact-right-small-14&quot;&gt;Solid-state drive (SSD) storage gives you space to store your projects, documents, photos, music, videos, and other files on your MacBook&amp;nbsp;Pro.&lt;/p&gt;&lt;p class=&quot;pd-util-compact-right-small-14&quot;&gt;The SSD in MacBook Pro M1 Max Price in Bangladesh delivers significant performance and speed that you’ll notice when you start up, launch apps, open project files, and browse your libraries.&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;/p&gt;', '1689531953macbook-price-in-bd-2022.jpg', 5, NULL, 5, 1),
(17, '64b4383481e52', 11, 28, 0, 'Black Endi Silk Saree', '4,543.00', '&lt;p class=&quot;product attribute description&quot;&gt;    &lt;h3&gt;Product Description&lt;/h3&gt;        &lt;p class=&quot;value&quot;&gt;Black endi silk saree. Comes with matching unstitched blouse piece. Blouse shown in the photo is a styling suggestion, it is not a part of the actual product.&lt;/p&gt;&lt;/p&gt;', '1689532468Screenshot-4.png', 7, NULL, 1, 1),
(18, '64b438c9bae22', 11, 28, 0, 'Aqua Half Silk Jamdani Saree', '52,520.93', '&lt;p class=&quot;product attribute description&quot;&gt;    &lt;h3&gt;Product Description&lt;/h3&gt;        &lt;p class=&quot;value&quot;&gt;Aqua half silk jamdani saree with copper, silver, aqua and golden buti. Comes with matching unstitched separate blouse piece. Blouse shown in the photo is a styling suggestion, it is not a part of the actual product.&lt;/p&gt;&lt;/p&gt;', '1689532617Screenshot-5.png', 5, NULL, 0, 1),
(19, '64b439923100c', 11, 27, 0, 'Product Description Aqua half silk jamdani saree with copper, silver, aqua and golden buti. Comes with matching unstitched separate blouse piece. Blouse shown in the photo is a styling suggestion, it is not a part of the actual product.', '4,500', '&lt;p class=&quot;product attribute description&quot;&gt;    &lt;h3&gt;Product Description&lt;/h3&gt;        &lt;p class=&quot;value&quot;&gt;Teal blue printed endi silk kameez with blue and shades of brown embroidery. Comes with matching check viscose shalwar and teal blue printed silk-muslin dupatta.&lt;/p&gt;&lt;/p&gt;', '1689532818Screenshot-6.png', 5, NULL, 1, 1),
(20, '64b43a7314806', 11, 29, 0, 'Pearl and Simulated Ruby Oxidized Silver Earrings', '5,266.77', '&lt;p class=&quot;product attribute description&quot;&gt;    &lt;h3&gt;Product Description&lt;/h3&gt;        &lt;p class=&quot;value&quot;&gt;White pearl and simulated ruby studded oxidized silver earrings.&lt;/p&gt;&lt;p class=&quot;value&quot;&gt;                    High quality silver oxidizes hence recommended to be cleaned with mild soapy water for shine&lt;/p&gt;&lt;/p&gt;', '1689533043Screenshot-7.png', 12, NULL, 3, 1),
(21, '64b43b3cba1df', 10, 30, 0, 'Black Viscose Slim Fit Taaga Man Formal Pant', '1,758.14', '&lt;p class=&quot;product attribute description&quot;&gt;    &lt;h3&gt;Product Description&lt;/h3&gt;        &lt;p class=&quot;value&quot;&gt;Black viscose slim fit Taaga man formal pant. Features button closure, zip fly and pockets.&lt;/p&gt;&lt;p class=&quot;value&quot;&gt;Machine Wash Separately In Cold Water. Wash Inside Out With Mild Detergent. Hang In Shade To Dry. No Bleach Or Tumble Dry. Low Iron At 110 Centigrade On Reverse.&lt;/p&gt;&lt;/p&gt;', '1689533244Screenshot-8.png', 10, NULL, 0, 1),
(22, '64b43c638b683', 10, 26, 15, 'Lavender Printed Cotton T-Shirt', '1000', '&lt;p class=&quot;product attribute description&quot;&gt;    &lt;h3&gt;Product Description&lt;/h3&gt;        &lt;p class=&quot;value&quot;&gt;Lavender single jersey knit cotton t-shirt with multicolour prints. Features ribbed-knit round neck.&lt;/p&gt;&lt;/p&gt;', '1689533539Screenshot-9.png', 10, NULL, 0, 1),
(23, '64b43d950d047', 12, 25, 0, 'HATIL Bed Myth-184', '46,500', '&lt;p align=&quot;center&quot;&gt;&lt;ul&gt;&lt;li&gt;&lt;h3&gt;Products and Service Information&lt;/h3&gt;&lt;/li&gt;&lt;li&gt;&lt;p role=&quot;tabpanel&quot; class=&quot;tab-pane active&quot; id=&quot;features&quot;&gt;&lt;ul style=&quot;list-style-type:circle&quot;&gt;&lt;li style=&quot;margin:0in; margin-bottom:.0001pt&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Made from Kiln-dried imported&amp;nbsp;Beech wood and veneered engineered wood. &lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin:0in; margin-bottom:.0001pt&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;High quality environment friendly Italian Ultra Violet (UV) and Polyurethane (PU) Lacquer in antique finish &lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin:0in; margin-bottom:.0001pt&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Please refer to images for dimension details&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin:0in; margin-bottom:.0001pt&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Any assembly or installation required will be done by the HATIL team at the time of delivery (one day after delivery for CKD items)&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin:0in; margin-bottom:.0001pt&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Imported high quality&amp;nbsp;hardware fittings&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin:0in; margin-bottom:.0001pt&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Only bed without mattress&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin:0in; margin-bottom:.0001pt&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Indoor use only&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin:0in; margin-bottom:.0001pt&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Weight 112.00&amp;nbsp;Kgs&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin:0in; margin-bottom:.0001pt&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Most of our furniture is made of natural components, which will have natural differences in grain construction and occasional minor blemish.&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/p&gt;', '1689533845-2LD1690.jpg', 6, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_cart`
--

CREATE TABLE `product_cart` (
  `s_no` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `sub_cat_id` int(11) NOT NULL,
  `sub_cat_title` varchar(100) NOT NULL,
  `cat_parent` int(11) NOT NULL,
  `cat_products` int(11) NOT NULL DEFAULT 0,
  `show_in_header` tinyint(4) NOT NULL DEFAULT 1,
  `show_in_footer` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`sub_cat_id`, `sub_cat_title`, `cat_parent`, `cat_products`, `show_in_header`, `show_in_footer`) VALUES
(19, 'Laptops', 9, 3, 1, 0),
(21, 'Camera', 9, 0, 1, 0),
(20, 'Speakers', 9, 0, 1, 0),
(18, 'Mobiles', 9, 3, 1, 1),
(22, 'Kitchen', 12, 0, 1, 0),
(23, 'Tableware', 12, 0, 0, 1),
(24, 'Living Room', 12, 1, 0, 1),
(25, 'Beds', 12, 3, 1, 1),
(26, 'Men\'s T-Shirts', 10, 3, 1, 1),
(27, 'Kurti\'s', 11, 2, 1, 1),
(28, 'Sarees', 11, 3, 0, 1),
(29, 'JEWELLERY', 11, 1, 1, 1),
(30, 'Formal Pant', 10, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `f_name` varchar(50) NOT NULL,
  `l_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `city` text NOT NULL,
  `user_role` int(11) DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `f_name`, `l_name`, `username`, `email`, `password`, `mobile`, `address`, `city`, `user_role`) VALUES
(16, 'Ashraful', 'islam', 'ashrfulislam222@gmail.com', '', '827ccb0eea8a706c4c34a16891f84e7b', '01863840470', 'dhaka', 'dhakaa', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`s_no`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_cart`
--
ALTER TABLE `product_cart`
  ADD PRIMARY KEY (`s_no`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`sub_cat_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1370;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1363;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `product_cart`
--
ALTER TABLE `product_cart`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `sub_cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
