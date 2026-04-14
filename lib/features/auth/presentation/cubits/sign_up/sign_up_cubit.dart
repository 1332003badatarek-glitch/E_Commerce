import 'dart:developer';
import 'dart:io';

import 'package:e_commerce/features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:e_commerce/features/auth/domain/use_cases/upload_image_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase _signUpUseCase;
  final UploadImageUseCase _uploadImageUseCase;

  SignUpCubit(this._signUpUseCase, this._uploadImageUseCase)
    : super(SignUpInitial());

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    File? imageFile,
  }) async {
    emit(SignUpLoading());
    String? uploadedImageUrl;
    if (imageFile != null) {
      final result = await _uploadImageUseCase(imageFile);
      result.fold(
        (failure) => log(failure.message),
        (imageUrl) => uploadedImageUrl = imageUrl,
      );
    }
    final result = await _signUpUseCase(
      SignUpParams(
        name: name,
        email: email,
        password: password,
        avatarUrl: uploadedImageUrl,
      ),
    );

    result.fold(
      (failure) => emit(SignUpFailure(erorrMessage: failure.message)),
      (user) => emit(SignUpSuccess(user: user)),
    );
  }
}
