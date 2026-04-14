import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/use_cases/use_case_interface.dart';
import 'package:e_commerce/features/auth/domain/repo/files_repo.dart';

class UploadImageUseCase extends UseCase<String, File> {
  final FilesRepo repository;
  UploadImageUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(File file) {
    return repository.uploadImage(file);
  }
}
