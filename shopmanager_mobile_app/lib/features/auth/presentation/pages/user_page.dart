import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPage extends StatefulWidget {
  UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late String token;

  @override
  void initState() {
    super.initState();

    getToken().then((value) {
      setState(() {
        token = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('User Page Content'),
            Text('Token: $token'),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> getToken() async {
    final sp = await SharedPreferences.getInstance();
    final tokenValue = sp.getString('sm_api_token');
    return tokenValue ?? '';
  }
}
