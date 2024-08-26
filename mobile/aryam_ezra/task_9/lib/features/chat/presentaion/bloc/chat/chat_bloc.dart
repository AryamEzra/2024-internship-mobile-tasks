import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/use_cases/no_para_use_case.dart';
import '../../../../user/domain/entities/user.dart';
import '../../../domain/entities/chat.dart';

import '../../../domain/use_cases/get_my_chats.dart';
import '../../../domain/use_cases/initiate_chat.dart';


part './chat_event.dart';
part './chat_state.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  final GetMyChats getMyChats;
  final InitiateChat initiateChat;

  ChatsBloc({
    required this.getMyChats,
    required this.initiateChat,
  }) : super(const ChatsInitial([])) {
    on<ChatsLoadRequested>(_onLoadChatsRequested);
    on<ChatsChatInitiated>(_onChatAdded);
  }

  Future<void> _onLoadChatsRequested(
      ChatsLoadRequested event, Emitter<ChatsState> emit) async {
    emit(ChatsLoadInProgress(state.chats));

    final chats = await getMyChats(NoParams());

    chats.fold(
      (failure) => emit(ChatsFailure(failure.message, state.chats)),
      (chats) => emit(ChatsLoadSuccess(chats)),
    );
  }

  Future<void> _onChatAdded(
      ChatsChatInitiated event, Emitter<ChatsState> emit) async {
    emit(ChatsInitiateInProgress(state.chats));

    final result = await initiateChat(InitiateChatParams(event.receiver));

    result.fold(
      (failure) => emit(ChatsFailure(failure.message, state.chats)),
      (chat) => emit(ChatsInitiateSuccess(chat, state.chats)),
    );
  }
}
