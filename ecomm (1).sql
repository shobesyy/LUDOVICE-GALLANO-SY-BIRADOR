-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2025 at 12:33 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecomm`
--

-- --------------------------------------------------------

--
-- Table structure for table `additional_address`
--

CREATE TABLE `additional_address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `barangay` varchar(255) NOT NULL,
  `municipality` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `business_name` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `delivery_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `seller_name` varchar(100) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `buyer_name` varchar(100) NOT NULL,
  `pickup_location` text NOT NULL,
  `delivery_location` text NOT NULL,
  `delivery_fee` decimal(10,2) NOT NULL,
  `delivery_courier_id` int(11) DEFAULT NULL,
  `picked_up_at` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `proof_of_delivery` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(50) NOT NULL,
  `username` varchar(255) NOT NULL,
  `rating` int(1) NOT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `image_1` varchar(255) DEFAULT NULL,
  `image_2` varchar(255) DEFAULT NULL,
  `image_3` varchar(255) DEFAULT NULL,
  `image_4` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `business_name` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `sender_type` enum('buyer','seller','admin') NOT NULL DEFAULT 'buyer',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_read` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `status` enum('unread','read') DEFAULT 'unread',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `recipient_type` enum('buyer','seller') NOT NULL DEFAULT 'buyer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seller_id` int(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `phoneNumber` varchar(50) NOT NULL,
  `municipality` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `barangay` varchar(255) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `business_name` varchar(255) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `total_gross` decimal(10,2) NOT NULL,
  `total_net` decimal(10,2) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT 'To Pay',
  `product_id` int(11) DEFAULT NULL,
  `cancel_reason` varchar(255) NOT NULL,
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `refund_reason` text NOT NULL,
  `refund_image_1` text DEFAULT NULL,
  `refund_image_2` text DEFAULT NULL,
  `refund_image_3` text DEFAULT NULL,
  `refund_image_4` text DEFAULT NULL,
  `refund_created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `seller_id`, `first_name`, `middle_name`, `last_name`, `username`, `phoneNumber`, `municipality`, `province`, `barangay`, `product_image`, `business_name`, `productName`, `productPrice`, `quantity`, `total`, `total_gross`, `total_net`, `payment_method`, `created_at`, `status`, `product_id`, `cancel_reason`, `updated_at`, `refund_reason`, `refund_image_1`, `refund_image_2`, `refund_image_3`, `refund_image_4`, `refund_created_at`) VALUES
(283, 72, 73, 'JC', 'TAN', 'GALLANO', 'Buyer 1', '09101314850', 'Sibalom', 'Antique', 'Calo-oy', '/static/upload_images/1.jpg', 'Baking Supplies & Ingredients', 'Flour', 150.00, 1, 200.00, 10.00, 190.00, 'Cash on Delivery', '2025-05-23 12:41:29', 'Completed', 328, '', '2025-05-23 20:42:45', '', NULL, NULL, NULL, NULL, '2025-05-23 12:41:29');

-- --------------------------------------------------------

--
-- Table structure for table `seller_add_product`
--

CREATE TABLE `seller_add_product` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `mini_description` text NOT NULL,
  `main_description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(255) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `sub_image_1` varchar(255) NOT NULL,
  `sub_image_2` varchar(255) NOT NULL,
  `sub_image_3` varchar(255) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `product_status` varchar(255) NOT NULL,
  `business_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seller_add_product`
--

INSERT INTO `seller_add_product` (`id`, `product_name`, `category`, `mini_description`, `main_description`, `price`, `stock_quantity`, `product_image`, `sub_image_1`, `sub_image_2`, `sub_image_3`, `seller_id`, `product_status`, `business_name`) VALUES
(329, 'King arthur: all purpose flour', 'Haircare Solutions', '\"Premium quality flour for all your baking and cooking needs', '\"Our all-purpose flour is finely milled for perfect texture and consistency, ideal for breads, pastries, and everyday cooking. Trusted by home cooks and professionals alike.\"', 140.00, 15, 'all_purpose_flour.jpg', 'all_purpose_flour.jpg', 'all_purpose_flour.jpg', 'all_purpose_flour.jpg', 73, 'listed', 'Baking Supplies & Ingredients'),
(330, 'almond flour', 'Haircare Solutions', 'Gluten-free almond flour for healthy, low-carb baking.', 'Made from finely ground blanched almonds, our almond flour is a nutritious, gluten-free alternative perfect for keto, paleo, and low-carb recipes. Great for baking, breading, and adding a nutty flavor to your dishes', 140.00, 15, 'Almond_Flour_Brownies.jpg', 'Almond_Flour_Brownies.jpg', 'Almond_Flour_Brownies.jpg', 'Almond_Flour_Brownies.jpg', 73, 'listed', 'Baking Supplies & Ingredients'),
(331, 'Cornstarch', 'Haircare Solutions', 'Pure cornstarch for thickening sauces, soups, and desserts', 'Versatile and smooth, our cornstarch is perfect for thickening gravies, soups, sauces, and baked goods. A kitchen essential for achieving the perfect texture in your recipes.', 100.00, 15, 'argo_cornstarch.jpg', 'argo_cornstarch.jpg', 'argo_cornstarch.jpg', 'argo_cornstarch.jpg', 73, 'listed', 'Baking Supplies & Ingredients'),
(332, 'baking square pan', 'Haircare Solutions', 'Durable square baking pan for perfect cakes and brownies.', 'This non-stick square baking pan ensures even heat distribution for perfectly baked cakes, brownies, and bars. Ideal for everyday baking with easy cleanup and long-lasting performance', 150.00, 15, 'Bakers_Secret_Signature_Square_Cake_Pan_8-Inch.jpg', 'Bakers_Secret_Signature_Square_Cake_Pan_8-Inch.jpg', 'Bakers_Secret_Signature_Square_Cake_Pan_8-Inch.jpg', 'Bakers_Secret_Signature_Square_Cake_Pan_8-Inch.jpg', 73, 'listed', 'Baking Supplies & Ingredients'),
(333, 'bread flour', 'Haircare Solutions', 'High-protein bread flour for soft, chewy, and airy loaves.', 'Specially milled for bread-making, our high-protein bread flour gives structure and rise to homemade loaves, rolls, and pizza dough. Perfect for achieving bakery-quality results at home.', 140.00, 15, 'bread_flour.jpg', 'bread_flour.jpg', 'bread_flour.jpg', 'bread_flour.jpg', 73, 'listed', 'Baking Supplies & Ingredients'),
(334, 'gluten free all purpose flour', 'Haircare Solutions', 'Versatile gluten-free flour for all your baking needs.', 'Our gluten-free all-purpose flour is a balanced blend ideal for baking cookies, cakes, breads, and more—without the gluten. Perfect for those with dietary restrictions, offering great taste and texture in every bite.', 140.00, 15, 'gluten_free_-_all_purpose_flour.jpg', 'gluten_free_-_all_purpose_flour.jpg', 'gluten_free_-_all_purpose_flour.jpg', 'gluten_free_-_all_purpose_flour.jpg', 73, 'listed', 'Baking Supplies & Ingredients'),
(335, 'measuring spoon, cup set', 'Haircare Solutions', 'Complete measuring spoon and cup set for precise cooking and baking.', 'This durable measuring spoon and cup set includes all essential sizes for accurate ingredient measurement. Made from high-quality materials, it\'s perfect for both dry and liquid ingredients in any kitchen task.', 250.00, 15, 'Measuring_Spoons_Cups_Set.jpg', 'Measuring_Spoons_Cups_Set.jpg', 'Measuring_Spoons_Cups_Set.jpg', 'Measuring_Spoons_Cups_Set.jpg', 73, 'listed', 'Baking Supplies & Ingredients'),
(336, 'natural banana extract', 'Haircare Solutions', 'Natural banana extract for rich, fruity flavor in every drop.', 'Made from real bananas, our natural banana extract adds a sweet, authentic banana flavor to your baked goods, smoothies, and desserts. A little goes a long way to enhance your recipes naturally.', 130.00, 15, 'Natural_Banana_Extract.jpg', 'Natural_Banana_Extract.jpg', 'Natural_Banana_Extract.jpg', 'Natural_Banana_Extract.jpg', 73, 'listed', 'Baking Supplies & Ingredients'),
(337, 'Original butter', 'Haircare Solutions', 'Rich and creamy original butter for everyday cooking and baking.', 'Our original butter is made from pure cream, delivering a rich, smooth flavor perfect for spreading, sautéing, and baking. A kitchen staple for classic taste and quality.', 135.00, 15, 'original_butter.jpg', 'original_butter.jpg', 'original_butter.jpg', 'original_butter.jpg', 73, 'listed', 'Baking Supplies & Ingredients'),
(338, 'oven thermometer', 'Haircare Solutions', 'Accurate oven thermometer for perfect baking temperatures.', 'Ensure precise cooking with our easy-to-read oven thermometer. Designed to withstand high heat, it helps you monitor oven temperature for consistently perfect baking and roasting results.', 399.00, 15, 'over_thermometer.jpg', 'over_thermometer.jpg', 'over_thermometer.jpg', 'over_thermometer.jpg', 73, 'listed', 'Baking Supplies & Ingredients'),
(339, 'cake pan set', 'Haircare Solutions', 'Durable cake pan set for baking a variety of cakes.', 'Our cake pan set includes multiple sizes with non-stick surfaces for even baking and easy release. Perfect for layer cakes, cheesecakes, and more—ideal for home bakers and professionals alike.', 360.00, 15, 'PP_CHEF_Cake_Pan_Set.jpg', 'PP_CHEF_Cake_Pan_Set.jpg', 'PP_CHEF_Cake_Pan_Set.jpg', 'PP_CHEF_Cake_Pan_Set.jpg', 73, 'listed', 'Baking Supplies & Ingredients'),
(340, 'pastry brush', 'Haircare Solutions', 'Versatile pastry brush for glazing, basting, and decorating.', 'Our pastry brush features soft, heat-resistant bristles for easy application of butter, egg wash, sauces, and glazes. A handy tool for baking and cooking with precision.', 199.00, 15, 'pastry_brush.jpg', 'pastry_brush.jpg', 'pastry_brush.jpg', 'pastry_brush.jpg', 73, 'listed', 'Baking Supplies & Ingredients'),
(341, 'piping bags and tips set', 'Haircare Solutions', 'Complete piping bags and tips set for decorating cakes and pastries.', 'This set includes reusable piping bags and a variety of metal tips for creating beautiful designs on cakes, cupcakes, and desserts. Perfect for both beginners and professional bakers.', 299.00, 15, 'Piping_Bags_and_Tips_Set.jpg', 'Piping_Bags_and_Tips_Set.jpg', 'Piping_Bags_and_Tips_Set.jpg', 'Piping_Bags_and_Tips_Set.jpg', 73, 'listed', 'Baking Supplies & Ingredients'),
(342, 'set of electric mixer', 'Skincare Products', 'Powerful electric mixer set for effortless mixing and baking.', 'Our electric mixer set comes with multiple speed settings and attachments, making it easy to whip, beat, and mix ingredients for cakes, doughs, and more. A must-have for every kitchen.', 589.00, 15, 'set_of_electric_mixer.jpg', 'set_of_electric_mixer.jpg', 'set_of_electric_mixer.jpg', 'set_of_electric_mixer.jpg', 73, 'listed', 'Baking Supplies & Ingredients'),
(343, 'set of machine mixer', 'Haircare Solutions', 'All-in-one mixer machine set for efficient baking and cooking.', 'This mixer machine set includes versatile attachments for mixing, kneading, and whipping. Designed for power and convenience, it’s perfect for preparing doughs, batters, and more with professional results.', 1050.00, 15, 'set_of_machine_mixer.jpg', 'set_of_machine_mixer.jpg', 'set_of_machine_mixer.jpg', 'set_of_machine_mixer.jpg', 73, 'listed', 'Baking Supplies & Ingredients'),
(344, 'blueberry mint iced', 'Health Supplements', 'Refreshing blueberry mint iced drink for a cool, fruity twist.', 'A vibrant blend of sweet blueberries and fresh mint, this iced beverage delivers a crisp, revitalizing flavor perfect for hot days. Naturally refreshing and delightfully smooth.', 145.00, 15, 'blueberry_mint_iced.jpg', 'blueberry_mint_iced.jpg', 'blueberry_mint_iced.jpg', 'blueberry_mint_iced.jpg', 2, 'listed', 'Coffee, Tea & Beverages'),
(345, 'cafe style cold coffee', 'Health Supplements', 'Smooth, cafe-style cold coffee with rich, bold flavor.', 'Crafted for coffee lovers, our cafe-style cold coffee blends premium brewed coffee with creamy milk for a refreshing, energizing drink. Perfectly chilled and ready to enjoy anytime.', 135.00, 15, 'Cafe_Style_Cold_Coffee.jpg', 'Cafe_Style_Cold_Coffee.jpg', 'Cafe_Style_Cold_Coffee.jpg', 'Cafe_Style_Cold_Coffee.jpg', 2, 'listed', 'Coffee, Tea & Beverages'),
(346, 'cuppucino rich caramel', 'Health Supplements', 'Rich cappuccino blended with smooth, sweet caramel.', 'Our caramel cappuccino combines bold espresso, frothy milk, and a swirl of luscious caramel for a perfectly balanced, indulgent coffee experience. Great hot or iced for any time of day.', 135.00, 15, 'Cappuccino_caramel.jpg', 'Cappuccino_caramel.jpg', 'Cappuccino_caramel.jpg', 'Cappuccino_caramel.jpg', 2, 'listed', 'Coffee, Tea & Beverages'),
(347, 'caramel tea', 'Health Supplements', 'Sweet and soothing caramel tea with a rich, mellow flavor.', 'Delight in the comforting blend of smooth black tea infused with the warm sweetness of caramel. Perfect for a relaxing break, this tea offers a naturally rich and cozy taste experience.', 140.00, 15, 'caramel_tea.jpg', 'caramel_tea.jpg', 'caramel_tea.jpg', 'caramel_tea.jpg', 2, 'listed', 'Coffee, Tea & Beverages'),
(348, 'chai tea latte', 'Health Supplements', 'Creamy chai tea latte with warm spices and bold flavor.', 'Our chai tea latte blends robust black tea with aromatic spices like cinnamon and cardamom, finished with creamy milk for a smooth, comforting drink. A perfect balance of spice and sweetness in every sip.', 140.00, 15, 'chai_tea_latte.jpg', 'chai_tea_latte.jpg', 'chai_tea_latte.jpg', 'chai_tea_latte.jpg', 2, 'listed', 'Coffee, Tea & Beverages'),
(349, 'cold brew', 'Skincare Products', 'Smooth, bold cold brew coffee for a refreshing caffeine kick.', 'Brewed slowly for a richer, less acidic taste, our cold brew coffee delivers deep flavor and a smooth finish. Perfect over ice, it’s a refreshing way to energize your day.', 140.00, 15, 'Cold_Brew.jpg', 'Cold_Brew.jpg', 'Cold_Brew.jpg', 'Cold_Brew.jpg', 2, 'listed', 'Coffee, Tea & Beverages'),
(350, 'cold brew caramel', 'Health Supplements', 'Bold cold brew coffee with a smooth caramel twist.', 'Our cold brew caramel combines the rich, smooth taste of slow-steeped coffee with a touch of sweet caramel. Refreshing and indulgent, it’s the perfect chilled pick-me-up.', 140.00, 15, 'Cold_Coffee_-_3_Ways.jpg', 'Cold_Coffee_-_3_Ways.jpg', 'Cold_Coffee_-_3_Ways.jpg', 'Cold_Coffee_-_3_Ways.jpg', 2, 'listed', 'Coffee, Tea & Beverages'),
(351, 'cuppucino latte iced', 'Health Supplements', 'Iced cappuccino latte with smooth espresso and creamy milk.', 'A refreshing twist on a classic, our iced cappuccino latte blends bold espresso with chilled, frothy milk for a smooth, creamy taste. Perfectly balanced and served cold for your coffee cravings.', 135.00, 15, 'Cuppuccino_latter_iced.jpg', 'Cuppuccino_latter_iced.jpg', 'Cuppuccino_latter_iced.jpg', 'Cuppuccino_latter_iced.jpg', 2, 'listed', 'Coffee, Tea & Beverages'),
(352, 'gumamela tea', 'Health Supplements', 'Calming gumamela (hibiscus) tea with a floral, tangy flavor', 'Gumamela tea, made from hibiscus flowers, offers a refreshing and naturally tangy taste packed with antioxidants. Enjoy it hot or iced for a soothing and healthy beverage.', 130.00, 15, 'gumamela_tea.jpg', 'gumamela_tea.jpg', 'gumamela_tea.jpg', 'gumamela_tea.jpg', 2, 'listed', 'Coffee, Tea & Beverages'),
(353, 'japanese green tea', 'Health Supplements', 'Pure Japanese green tea with fresh, grassy notes.', 'Experience the authentic taste of Japanese green tea, known for its delicate flavor and natural antioxidants. Light, refreshing, and perfect for a calming tea break.', 130.00, 15, 'japanese_green_tea.jpg', 'japanese_green_tea.jpg', 'japanese_green_tea.jpg', 'japanese_green_tea.jpg', 2, 'listed', 'Coffee, Tea & Beverages'),
(354, 'peanut butter high protein smoothies', 'Health Supplements', 'High-protein peanut butter smoothie for energy and muscle fuel.', 'Our peanut butter high-protein smoothie blends creamy peanut butter with protein-rich ingredients for a delicious, satisfying drink. Perfect as a post-workout boost or nutritious snack.', 140.00, 15, 'peanut_butter_high_protien_smoothies.jpg', 'peanut_butter_high_protien_smoothies.jpg', 'peanut_butter_high_protien_smoothies.jpg', 'peanut_butter_high_protien_smoothies.jpg', 2, 'listed', 'Coffee, Tea & Beverages'),
(355, 'lemon mint & soda', 'Health Supplements', 'Zesty lemon mint soda for a refreshing, bubbly twist', 'A crisp blend of tangy lemon and fresh mint combined with sparkling soda water, delivering a cool and invigorating drink perfect for any time you need a refreshing lift.', 145.00, 15, 'lemon__mint_soda.jpg', 'lemon__mint_soda.jpg', 'lemon__mint_soda.jpg', 'lemon__mint_soda.jpg', 2, 'listed', 'Coffee, Tea & Beverages'),
(356, 'matcha smoothies', 'Health Supplements', 'Creamy matcha smoothie packed with antioxidants and flavor.', 'Our matcha smoothie blends vibrant green tea powder with creamy ingredients for a refreshing, energizing drink rich in antioxidants. Perfect for a healthy boost anytime.', 145.00, 15, 'matcha_smoothies.jpg', 'matcha_smoothies.jpg', 'matcha_smoothies.jpg', 'matcha_smoothies.jpg', 2, 'listed', 'Coffee, Tea & Beverages'),
(357, 'mango iced & lemon', 'Health Supplements', 'Tropical mango iced tea with a zesty lemon twist.', 'A refreshing blend of sweet mango and tangy lemon served iced, this drink offers a perfect balance of fruity sweetness and citrus zing—ideal for cooling down on warm days.', 145.00, 15, 'Mango_Iced_Tea.jpg', 'Mango_Iced_Tea.jpg', 'Mango_Iced_Tea.jpg', 'Mango_Iced_Tea.jpg', 2, 'listed', 'Coffee, Tea & Beverages'),
(358, 'maira clara juice', 'Health Supplements', 'Fresh maira clara juice for a sweet, tropical refreshment.', 'Enjoy the naturally sweet and juicy flavor of maira clara fruit in this refreshing juice. Packed with vitamins, it\'s a perfect tropical drink to hydrate and energize your day.', 140.00, 15, 'maira_clara_juice.jpg', 'maira_clara_juice.jpg', 'maira_clara_juice.jpg', 'maira_clara_juice.jpg', 2, 'listed', 'Coffee, Tea & Beverages'),
(359, 'a cup of fruits', 'Makeup & Cosmetics', 'Fresh mixed fruit cup packed with natural sweetness', 'A vibrant cup filled with a variety of fresh, juicy fruits. Perfect for a healthy snack or refreshing treat anytime.', 120.00, 15, 'a_cup_of_fruits.jpg', 'a_cup_of_fruits.jpg', 'a_cup_of_fruits.jpg', 'a_cup_of_fruits.jpg', 3, 'listed', ' Snacks & Candy'),
(360, 'caramel butter bar', 'Makeup & Cosmetics', 'Decadent caramel butter bar with rich, buttery sweetness.', 'Our caramel butter bar features a smooth, buttery base topped with luscious caramel, delivering a rich and indulgent treat perfect for satisfying your sweet cravings.', 110.00, 15, 'caramel_butter_bar.jpg', 'caramel_butter_bar.jpg', 'caramel_butter_bar.jpg', 'caramel_butter_bar.jpg', 3, 'listed', ' Snacks & Candy'),
(361, 'caramel wrap dark choco', 'Makeup & Cosmetics', 'Rich dark chocolate wrapped with smooth caramel.', 'Indulge in the perfect blend of bittersweet dark chocolate enveloping a silky caramel center. A decadent treat for chocolate and caramel lovers alike.', 110.00, 15, 'caramel_wrapped_dark_choco.jpg', 'caramel_wrapped_dark_choco.jpg', 'caramel_wrapped_dark_choco.jpg', 'caramel_wrapped_dark_choco.jpg', 3, 'listed', ' Snacks & Candy'),
(362, 'cheese puffs', 'Makeup & Cosmetics', 'Crispy cheese puffs with a bold cheesy flavor.', 'Our cheese puffs are light, crunchy snacks packed with rich, savory cheese taste. Perfect for satisfying your snack cravings anytime.', 80.00, 15, 'cheese_puffs.jpg', 'cheese_puffs.jpg', 'cheese_puffs.jpg', 'cheese_puffs.jpg', 3, 'listed', ' Snacks & Candy'),
(363, 'cheez - it crackers', 'Makeup & Cosmetics', 'Crunchy Cheez-It crackers with sharp, cheesy flavor.', 'Cheez-It crackers deliver a perfect balance of crispy texture and bold, cheesy taste. Ideal for snacking, lunchboxes, or pairing with your favorite dips.', 95.00, 15, 'cheezit_crackers.jpg', 'cheezit_crackers.jpg', 'cheezit_crackers.jpg', 'cheezit_crackers.jpg', 3, 'listed', ' Snacks & Candy'),
(364, 'chocolate chips coockies', 'Makeup & Cosmetics', 'Soft chocolate chip cookies with melty chocolate chunks.', 'Delight in our freshly baked chocolate chip cookies, loaded with rich, gooey chocolate chips for a classic, comforting treat that’s perfect any time of day.', 155.00, 15, 'chocolate_chip_coockies.jpg', 'chocolate_chip_coockies.jpg', 'chocolate_chip_coockies.jpg', 'chocolate_chip_coockies.jpg', 3, 'listed', ' Snacks & Candy'),
(365, 'chocolate chips muffins', 'Makeup & Cosmetics', 'Moist chocolate chip muffins bursting with chocolatey goodness.', 'Our chocolate chip muffins are soft and fluffy, packed with generous chocolate chips in every bite. Perfect for breakfast, snacks, or dessert cravings.', 145.00, 15, 'chocolate_chips_muffins.jpg', 'chocolate_chips_muffins.jpg', 'chocolate_chips_muffins.jpg', 'chocolate_chips_muffins.jpg', 3, 'listed', ' Snacks & Candy'),
(366, 'chocolate pepper mint', 'Makeup & Cosmetics', 'Refreshing chocolate peppermint with a cool, minty twist.', 'A delightful blend of rich chocolate and invigorating peppermint, offering a perfect balance of sweet and cool flavors. Ideal for a refreshing treat anytime.', 140.00, 15, 'chocolate_peppermint.jpg', 'chocolate_peppermint.jpg', 'chocolate_peppermint.jpg', 'chocolate_peppermint.jpg', 3, 'listed', ' Snacks & Candy'),
(367, 'nuts & honey', 'Makeup & Cosmetics', 'Crunchy nuts drizzled with natural honey sweetness.', 'A wholesome mix of roasted nuts coated in pure honey, creating a perfect balance of crunchy texture and sweet flavor. Great as a snack or topping for yogurt and desserts.', 130.00, 15, 'nuts__honey.jpg', 'nuts__honey.jpg', 'nuts__honey.jpg', 'nuts__honey.jpg', 3, 'listed', ' Snacks & Candy'),
(368, 'sea salt chocolate nuts', 'Makeup & Cosmetics', 'Decadent chocolate-covered nuts with a hint of sea salt.', 'Rich, smooth chocolate envelopes crunchy nuts, enhanced by a touch of sea salt for a perfect sweet-and-salty snack that satisfies every craving.', 120.00, 15, 'sea_salt_chocolate_nuts.jpg', 'sea_salt_chocolate_nuts.jpg', 'sea_salt_chocolate_nuts.jpg', 'sea_salt_chocolate_nuts.jpg', 3, 'listed', ' Snacks & Candy'),
(369, 'rice pop corn', 'Makeup & Cosmetics', 'Light and crispy rice popcorn for a healthy snack.', 'Our rice popcorn is a crunchy, low-calorie snack made from puffed rice. Perfect for guilt-free munching anytime, with a subtle, satisfying taste', 60.00, 15, 'rice_pop_corn.jpg', 'rice_pop_corn.jpg', 'rice_pop_corn.jpg', 'rice_pop_corn.jpg', 3, 'listed', ' Snacks & Candy'),
(370, 'tostitos ', 'Makeup & Cosmetics', 'Crispy Tostitos tortilla chips perfect for dipping.', 'Tostitos are crunchy, golden tortilla chips made from quality corn. Ideal for pairing with salsa, guacamole, or your favorite dips for tasty snacking', 95.00, 15, 'tostitos_snacks.jpg', 'tostitos_snacks.jpg', 'tostitos_snacks.jpg', 'tostitos_snacks.jpg', 3, 'listed', ' Snacks & Candy'),
(371, 'truffle brownies', 'Makeup & Cosmetics', 'Decadent truffle brownies with rich, fudgy texture.', 'Our truffle brownies are indulgently moist and dense, infused with premium chocolate for an ultra-rich, melt-in-your-mouth experience. Perfect for chocolate lovers craving luxury in every bite.', 95.00, 15, 'truffle_browies.jpg', 'truffle_browies.jpg', 'truffle_browies.jpg', 'truffle_browies.jpg', 3, 'listed', ' Snacks & Candy'),
(372, 'nougats', 'Makeup & Cosmetics', 'Chewy nougats packed with nuts and sweet honey.', 'Our nougats combine soft, chewy texture with crunchy nuts and a delicate honey sweetness, creating a classic treat that’s perfect for snacking or gifting.', 95.00, 15, 'nouguts.jpg', 'nouguts.jpg', 'nouguts.jpg', 'nouguts.jpg', 3, 'listed', ' Snacks & Candy'),
(373, 'matcha chocolate pie', 'Makeup & Cosmetics', 'Delicious matcha chocolate pie with creamy, rich flavor.', 'Our matcha chocolate pie blends earthy green tea with smooth chocolate in a flaky crust, delivering a unique and indulgent dessert experience.', 150.00, 15, 'green_tea_chocolate.jpg', 'green_tea_chocolate.jpg', 'green_tea_chocolate.jpg', 'green_tea_chocolate.jpg', 3, 'listed', ' Snacks & Candy'),
(374, 'caramelized banana toast bread', 'Personal Care Appliances', 'Sweet caramelized banana toast on soft bread.', 'A deliciously warm toast topped with caramelized bananas and a hint of sweetness, perfect for breakfast or a cozy snack.', 140.00, 15, 'Caramelized_Banana_Toast_with_Cinnamon_and_Honey.jpg', 'Caramelized_Banana_Toast_with_Cinnamon_and_Honey.jpg', 'Caramelized_Banana_Toast_with_Cinnamon_and_Honey.jpg', 'Caramelized_Banana_Toast_with_Cinnamon_and_Honey.jpg', 4, 'listed', 'Specialty Foods & International\nCuisine'),
(375, 'cinnamon rolls', 'Personal Care Appliances', 'Soft and sweet cinnamon rolls with gooey cinnamon filling.', 'Freshly baked cinnamon rolls with a tender dough, swirled with spiced cinnamon sugar, and topped with a creamy glaze. Perfect for a comforting treat any time of day.', 140.00, 15, 'cinnamon_rolls.jpg', 'cinnamon_rolls.jpg', 'cinnamon_rolls.jpg', 'cinnamon_rolls.jpg', 4, 'listed', 'Specialty Foods & International\nCuisine'),
(376, 'Cozy Butternut Squash Soup with Crème Fraîche', 'Personal Care Appliances', 'Warm butternut squash soup topped with creamy crème fraîche.', 'A comforting, velvety soup made from roasted butternut squash, gently spiced and finished with a dollop of rich crème fraîche for a smooth, luxurious touch.', 170.00, 15, 'Cozy_Butternut_Squash_Soup_with_Creme_Fraiche.jpg', 'Cozy_Butternut_Squash_Soup_with_Creme_Fraiche.jpg', 'Cozy_Butternut_Squash_Soup_with_Creme_Fraiche.jpg', 'Cozy_Butternut_Squash_Soup_with_Creme_Fraiche.jpg', 4, 'listed', 'Specialty Foods & International\nCuisine'),
(377, 'curry paste', 'Personal Care Appliances', 'Flavorful curry paste to spice up your dishes.', 'Our curry paste is a rich blend of aromatic spices and herbs, perfect for creating authentic, savory curry dishes with bold, vibrant flavors.', 139.00, 15, 'curry_paste.jpg', 'curry_paste.jpg', 'curry_paste.jpg', 'curry_paste.jpg', 4, 'listed', 'Specialty Foods & International\nCuisine'),
(378, 'Healthy Avocado Egg Toast', 'Personal Care Appliances', 'Nutritious avocado egg toast with creamy and savory flavors.', 'Whole-grain toast topped with mashed avocado and a perfectly cooked egg, seasoned for a healthy, satisfying breakfast or snack packed with good fats and protein.', 159.00, 15, 'Healthy_Avocado_Egg_Toast.jpg', 'Healthy_Avocado_Egg_Toast.jpg', 'Healthy_Avocado_Egg_Toast.jpg', 'Healthy_Avocado_Egg_Toast.jpg', 4, 'listed', 'Specialty Foods & International\nCuisine'),
(379, 'yuzu juice', 'Personal Care Appliances', 'Tart and fragrant yuzu juice for bright, citrusy flavor.', 'Extracted from the aromatic yuzu fruit, this juice adds a unique blend of tartness and floral citrus notes, perfect for cocktails, dressings, marinades, and more.', 130.00, 15, 'yuzu_juice.jpg', 'yuzu_juice.jpg', 'yuzu_juice.jpg', 'yuzu_juice.jpg', 4, 'listed', 'Specialty Foods & International\nCuisine'),
(380, 'mirin', 'Personal Care Appliances', 'Sweet Japanese mirin for authentic cooking flavor.', 'Mirin is a traditional Japanese rice wine with a mild sweetness, used to enhance the flavor and glaze of dishes like teriyaki, sauces, and marinades.', 159.00, 15, 'mirin.jpg', 'mirin.jpg', 'mirin.jpg', 'mirin.jpg', 4, 'listed', 'Specialty Foods & International\nCuisine'),
(381, 'safron', 'Personal Care Appliances', 'Premium saffron threads for rich aroma and vibrant color.', 'Our high-quality saffron adds a delicate floral aroma, deep golden hue, and subtle flavor to your dishes, perfect for enhancing rice, desserts, and more.', 150.00, 15, 'safron.jpg', 'safron.jpg', 'safron.jpg', 'safron.jpg', 4, 'listed', 'Specialty Foods & International\nCuisine'),
(382, 'samjin wang kimchi ', 'Personal Care Appliances', 'Authentic Samjin Wang Kimchi with bold, spicy flavor.', 'Samjin Wang Kimchi offers traditional Korean fermented cabbage packed with vibrant spices and tangy heat. Perfect as a side dish or flavorful ingredient in your meals.', 145.00, 15, 'samjin_wang_kimchi_1.jpg', 'samjin_wang_kimchi_1.jpg', 'samjin_wang_kimchi_1.jpg', 'samjin_wang_kimchi_1.jpg', 4, 'listed', 'Specialty Foods & International\nCuisine'),
(383, 'Roasted Tomato Basil Soup Recipe', 'Personal Care Appliances', 'Rich roasted tomato basil soup with fresh herbs.', 'A comforting soup made from slow-roasted tomatoes blended with fresh basil and spices, delivering a deep, savory flavor perfect for cozy meals.', 149.00, 15, 'Roasted_Tomato_Basil_Soup_Recipe.jpg', 'Roasted_Tomato_Basil_Soup_Recipe.jpg', 'Roasted_Tomato_Basil_Soup_Recipe.jpg', 'Roasted_Tomato_Basil_Soup_Recipe.jpg', 4, 'listed', 'Specialty Foods & International\nCuisine'),
(384, 'Roasted Turkey And Cranberry Brie Melt', 'Personal Care Appliances', 'Warm roasted turkey sandwich with cranberry and brie.', 'A delicious melt combining tender roasted turkey, creamy brie cheese, and tangy cranberry sauce on toasted bread—perfect for a cozy, flavorful meal.', 160.00, 15, 'Roasted_Turkey_And_Cranberry_Brie_Melt.jpg', 'Roasted_Turkey_And_Cranberry_Brie_Melt.jpg', 'Roasted_Turkey_And_Cranberry_Brie_Melt.jpg', 'Roasted_Turkey_And_Cranberry_Brie_Melt.jpg', 4, 'listed', 'Specialty Foods & International\nCuisine'),
(385, 'Healthy Grilled  Basil Mozzarella Caprese Panini Sandwich', 'Personal Care Appliances', 'Healthy grilled panini with basil, mozzarella, and tomatoes.', 'A fresh and flavorful sandwich featuring melted mozzarella, fragrant basil, and ripe tomatoes grilled to perfection on whole-grain bread. A nutritious and delicious meal on the go.', 160.00, 15, 'Healthy_Grilled_Basil_Mozzarella_Caprese_Panini_Sandwich.jpg', 'Healthy_Grilled_Basil_Mozzarella_Caprese_Panini_Sandwich.jpg', 'Healthy_Grilled_Basil_Mozzarella_Caprese_Panini_Sandwich.jpg', 'Healthy_Grilled_Basil_Mozzarella_Caprese_Panini_Sandwich.jpg', 4, 'listed', 'Specialty Foods & International\nCuisine'),
(386, 'nori sheets', 'Personal Care Appliances', 'Crispy nori sheets perfect for sushi and snacks.', 'Our premium nori sheets are thin, roasted seaweed perfect for making sushi rolls, rice balls, or enjoying as a healthy, savory snack packed with nutrients.', 100.00, 15, 'nori_sheets.jpg', 'nori_sheets.jpg', 'nori_sheets.jpg', 'nori_sheets.jpg', 4, 'listed', 'Specialty Foods & International\nCuisine'),
(387, 'tiramisu', 'Personal Care Appliances', 'Classic tiramisu with creamy mascarpone and espresso-soaked layers.', 'An indulgent Italian dessert featuring layers of coffee-soaked ladyfingers and rich mascarpone cream, dusted with cocoa powder for a perfect balance of sweetness and bold flavor.', 100.00, 15, 'MINI_TIRAMISU_CUPS.jpg', 'MINI_TIRAMISU_CUPS.jpg', 'MINI_TIRAMISU_CUPS.jpg', 'MINI_TIRAMISU_CUPS.jpg', 4, 'listed', 'Specialty Foods & International\nCuisine'),
(388, 'Savory Herb and Cheese Scones', 'Personal Care Appliances', 'Flaky savory scones with herbs and cheese.', 'Deliciously buttery scones infused with fresh herbs and melted cheese, perfect for breakfast, snacks, or alongside soups and salads.', 140.00, 15, 'Savory_Herb_and_Cheese_Scones.jpg', 'Savory_Herb_and_Cheese_Scones.jpg', 'Savory_Herb_and_Cheese_Scones.jpg', 'Savory_Herb_and_Cheese_Scones.jpg', 4, 'listed', 'Specialty Foods & International\nCuisine'),
(389, 'black beans', 'Skincare Products', 'Nutritious black beans, rich in fiber and protein.', 'Our black beans are versatile and packed with nutrients, perfect for soups, salads, stews, and a variety of hearty dishes.', 140.00, 15, 'black_beans_1.jpg', 'black_beans_1.jpg', 'black_beans_1.jpg', 'black_beans_1.jpg', 5, 'listed', 'Organic & Health Foods'),
(390, 'Fresh fruit salad with berries, kiwi, and mint in glass bowl', 'Skincare Products', 'Vibrant fresh fruit salad with berries, kiwi, and mint.', 'A colorful and refreshing mix of juicy berries, sweet kiwi, and fresh mint served in a glass bowl. Perfect for a healthy snack or light dessert.', 130.00, 15, 'Fresh_fruit_salad_with_berries_kiwi_and_mint_in_glass_bowl.jpg', 'Fresh_fruit_salad_with_berries_kiwi_and_mint_in_glass_bowl.jpg', 'Fresh_fruit_salad_with_berries_kiwi_and_mint_in_glass_bowl.jpg', 'Fresh_fruit_salad_with_berries_kiwi_and_mint_in_glass_bowl.jpg', 5, 'listed', 'Organic & Health Foods'),
(391, 'geek yougurt', 'Skincare Products', 'Thick and creamy Greek yogurt packed with protein.', 'Our Greek yogurt offers a smooth, rich texture and tangy flavor, perfect for breakfast, snacks, or adding to recipes for a healthy protein boost.', 130.00, 15, 'Greek_Yogurt.jpg', 'Greek_Yogurt.jpg', 'Greek_Yogurt.jpg', 'Greek_Yogurt.jpg', 5, 'listed', 'Organic & Health Foods'),
(392, 'hummus veggies', 'Skincare Products', 'Fresh veggies served with creamy hummus dip.', '\"A healthy and colorful platter of crisp, fresh vegetables paired with smooth, flavorful hummus—perfect for snacking or entertaining.\"', 150.00, 15, 'hummus_veggies.jpg', 'hummus_veggies.jpg', 'hummus_veggies.jpg', 'hummus_veggies.jpg', 5, 'listed', 'Organic & Health Foods'),
(393, 'Lentil & Vegetable Soup', 'Skincare Products', 'Hearty lentil and vegetable soup full of flavor.', 'A nourishing soup combining protein-rich lentils with fresh vegetables and herbs, simmered to create a comforting and wholesome meal.', 145.00, 15, 'Lentil__Vegetable_Soup.jpg', 'Lentil__Vegetable_Soup.jpg', 'Lentil__Vegetable_Soup.jpg', 'Lentil__Vegetable_Soup.jpg', 5, 'listed', 'Organic & Health Foods'),
(394, 'organic honey butter', 'Skincare Products', 'Smooth organic honey butter with natural sweetness.', 'Our organic honey butter blends creamy butter with pure honey for a rich, sweet spread perfect on toast, muffins, and more.', 130.00, 15, 'organic_nut_butter.jpg', 'organic_nut_butter.jpg', 'organic_nut_butter.jpg', 'organic_nut_butter.jpg', 5, 'listed', 'Organic & Health Foods'),
(395, 'organis mapple pecans oatmil', 'Skincare Products', 'Organic maple pecan oatmeal—sweet and wholesome.', 'A delicious organic oatmeal blend infused with natural maple syrup and crunchy pecans for a nutritious, hearty breakfast packed with flavor and energy.', 160.00, 15, 'organis_mapple_pecans_oatmil.jpg', 'organis_mapple_pecans_oatmil.jpg', 'organis_mapple_pecans_oatmil.jpg', 'organis_mapple_pecans_oatmil.jpg', 5, 'listed', 'Organic & Health Foods'),
(396, 'peanut butter energy ball', 'Skincare Products', 'Protein-packed peanut butter energy balls.', 'Made with wholesome ingredients like oats, peanut butter, and honey, these energy balls are a delicious, no-bake snack perfect for fueling your day.', 135.00, 15, 'peanut_butter_energy_ball.jpg', 'peanut_butter_energy_ball.jpg', 'peanut_butter_energy_ball.jpg', 'peanut_butter_energy_ball.jpg', 5, 'listed', 'Organic & Health Foods'),
(397, 'hard boiled egg', 'Skincare Products', 'Simple and nutritious hard-boiled egg.', 'A classic source of protein, our hard-boiled eggs are perfectly cooked for a quick snack, breakfast addition, or protein boost to any meal.', 45.00, 15, 'Perfect_Hard_Boiled_Eggs.jpg', 'Perfect_Hard_Boiled_Eggs.jpg', 'Perfect_Hard_Boiled_Eggs.jpg', 'Perfect_Hard_Boiled_Eggs.jpg', 5, 'listed', 'Organic & Health Foods'),
(398, 'pomegrante organic juice', 'Skincare Products', 'Pure organic pomegranate juice bursting with antioxidants.', 'Made from 100% organic pomegranates, this juice offers a bold, tangy flavor and is packed with natural antioxidants—perfect for a refreshing and health-boosting drink.', 169.00, 15, 'pomegranate_juice.jpg', 'pomegranate_juice.jpg', 'pomegranate_juice.jpg', 'pomegranate_juice.jpg', 5, 'listed', 'Organic & Health Foods'),
(399, 'Roasted Turkey And Cranberry', 'Skincare Products', 'Roasted turkey with sweet-tart cranberry flavor.', 'Tender slices of roasted turkey paired with tangy cranberry sauce for a flavorful combination—perfect for sandwiches, wraps, or as a hearty main dish.', 159.00, 15, 'Roasted_Turkey_And_Cranberry.jpg', 'Roasted_Turkey_And_Cranberry.jpg', 'Roasted_Turkey_And_Cranberry.jpg', 'Roasted_Turkey_And_Cranberry.jpg', 5, 'listed', 'Organic & Health Foods'),
(400, 'salmon wild caught', 'Skincare Products', 'Fresh wild-caught salmon rich in omega-3s.', 'Our wild-caught salmon is sustainably sourced and packed with heart-healthy omega-3 fatty acids, offering a rich, clean flavor perfect for grilling, baking, or pan-searing.', 150.00, 15, 'salmon_wild_caught.jpg', 'salmon_wild_caught.jpg', 'salmon_wild_caught.jpg', 'salmon_wild_caught.jpg', 5, 'listed', 'Organic & Health Foods'),
(401, 'tuna wild caught', 'Skincare Products', 'Wild-caught tuna with bold flavor and lean protein.', 'Sustainably sourced wild-caught tuna, rich in protein and omega-3s, perfect for salads, sandwiches, or seared dishes with fresh, ocean-caught quality.', 160.00, 15, 'tune_wild_caught.jpg', 'tune_wild_caught.jpg', 'tune_wild_caught.jpg', 'tune_wild_caught.jpg', 5, 'listed', 'Organic & Health Foods'),
(402, 'Vegan Banana Bread', 'Skincare Products', 'Moist and flavorful vegan banana bread.', 'This plant-based banana bread is soft, sweet, and perfectly spiced, made without dairy or eggs—an ideal treat for a wholesome, guilt-free indulgence.', 135.00, 15, 'Vegan_Banana_Bread.jpg', 'Vegan_Banana_Bread.jpg', 'Vegan_Banana_Bread.jpg', 'Vegan_Banana_Bread.jpg', 5, 'listed', 'Organic & Health Foods'),
(403, 'Veggie Sticks with Hummus', 'Skincare Products', 'Crunchy veggie sticks paired with creamy hummus.', 'A healthy and satisfying snack of fresh-cut vegetables served with smooth, flavorful hummus—perfect for dipping and packed with nutrients.', 157.00, 15, 'Veggie_Sticks_with_Hummus.jpg', 'Veggie_Sticks_with_Hummus.jpg', 'Veggie_Sticks_with_Hummus.jpg', 'Veggie_Sticks_with_Hummus.jpg', 5, 'listed', 'Organic & Health Foods'),
(404, 'Chicken Souvlaki with Roasted Vegetables', 'Men\'s Grooming', 'Grilled chicken souvlaki served with roasted vegetables.', 'Tender, marinated chicken skewers grilled to perfection and served alongside a medley of seasoned roasted vegetables for a flavorful and balanced Mediterranean-inspired meal.', 145.00, 15, 'Chicken_Souvlaki_with_Roasted_Vegetables.jpg', 'Chicken_Souvlaki_with_Roasted_Vegetables.jpg', 'Chicken_Souvlaki_with_Roasted_Vegetables.jpg', 'Chicken_Souvlaki_with_Roasted_Vegetables.jpg', 6, 'listed', 'Meal Kits & Prepped Foods'),
(405, 'chicken taco', 'Men\'s Grooming', 'Flavorful chicken taco with fresh toppings.', 'A delicious taco filled with seasoned, grilled chicken and topped with crisp lettuce, fresh salsa, and creamy sauce—perfect for a quick, satisfying meal.', 145.00, 15, 'chicken_taco.jpg', 'chicken_taco.jpg', 'chicken_taco.jpg', 'chicken_taco.jpg', 6, 'listed', 'Meal Kits & Prepped Foods'),
(406, 'Chopped Salad in a Cup', 'Men\'s Grooming', 'Fresh chopped salad served conveniently in a cup.', 'A colorful mix of crisp veggies, greens, and flavorful toppings, all chopped and packed into a portable cup for an easy, healthy snack or meal on the go.', 145.00, 15, 'Chopped_Salad_in_a_Cup.jpg', 'Chopped_Salad_in_a_Cup.jpg', 'Chopped_Salad_in_a_Cup.jpg', 'Chopped_Salad_in_a_Cup.jpg', 6, 'listed', 'Meal Kits & Prepped Foods'),
(407, 'easy protien', 'Men\'s Grooming', 'Quick and simple protein-packed snack.', 'A convenient and easy-to-prepare source of protein, perfect for boosting energy and supporting muscle recovery anytime, anywhere.', 135.00, 15, 'easy_protiens.jpg', 'easy_protiens.jpg', 'easy_protiens.jpg', 'easy_protiens.jpg', 6, 'listed', 'Meal Kits & Prepped Foods'),
(408, 'gift box summer sausage', 'Men\'s Grooming', 'Deluxe gift box with savory summer sausage.', 'A thoughtfully curated gift box featuring premium summer sausage, perfect for sharing or enjoying as a savory snack with family and friends.', 499.00, 15, 'gift_box_summer_sausage.jpg', 'gift_box_summer_sausage.jpg', 'gift_box_summer_sausage.jpg', 'gift_box_summer_sausage.jpg', 6, 'listed', 'Meal Kits & Prepped Foods'),
(409, 'gift box', 'Men\'s Grooming', 'Elegant gift box perfect for any occasion.', 'A beautifully packaged gift box filled with carefully selected items, ideal for celebrations, holidays, or thoughtful gestures.', 399.00, 15, 'Gift_Box.jpg', 'Gift_Box.jpg', 'Gift_Box.jpg', 'Gift_Box.jpg', 6, 'listed', 'Meal Kits & Prepped Foods'),
(410, 'lance sandwich 10packs', 'Men\'s Grooming', 'Convenient 10-pack of Lance sandwiches.', 'A bundle of 10 individually wrapped Lance sandwiches, perfect for quick snacks, lunches, or on-the-go meals with classic, tasty flavors.', 299.00, 15, 'lance_sandwich_10packs.jpg', 'lance_sandwich_10packs.jpg', 'lance_sandwich_10packs.jpg', 'lance_sandwich_10packs.jpg', 6, 'listed', 'Meal Kits & Prepped Foods'),
(411, 'lasagna', 'Men\'s Grooming', 'Classic lasagna with layers of pasta, cheese, and sauce.', 'Rich and hearty lasagna featuring tender pasta sheets layered with savory meat sauce, creamy ricotta, and melted cheese—perfect for a comforting family meal.', 158.00, 15, 'lasagna.jpg', 'lasagna.jpg', 'lasagna.jpg', 'lasagna.jpg', 6, 'listed', 'Meal Kits & Prepped Foods'),
(412, 'orvernight oats', 'Men\'s Grooming', 'Easy, no-cook overnight oats for a quick breakfast.', 'A nutritious and convenient breakfast made by soaking oats overnight in milk or yogurt, customizable with fruits, nuts, and sweeteners for a delicious start to your day.', 140.00, 15, 'orvernight_oats.jpg', 'orvernight_oats.jpg', 'orvernight_oats.jpg', 'orvernight_oats.jpg', 6, 'listed', 'Meal Kits & Prepped Foods'),
(413, 'pizza pepperoni', 'Men\'s Grooming', 'Classic pepperoni pizza with savory toppings.', 'A delicious pizza topped with zesty tomato sauce, melted cheese, and generous slices of spicy pepperoni—perfect for any pizza lover.', 200.00, 15, 'pizza_pepperoni.jpg', 'pizza_pepperoni.jpg', 'pizza_pepperoni.jpg', 'pizza_pepperoni.jpg', 6, 'listed', 'Meal Kits & Prepped Foods'),
(414, 'protien baked egg', 'Men\'s Grooming', 'High-protein baked egg for a healthy boost.', 'A simple and nutritious baked egg dish, packed with protein and perfect for a quick breakfast or snack to fuel your day.', 120.00, 15, 'protien_egg.jpg', 'protien_egg.jpg', 'protien_egg.jpg', 'protien_egg.jpg', 6, 'listed', 'Meal Kits & Prepped Foods'),
(415, 'bread oats sandwich', 'Men\'s Grooming', 'Hearty oats bread sandwich for a wholesome meal.', 'A nutritious sandwich made with oats-infused bread, filled with your choice of fresh ingredients—perfect for a satisfying and healthy lunch or snack.', 130.00, 15, 'sandwich_oats.jpg', 'sandwich_oats.jpg', 'sandwich_oats.jpg', 'sandwich_oats.jpg', 6, 'listed', 'Meal Kits & Prepped Foods'),
(416, 'shepered pie', 'Men\'s Grooming', 'Classic shepherd’s pie with savory meat and mashed potato.', 'A comforting dish featuring seasoned ground meat and vegetables topped with creamy mashed potatoes, baked to golden perfection for a hearty meal.', 160.00, 15, 'shepered_pie.jpg', 'shepered_pie.jpg', 'shepered_pie.jpg', 'shepered_pie.jpg', 6, 'listed', 'Meal Kits & Prepped Foods'),
(417, 'thai peanut noodles', 'Men\'s Grooming', 'Flavorful Thai peanut noodles with a creamy sauce.', 'Delicious noodles tossed in a rich, savory peanut sauce with hints of lime and spices, topped with fresh veggies and herbs for a satisfying Asian-inspired dish.', 185.00, 15, 'thai_peanut_noodles.jpg', 'thai_peanut_noodles.jpg', 'thai_peanut_noodles.jpg', 'thai_peanut_noodles.jpg', 6, 'listed', 'Meal Kits & Prepped Foods'),
(418, 'tortelini parmesan pasta', 'Men\'s Grooming', 'Cheesy tortellini pasta with parmesan.', 'Delicate stuffed tortellini tossed in a creamy parmesan sauce, delivering a rich and comforting Italian pasta dish perfect for any meal.', 178.00, 15, 'tortelini_parmesan_pasta.jpg', 'tortelini_parmesan_pasta.jpg', 'tortelini_parmesan_pasta.jpg', 'tortelini_parmesan_pasta.jpg', 6, 'listed', 'Meal Kits & Prepped Foods');

-- --------------------------------------------------------

--
-- Table structure for table `seller_unlisted_products`
--

CREATE TABLE `seller_unlisted_products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `mini_description` text DEFAULT NULL,
  `main_description` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock_quantity` int(11) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `sub_image_1` varchar(255) DEFAULT NULL,
  `sub_image_2` varchar(255) DEFAULT NULL,
  `sub_image_3` varchar(255) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `product_status` varchar(50) DEFAULT NULL,
  `business_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `ID` int(255) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `municipality` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `barangay` varchar(255) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Roles` varchar(255) NOT NULL,
  `Status` enum('pending','approved') DEFAULT 'pending',
  `vehicle_type` varchar(255) NOT NULL,
  `plate_number` varchar(255) NOT NULL,
  `Business_name` varchar(255) NOT NULL,
  `Phone_number` varchar(255) NOT NULL,
  `Business_permit` varchar(255) DEFAULT NULL,
  `Upload_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `gender` varchar(10) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `profile_picture` varchar(255) NOT NULL,
  `ban_reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`ID`, `first_name`, `middle_name`, `last_name`, `municipality`, `province`, `barangay`, `Username`, `Email`, `Password`, `Roles`, `Status`, `vehicle_type`, `plate_number`, `Business_name`, `Phone_number`, `Business_permit`, `Upload_id`, `created_at`, `gender`, `date_of_birth`, `profile_picture`, `ban_reason`) VALUES
(1, 'Admin', '', 'User', '', '', '', 'admin', 'admin@gmail.com', 'pbkdf2:sha256:1000000$9m697mXZbxDb5vkc$ca8cb5a1f8576db3e242644c3f17b9776ee503f061341f426dde5b31fb601538', 'admin', '', '', '', '', '09123456789', '', '', '2025-05-23 11:27:46', 'Other', '1990-01-01', '', ''),
(2, 'Seller', '', 'Two', 'TownA', 'ProvinceA', 'BarangayA', 'seller2', 'seller2@example.com', 'pbkdf2:sha256:1000000$yu5BFMqSwES2Sgwj$7b3dd4ae79ab7b820bcb7a5a993ff96148c986f28c4422ce3daaf41b7394e1a6', 'seller', 'approved', '', '', 'Coffee, Tea & Beverages', '09111111112', 'permit2.pdf', 'id2.jpg', '2025-05-23 11:41:04', 'Male', '1992-02-02', '', ''),
(3, 'Seller', '', 'Three', 'TownB', 'ProvinceB', 'BarangayB', 'seller3', 'seller3@example.com', 'pbkdf2:sha256:1000000$QtpZ3z29vAsDc5M6$dfe9d6673b3700005f11cdb59d38011e69b20174b7df3fa3fc97769d469b231c', 'seller', 'approved', '', '', ' Snacks & Candy', '09111111113', 'permit3.pdf', 'id3.jpg', '2025-05-23 11:41:04', 'Female', '1993-03-03', '', ''),
(4, 'Seller', '', 'Four', 'TownC', 'ProvinceC', 'BarangayC', 'seller4', 'seller4@example.com', 'pbkdf2:sha256:1000000$vI2SeWach9zcLMaA$0d878305edff333887dc8a880456c791bfa0cdc4d69199f67ede0678bb1c6b20', 'seller', 'approved', '', '', 'Specialty Foods & International\nCuisine', '09111111114', 'permit4.pdf', 'id4.jpg', '2025-05-23 11:41:04', 'Male', '1994-04-04', '', ''),
(5, 'Seller', '', 'Five', 'TownD', 'ProvinceD', 'BarangayD', 'seller5', 'seller5@example.com', 'pbkdf2:sha256:1000000$plPAt4YS8IoAUMaP$88547c90c31912ef944df7cf66f5bef3be713b9a8eb63528be066ddc18ad48c8', 'seller', 'approved', '', '', 'Organic & Health Foods', '09111111115', 'permit5.pdf', 'id5.jpg', '2025-05-23 11:41:04', 'Female', '1995-05-05', '', ''),
(6, 'Seller', '', 'Six', 'TownE', 'ProvinceE', 'BarangayE', 'seller6', 'seller6@example.com', 'pbkdf2:sha256:1000000$zXrUaUQwqFQjKu8f$e6172e3dd8eebf8764c3934f8d31951e4e7ee53abf03ec967cdde6a44c1bef94', 'seller', 'approved', '', '', 'Meal Kits & Prepped Foods', '09111111116', 'permit6.pdf', 'id6.jpg', '2025-05-23 11:41:04', 'Male', '1996-06-06', '', ''),
(72, 'JC', 'TAN', 'GALLANO', 'Sibalom', 'Antique', 'Calo-oy', 'Buyer 1', '1@gmail.com', 'pbkdf2:sha256:1000000$LyxgE5d6z4m3nlY8$6abfd3a2809b860a3840424ebd76031e1bbdee6a3d4b5c00c20ca13f2516563c', 'buyer', 'approved', '', '', '', '09101314850', NULL, NULL, '2025-05-23 11:25:36', NULL, NULL, 'default.png', ''),
(73, 'Seller', '', 'one', 'Balete', 'Aklan', 'Oquendo', 'Seller 1', 'seller1@example.com', '1', 'seller', 'approved', '', '', 'Baking Supplies & Ingredients', '09101314850', 'C:\\Users\\ludov\\OneDrive\\Documents\\Web development\\ecomwebsite\\ecomwebsite\\static\\registration_uploads\\ludoviceylo26@gmail.com\\business_permit.jpg', 'C:\\Users\\ludov\\OneDrive\\Documents\\Web development\\ecomwebsite\\ecomwebsite\\static\\registration_uploads\\ludoviceylo26@gmail.com\\upload_id.jpg', '2025-05-23 11:37:40', NULL, NULL, '', ''),
(74, 'JC', 'TAN', 'GALLANO', 'Bugasong', 'Antique', 'Igsoro', 'Courier 1', '2@gmail.com', 'pbkdf2:sha256:1000000$7786R4m9U33DlyRi$76cee2a267331868c36c6e53d358208834b3f1dbb9c3affebd1c5613535a2127', 'courier', 'approved', 'motorcycle', '123abc', '', '09101314850', NULL, 'registration_uploads/yloludovice709@gmail.com/upload_id.jpg', '2025-05-23 12:00:43', NULL, NULL, 'default.png', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_info_banned`
--

CREATE TABLE `user_info_banned` (
  `ID` int(255) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `municipality` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `barangay` varchar(255) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Roles` varchar(255) NOT NULL,
  `Status` enum('pending','approved') DEFAULT 'pending',
  `vehicle_type` varchar(255) NOT NULL,
  `plate_number` varchar(255) NOT NULL,
  `Business_name` varchar(255) NOT NULL,
  `Phone_number` varchar(255) NOT NULL,
  `Business_permit` varchar(255) DEFAULT NULL,
  `Upload_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `gender` varchar(10) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `ban_reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `product_image` varchar(100) DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL,
  `business_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `seller_id`, `product_id`, `product_name`, `product_image`, `product_price`, `business_name`) VALUES
(57, 72, 3, 366, 'chocolate pepper mint', 'chocolate_peppermint.jpg', 140.00, ' Snacks & Candy');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additional_address`
--
ALTER TABLE `additional_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `seller_id` (`seller_id`),
  ADD KEY `buyer_id` (`buyer_id`),
  ADD KEY `delivery_courier_id` (`delivery_courier_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_add_product`
--
ALTER TABLE `seller_add_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_unlisted_products`
--
ALTER TABLE `seller_unlisted_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `additional_address`
--
ALTER TABLE `additional_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=549;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=284;

--
-- AUTO_INCREMENT for table `seller_add_product`
--
ALTER TABLE `seller_add_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=419;

--
-- AUTO_INCREMENT for table `seller_unlisted_products`
--
ALTER TABLE `seller_unlisted_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `user_info` (`ID`),
  ADD CONSTRAINT `delivery_ibfk_3` FOREIGN KEY (`buyer_id`) REFERENCES `user_info` (`ID`),
  ADD CONSTRAINT `delivery_ibfk_4` FOREIGN KEY (`delivery_courier_id`) REFERENCES `user_info` (`ID`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
