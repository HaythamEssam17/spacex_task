import 'package:intl/intl.dart';

class Utils {
  static String parseToDateTime(DateTime dt) {
    return DateFormat('EEEE, d MMM, yyyy').format(dt).toString();
  }
}
