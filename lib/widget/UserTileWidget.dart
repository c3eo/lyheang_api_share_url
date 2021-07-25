import 'package:flutter/material.dart';
import 'package:lyheang_api_share_url/model/RandomUser.dart';
import 'package:lyheang_api_share_url/view/detail_page.dart';

class UserTileWidget extends StatelessWidget {
  final Result user;

  const UserTileWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(user: user),
            ),
          );
        },
        leading:
            CircleAvatar(backgroundImage: NetworkImage(user.picture.medium)),
        title: Text('${user.name.title} ${user.name.first} ${user.name.last} '),
        subtitle: Text('Email: ${user.email}'),
      ),
    );
  }
}
