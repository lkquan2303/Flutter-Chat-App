import '../../pages/messages/models/chat.dart';
import '../../pages/messages/models/local_message.dart';

abstract class IDatasource {
  Future<void> addChat(Chat chat);
  Future<void> addMessage(LocalMessage message);
  Future<Chat> findChat(String chatId);
  Future<List<Chat>> findAllChat();
  Future<void> updateMessage(LocalMessage message);
  Future<List<LocalMessage>> findMessages(String chatId);
  Future<void> deleteChat(String chatId);
}
