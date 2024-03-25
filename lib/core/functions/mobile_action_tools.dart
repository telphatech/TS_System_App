import 'package:ts_system/core/network/log.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TTMobileActionsTools {
  static void callPhoneNumber(String phone) async {
    final number = phone.replaceAll(RegExp(r"\D"), "");
    final url = "tel://$number";
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      Log.debug('Unable to launch tel url $url');
    }
  }

  static void emailTo(String emailAddress) async {
    final url = "mailto:$emailAddress";
    if (await canLaunchUrlString(url)) {
      launchUrlString(url);
    } else {
      Log.debug('Unable to launch mailto url $url');
    }
  }
}
