-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3307
-- Thời gian đã tạo: Th4 27, 2022 lúc 11:22 AM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `coffee`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills_ban`
--

CREATE TABLE `bills_ban` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_kh` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `tong_tien` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `status` varchar(20) NOT NULL,
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bills_ban`
--

INSERT INTO `bills_ban` (`id`, `id_kh`, `date_order`, `tong_tien`, `payment`, `status`, `note`, `created_at`, `updated_at`) VALUES
(20, 32, '2019-05-06', 20000, 'on', 'done', NULL, '2022-04-08 06:41:05', '2019-05-05 18:19:04'),
(22, 34, '2019-05-09', 35000, 'on', 'failed', NULL, '2022-04-08 06:54:48', '2022-04-07 23:54:48'),
(15, 27, '2019-04-19', 17000, 'on', 'done', NULL, '2022-04-08 06:41:05', '2019-04-18 22:48:32'),
(16, 28, '2019-04-19', 70000, 'on', 'failed', NULL, '2022-04-08 06:41:40', '2022-04-07 23:41:40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills_nhap`
--

CREATE TABLE `bills_nhap` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_ncc` int(11) DEFAULT NULL,
  `id_nhanvien` int(10) NOT NULL,
  `date_order` date DEFAULT NULL,
  `tong_tien` float DEFAULT NULL COMMENT 'tổng tiền',
  `thanh_toan` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bills_nhap`
--

INSERT INTO `bills_nhap` (`id`, `id_ncc`, `id_nhanvien`, `date_order`, `tong_tien`, `thanh_toan`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2019-04-15', 1500000, 'on', 'none', '2022-04-08 06:55:43', '2022-04-07 23:55:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_detail_ban`
--

CREATE TABLE `bill_detail_ban` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill_ban` int(10) NOT NULL,
  `id_sp` int(10) NOT NULL,
  `sl` int(11) NOT NULL COMMENT 'số lượng',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bill_detail_ban`
--

INSERT INTO `bill_detail_ban` (`id`, `id_bill_ban`, `id_sp`, `sl`, `created_at`, `updated_at`) VALUES
(12, 16, 6, 1, '2019-04-18 22:50:19', '2019-04-18 22:50:19'),
(11, 15, 4, 1, '2019-04-18 22:48:32', '2019-04-18 22:48:32'),
(13, 16, 7, 2, '2019-04-18 22:50:19', '2019-04-18 22:50:19'),
(19, 22, 2, 1, '2019-05-09 01:27:05', '2019-05-09 01:27:05'),
(17, 20, 6, 1, '2019-05-05 18:19:04', '2019-05-05 18:19:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_detail_nhap`
--

CREATE TABLE `bill_detail_nhap` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill_nhap` int(10) NOT NULL,
  `id_sp` int(10) NOT NULL,
  `sl` int(11) NOT NULL COMMENT 'số lượng',
  `don_vi` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bill_detail_nhap`
--

INSERT INTO `bill_detail_nhap` (`id`, `id_bill_nhap`, `id_sp`, `sl`, `don_vi`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 10, 'kg', '2019-04-15 06:35:52', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dat_ban`
--

CREATE TABLE `dat_ban` (
  `id` int(10) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sdt` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sl` int(10) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `dat_ban`
--

INSERT INTO `dat_ban` (`id`, `name`, `sdt`, `email`, `sl`, `date`, `time`, `created_at`, `updated_at`) VALUES
(1, 'reszgfd', '09854325', 'reshazsd', 20, '2022-04-21', '12:45:00', '2022-04-20 15:41:44', '2022-04-20 08:41:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gallery`
--

CREATE TABLE `gallery` (
  `id` int(10) NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `gallery`
--

INSERT INTO `gallery` (`id`, `image`, `created_at`, `updated_at`) VALUES
(1, 'pcoffe_1_r1_slide_best_coffee_img_1-2.jpg', '2022-04-08 14:36:10', '2022-04-08 14:36:10'),
(2, 'pcoffe_1_r1_slide_best_coffee_img_2-1.jpg', '2022-04-08 14:36:10', '2022-04-08 14:36:10'),
(3, 'pcoffe_1_r1_slide_best_coffee_img_3-1.jpg', '2022-04-08 14:36:10', '2022-04-08 14:36:10'),
(4, '2020-09-06_201352-1007x800.png', '2022-04-08 14:36:10', '2022-04-08 14:36:10'),
(5, '1-1.jpg', '2022-04-08 14:36:10', '2022-04-08 14:36:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khach_hang`
--

CREATE TABLE `khach_hang` (
  `id` int(10) UNSIGNED NOT NULL,
  `ten_kh` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dia_chi` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sdt` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `khach_hang`
--

INSERT INTO `khach_hang` (`id`, `ten_kh`, `email`, `dia_chi`, `sdt`, `note`, `created_at`, `updated_at`) VALUES
(28, 'Đoàn Thùy Linh', 'doanlinh1098@gmail.com', 'Bình Nguyên-Đa Lộc-Ân Thi-Hưng Yên', '0983017991', NULL, '2022-04-07 03:12:49', '2022-04-06 20:12:49'),
(32, 'Đoàn Văn Việt', 'tuan@gmail.com', 'Đa Lộc-Ân Thi-Hưng Yên', '0983756482', NULL, '2019-05-05 18:19:04', '2019-05-05 18:19:04'),
(34, 'Đoàn Linh', 'doanlinh@gmail.com', 'Đa Lộc- Ân Thi-Hưng Yên', '01628470872', NULL, '2019-05-09 01:27:05', '2019-05-09 01:27:05'),
(27, 'Nguyễn Văn Hùng', 'hung@gmail.com', 'Nguyễn Xá- Nhân Hòa-Mỹ Hào-Hưng yên', '0983017763', NULL, '2019-04-22 08:11:30', '2019-04-18 22:48:32'),
(38, 'anh', 'anh', 'ah', '098765', 'a', '2022-04-13 00:59:11', '2022-04-13 00:59:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `kho`
--

CREATE TABLE `kho` (
  `id` int(11) NOT NULL,
  `id_sp` int(11) NOT NULL,
  `sl` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `kho`
--

INSERT INTO `kho` (`id`, `id_sp`, `sl`, `created_at`, `updated_at`) VALUES
(1, 1, 14, '2022-04-08 14:39:10', '2022-04-08 07:39:10'),
(2, 2, 23, '2022-04-08 14:37:11', '2022-04-08 14:37:11'),
(3, 3, 23, '2022-04-08 14:37:11', '2022-04-08 14:37:11'),
(4, 4, 23, '2022-04-08 14:37:11', '2022-04-08 14:37:11'),
(5, 5, 34, '2022-04-08 14:37:11', '2022-04-08 14:37:11'),
(6, 6, 34, '2022-04-08 14:37:11', '2022-04-08 14:37:11'),
(7, 7, 56, '2022-04-08 14:37:11', '2022-04-08 14:37:11'),
(8, 8, 25, '2022-04-08 14:37:11', '2022-04-08 14:37:11'),
(9, 9, 45, '2022-04-08 14:37:11', '2022-04-08 14:37:11'),
(10, 10, 27, '2022-04-08 14:37:11', '2022-04-08 14:37:11'),
(11, 11, 43, '2022-04-08 14:37:11', '2022-04-08 14:37:11'),
(12, 12, 44, '2022-04-08 14:37:11', '2022-04-08 14:37:11'),
(13, 13, 29, '2022-04-08 14:37:11', '2022-04-08 14:37:11'),
(14, 14, 55, '2022-04-08 14:37:11', '2022-04-08 14:37:11'),
(15, 15, 58, '2022-04-08 14:37:11', '2022-04-08 14:37:11'),
(16, 31, 77, '2022-04-08 14:37:11', '2022-04-08 14:37:11'),
(17, 32, 55, '2022-04-08 14:37:11', '2022-04-08 14:37:11'),
(20, 39, 40, '2022-04-08 07:39:20', '2022-04-08 07:39:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loai_sp`
--

CREATE TABLE `loai_sp` (
  `id` int(10) UNSIGNED NOT NULL,
  `tenloai` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `loai_sp`
--

INSERT INTO `loai_sp` (`id`, `tenloai`, `created_at`, `updated_at`) VALUES
(1, 'Coffee', '2022-03-23 03:27:26', '2022-04-13 18:34:07'),
(2, 'Nước ép', '2022-03-23 03:41:45', '2022-04-03 18:05:31'),
(3, 'Trà sữa', '2022-03-23 03:41:45', '2022-04-08 14:41:48'),
(4, 'Cocktail', '2022-03-23 03:36:22', '2022-04-08 14:42:01'),
(5, 'Bánh', '2022-04-07 17:57:27', '2022-04-07 17:57:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(10) NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'tiêu đề',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'nội dung',
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `image`, `created_at`, `updated_at`) VALUES
(1, 'CHẾ BIẾN CÀ PHÊ', 'CHẾ BIẾN CÀ PHÊ\r\n\r\nCà phê sạch hiểu đơn giản là 100% cà phê, không pha trộn thêm bất cứ thứ gì khác. Vậy quy trình sản xuất chế biến cà phê sạch như thế nào là đúng chuẩn? Chúng ta cùng tìm hiểu nhé.\r\n\r\nỞ đây chúng ta chỉ nói các công đoạn quan trọng trong quá trình sản xuất và chế biến cà phê sạch (từ khâu cà phê nhân mà không phân tích sâu vào toàn bộ quy trình trồng trọt, chăm sóc, thu hái, sơ chế...). Về cơ bản chúng ta đảm bảo rằng cà phê nhân đem vào sản xuất chế biến đạt chất lượng.\r\n\r\nPhân loại hạt cà phê\r\n\r\nCà phê hiện nay được chế biến theo hai phương pháp: Chế biến khô và chế biến ướt. Mặc dù phân loại kích cỡ hạt theo sàn là giống nhau nhưng các tiêu chuẩn khác thì cà phê chế biến ướt cao hơn hẳn.\r\n\r\nMục đích của việc phân loại hạt cà phê là loại bỏ những hạt đen, khuyết tật, hạt mối mốc không đạt tiêu chuẩn. Lựa chọn nguyên liệu tốt và đồng đều, giúp chế biến dễ dàng hơn. Đồng thời làm tăng chất lượng sản phẩm.\r\n\r\nHạt cà phê khi chưa rang có nhiều kích cỡ khác nhau, nhiều loại khác nhau nên giá trị kinh tế theo đó cũng khác nhau. Người ta phân loại cà phê theo kích cỡ dựa trên các yếu tố như kích cỡ sàn, tỉ lệ % thành hình, tỉ lệ % hạt đen vỡ,  tỉ lệ lệ % tạp chất, độ ẩm...\r\n\r\nMột số ví dụ: Cà phê Sàn 18 có kích cỡ hạt là 7,2mm; Cà phê Sàn 16 có kích cỡ hạt là 6,3mm; Cà phê Sàn 13 có kích cỡ hạt là 5mm; Tỉ lệ đen vỡ tối đa của cà phê chế biến ướt cao nhất thường là 0,2%; trong khi đó của cà phê chế biến khô là 2%.\r\n\r\nCông đoạn rang cà phê\r\n\r\nTrong quy trình sản xuất cà phê sạch, công đoạn rang cà phê quan trọng nhất và mang tính chất quyết định đến chất lượng của cà phê thành phẩm, dưới tác dụng của nhiệt độ các phản ứng hóa học diễn ra và tạo thành hương vị, màu sắc đặc trưng.\r\n\r\nMáy rang cà phê\r\n\r\nSau quá trình rang hạt cà phê có độ bền cơ học giảm, độ giòn tăng lên. Khi đó dưới tác dụng của lực cơ học trong quá trình nghiền hạt cà phê dễ dàng bị vỡ ra.\r\n\r\nBiến đổi thành phần cà phê trong quá trình rang\r\n\r\nPhản ứng caramel, phản ứng melanoidin hình thành màu nâu đen bên ngoài và màu nâu đỏ bên trong hạt cà phê.\r\n\r\nHương thơm của cà phê được hình thành nhờ phản ứng melanoidin tạo phức andehyt thơm, phản ứng phân hủy acid quinic tạo rượu thơm hydroquinone, pyrogallol, phenol, cafechol,…, phản ứng phân hủy acid cafeic tạo cafechol, vinyl cafechol, ethyl cafechol…\r\n\r\nVị cũng được hình thành từ các acid gây vị chua như acid citric, acid malic, acid lactic, acid pyruvic, acid acetic. Vị đắng được hình thành từ cafein và sản phẩm của phản ứng caramel và melanoidin.\r\n\r\nCông đoạn làm nguội cà phê\r\n\r\nMục đích:\r\n\r\nCà phê sau quá trình rang có nhiệt độ cao làm cho các hợp chất tạo hương mới sinh ra tiếp tục bay hơi làm thất thoát hương. Vì vậy để tránh thất thoát hương thơm thì cà phê sau khi rang phải được làm nguội càng nhanh càng tốt.\r\n\r\nCác biến đổi:\r\n\r\nTrong quá trình làm nguội cà phê các hợp chất hương tạo thành vẫn tiếp tục bay hơi. Mặt khác do nhiệt độ cao nên các phản ứng hóa học trong hạt vẫn tiếp tục xảy ra, nhất là phản ứng Caramel và phản ứng Maillard. Do đó, màu hạt trở nên sậm hơn. Làm nguội càng nhanh thì sự thất thoát hương càng giảm.\r\n\r\nThoạt nhìn qua có vẻ công đoạn này không quá quan trọng nhưng đối với một tay rang cà phê chuyên nghiệp họ sẽ rất coi trọng công đoạn này, từ khi ngửi mùi hương thơm cho đến khi nhìn hạt cà phê đã được làm nguội xong cho họ một xúc cảm khó tả.\r\n\r\nCông đoạn xay hạt cà phê\r\n\r\nMục đích:\r\n\r\nQuá trình xay hạt cà phê rang có mục đích chính là giảm kích thước của hạt cà phê, phá vỡ cấu trúc vốn có của hạt cà phê rang để tạo điều kiện thuận lợi cho quá trình pha chế khi có nhu cầu sử dụng. Tạo điều kiện cho một số loại khí thoát ra trong quá trình rang thoát ra ngoài.\r\n\r\nViệc xay hạt cà phê cũng rất quan trọng, ảnh hưởng trực tiếp đến chất lượng của ly cà phê thành phẩm. Nếu \r\nmáy xay cà phê của bạn không tốt, hạt cà phê được xay không đều thì việc pha chế cà phê sẽ gặp nhiều khó khăn, chất lượng không đảm bảo.\r\n\r\nTiêu chuẩn xay cà phê là hạt cà phê phải được xay mịn đều, phát sinh nhiệt ở mức tối thiểu (hay chính xác là công nghệ cắt hạt cà phê ra thành nhiều phần nhỏ bằng nhau). Điều này cũng lý giải tại sao có những chiếc máy xay cà phê có giá lên đến vài nghìn $.\r\n\r\nTrên thế giới hiện nay tiêu chuẩn xay cà phê cao nhất bây giờ là dành cho các máy pha cà phê espresso chuyên nghiệp.\r\n\r\nCác biến đổi:\r\n\r\nTrải qua quá trình xay cà phê thì khí CO2, hơi nước và các chất đễ bay hơi sẽ được giải phóng. Mức độ thoát khí phụ thuộc vào kích thước hạt cà phê sau khi xay. Quá trình xay làm giảm mùi thơm của cà phê do một số chất bị thất thoát, vậy nên chúng ta cần sử dụng ngay khi cà phê được xay để đảm bảo chất lượng tốt nhất. Hoặc nếu chưa sử dụng thì cần phải bảo quản trong bịch kín, tránh tiếp xúc với không khí.\r\n\r\nLời kết\r\n\r\nTrên đây là những chia sẻ cơ bản về \r\nquy trình sản xuất chế biến cà phê sạch, trên thực tế việc rang xay chế biến cà phê sạch còn phức tạp hơn nhiều. Chẳng hạn như, đối với mỗi loại cà phê khác nhau chúng ta sẽ có cách rang khác nhau, xử lý sau khi rang cũng khác nhau. Hay như với mỗi kiểu pha chế cà phê khác nhau chúng ta cũng phải rang cà phê, xay cà phê theo những profile khác nhau (ví dụ như rang, xay cà phê dùng để pha phin sẽ khác với rang, xay cà phê để pha máy).\r\n\r\nMục đích của bài viết là chia sẻ đến mọi người quy trình làm cà phê sạch cơ bản nhất, tới đây mình sẽ viết một bài chi tiết về toàn bộ quy trình làm cà phê sạch từ khâu trồng trọt cho đến pha chế. Mọi người chờ đợi nhé.', 'pcoffe_1_r1_slide_best_coffee_img_1-1.jpg', '2022-04-07 00:54:29', '2022-04-06 17:54:29'),
(2, 'COFFEE THỔ NHĨ KỲ', 'COFFEE THỔ NHĨ KỲ\r\n\r\nCà phê Thổ Nhĩ Kỳ có một phong cách pha chế rất quyến rũ và nghệ thuật thưởng thức thú vị. Cà phê ở đất nước này không chỉ là một món đồ uống đơn thuần mà còn mang rất nhiều giá trị văn hóa khác.\r\n\r\nCà phê đã trở thành nghi thức\r\n\r\nỞ đất nước này cấm tuyệt đối các thức uống có cồn nên do đó cà phê trở thành một thức uống được ưa chuộng toàn xã hội. Nghi thức cà phê trở nên quan trọng hơn và trở thành một nghi thức không thể thiếu trong một cuộc giao tiếp xã hội, thết đãi quan khách và thậm chí là việc cưới hỏi.\r\n\r\nCà phê Thổ Nhĩ Kỳ chủ yếu sử dụng loại cà phê Arabica được rang và nghiền nhuyễn ngay trước khi pha chế cà phê. Người ta sử dụng một loại ấm pha cà phê đặc biệt gọi là cezve. Bột cà phê được đo lường kỹ, ngâm và đun nóng quan một chiếc khay nhỏ chứa cát và đặt trên bếp, cà phê được đun nóng nhưng không sôi và đủ lâu để cà phê có thời gian cho ra một hương vị thơm ngon và tạo bọt.\r\n\r\nCà phê có thể được hâm nóng hai hoặc ba lần rồi được rót vào cốc, để tạo bọt thật dày khi rót cà phê phải giơ ấm lên cao và rót chậm rãi. Cà phê có thể được pha chế với hạt nhục đậu khấu (cardamom) và bột quế (cinnamon) và một số hương liệu khác để làm phong phú thêm hương vị.\r\n\r\nThưởng thức cà phê Thổ Nhĩ Kỳ cũng là một cách để thư giãn hoặc rèn luyện tính kiên trì vì cà phê đã rót ra không được dùng muỗng để khuấy mà phải chờ cho bột cà phê lắng xuống hết mới được uống. Và một điều thú vị là sau khi uống xong, người ta thường úp tách cà phê xuống đĩa và xem bói vận mệnh của mình dựa trên phần cặn cà phê ở đĩa, họ gọi đây là phép bói cặn cà phê.\r\n\r\nPhương pháp pha chế cà phê kiểu Nấu Sôi\r\n\r\nNhững người sành điệu đều tin rằng phương pháp pha chế cà phê này cho ra một tách cà phê nóng, đặc và vị mạnh, hậu vị kéo dài dù chỉ nhấp một ngụm nhỏ. Giai đoạn nấu sôi cà phê tương đối ngắn, nên phương pháp pha kiểu Thổ Nhĩ Kỳ này là cách duy nhất được chấp nhận đối với những ai ưa thích sự tinh khiết.\r\n\r\nTại Istanbul, người ta pha cà phê như sau: dùng nửa tách nước và 2 muỗng cà phê xay mịn cho vào một cái bình có cán dài (gọi là cezve hoặc ibriq), thêm 1 muỗng đường vào rồi đưa lên trên ngọn lửa vừa phải.\r\n\r\nKhi hỗn hợp này bắt đầu sôi và sủi bọt, người ta khuấy lên rồi rót một ít cà phê ra tách. Tiếp tục nấu cho bình cà phê sôi lại một lần nữa, rồi mới rót tất cả (luôn cả bã cà phê) ra tách. Tất nhiên, có nhiều biến thể khác nhau, ví dụ như tại Hy Lạp thì cà phê được đun sôi 3 lần.\r\n\r\nThông thường người ta dành ra 2 phút để cho bã cà phê lắng xuống đáy cốc rồi mới thưởng lãm. Những người dùng cà phê Thổ Nhĩ Kỳ thiếu kiên nhẫn sẽ chấm ngón tay vào một ly nước lạnh, rồi nhúng vào trong tách cà phê để làm quá trình lắng bã diễn ra nhanh hơn.\r\n\r\nTheo cách Thổ Nhĩ Kỳ, đường được cho vào cà phê từ đầu (trước khi pha chế) chứ không phải cà phê pha xong rổi mới thêm đường vào, nên phép lịch sự yêu cầu chủ nhân sẽ hỏi khách xem muốn nhiều hay ít đường từ trước.\r\n\r\nNhững hạt cà phê ngon nhất sẽ cho ra tách cà phê Thổ Nhĩ Kỳ tuyệt hảo. Phương pháp này yêu cầu các hạt arabica thuần chủng, không bị đắng sau khi trải qua giai đoạn nấu sôi rất ngắn như trên. Không chỉ có người Thổ Nhĩ Kỳ mà các dân tộc khác, chẳng hạn Ethiopia, cũng tin rằng bình ibriq là dụng cụ tốt nhất để có cà phê ngon nhất: sánh, ngọt, hương vị đọng lại lâu trong tâm trí.\r\n\r\nĐiều lý thú nữa là: cà phê Thổ Nhĩ Kỳ là thứ cà phê duy nhất dùng để xem bói. “Thầy bói” úp một cái đĩa  nhỏ lên miệng tách rồi đảo lộn tách cà phê, để cho thứ nước dính quanh thành ly và hiển thị các hình thù, dựa vào đó “thầy” phán về những sự kiện trong tương lai.\r\n\r\nPhương pháp pha chế cà phê pha kiểu ngâm\r\n\r\nĐây là kiểu pha chế cà phê rất thanh lịch cũng phát xuất từ Thổ Nhĩ Kỳ có từ đầu thế kỷ 20. Theo đó cà phê được ngâm trong đáy bình đậy kín (thường bằng thủy tinh) nên không bị mất hương.\r\n\r\nCác chuyên gia cà phê vẫn hay thử sản phẩm bằng cách pha này. Ít nhất là cần 10gr cà phê để có một tách. Bước đột phá là sự phát minh của Meloir với bộ phận lọc cà phê rất mịn, giữ lại bột cà phê ở đáy bình.', 'blog-2_large.jpg', '2022-04-06 07:07:32', '2022-04-06 07:07:32'),
(3, 'ĐẲNG CẤP QUA CỐC CÀ PHÊ', 'ĐẲNG CẤP QUA CỐC CÀ PHÊ\r\n\r\nUống cà phê thì dễ, thưởng thức cà phê mới khó. Muốn cảm nhận được toàn bộ hương vị của cà phê, không những phải chú ý đến hạt cà phê, cách pha cà phê mà còn phải chú ý đến cốc cà phê. Hôm nay, LeCanFruits sẽ giúp bạn đọc tìm ra loại cốc phù hợp để mang đến hương vị hoàn hảo nhất cho mỗi lần thưởng thức cà phê.\r\n\r\nThưởng thức, không chỉ là cảm nhận của vị giác mà còn là cảm nhận qua thị giác. Chính vì thế, cách trình bày, trang trí khi sử dụng ly thủy tinh phù hợp cũng rất quan trọng góp phần làm nên hương vị của ly cà phê.\r\n\r\nCà phê, như chúng ta đã biết, có nhiều loại khác nhau như Cà phê sữa nóng, cà phê sữa đá, cà phê đen, cà phê đá… Tương ứng với mỗi loại cà phê lại có một loại ly tách chuyên biệt. Sau đây, chúng tôi xin cung cấp một số loại chén tách tiêu biểu dùng để uống cà phê.\r\n\r\n1. Cốc để uống cà phê sữa đá\r\n\r\nĐối với loại cà phê này, ta nên chọn ly thủy tinh có dáng cao, có kiểu vân đẹp và lạ mắt, dễ tạo ra cho người uống cảm giác thích thú và ngon miệng. Thêm một chiếc muỗng để quấy cà phê lên sẽ khiến việc thưởng thức cà phê trở nên thật tuyệt vời.\r\n\r\nCốc cà phê dáng cao cho cà phê sữa đá\r\n\r\n2. Cốc để uống cà phê sữa nóng hay tách cà phê đen\r\n\r\nTa ưu tiên chọn những loại tách dáng thấp, kiểu có quai bằng gốm sứ hoặc cốc thủy tinh. Bạn có thể chọn loại cốc sứ cổ điển nhỏ nhắn hoặc loại hiện đại cứng cáp và chắc chắn hơn như sau.\r\n\r\nCốc cà phê kiểu cổ điển\r\n\r\n3. Cốc Take away\r\n\r\nCuộc sống vội vã cuốn chúng ta đi nhanh đến nỗi chúng ta không thể thưởng thức ly cà phê một cách từ tốn. Chính vì thế, ly Take away ra đời. Với chất liệu mỏng nhẹ, màu sắc, mẫu mã vô cùng đa dạng, loại ly này đã trở nên vô cùng phổ biến và được ưa chuộng.\r\n\r\n4. Cốc uống cà phê Espressio, Capuchino\r\n\r\nNhư chúng ta đã biết gốm, gốm sa thạch, sứ có khả năng giữ nhiệt tốt; còn thủy tinh làm cho cà phê nhanh nguội; nhựa và kim loại dễ làm hỏng mùi vị của cà phê; đồ sứ mỏng sẽ nhanh nóng  và khó cầm trên tay. Vì thế, ly đựng Cappuccino và Espressio tốt nhất nên làm bằng sứ dày.\r\n\r\n5. Cốc để uống cà phê đen đậm đặc\r\n\r\nĐây là loại cà phê yêu cầu độ đậm đặc và chắt lọc cao. Chính vì thế, khi rót ra cốc trông có vẻ rất ít. Đặc biệt, vì muốn tạo cảm giác cốc cà phê đầy, ta cho thêm nhiều đá khiến cà phê bị nhạt. Chính vì thế, với loại cà phê này cần chọn những ly thủy tinh dáng lùn hoặc loại có eo như sau:\r\n\r\nViệc lựa chọn đúng loại ly phù hợp với mỗi thức uống yêu thích đặc biệt là cà phê không chỉ chứng tỏ sự am hiểu, tinh tế của người uống  mà còn giúp cho chúng ta thưởng thức được đầy đủ hương vị của cà phê nữa. Trên đây là một số gợi ý của chúng tôi. Chúc bạn đọc chọn lựa được những chiếc ly phù hợp cho loại cà phê mà mình thưởng thức!', 'blog1_large.jpg', '2022-04-06 07:13:55', '2022-04-06 07:13:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhan_vien`
--

CREATE TABLE `nhan_vien` (
  `id` int(11) NOT NULL,
  `ten_nhanvien` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gioitinh` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ngaysinh` date NOT NULL,
  `quequan` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sdt` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `capbac` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nhan_vien`
--

INSERT INTO `nhan_vien` (`id`, `ten_nhanvien`, `gioitinh`, `ngaysinh`, `quequan`, `sdt`, `email`, `capbac`, `created_at`, `updated_at`) VALUES
(1, 'Nguyễn Thị Thùy', 'Nữ', '1989-10-04', 'Nguyễn Xá-Nhân Hòa-Mỹ Hào-Hưng Yên', '0986253821', 'thuynguyen@gmail.com', '1', '2022-04-08 10:09:36', '2022-04-08 03:09:36'),
(7, 'anh', 'Nam', '2020-12-08', 'ádfd', '756432', 'ègr', '1', '2022-04-13 21:16:32', '2022-04-13 21:16:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nha_cung_cap`
--

CREATE TABLE `nha_cung_cap` (
  `id` int(11) NOT NULL,
  `ten_ncc` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `diachi_ncc` text COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sdt` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nha_cung_cap`
--

INSERT INTO `nha_cung_cap` (`id`, `ten_ncc`, `diachi_ncc`, `email`, `sdt`, `created_at`, `updated_at`) VALUES
(1, 'CÔNG TY CỔ PHẦN ĐẦU TƯ EXP VIỆT NAM', 'Nhà D21, dãy D, khu tập thể sư đoàn 361, P. Xuân Đỉnh, Q. Bắc Từ Liêm, Hà Nội', 'thucphamexp@gmail.com', '(024) 3750294', '2022-04-08 10:04:40', '2022-04-08 03:04:40'),
(2, 'Công Ty TNHH Chế Biến Nông Sản Thực Phẩm Thiên Hà', 'Lầu 10, Toà Nhà Vinaconex, 47 Điện Biên Phủ, P. Đa Kao, Q. 1, Tp. Hồ Chí Minh (TPHCM)', 'nancy@galaxy-vn.com', '(028) 39103066', '2019-04-04 14:48:55', '0000-00-00 00:00:00'),
(3, 'Nông Sản Galaxy Agro - Công Ty TNHH Galaxy Agro', 'Số 14/16, Đường 990, Khu Phố 4, Phường Phú Hữu, Quận 9, Tp. Hồ Chí Minh (TPHCM)', 'nancy@galaxy-vn.com', '(028) 39103066', '2019-04-04 14:48:55', '0000-00-00 00:00:00'),
(4, 'Công ty QTY', 'Phố 4, Quận 7 Tp.Hồ Chí Minh', 'QTY@gmail.com', '0964835982', '2022-04-08 09:59:58', '2022-04-08 02:59:58'),
(5, '23t4y5er', '532645u6t', '6435ty', '5263i', '2022-04-13 20:28:30', '2022-04-13 20:28:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phan_hoi`
--

CREATE TABLE `phan_hoi` (
  `id` int(11) NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `level` int(10) NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `phan_hoi`
--

INSERT INTO `phan_hoi` (`id`, `image`, `name`, `level`, `note`, `created_at`, `updated_at`) VALUES
(1, 'chang-trai-lai-3-dong-mau-va-nhung-bac-si-noi-tieng-tren-mang-4abe91-280x280.jpg', 'Lê Minh Trung', 5, 'Mình rất thích đưa khách hàng của mình đến đây bởi vì phong cách rất chuyên nghiệp. Hơn nữa thức uống ở đây rất ngon, có hương vị rất khác biệt, các vị khách của mình vô cùng thích.', '2022-04-14 02:53:55', '2022-04-13 19:53:55'),
(2, 'img_1062_89af8c0f-3d9b-49c5-4b09-33fc8d0a2f0d-280x280.jpg', 'Ngô Lệ Hằng', 5, 'Nếu như muốn được thư giãn hãy nghe một bản nhạc. Nếu muốn tìm một hương vị cà phê đúng gu nhất với mình thì hãy đến với AnhCoffee. Nơi luôn khiến mình hài lòng nhất.', '2022-04-13 16:53:20', '2022-03-23 14:58:56'),
(3, '4302df8958f010703fef2d8187d869a6-280x280.jpg', 'Nguyễn Vinh Quang', 5, 'Không gian được thiết kế quá tuyệt vời luôn giúp mình có nhiều idea và cảm hứng để mình sáng tạo. Hơn nữa chất lượng đồ uống ở đây vô cùng vừa ý mình, AnhCoffee là sự lựa chọn tuyệt vời.', '2022-05-04 06:57:33', '2022-03-23 14:58:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quang_cao`
--

CREATE TABLE `quang_cao` (
  `id` int(11) NOT NULL,
  `tittle` text COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `san_pham`
--

CREATE TABLE `san_pham` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_loai_sp` int(10) UNSIGNED DEFAULT NULL,
  `tenloai` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_ncc` int(11) NOT NULL,
  `mota_sp` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `gia_kkm` float DEFAULT NULL,
  `so_luong` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `don_vi_tinh` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `san_pham`
--

INSERT INTO `san_pham` (`id`, `name`, `id_loai_sp`, `tenloai`, `id_ncc`, `mota_sp`, `unit_price`, `gia_kkm`, `so_luong`, `image`, `don_vi_tinh`, `new`, `created_at`, `updated_at`) VALUES
(1, 'Coffee Americano', 1, 'Coffee', 2, 'Một thức uống yêu thích được kết hợp bởi giữa sốt sô cô la ngọt ngào, sữa tươi và đặc biệt là cà phê espresso đậm đà\r\n\r\nBạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá.', 60000, 60000, 26, 'product3-e48d6351-81a1-4cb4-86b8-be535e75c606.jpg', 'cốc take away', 'Không', '2022-03-23 06:11:27', '2022-04-22 20:31:27'),
(2, 'Coffee Chai Latte', 1, 'Coffee', 2, 'Một thức uống yêu thích được kết hợp bởi giữa sốt sô cô la ngọt ngào, sữa tươi và đặc biệt là cà phê espresso đậm đà\r\n\r\nBạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá.', 80000, 80000, 60, '1.jpg', 'cốc take away', 'Không', '2022-03-23 06:19:51', '2022-04-27 01:29:33'),
(3, 'Coffee Hazelnut Ice Blended', 1, 'Coffee', 1, 'Một thức uống yêu thích được kết hợp bởi giữa sốt sô cô la ngọt ngào, sữa tươi và đặc biệt là cà phê espresso đậm đà\r\n\r\nBạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá.', 80000, 80000, 15, 'product2-9f7b1cca-7c88-4df7-8315-1204b77afec7.jpg', 'gói', 'Không', '2022-03-23 06:34:05', '2022-04-06 08:19:03'),
(4, 'Coffee Americano', 1, 'Coffee', 3, 'Một thức uống yêu thích được kết hợp bởi giữa sốt sô cô la ngọt ngào, sữa tươi và đặc biệt là cà phê espresso đậm đà\r\n\r\nBạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá.', 80000, 80000, 23, '2.jpg', 'cốc', 'Không', '2022-03-23 06:38:41', '2022-04-06 08:19:07'),
(5, 'Coffee Ice Latte', 1, 'Coffee', 3, 'Cà phê đậm phong cách Ý được phối hợp với kem giúp giữ hương vị và tạo sự thơm ngon.', 60000, 60000, 16, 'sp1._medium.png', 'cốc', 'Không', '2022-03-23 06:42:14', '2022-04-06 08:19:12'),
(6, 'Coffee Capuchino', 1, 'Coffee', 3, 'Đậm phong cách Ý với 3 phần : Cà phê Espresso pha lượng nước gấp đôi, sữa nóng, sủi bọt.', 45000, 45000, 33, '7.png', 'tách', 'Không', '2022-03-23 06:52:47', '2022-04-06 08:19:18'),
(7, 'Coffee Americano', 1, 'Coffee', 2, 'Đậm chất Mỹ với nước nóng được pha vào Espresso giúp cà phê có độ đậm đặc biệt.', 45000, 45000, 27, '5.png', 'tách', 'Không', '2022-03-23 06:48:32', '2022-04-06 08:19:22'),
(8, 'Coffee Mocha', 1, 'Coffee', 2, 'Hỗn hợp Espresso và chocolate nóng, kem tươi và chocolate sause béo ngậy, vị thơm.', 40000, 40000, 24, '6.png', 'tách', 'Không', '2022-03-23 07:00:34', '2022-04-06 08:19:28'),
(9, 'Coffee Expresso', 1, 'Coffee', 2, 'Được pha chế bằng cách dùng nước nóng nén dưới áp suất cao qua bột cà phê được xay mịn.', 30000, 30000, 35, '4.png', 'tách', 'Không', '2022-03-23 06:56:02', '2022-04-06 08:19:33'),
(10, 'Coffee Latte', 1, 'Coffee', 2, 'Cà phê sữa đậm phong cách Ý với cốc sữa lớn và được pha bằng sữa bò tươi 100% nguyên chất.', 45000, 0, 32, '8.png', 'tách', 'Không', '2022-03-23 06:58:29', '2022-04-06 08:19:37'),
(11, 'Vietnamese Coffee', 1, 'Coffee', 3, 'Một thức uống yêu thích được kết hợp bởi giữa sốt sô cô la ngọt ngào, sữa tươi và đặc biệt là cà phê espresso đậm đà.\r\n\r\nBạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá.', 59000, 59000, 42, 'product1-8ed5cdf2-9430-402c-be6e-a529af32a714.jpg', 'cốc', 'Không', '2022-03-23 06:59:41', '2022-04-06 08:19:44'),
(12, 'Nước ép cam', 2, 'Nước ép', 2, 'Một ly nước ép cam vào buổi sáng khi đói, không những giúp tinh thần bạn sảng khoái, tỉnh táo mà nước ép này còn giúp lọc bỏ các độc tố ra khỏi cơ thế.\r\n\r\nTheo lời khuyên của các chuyên gia y tế cho rằng: mùa hè, bạn nên uống ít nhất 2 ly nước ép mỗi ngày. Bởi vì, khi đó các hàm lượng có sẵn chứa trong QUẢ  sẽ tự động làm giảm lượng calo bên cạnh việc duy trì sức khỏe của thận. Đồng thời, nó sẽ tự động loại bỏ các độc tố ra khỏi bàng quang, giúp cho cơ thể bạn luôn trong trạng thái khỏe mạnh.', 65000, 65000, 23, '10.jpg', 'cốc', 'Không', '2022-03-23 07:03:19', '2022-04-06 08:19:49'),
(13, 'Nước ép dứa', 2, 'Nước ép', 2, 'Một ly nước ép dứa vào buổi sáng khi đói, không những giúp tinh thần bạn sảng khoái, tỉnh táo mà nước ép này còn giúp lọc bỏ các độc tố ra khỏi cơ thế.\r\n\r\nTheo lời khuyên của các chuyên gia y tế cho rằng: mùa hè, bạn nên uống ít nhất 2 ly nước ép mỗi ngày. Bởi vì, khi đó các hàm lượng có sẵn chứa trong QUẢ  sẽ tự động làm giảm lượng calo bên cạnh việc duy trì sức khỏe của thận. Đồng thời, nó sẽ tự động loại bỏ các độc tố ra khỏi bàng quang, giúp cho cơ thể bạn luôn trong trạng thái khỏe mạnh.', 60000, 60000, 25, '12.jpg', 'cốc', 'Không', '2022-03-23 07:05:14', '2022-04-06 08:19:54'),
(14, 'Nước ép dưa hấu', 2, 'Nước ép', 1, 'Một ly nước ép dưa hấu vào buổi sáng khi đói, không những giúp tinh thần bạn sảng khoái, tỉnh táo mà nước ép này còn giúp lọc bỏ các độc tố ra khỏi cơ thể.\r\n\r\nTheo lời khuyên của các chuyên gia y tế cho rằng: mùa hè, bạn nên uống ít nhất 2 ly nước ép mỗi ngày. Bởi vì, khi đó các hàm lượng có sẵn chứa trong QUẢ  sẽ tự động làm giảm lượng calo bên cạnh việc duy trì sức khỏe của thận. Đồng thời, nó sẽ tự động loại bỏ các độc tố ra khỏi bàng quang, giúp cho cơ thể bạn luôn trong trạng thái khỏe mạnh.', 60000, 60000, 15, '9.jpg', 'cốc', 'Không', '2022-03-23 07:07:34', '2022-04-06 08:20:01'),
(15, 'Nước ép táo', 2, 'Nước ép', 1, 'Một ly nước ép táo vào buổi sáng khi đói, không những giúp tinh thần bạn sảng khoái, tỉnh táo mà nước ép này còn giúp lọc bỏ các độc tố ra khỏi cơ thể.\r\n\r\nTheo lời khuyên của các chuyên gia y tế cho rằng: mùa hè, bạn nên uống ít nhất 2 ly nước ép mỗi ngày. Bởi vì, khi đó các hàm lượng có sẵn chứa trong QUẢ  sẽ tự động làm giảm lượng calo bên cạnh việc duy trì sức khỏe của thận. Đồng thời, nó sẽ tự động loại bỏ các độc tố ra khỏi bàng quang, giúp cho cơ thể bạn luôn trong trạng thái khỏe mạnh.', 50000, 50000, 23, '11.jpg', 'cốc', 'Không', '2022-03-23 07:09:11', '2022-04-06 08:20:07'),
(16, 'Trà sữa dâu tây', 3, 'Trà sữa', 3, 'Trà sữa trân châu hay trà sữa Đài Loan là thức uống được chế biến từ trà xanh hoặc trà đen được các cửa hàng đồ uống tại Đài Trung, Đài Loan phát triển từ những năm 1980', 50000, 65000, 20, 'a2.jpg', 'cốc', 'Không', '2022-03-23 07:10:39', '2022-04-06 08:20:12'),
(17, 'Trà sữa khoai môn', 3, 'Trà sữa', 1, 'Trà sữa trân châu hay trà sữa Đài Loan là thức uống được chế biến từ trà xanh hoặc trà đen được các cửa hàng đồ uống tại Đài Trung, Đài Loan phát triển từ những năm 1980', 50000, 65000, 40, 'a3.jpg', 'cốc', 'Có', '2022-03-23 06:23:08', '0000-00-00 00:00:00'),
(18, 'Trà sữa chocolate', 3, 'Trà sữa', 1, 'Trà sữa trân châu hay trà sữa Đài Loan là thức uống được chế biến từ trà xanh hoặc trà đen được các cửa hàng đồ uống tại Đài Trung, Đài Loan phát triển từ những năm 1980', 50000, 65000, 40, 'a1.jpg', 'cốc', 'Có', '2022-03-23 06:23:08', '0000-00-00 00:00:00'),
(19, 'Trà sữa cream', 3, 'Trà sữa', 1, 'Trà sữa trân châu hay trà sữa Đài Loan là thức uống được chế biến từ trà xanh hoặc trà đen được các cửa hàng đồ uống tại Đài Trung, Đài Loan phát triển từ những năm 1980', 50000, 65000, 40, 'a4.jpg', 'cốc', 'Có', '2022-03-23 06:23:08', '0000-00-00 00:00:00'),
(20, 'Cocktail Mojito', 4, 'Cocktail', 3, '40ml Dark Rum,\r\n40ml Malibu,\r\n20ml of Lime juice,\r\n40ml of Coconut milk,\r\nHalf of Pinapple,\r\nBlender to mix everything up', 120000, 120000, 27, '', 'ly', 'Có', '2022-03-23 07:17:57', '0000-00-00 00:00:00'),
(21, 'Cocktail Bacardi', 4, 'Cocktail', 3, '40ml Dark Rum,\r\n40ml Malibu,\r\n20ml of Lime juice,\r\n40ml of Coconut milk,\r\nHalf of Pinapple,\r\nBlender to mix everything up', 140000, 140000, 27, 'unnamed.jpg', 'ly', 'Có', '2022-03-23 07:17:57', '0000-00-00 00:00:00'),
(22, 'Cocktail Bloody Mary', 4, 'Cocktail', 3, '40ml Dark Rum,\r\n40ml Malibu,\r\n20ml of Lime juice,\r\n40ml of Coconut milk,\r\nHalf of Pinapple,\r\nBlender to mix everything up', 160000, 160000, 27, '5db96bdadba87.jpg', 'ly', 'Có', '2022-03-23 07:17:57', '0000-00-00 00:00:00'),
(23, 'VectorStock Tequila Sunrise', 4, 'Cocktail', 3, '40ml Dark Rum,\r\n40ml Malibu,\r\n20ml of Lime juice,\r\n40ml of Coconut milk,\r\nHalf of Pinapple,\r\nBlender to mix everything up', 160000, 160000, 27, 'png-clipart-tequila-sunrise-cocktail-margarita-sangria-cocktail-food-recipe.png', 'ly', 'Có', '2022-03-23 07:17:57', '0000-00-00 00:00:00'),
(24, 'Bánh Flan', 5, 'Bánh', 3, 'Một món ăn yêu thích được kết hợp bởi giữa sốt sữa tươi và đặc biệt là cà phê đậm đà.', 15000, 30000, 26, 'flan.jpg', 'cái', 'Có', '2022-03-23 07:27:54', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide1index`
--

CREATE TABLE `slide1index` (
  `id` int(10) NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `slide1index`
--

INSERT INTO `slide1index` (`id`, `image`, `link`, `created_at`, `updated_at`) VALUES
(1, 'slider_1.jpg', NULL, '2022-04-14 03:46:32', '2022-04-13 20:46:32'),
(2, 'slider_2.jpg', NULL, '2022-04-14 03:46:41', '2022-04-13 20:46:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide2index`
--

CREATE TABLE `slide2index` (
  `id` int(10) NOT NULL,
  `link` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `slide2index`
--

INSERT INTO `slide2index` (`id`, `link`, `image`, `created_at`, `updated_at`) VALUES
(1, '', 'pcoffe_1_r1_slide_best_coffee_img_1.jpg', '2022-04-08 15:15:04', '2022-04-08 15:15:04'),
(2, '', 'pcoffe_1_r1_slide_best_coffee_img_2.jpg', '2022-04-08 15:15:04', '2022-04-08 15:15:04'),
(3, NULL, 'pcoffe_1_r1_slide_best_coffee_img_3.jpg', '2022-04-14 15:23:02', '2022-04-14 08:23:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `full_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `users_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `full_name`, `users_name`, `email`, `password`, `phone`, `address`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Đoàn Linh', 'DoanLinh', 'doanlinh@gmail.com', '$2y$10$qwkACRebVrq1PxDhpFQTUeof.5.Qr1lVayiJrXx8NgfLYdoWQH4m6', '0328470872', 'Đa Lộc- Ân Thi-Hưng Yên', 'chang-trai-lai-3-dong-mau-va-nhung-bac-si-noi-tieng-tren-mang-4abe91-280x280.jpg', '2022-04-13 06:17:22', '2022-04-12 23:17:22'),
(5, 'DoanThiLinh', 'LinhD', 'vinh@gmail.com', '$2y$10$9nFyWml4BRW1seMuzicLqOz9/EP5BeHSi9j.TxR.vdR.GEVB6VaIi', '0983715373', 'Ân Thi', 'chang-trai-lai-3-dong-mau-va-nhung-bac-si-noi-tieng-tren-mang-4abe91-280x280.jpg', '2022-04-08 15:30:17', '2022-04-08 08:30:17'),
(7, 'Đoàn Thị Thùy Linh', 'LinhDoan', 'doanlinh101998@gmail.com', '$2y$10$TE8Q0ak2lz3W7.pWUQMW7.Li5O7KkGFwlI/ci8McxtPtKpLkWybbK', '0983017992', 'Đa Lộc -Ân Thi-Hưng Yên', 'chang-trai-lai-3-dong-mau-va-nhung-bac-si-noi-tieng-tren-mang-4abe91-280x280.jpg', '2022-04-07 01:45:38', '2019-04-22 01:52:34'),
(8, 'Đoàn Thị Linh', 'Linh', 'doanlinh1098@gmail.com', '$2y$10$E2tUqHVotdoL8T9d2DhBlepbHod5zuTTVYVafvLl1caMG2t67NYrS', '0983017991', 'Bình Nguyên-Đa Lộc-Ân Thi-Hưng Yên', 'chang-trai-lai-3-dong-mau-va-nhung-bac-si-noi-tieng-tren-mang-4abe91-280x280.jpg', '2022-04-07 01:45:38', '2019-05-04 22:23:48'),
(9, '324', 'r2t4ages', '2t4wage', '52t4ge', '24tesh', '24rtge', 't4agwe', '2022-04-13 18:46:56', '2022-04-13 18:46:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `why`
--

CREATE TABLE `why` (
  `id` int(10) NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `why`
--

INSERT INTO `why` (`id`, `image`, `title`, `text`, `created_at`, `updated_at`) VALUES
(1, 'pizi_coffe_1_r9_some_feature_img_1.png', 'COFFEE NGUYÊN CHẤT', 'Hạt cà phê được thu hoạch và rang xay theo quy trình khép kín đúng công thức đặc biệt đảm bảo tính nguyên chất.', '2022-04-14 03:19:38', '2022-04-13 20:19:38'),
(2, 'pizi_coffe_1_r9_some_feature_img_2.png', 'PHA CHẾ ĐỘC ĐÁO', 'Bí kíp tạo nên sự độc là trong từng thức uống đó chính là phương pháp pha chế độc đáo của AnhCoffee.', '2022-04-08 15:16:27', '2022-04-08 15:16:27'),
(3, 'pizi_coffe_1_r9_some_feature_img_1-1.png', 'DESSERT ĐẶC BIỆT', 'Các món bánh tráng miệng và hoa quả tại AnhCoffee được chế biến theo phong cách Châu Âu với nhiều hương vị khác.', '2022-04-08 15:16:27', '2022-04-08 15:16:27'),
(4, 'pizi_coffe_1_r9_some_feature_img_4.png', 'KHÔNG GIAN ĐỘC ĐÁO', 'Được thiết kế theo lối không gian mở vừa hiện đại nhưng không mất phần tao nhã, lịch sự của một quán Cà phê.', '2022-04-08 15:16:27', '2022-04-08 15:16:27');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bills_ban`
--
ALTER TABLE `bills_ban`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bills_nhap`
--
ALTER TABLE `bills_nhap`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bill_detail_ban`
--
ALTER TABLE `bill_detail_ban`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bill_detail_nhap`
--
ALTER TABLE `bill_detail_nhap`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `dat_ban`
--
ALTER TABLE `dat_ban`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `khach_hang`
--
ALTER TABLE `khach_hang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `kho`
--
ALTER TABLE `kho`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `loai_sp`
--
ALTER TABLE `loai_sp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tenloai` (`tenloai`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nhan_vien`
--
ALTER TABLE `nhan_vien`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nha_cung_cap`
--
ALTER TABLE `nha_cung_cap`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `phan_hoi`
--
ALTER TABLE `phan_hoi`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `quang_cao`
--
ALTER TABLE `quang_cao`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `slide1index`
--
ALTER TABLE `slide1index`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `slide2index`
--
ALTER TABLE `slide2index`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `full_name` (`full_name`),
  ADD UNIQUE KEY `users_name` (`users_name`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Chỉ mục cho bảng `why`
--
ALTER TABLE `why`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bills_ban`
--
ALTER TABLE `bills_ban`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `bills_nhap`
--
ALTER TABLE `bills_nhap`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `bill_detail_ban`
--
ALTER TABLE `bill_detail_ban`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `bill_detail_nhap`
--
ALTER TABLE `bill_detail_nhap`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `dat_ban`
--
ALTER TABLE `dat_ban`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `khach_hang`
--
ALTER TABLE `khach_hang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `kho`
--
ALTER TABLE `kho`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `loai_sp`
--
ALTER TABLE `loai_sp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `nhan_vien`
--
ALTER TABLE `nhan_vien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `nha_cung_cap`
--
ALTER TABLE `nha_cung_cap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `phan_hoi`
--
ALTER TABLE `phan_hoi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `quang_cao`
--
ALTER TABLE `quang_cao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT cho bảng `slide1index`
--
ALTER TABLE `slide1index`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `slide2index`
--
ALTER TABLE `slide2index`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `why`
--
ALTER TABLE `why`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
