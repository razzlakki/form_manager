enum ReqType { POST, GET }

class ApiConstants {
  static const BASE = 'http://healthvedic.in/';/*'https://myfarmvizag.com/';*/
  static const BASE_URL = BASE + 'index.php?route=';
  static const ADMIN_LOGIN = 'api/admin';
  static const BANNERS = 'api/banners';
  static const PRODUCT_LIST = 'api/product/list';
  static const CART_PRODUCTS = 'api/cart/products';
  static const ADD_TO_CART = 'api/cart/add';
  static const REMOVE_FROM_CART = 'api/cart/remove';
  static const SUBSCRIPTION_GET = 'api/subscription/get';
  static const SUBSCRIPTION_SAVE = 'api/subscription/save';
  static const PLACE_ORDER = 'api/order/create';
  static const REGISTER = 'api/customer/register';
  static const MASTER = 'api/masters';
  static const PAYMENT_DETAILS = 'api/customer_payment';
  static const FEEDBACK = 'api/feedback/add';
  static const GET_USER_DETAILS = 'api/address/get_user_details';
  static const GET_DELIVERY_BOY_DETAILS = 'api/delivery_group_details/get';
  static const GET_OTP = 'api/sendotp';
  static const VALIDATE_OTP = 'api/sendotp/validate_otp';

  static var ABOUT_US = BASE + 'staticSites/aboutus.html';
}
