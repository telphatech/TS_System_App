import 'package:intl/intl.dart';
import 'package:ts_system/core/network/log.dart';

class TTDateFormat {
  static DateTime? parse(String? dateString) {
    if (dateString != null) {
      try {
        return DateTime.parse(dateString);
      } catch (e) {
        Log.error('DateFormat failed to parse $dateString with error: $e');
      }
    }
    return null;
  }

  static String? date(String? dateString) {
    if (dateString != null) {
      try {
        final date = DateTime.parse(dateString);
        return DateFormat.yMd().format(date);
      } catch (e) {
        Log.error('DateFormat failed to parse date $dateString with error: $e');
      }
    }
    return null;
  }

  static String? dateMonth(String? dateString) {
    if (dateString != null) {
      try {
        final date = DateTime.parse(dateString);
        return DateFormat.MMMM().format(date);
      } catch (e) {
        Log.error(
            'DateFormat failed to parse dateMonth $dateString with error: $e');
      }
    }
    return null;
  }

  static String? dateAndMonth(String? dateString) {
    if (dateString != null) {
      try {
        final date = DateTime.parse(dateString);
        return DateFormat.Md().format(date);
      } catch (e) {
        Log.error(
            'DateFormat failed to parse dateMonth $dateString with error: $e');
      }
    }
    return null;
  }

  static String? monthYear(String? dateString) {
    if (dateString != null) {
      try {
        final date = DateTime.parse(dateString);
        return DateFormat.yM().format(date);
      } catch (e) {
        Log.error(
            'DateFormat failed to parse dateMonth $dateString with error: $e');
      }
    }
    return null;
  }

  static String formatToYMD(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static String? formatDateStringToyMMMd(String? dateString) {
    if (dateString != null) {
      try {
        DateTime date = DateTime.parse(dateString);
        String formattedDate = DateFormat.yMMMd().format(date);
        return formattedDate;
      } catch (e) {
        Log.error(
            'DateFormat failed to parse dateMonth $dateString with error: $e');
      }
    }
    return null;
  }

  static String? formatDateStringToyMMM(String? dateString) {
    if (dateString != null) {
      try {
        DateTime date = DateTime.parse(dateString);
        String formattedDate = DateFormat.yMMM().format(date);
        return formattedDate;
      } catch (e) {
        Log.error(
            'DateFormat failed to parse dateMonth $dateString with error: $e');
      }
    }
    return null;
  }

  static String? formatDateStringToDayAndMonth(String? dateString) {
    if (dateString != null) {
      try {
        DateTime date = DateTime.parse(dateString);
        String formattedDate =
            '${DateFormat.d().format(date)} ${DateFormat.MMM().format(date)}';
        return formattedDate;
      } catch (e) {
        Log.error(
            'DateFormat failed to parse dateMonth $dateString with error: $e');
      }
    }
    return null;
  }

  static String formatToMMddyy(DateTime date) {
    return DateFormat('MM/dd/yy').format(date);
  }
}
