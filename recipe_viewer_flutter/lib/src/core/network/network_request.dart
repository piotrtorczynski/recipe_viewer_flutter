abstract class NetworkRequest<T> {
  /// Ścieżka do endpointa
  String get path;

  /// Parametry query (opcjonalne)
  Map<String, dynamic>? get queryParameters => null;

  /// Nagłówki zapytania (opcjonalne)
  Map<String, String> get headers => {'Content-Type': 'application/json'};

  /// Metoda HTTP (GET, POST, etc.)
  String get method;

  /// Body zapytania (opcjonalne, np. dla POST/PUT)
  Map<String, dynamic>? get body => null;

  /// Parsowanie odpowiedzi
  T parseResponse(Map<String, dynamic> json);
}
