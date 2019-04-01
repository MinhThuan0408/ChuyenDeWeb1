-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 01, 2019 lúc 05:10 PM
-- Phiên bản máy phục vụ: 10.1.38-MariaDB
-- Phiên bản PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `facefly`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `airlines`
--

CREATE TABLE `airlines` (
  `airline_id` int(11) NOT NULL,
  `airline_name` varchar(55) NOT NULL,
  `airline_nation_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `airlines`
--

INSERT INTO `airlines` (`airline_id`, `airline_name`, `airline_nation_id`) VALUES
(1, 'Jetstar Airlines', 1),
(2, 'Vietnam Airlines', 1),
(3, 'VietJet', 2),
(4, 'Japan Airlines', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `airports`
--

CREATE TABLE `airports` (
  `airport_id` int(11) NOT NULL,
  `airport_name` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `airports`
--

INSERT INTO `airports` (`airport_id`, `airport_name`) VALUES
(1, 'Da Nang International Airport'),
(2, 'Noi Bai International Airport'),
(3, 'Abu Dhabi Intl'),
(4, 'Tan Son Nhat International Airport');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cities`
--

CREATE TABLE `cities` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(55) NOT NULL,
  `city_code` varchar(15) NOT NULL,
  `city_airport_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `cities`
--

INSERT INTO `cities` (`city_id`, `city_name`, `city_code`, `city_airport_id`) VALUES
(1, 'Hồ Chí Minh', 'SGN', 1),
(2, 'Hà Nội', 'HAN', 2),
(3, 'Đà Nẵng', 'DN', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_user_id` int(11) NOT NULL,
  `customer_first_name` varchar(55) NOT NULL,
  `customer_last_name` varchar(16) NOT NULL,
  `customer_title` varchar(16) NOT NULL,
  `customer_transfer` varchar(55) NOT NULL,
  `customer_paypal` varchar(55) NOT NULL,
  `customer_credit_card` int(16) NOT NULL,
  `customer_credit_name` varchar(55) NOT NULL,
  `customer_credit_ccv` varchar(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flight_booking`
--

CREATE TABLE `flight_booking` (
  `fb_id` int(11) NOT NULL,
  `fb_airline_id` int(11) NOT NULL,
  `fb_city_from_id` int(11) NOT NULL,
  `fb_city_to_id` int(11) NOT NULL,
  `fb_transit_id` int(11) NOT NULL,
  `fb_customer_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `flight_booking`
--

INSERT INTO `flight_booking` (`fb_id`, `fb_airline_id`, `fb_city_from_id`, `fb_city_to_id`, `fb_transit_id`, `fb_customer_id`) VALUES
(1, 0, 0, 0, 0, 0),
(2, 0, 0, 0, 0, 0),
(3, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flight_classes`
--

CREATE TABLE `flight_classes` (
  `fc_id` int(11) NOT NULL,
  `fc_name` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `flight_classes`
--

INSERT INTO `flight_classes` (`fc_id`, `fc_name`) VALUES
(1, 'Economy'),
(2, 'Business'),
(3, 'Premium Economy');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flight_list`
--

CREATE TABLE `flight_list` (
  `fl_id` int(11) NOT NULL,
  `fl_code` varchar(15) NOT NULL,
  `fl_airline_id` int(11) NOT NULL,
  `fl_fc_id` int(11) NOT NULL,
  `fl_type` tinyint(11) NOT NULL,
  `fl_city_from_id` int(11) NOT NULL,
  `fl_city_to_id` int(11) NOT NULL,
  `fl_departure_day` datetime DEFAULT NULL,
  `fl_return_day` datetime DEFAULT NULL,
  `fl_total` int(11) NOT NULL,
  `fl_cost` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `flight_list`
--

INSERT INTO `flight_list` (`fl_id`, `fl_code`, `fl_airline_id`, `fl_fc_id`, `fl_type`, `fl_city_from_id`, `fl_city_to_id`, `fl_departure_day`, `fl_return_day`, `fl_total`, `fl_cost`) VALUES
(1, 'VVCS/VCS', 2, 2, 2, 1, 2, '2019-03-01 09:00:00', '2019-03-04 12:00:00', 10, 1500000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nations`
--

CREATE TABLE `nations` (
  `nation_id` int(11) NOT NULL,
  `nation_name` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nations`
--

INSERT INTO `nations` (`nation_id`, `nation_name`) VALUES
(1, 'Việt Nam'),
(2, 'Hàn Quốc'),
(3, 'Nhật Bản');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transits`
--

CREATE TABLE `transits` (
  `transit_id` int(11) NOT NULL,
  `transit_city_id` int(11) NOT NULL,
  `transit_fl_id` int(11) NOT NULL,
  `transit_departure_date` datetime NOT NULL,
  `transit_landing_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `transits`
--

INSERT INTO `transits` (`transit_id`, `transit_city_id`, `transit_fl_id`, `transit_departure_date`, `transit_landing_date`) VALUES
(1, 1, 1, '2019-03-08 02:05:00', '2019-03-07 00:05:00'),
(2, 2, 2, '2019-03-08 09:00:00', '2019-03-08 08:10:00'),
(3, 3, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(55) NOT NULL,
  `user_password` varchar(128) NOT NULL,
  `user_first_name` varchar(55) NOT NULL,
  `user_last_name` varchar(15) NOT NULL,
  `user_phone` varchar(15) NOT NULL,
  `user_last_access` datetime DEFAULT NULL,
  `user_attempt` int(11) DEFAULT NULL,
  `user_status` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `user_email`, `user_password`, `user_first_name`, `user_last_name`, `user_phone`, `user_last_access`, `user_attempt`, `user_status`) VALUES
(9, 'admin1234@gmail.com', '$2y$10$RWdgV4MZtiPVoUKGgdZYWe7.Eznn7ulK8CzscWv9CrLOkN94Zf8FW', 'Le', 'Tran Thi', '01236789', NULL, NULL, NULL),
(8, 'admin123@gmail.com', '$2y$10$FlE48zPmcdJLHFn4LPdNMuo4HtVvCcdqomPmgYj3/EpeG5rGpJLTG', 'Le', 'Minh Thuan', '98151191', '2019-03-19 00:31:20', 0, 1),
(7, 'kimngan@gmail.com', '$2y$10$0v7En0RF6AdLaKGcSN1S/ePRccjx6K1LZ0Gb2sa44yjXqcCS2HXSK', 'Kim Ngan', 'Tran Thi', '0327098408', '2019-03-14 06:19:08', 0, 1),
(6, 'admin1@gmail.com', '$2y$10$8m8ba0xsRURuJ2Vfmg9Pf.8SV1SNZhD7faVvTKjD5eGO2geEPDfDe', 'Le Minh', 'Thuan', '0327098408', '2019-03-29 03:43:30', 0, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `airlines`
--
ALTER TABLE `airlines`
  ADD PRIMARY KEY (`airline_id`);

--
-- Chỉ mục cho bảng `airports`
--
ALTER TABLE `airports`
  ADD PRIMARY KEY (`airport_id`);

--
-- Chỉ mục cho bảng `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`city_id`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Chỉ mục cho bảng `flight_booking`
--
ALTER TABLE `flight_booking`
  ADD PRIMARY KEY (`fb_id`);

--
-- Chỉ mục cho bảng `flight_classes`
--
ALTER TABLE `flight_classes`
  ADD PRIMARY KEY (`fc_id`);

--
-- Chỉ mục cho bảng `flight_list`
--
ALTER TABLE `flight_list`
  ADD PRIMARY KEY (`fl_id`);

--
-- Chỉ mục cho bảng `nations`
--
ALTER TABLE `nations`
  ADD PRIMARY KEY (`nation_id`);

--
-- Chỉ mục cho bảng `transits`
--
ALTER TABLE `transits`
  ADD PRIMARY KEY (`transit_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `airlines`
--
ALTER TABLE `airlines`
  MODIFY `airline_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `airports`
--
ALTER TABLE `airports`
  MODIFY `airport_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `cities`
--
ALTER TABLE `cities`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `flight_booking`
--
ALTER TABLE `flight_booking`
  MODIFY `fb_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `flight_classes`
--
ALTER TABLE `flight_classes`
  MODIFY `fc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `flight_list`
--
ALTER TABLE `flight_list`
  MODIFY `fl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `nations`
--
ALTER TABLE `nations`
  MODIFY `nation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `transits`
--
ALTER TABLE `transits`
  MODIFY `transit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
