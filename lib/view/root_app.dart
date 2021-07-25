import 'package:flutter/material.dart';
import 'package:lyheang_api_share_url/api/UserApi.dart';
import 'package:lyheang_api_share_url/widget/UserTileWidget.dart';
import 'package:provider/provider.dart';

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserApi()),
      ],
      child: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<UserApi>().getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random User'),
        centerTitle: true,
      ),
      body: _buildInfo(context),
    );
  }

  Widget _buildInfo(BuildContext context) {
    final users = context.watch<UserApi>().user;
    final status = context.watch<UserApi>().status;

    if (status == Status.loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (status == Status.done) {
      return RefreshIndicator(
        onRefresh: () async {
          await context.read<UserApi>().getUser();
        },
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: users!.results.length,
          itemBuilder: (context, index) {
            final user = users.results[index];
            return UserTileWidget(user: user);
          },
        ),
      );
    } else {
      return Center(
        child: Text('Something went wrong'),
      );
    }
  }
}
