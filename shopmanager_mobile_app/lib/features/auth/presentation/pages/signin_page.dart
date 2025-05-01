import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopmanager_mobile_app/common/bloc/button/button_state.dart';
import 'package:shopmanager_mobile_app/common/bloc/button/button_state_cubit.dart';
import 'package:shopmanager_mobile_app/common/widgets/button/basic_app_button.dart';
import 'package:shopmanager_mobile_app/features/auth/domain/entities/signin_request.dart';
import 'package:shopmanager_mobile_app/features/auth/domain/usecases/signin_usecase.dart';
import 'package:shopmanager_mobile_app/injection_container.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            late String message;
            if (state is ButtonSuccessState) {
              message = 'Sign in success';
            } else if (state is ButtonFailureState) {
              message = state.errorMessage;
            }
            var snackBar = SnackBar(content: Text(message));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: SafeArea(
            minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _signin(),
                const SizedBox(height: 50),
                _emailField(_emailController),
                const SizedBox(height: 20),
                _passwordField(_passwordController),
                const SizedBox(height: 40),
                _signinButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signin() {
    return const Text(
      'Sign In',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
    );
  }

  Widget _emailField(TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: _inputDecoration('Email'),
    );
  }

  Widget _passwordField(TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: _inputDecoration('Password'),
    );
  }

  Widget _signinButton(BuildContext context) {
    // return ElevatedButton(
    //   onPressed: () {},
    //   child: Text('Login'),
    //   style: ElevatedButton.styleFrom(
    //     minimumSize: Size(100, 40),
    //   ),
    // );
    return Builder(
      builder: (context) {
        return BasicAppButton(
          title: 'Login',
          onPressed: () {
            context.read<ButtonStateCubit>().execute(
                  usecase: sl<SigninUsecase>(),
                  params: SigninRequest(
                    login: _emailController.text,
                    password: _passwordController.text,
                  ),
                );
          },
        );
      },
    );
  }
}
