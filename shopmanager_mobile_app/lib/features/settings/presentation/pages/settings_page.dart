import 'package:flutter/material.dart';
import 'package:shopmanager_mobile_app/core/helpers/helper.dart';
import 'package:shopmanager_mobile_app/core/widgets/custom_text_field.dart';
import 'package:shopmanager_mobile_app/features/settings/presentation/pages/settings_view_model.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SettingsPage());
  }

  static Page<void> page() => const MaterialPage<void>(
        child: SettingsPage(),
      );

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final apiBaseUrlController = TextEditingController();
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  late Helper helper; // Mark as late

  @override
  void initState() {
    super.initState();
    helper = Helper(context); // Initialize here

    SettingsViewModel().load().then((settingsResult) {
      setState(() {
        settingsResult.when(
          success: (value) {
            apiBaseUrlController.text = value.apiBaseUrl ?? '';
            userController.text = value.user ?? '';
            passwordController.text = value.password ?? '';
          },
          failure: (error) {
            helper.showSnackbar("Error loading settings: $error");
          },
        );
      });
    });
  }

  Future<void> _saveDatas() async {
    final String apiBaseUrl = apiBaseUrlController.text;
    final String user = userController.text;
    final String password = passwordController.text;

    final settingsViewModel = SettingsViewModel(
      apiBaseUrl: apiBaseUrl,
      user: user,
      password: password,
    );

    if (settingsViewModel.isNotValid) {
      helper.showSnackbar(settingsViewModel.message);
      return;
    }

    final result = await settingsViewModel.save();
    result.when(
      success: (_) {
        helper.showSnackbar(settingsViewModel.message);
      },
      failure: (error) {
        helper.showSnackbar(settingsViewModel.message);
      },
    );
  }

  @override
  void dispose() {
    apiBaseUrlController.dispose();
    userController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                controller: apiBaseUrlController,
                hintText: 'Api base url',
                keyboardType: TextInputType.url,
              ),
              const SizedBox(height: 24),
              CustomTextField(
                hintText: 'User',
                controller: userController,
              ),
              const SizedBox(height: 8),
              CustomTextField(
                hintText: 'Password',
                controller: passwordController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 32),
              FilledButton(
                onPressed: _saveDatas,
                child: const Text('Save settings'),
              ),
              // const SizedBox(height: 32),
              // FilledButton(
              //   onPressed: () {},
              //   child: const Text("Test api setting"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
