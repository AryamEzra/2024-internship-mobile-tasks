import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/use_cases/no_para_use_case.dart';
import '../../../../core/use_cases/use_case.dart';

import '../entities/chat.dart';
import '../repositories/chat_repositories.dart';


class GetMyChats implements UseCase<List<Chat>, NoParams> {
  final ChatRepository repository;

  const GetMyChats(this.repository);

  @override
  Future<Either<Failure, List<Chat>>> call(NoParams params) async {
    return await repository.getUserChats();
  }
}