import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:login_bloc/src/blocs/Validators.dart';

class BLOC extends Validators {
// I had to use it bcz, stramctrl doesn't provide textfield values so easily, but it is basically same as stramontroller
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

/*
  Instead of dart's streamcontroller, we are going to use RxDart's Subject which is broadcast by deafult
  // underscore is used to make emailController and passwordController private  
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();
*/
  // Add data to stream
  Stream<String> get email => _emailController.stream.transform(vaildateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitValues =>
      Observable.combineLatest2(email, password, (e, p) => true);

  //Change data
  // get is used to follow best practice, not to expose whole functoin
  // Function(String) shows the thing which changeEmail is targetting to, is a function accepting String
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  submit() {
    final email = _emailController.value;
    final password = _passwordController.value;
    print("Email is:$email");
    print("Password is:$password");
  }

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

final bloc = BLOC();
