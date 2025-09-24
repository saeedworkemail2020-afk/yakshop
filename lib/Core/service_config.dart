class ServiceConfig {
  static const String baseUri = "https://6fee9088a60f.ngrok-free.app";
  static Uri urihealth = Uri.parse("$baseUri/health");
  static const String baseloadUri = "$baseUri/yak-shop/load";
  static const String basestockUri = "$baseUri/yak-shop/stock/";
  static const String baseherdUri = "$baseUri/yak-shop/herd/";
  static const String baseorderUri = "$baseUri/yak-shop/order/";
}
