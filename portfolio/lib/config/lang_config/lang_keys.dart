
import 'package:portfolio/utils/lang_utils/lang_utils.dart';

export 'langs/en.dart';
export 'langs/vi.dart';



extension TranslateLang on String {
  String translate() {
    return lang(this);
  }
}

class LangKey {
  static const String hello = "hello";
}

