import 'package:ts_system/core/network/log.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TTMobileActionsTools {
  // static const internalAppLinkPrefix = "messthali://";

  static void callPhoneNumber(String phone) async {
    final number = phone.replaceAll(RegExp(r"\D"), "");
    final url = "tel://$number"; // Adjust the country code prefix as needed
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
      print(url);
    } else {
      Log.debug('Unable to launch tel url $url');
      // Handle error here
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

  // static void launchURL(
  //   String url, {
  //   BuildContext? context,
  //   LaunchMode launchMode = LaunchMode.externalApplication,
  // }) async {
  //   // Check if internal link
  //   if (context != null) {
  //     if (url.toLowerCase().startsWith(internalAppLinkPrefix)) {
  //       final link =
  //           url.toLowerCase().substring(internalAppLinkPrefix.length - 1);
  //       final uri = Uri.tryParse(link);
  //       final appLink = await RouteValidator.validate(AppLink.fromLocation(
  //         uri?.path ?? "",
  //         queryParams: uri?.queryParameters,
  //       ));
  //       Provider.of<AppState>(context, listen: false).goToPage(appLink);
  //       return;
  //     }
  //   }
  //
  //   if (await canLaunchUrlString(url)) {
  //     launchUrlString(
  //       url,
  //       mode: launchMode,
  //     );
  //   } else {
  //     Log.debug('Unable to launch  url $url');
  //   }
  // }
  //
  // static uncheckedLaunch(String url) {
  //   launchUrlString(url);
  // }
}
