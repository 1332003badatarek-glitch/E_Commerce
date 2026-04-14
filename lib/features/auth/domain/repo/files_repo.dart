import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';

abstract class FilesRepo {
  Future<Either<Failure, String>> uploadImage(File file);
}
