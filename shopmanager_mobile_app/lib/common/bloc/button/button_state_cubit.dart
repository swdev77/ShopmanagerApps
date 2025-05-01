import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopmanager_mobile_app/common/bloc/button/button_state.dart';
import 'package:shopmanager_mobile_app/core/usecases/usecase.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());

  void execute({dynamic params, required Usecase usecase}) async {
    emit(ButtonLoadingState());

    await Future.delayed(const Duration(seconds: 1));

    try {
      Either result = await usecase.call(request: params);

      result.fold(
        (error) {
          emit(ButtonFailureState(errorMessage: error));
        },
        (data) {
          emit(ButtonSuccessState());
        },
      );
    } catch (e) {
      emit(ButtonFailureState(errorMessage: e.toString()));
    }
  }
}
