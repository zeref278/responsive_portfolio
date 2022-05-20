import 'package:portfolio/config/data_constants/key_constants.dart';
import 'package:portfolio/utils/lang_utils/translate_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:portfolio/config/lang_config/lang_keys.dart';


String lang(String id) {
  String? content =
  LanguageUtils().multiLang[TranslateLanguage().getLanguage()]![id];
  return content ?? "???";
}

class LanguageUtils {
  static const String LANGUAGE_CODE_VI = "vi";
  static const String LANGUAGE_CODE_EN = "en";

  static String langCode = TranslateLanguage().getLanguage();

  static final LanguageUtils _singleton = LanguageUtils._internal();

  LanguageUtils._internal();

  factory LanguageUtils() {
    return _singleton;
  }

  final languages = [
    LanguageModel(
      "Tiếng Việt",
      LANGUAGE_CODE_VI,
      'vi',
    ),
    LanguageModel(
      "English",
      LANGUAGE_CODE_EN,
      'en',
    ),
  ];

  String getLanguage(String id) {
    for (LanguageModel item in languages) {
      if (item.id == id) {
        return item.name;
      }
    }
    return "Tiếng Việt";
  }

  Future getLanguageLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(KeyConstants.SHARED_CURRENT_LANG)) {
      langCode = prefs.getString(KeyConstants.SHARED_CURRENT_LANG) ?? "vi";
      if (langCode.isEmpty) {
        langCode = LANGUAGE_CODE_VI;
      }
      TranslateLanguage().setLanguage(langCode);
    } else {
      langCode = LANGUAGE_CODE_VI;
      TranslateLanguage().setLanguage(langCode);
    }

    if (!languages.map((e) => e.id).toList().contains(langCode)) {
      langCode = LANGUAGE_CODE_VI;
      TranslateLanguage().setLanguage(langCode);
    }
  }

  updateLanguageLocal(String langcode) {
    if (!languages.map((e) => e.id).toList().contains(langCode)) {
      langCode = LANGUAGE_CODE_VI;
    }
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(KeyConstants.SHARED_CURRENT_LANG, langcode);
    });
  }

  Map<String, Map<String, String>> multiLang = {
    'en': en,
    'vi': vi,
  };
}

class LanguageModel {
  String id;
  String name;
  String countryCode;

  LanguageModel(
      this.name,
      this.id,
      this.countryCode,
      );
}
