import 'package:flutter/material.dart';

import '../../models/message.dart';
import '../../models/user.dart';

abstract class IMessageService {
  Future<bool> send(Message message);
  Stream<Message> messages({@required User activeUser});
  void dispose();
}
