import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:socket_io_client/socket_io_client.dart';

import '../../../../core/constants/api_url.dart';
import '../../../../core/error/exceptions.dart';
import '../../../user/data/models/user_model.dart';
import '../models/chat_model.dart';
import '../models/message_model.dart';
import 'stream_socket.dart';
import 'package:task_9/core/connectivity/http.dart'; // Import the HttpClient

abstract class ChatRemoteDataSource {
  Future<void> deleteChat(String id);
  Future<ChatModel> getOrCreateChat(UserModel receiver);
  Future<List<ChatModel>> getUserChats();
  void sendMessage(String chat, String message, String type);
  Stream<MessageModel> getChatMessages(String id);
}

class ChatRemoteDataSourceImpl extends ChatRemoteDataSource {
  final HttpClient client;
  final String _baseUrl;

  StreamSocket streamSocket = StreamSocket();

  ChatRemoteDataSourceImpl({
    required this.client,
  }) : _baseUrl = '$baseUrlChat/chats';

  @override
  Future<void> deleteChat(String id) async {
    try {
      final response = await client.delete('$_baseUrl/$id');

      if (response.statusCode != 200) {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Stream<MessageModel> getChatMessages(String id) {
    streamSocket.dispose();
    streamSocket = StreamSocket();

    client.get('$_baseUrl/$id/messages').then((response) {
      if (response.statusCode == 200) {
        final List<dynamic> messages = jsonDecode(response.body)['data'];

        for (var message in messages) {
          streamSocket.addResponse(MessageModel.fromJson(message));
        }
      } else {
        throw ServerException();
      }
    });

    client.socket.connect();

    client.socket.onConnect((_) {
      log('Connected to the socket server');
    });

    client.socket.onDisconnect((_) {
      log('Disconnected from the socket server');
    });

    client.socket.on('message:delivered', (data) {
      MessageModel message = MessageModel.fromJson(data);
      streamSocket.addResponse(message);
    });

    client.socket.on('message:received', (data) {
      MessageModel message = MessageModel.fromJson(data);
      streamSocket.addResponse(message);
    });

    return streamSocket.getResponse;
  }

  @override
  Future<ChatModel> getOrCreateChat(UserModel receiver) async {
    try {
      final response = await client.post(_baseUrl, {
        'userId': receiver.id,
      });

      if (response.statusCode == 200) {
        return ChatModel.fromJson(jsonDecode(response.body)['data']);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<ChatModel>> getUserChats() async {
    try {
      final response = await client.get(_baseUrl);

      if (response.statusCode == 200) {
        final List<dynamic> chats = jsonDecode(response.body)['data'];
        return chats.map((e) => ChatModel.fromJson(e)).toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  void sendMessage(String chat, String message, String type) {
    client.socket.emit('message:send', {
      'chatId': chat,
      'content': message,
      'type': type,
    });
  }
}
