import 'package:dartz/dartz.dart';
import 'package:task_9/core/failure/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
