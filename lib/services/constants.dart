import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class PriceConverter {
  static convert(price) {
    return '₹ ${double.parse('$price').toStringAsFixed(2)}';
  }

  static convertRound(price) {
    return '₹ ${double.parse('$price').toInt()}';
  }

  static convertToNumberFormat(num price) {
    final format = NumberFormat("#,##,##,##0.00", "en_IN");
    return '₹ ${format.format(price)}';
  }
}

showCustomToast(msg, {color}) {
  Fluttertoast.showToast(
    msg: "$msg",
    backgroundColor: color,
    timeInSecForIosWeb: 1,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    webPosition: "center",
    webBgColor: "linear-gradient(to right, #dc1c13, #dc1c13)",
  );
}

String getStringFromList(List<dynamic>? data) {
  String str = data.toString();
  return data.toString().substring(1, str.length - 1);
}

class AppConstants {
  get getBaseUrl => baseUrl;

  set setBaseUrl(String url) => baseUrl = url;

  //TODO: Change Base Url
  // static String baseUrl = 'http://192.168.1.31:8000/';

  static String baseUrl = 'https://epicinfo.com.heenahealth.in/'; // BASE URL

  ///USE FOR LOCAL

  static const String loginUri = 'api/v1/user/login';
  static const String signUpUri = 'api/v1/user/signup';
  static const String emailVerification = 'api/v1/verification/send';

  static const String profileUri = 'api/v1/user/profile';
  static const String updateProfileUri = 'api/v1/user/update-profile';
  static const String extras = 'api/v1/extra';
  static const String notification = 'api/v1/notification/get-notification';
  static const String deletenotification = 'api/v1/notification/delete-notification';
  static const String businessSettings = 'api/v1/basic/business-setting';

  /// STATE AND CITY --
  static const String stateUrl = 'api/v1/basic/get-states';
  static const String cityUrl = 'api/v1/basic/get-cities';

  /// HomePage
  static const String banner = 'api/v1/basic/get-home-banner';
  static const String ourService = 'api/v1/service/get-service';
  static const String packages = 'api/v1/service/get-package';
  static const String addOns = 'api/v1/service/get-addons';
  static const String studioLocations = 'api/v1/basic/get-studio';
  static const String trendingPackages = 'api/v1/service/featured-package';
  static const String testimonials = 'api/v1/basic/get-testimonial';
  static const String workingHour = 'api/v1/work/get-time';
  static const String placePackageOrder = 'api/v1/booking/create-booking';
  static const String fetchOrder = 'api/v1/booking/fetch-booking';

  static const String myPackageBookings = 'api/v1/booking/my-bookings';
  static const String packageOrderDetail = 'api/v1/booking/booking-detail';
  static const String updateBookingDetail = 'api/v1/booking/update-booking-detail';
  static const String additionalAddOnsPurchase = 'api/v1/booking/create-addon-purchase';
  static const String fetchAdditionalAddOnsPurchase = 'api/v1/booking/fetch-addon-purchase';
  static const String rescheduleBooking = 'api/v1/booking/booking-reschedule';
  static const String fetchRescheduleBooking = 'api/v1/booking/fetch-booking-reschedule';
  static const String payRemaining = 'api/v1/booking/paid-remaining';
  static const String fetchPayRemaining = 'api/v1/booking/fetch-paid-remaining';
  static const String selectedImages = 'api/v1/booking/select-image';
  static const String fetchSelectedImages = 'api/v1/booking/fetch-image-edit-charge';

  // Shop --
  static const String shopProducts = 'api/v1/product/get-product';
  static const String featuredProducts = 'api/v1/product/get-featured';
  static const String productByCategory = 'api/v1/product/get-product-by-category';
  static const String productDetails = 'api/v1/product/product-detail';

  //Cart

  static const String addToCart = 'api/v1/cart/add-to-cart';
  static const String getCart = 'api/v1/cart/get-cart';
  static const String updateCart = 'api/v1/cart/update-cart';
  static const String deleteCart = 'api/v1/cart/delete-cart';

  // Shared Key
  static const String token = 'user_app_token';
  static const String userId = 'user_app_id';
  static const String userNotificationTimeStamp = 'timestamp';

  static const String razorpayKey = 'razorpay_key';
  static const String recentOrders = 'recent_orders';
  static const String isUser = 'is_user';
}
