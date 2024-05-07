class Endpoints {
  static const baseUrl = "http://127.0.0.1:8078";

  static const loginEndpoint = "$baseUrl/login";

  static const tokenCheck = "$baseUrl/check";

  static const adminBaseUrl = "$baseUrl/admin";

  static const visitsEndpoint = "$adminBaseUrl/visits";

  static const financesEndpoint = "$adminBaseUrl/finances";

  static const clienteleEndpoint = "$adminBaseUrl/clientele";

  static const categoriesEndpoint = "$adminBaseUrl/categories";

  static const productsEndpoint = "$adminBaseUrl/products";

  static const customersEndpoint = "$adminBaseUrl/customers";

  static const ordersEndpoint = "$adminBaseUrl/orders";
}
