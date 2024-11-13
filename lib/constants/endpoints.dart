class Endpoints {
  static const baseUrl = "http://127.0.0.1:8078";

  static const adminBaseUrl = "$baseUrl/admin";

  static const loginEndpoint = "$adminBaseUrl/login";

  static const tokenCheck = "$adminBaseUrl/check";

  static const settingEndpoint = "$adminBaseUrl/setting";

  static const messageEndpoint = "$adminBaseUrl/message";

  static const visitsEndpoint = "$adminBaseUrl/visits";

  static const visitsStatsEndpoint = "$visitsEndpoint/stats";

  static const visitsGraphEndpoint = "$visitsEndpoint/graph";

  static const visitsStandingsEndpoint = "$visitsEndpoint/standings";

  static const financesEndpoint = "$adminBaseUrl/finances";

  static const finStatsEndpoint = "$financesEndpoint/stats";

  static const finOrdersEndpoint = "$financesEndpoint/orders";

  static const finMonetaryEndpoint = "$financesEndpoint/monetary";

  static const finPaymentsEndpoint = "$financesEndpoint/payments";

  static const finStatusEndpoint = "$financesEndpoint/status";

  static const finMethodsEndpoint = "$financesEndpoint/methods";

  static const finStandsEndpoint = "$financesEndpoint/standings";

  static const clienteleEndpoint = "$adminBaseUrl/clientele";

  static const categoriesEndpoint = "$adminBaseUrl/categories";

  static const productsEndpoint = "$adminBaseUrl/products";

  static const customersEndpoint = "$adminBaseUrl/customers";

  static const ordersEndpoint = "$adminBaseUrl/orders";

  static const fulfillEndpoint = "$adminBaseUrl/fulfill";
}
