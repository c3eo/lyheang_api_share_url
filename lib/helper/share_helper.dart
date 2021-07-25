import 'package:flutter_share/flutter_share.dart';
import 'package:lyheang_api_share_url/model/RandomUser.dart';

abstract class ShareHelper {
  static Future<void> shareUserInfo(Result user) async {
    await FlutterShare.share(
      title: user.fullname,
      text: user.information,
      chooserTitle: 'User Information',
    );
  }
}
