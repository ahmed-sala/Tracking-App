import 'package:url_launcher/url_launcher.dart';

abstract class OpenApplication {
  Future<bool>openClickApplication({required String phone});
}
class OpenWhatsApp implements OpenApplication {
  @override
  Future<bool> openClickApplication({required String phone}) async {
    final Uri url = Uri.parse('https://wa.me/$phone');
    if (await canLaunchUrl(url)) {
      return await launchUrl(url, mode: LaunchMode.inAppWebView);
    } else {
      return false;
    }
  }
}
class OpenPhoneApp implements OpenApplication {
  @override
  Future<bool> openClickApplication({required String phone}) async {
    final Uri url = Uri.parse('tel:$phone');
    if (await canLaunchUrl(url)) {
      return await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      return false;
    }
  }

}


