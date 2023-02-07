import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:ngo_app/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  const Register(this.toggleView, {super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormBuilderState>();
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text("Register"),
        backgroundColor: Colors.brown[200],
        actions: <Widget>[
          TextButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: const Icon(Icons.person),
              label: const Text("Sign in"))
        ],
      ),
      body: FormBuilder(
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
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            name: "confirm_password",
            decoration: const InputDecoration(labelText: 'Confirm Password'),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
          ),
          ElevatedButton(
              onPressed: () async {
                _formKey.currentState?.save();
                if (_formKey.currentState!.validate()) {
                  final formData = _formKey.currentState?.value;
                  dynamic result = _auth.registerWithEmailAndPassword(
                      formData?["email"], formData?["password"]);

                  debugPrint(result.toString());
                  if (result == null) {
                    debugPrint("result returned as null");
                    setState(() {
                      error = "Unable to register";
                    });
                  }
                }
              },
              child: const Text("Register")),
          const SizedBox(
            height: 20,
          ),
          Text(error)
        ]),
      ),
    );
  }
}
