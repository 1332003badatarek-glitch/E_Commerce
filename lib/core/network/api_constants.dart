class ApiConstants {
  static const String baseUrl = "https://api.escuelajs.co/api/v1/";
  static const String accessToken = "accessToken";
  static const String refreshToken = "refreshToken";

  //endpoints
  static const refreshTokenEndpoint = "auth/refresh-token";
  static const loginEndpoint = "auth/login";
  static const signUpEndpoint = "users/";
  static const profileEndpoint = "auth/profile";
  static const fileUploadEndpoint = "files/upload";
  static const categoriesEndpoint = "categories/";
  static const productsEndpoint = "products/";

  //query params
  static const String price = "price";
  static const String minPrice = "price_min";
  static const String maxPrice = "price_max";
}
