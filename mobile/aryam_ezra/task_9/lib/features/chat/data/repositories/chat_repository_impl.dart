import 'package:dartz/dartz.dart';

import '../../../../core/connectivity/network_info.dart';
import '../../../../core/failure/failure.dart';

import '../../../user/data/models/user_model.dart';
import '../../../user/domain/entities/user.dart';
import '../../domain/entities/chat.dart';
import '../../domain/entities/message.dart';
import '../../domain/repositories/chat_repositories.dart';
import '../data_source/chat_remote_data_source.dart';

class ChatRepositoryImpl extends ChatRepository {
  final ChatRemoteDataSource _chatRemoteDataSource;

  final NetworkInfo _networkInfo;

  ChatRepositoryImpl({
    required NetworkInfo networkInfo,
    required ChatRemoteDataSource remoteDataSource,
  })  : _networkInfo = networkInfo,
        _chatRemoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, Unit>> deleteChat(String id) async {
    if (await _networkInfo.isConnected) {
      await _chatRemoteDataSource.deleteChat(id);
      return const Right(unit);
    } else {
      return Left(ServerFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Stream<Either<Failure, Message>>> getChatMessages(String id) async {
    if (await _networkInfo.isConnected) {
      final so = _chatRemoteDataSource.getChatMessages(id);
      return so.map((event) => Right(event));
    } else {
      return Stream.value(Left(ServerFailure(message: 'No internet connection')));
    }
  }

  @override
  Future<Either<Failure, Chat>> getOrCreateChat(User receiver) async {
    if (await _networkInfo.isConnected) {
      return Right(await _chatRemoteDataSource
          .getOrCreateChat(UserModel.fromEntity(receiver)));
    } else {
      return  Left(ServerFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<Chat>>> getUserChats() async {
    if (await _networkInfo.isConnected) {
      return Right(await _chatRemoteDataSource.getUserChats());
    } else {
      return  Left(ServerFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendMessage(
      String chatId, String message, String type) async {
    if (await _networkInfo.isConnected) {
      _chatRemoteDataSource.sendMessage(chatId, message, type);
      return const Right(unit);
    } else {
      return  Left(ServerFailure(message: 'No internet connection'));
    }
  }
}
