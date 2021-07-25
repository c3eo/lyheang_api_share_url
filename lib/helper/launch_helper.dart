import 'package:url_launcher/url_launcher.dart';

abstract class LauncherHelper {
  static openTel(String phoneNumber) async {
    String tel = 'tel:$phoneNumber';
    await _launcher(tel);
  }

  static openMail(String emailAddress) async {
    String email = 'mailto:<$emailAddress>';
    await _launcher(email);
  }

  static openMap(String lat, String lng) async {
    String mapUrl = 'http://maps.google.com/maps/@$lat,$lng,16z';
    await _launcher(mapUrl);
  }

  static Future<void> _launcher(String action) async => await canLaunch(action)
      ? await launch(action)
      : throw 'Cound not launch $action';
}
