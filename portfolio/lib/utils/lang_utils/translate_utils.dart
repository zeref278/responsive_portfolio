class TranslateLanguage {
  static final TranslateLanguage _singleton = TranslateLanguage._internal();

  factory TranslateLanguage() {
    return _singleton;
  }

  TranslateLanguage._internal();
  String language = "vi";

  void setLanguage(String val) {
    language = val;
  }

  String getLanguage() {
    return language;
  }
}
