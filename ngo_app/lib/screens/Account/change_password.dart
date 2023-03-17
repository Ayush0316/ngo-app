import "package:flutter/material.dart";
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:form_builder_phone_field/form_builder_phone_field.dart';

class edit_password extends StatefulWidget {
  const edit_password({super.key});

  @override
  State<edit_password> createState() => _edit_passwordState();
}

class _edit_passwordState extends State<edit_password> {
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
                    // key: _formKey,
                    child: Column(children: <Widget>[
                      FormBuilderTextField(
                        name: "name",
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Old Password *',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FormBuilderTextField(
                        name: "name",
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'New Password *',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FormBuilderTextField(
                        name: "name",
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Confirm New Password *',
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () async {},
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
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
