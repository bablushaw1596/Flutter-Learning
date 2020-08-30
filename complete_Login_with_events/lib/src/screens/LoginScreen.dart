import 'package:flutter/material.dart';
import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(children: <Widget>[
        emailField(),
        passwordField(),
        Container(margin: EdgeInsets.only(bottom: 20.0)),
        submitButton()
      ]),
    );
  }

  Widget emailField() {
    return StreamBuilder(
      stream: bloc.email,
      //snapshot contains the error msg from validator
      builder: (context, snapshot) {
        return TextField(
          // whenever textbox value is changed, onChanged will fired up and data is sent to sink's add fn changeEmail.
          // The sink then forward that data to stream where validation is done and new updates are sent
          // back to StreamBuilder's stream above, then calls builder method again with refreshed snapshot.
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Enter Email ID',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget passwordField() {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Enter Password',
              errorText: snapshot.error,
            ),
          );
        });
  }

  Widget submitButton() {
    return StreamBuilder(
      stream: bloc.submitValues,
      builder: (context, snapshot) {
        return RaisedButton(
/*   This snapshot has hasError, since for the 1st time when app is launched no error was there
     so login button by default is enabled which we dont want. 
          onPressed: snapshot.hasError  
              ? null
              : () {
                  print("correct!!");
                },
        */
/*      This snapshot has no data, no error for 1st time, 
*/
          onPressed: snapshot.hasData ? bloc.submit : null,
          child: Text('LOGIN!'),
          color: Colors.blue[600],
        );
      },
    );
  }
}
