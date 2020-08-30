import 'dart:async';

//This class is trying to make validators re-usable

class Validators {
  final vaildateEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (emailValue, sink) {
    if (emailValue.contains('@'))
      sink.add(emailValue);
    else
      sink.addError('Invalid Email');
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (passwordValue, sink) {
    if (passwordValue.length > 3)
      sink.add(passwordValue);
    else
      sink.addError('Password too short');
  });
}
