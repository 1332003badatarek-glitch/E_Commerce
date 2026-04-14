import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/error_handler.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/data/data_sources/remote/files_api_service.dart';
import 'package:e_commerce/features/auth/domain/repo/files_repo.dart';

class FilesRepoImpl extends FilesRepo {
  final FilesApiService _filesApiService;

  FilesRepoImpl(this._filesApiService);
  @override
  Future<Either<Failure, String>> uploadImage(File file) async {
    try {
      final response = await _filesApiService.uploadFile(file);
      return Right(response.location);
    } catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }
}
