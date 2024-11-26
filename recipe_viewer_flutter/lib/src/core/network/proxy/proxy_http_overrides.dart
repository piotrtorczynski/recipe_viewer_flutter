import 'dart:io';

class ProxyHttpOverrides extends HttpOverrides {
  final String proxy;

  ProxyHttpOverrides(this.proxy);

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final httpClient = super.createHttpClient(context);
    httpClient.findProxy = (uri) => "PROXY $proxy;";
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) =>
            true; // Ignoruj błędy certyfikatów
    return httpClient;
  }
}
