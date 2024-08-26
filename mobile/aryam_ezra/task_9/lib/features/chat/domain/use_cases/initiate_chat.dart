import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../../../user/domain/entities/user.dart';
import '../entities/chat.dart';

import '../repositories/chat_repositories.dart';

class InitiateChat implements UseCase<Chat, InitiateChatParams> {
  final ChatRepository repository;

  const InitiateChat(this.repository);

  @override
  Future<Either<Failure, Chat>> call(InitiateChatParams params) async {
    return await repository.getOrCreateChat(params.receiver);
  }
}

class InitiateChatParams extends Equatable {
  final User receiver;

  const InitiateChatParams(this.receiver);

  @override
  List<Object?> get props => [receiver];
}
