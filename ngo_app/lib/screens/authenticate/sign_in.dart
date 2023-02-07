import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:ngo_app/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn(this.toggleView, {super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  // RegExp passwordCheck =
  // RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])$');

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          title: const Text("Sign in"),
          actions: <Widget>[
            TextButton.icon(
                onPressed: () {
                  widget.toggleView();
                },
                icon: const Icon(Icons.person),
                label: const Text("Register"))
          ],
        ),
        body: Column(children: [
          ElevatedButton(
            child: const Text("sign in anon"),
            onPressed: () async {
              dynamic result = await _auth.signInAnon();
              if (result != null) {
                debugPrint("User signin successfull");
                debugPrint(result.uid);
              } else {
                debugPrint("Error signing in.");
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          FormBuilder(
            key: _formKey,
            child: Column(children: <Widget>[
              FormBuilderTextField(
                name: "email",
                decoration: const InputDecoration(labelText: 'Email'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              FormBuilderTextField(
                name: "password",
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  // (val) {
                  //   (val!.length < 8) ? "Must be 8 char long" : null;
                  //   return passwordCheck.hasMatch(val)
                  //       ? "Must contain 1 upper case, 1 lower case, 1 digit, 1 special char"
                  //       : null;
                  // }
                ]),
              ),
              ElevatedButton(
                  onPressed: () async {
                    _formKey.currentState?.save();
                    if (_formKey.currentState!.validate()) {
                      final formData = _formKey.currentState?.value;
                      dynamic result = await _auth.signInAnon();
                      // formData = { 'field1': ..., 'field2': ..., 'field3': ... }
                      // do something with the form data
                    }
                  },
                  child: const Text("Log in"))
            ]),
          )
        ]));
  }
}
