import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopmanager_mobile_app/common/bloc/button/button_state.dart';
import 'package:shopmanager_mobile_app/common/bloc/button/button_state_cubit.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  final double? width;

  const BasicAppButton({
    required this.onPressed,
    this.title = '',
    this.height,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const heightValue = 50.0;
    final widthValue = MediaQuery.of(context).size.width;

    return BlocBuilder<ButtonStateCubit, ButtonState>(
        builder: (context, state) {
      if (state is ButtonLoadingState) {
        return _loading(context, heightValue, widthValue);
      }
      return _initial(context, heightValue, widthValue);
    });
  }

  Widget _loading(BuildContext context, double height, double width) {
    return ElevatedButton(
      onPressed: null,
      style: ElevatedButton.styleFrom(
          disabledBackgroundColor: Colors.grey,
          minimumSize: Size(width, height)),
      child: const CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }

  Widget _initial(BuildContext context, double height, double width) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        // boxShadow: [
        //   BoxShadow(
        //     color: const Color(0xff3461FD).withOpacity(0.8),
        //     offset: const Offset(0, 5),
        //     blurRadius: 17,
        //   )
        // ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width, height),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
