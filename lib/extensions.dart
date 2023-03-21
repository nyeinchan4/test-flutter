import 'models/quotes.dart';

extension DataValidator on House? {
  bool get isDataOrNull {
    if (this == null) {
      return true;
    }
    else {
      return false;
    }
  }
}