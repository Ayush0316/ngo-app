import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:ngo_app/screens/authenticate/authenticate.dart';
import 'package:ngo_app/services/auth.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String status = " ";
  final _formKey = GlobalKey<FormBuilderState>();
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white70,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
        child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(child: Container(), flex: 0),
                FormBuilderTextField(
                  name: "email",
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    icon: Icon(
                      Icons.mail,
                      color: Colors.white,
                    ),
                    errorStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text('Send Email'),
                  onPressed: () async {
                    _formKey.currentState?.save();
                    if (_formKey.currentState!.validate()) {
                      final formData = _formKey.currentState?.value;
                      final result =
                          await _auth.resetPassword(formData!["email"]);
                      setState(() {
                        status = result;
                      });
                    } else {
                      setState(() {
                        status = "Invalid email id!!";
                      });
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Text(status, style: const TextStyle(color: Colors.white)),
                ),
                TextButton(
                  child: Text('Sign In'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Authenticate()));
                  },
                )
              ],
            )),
      )),
    ));
  }
}
