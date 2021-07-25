import 'package:flutter/material.dart';
import '../helper/launch_helper.dart';
import '../helper/share_helper.dart';

import '../model/model.dart';

class DetailPage extends StatelessWidget {
  final Result user;
  const DetailPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          Flexible(flex: 1, child: _profileImage()),
          Flexible(flex: 2, child: _detailPanel(context)),
        ],
      ),
    );
  }

  Container _detailPanel(BuildContext context) {
    return _detailContainer(
      context,
      child: Column(
        children: [
          const SizedBox(height: 20),
          _fullname(),
          const SizedBox(height: 8),
          _age(),
          const Divider(),
          const SizedBox(height: 8),
          _phone(),
          const SizedBox(height: 8),
          _email(),
          const SizedBox(height: 8),
          _address(context),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text('Randome User'),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () async => await ShareHelper.shareUserInfo(user),
          icon: Icon(Icons.share),
        )
      ],
    );
  }

  String get _longitude => user.location.coordinates.longitude;
  String get _latitude => user.location.coordinates.latitude;
  Row _address(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                const Icon(Icons.map),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    user.location.location,
                    style: _textStyle(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
        IconButton(
            onPressed: () => LauncherHelper.openMap(_latitude, _longitude),
            icon: const Icon(Icons.send)),
      ],
    );
  }

  Row _email() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          const Icon(Icons.email),
          const SizedBox(width: 8),
          Text(user.email, style: _textStyle()),
        ]),
        IconButton(
            onPressed: () => LauncherHelper.openMail(user.email),
            icon: const Icon(Icons.send)),
      ],
    );
  }

  Row _phone() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          const Icon(Icons.phone),
          const SizedBox(width: 8),
          Text(user.phone, style: _textStyle()),
        ]),
        IconButton(
          onPressed: () => LauncherHelper.openTel(user.phone),
          icon: const Icon(Icons.send),
        ),
      ],
    );
  }

  Text _age() {
    return Text("Age: ${user.dob.age} years old", style: _textStyle());
  }

  Text _fullname() => Text(user.fullname, style: _textStyle(fontsize: 20));

  Center _profileImage() {
    return Center(
      child: CircleAvatar(
        radius: 80,
        backgroundImage: NetworkImage(
          user.picture.large,
        ),
      ),
    );
  }

  ///
  //!/ -- style ---------------------------------------------------
  ///
  TextStyle _textStyle({double fontsize = 16}) => TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: fontsize,
      );

  Container _detailContainer(BuildContext context, {required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: child,
    );
  }
}
