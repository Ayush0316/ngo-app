import "package:flutter/material.dart";
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:form_builder_phone_field/form_builder_phone_field.dart';
import 'package:ngo_app/services/auth.dart';

class edit_password extends StatefulWidget {
  const edit_password({super.key});

  @override
  State<edit_password> createState() => _edit_passwordState();
}

class _edit_passwordState extends State<edit_password> {
  String status = " ";
  final _formKey = GlobalKey<FormBuilderState>();
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Color.fromARGB(249, 255, 255, 255),
          appBar: AppBar(
            leading: BackButton(
              onPressed: () => Navigator.of(context).pop(false),
            ),
            backgroundColor: Colors.blue,
            title: const Text("Password"),
            elevation: 0.0,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(child: Container(), flex: 0),
                  FormBuilder(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      FormBuilderTextField(
                        name: "password",
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'New Password *',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FormBuilderTextField(
                        name: "confirm",
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Confirm New Password *',
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          _formKey.currentState?.save();
                          if (_formKey.currentState!.validate()) {
                            final formData = _formKey.currentState?.value;
                            if (formData!["password"] == formData["confirm"]) {
                              final result = await _auth
                                  .changePassword(formData["password"]);
                              setState(() {
                                status = result;
                              });
                            } else {
                              setState(() {
                                status =
                                    "Confirm password must match new password";
                              });
                            }
                          } else {
                            setState(() {
                              status = "Invalid inputs";
                            });
                          }
                        },
                        child: const Text(
                          "CHANGE PASSWORD",
                          style: TextStyle(
                              letterSpacing: 0.3,
                              fontSize: 17,
                              fontWeight: FontWeight.w200,
                              color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          elevation: 0.0,
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                              horizontal: 90, vertical: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(status,
                            style: const TextStyle(color: Colors.white)),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
