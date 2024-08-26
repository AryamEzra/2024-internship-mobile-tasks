import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/chat.dart';

import '../repositories/chat_repositories.dart';

class SendMessage implements UseCase<Unit, SendMessageParams> {
  final ChatRepository repository;

  const SendMessage(this.repository);

  @override
  Future<Either<Failure, Unit>> call(SendMessageParams params) async {
    return await repository.sendMessage(
        params.chat.id, params.message, params.type);
  }
}

class SendMessageParams extends Equatable {
  final Chat chat;
  final String message;
  final String type;

  const SendMessageParams(this.chat, this.message, this.type);

  @override
  List<Object?> get props => [chat, message, type];
}
