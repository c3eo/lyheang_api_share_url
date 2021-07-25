import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'package:provider/provider.dart';
import '../model/model.dart';
import '../provider/provider.dart';

class ComplexApi extends StatelessWidget {
  const ComplexApi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataProvider()),
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
    context.read<DataProvider>().getUser();
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
    final users = context.watch<DataProvider>().user;
    final status = context.watch<DataProvider>().status;

    if (status == Status.loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (status == Status.done) {
      return RefreshIndicator(
        onRefresh: () async {
          await context.read<DataProvider>().getUser();
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
            CircleAvatar(backgroundImage: NetworkImage(user.picture.large)),
        title: Text('${user.name.title} ${user.name.first} ${user.name.last} '),
        subtitle: Text('Email: ${user.email}'),
      ),
    );
  }
}
