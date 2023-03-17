import "package:flutter/material.dart";
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:ngo_app/modals/user.dart';
import 'package:ngo_app/services/UserProvider.dart';
import 'package:form_builder_phone_field/form_builder_phone_field.dart';
import 'package:ngo_app/screens/Account/change_password.dart';
import 'package:ngo_app/services/database.dart';
import 'package:provider/provider.dart';

class ngo_acc_details extends StatefulWidget {
  const ngo_acc_details({super.key});

  @override
  State<ngo_acc_details> createState() => _ngo_acc_detailsState();
}

class _ngo_acc_detailsState extends State<ngo_acc_details> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Color.fromARGB(249, 255, 255, 255),
          appBar: AppBar(
            leading: BackButton(
              onPressed: () => Navigator.of(context).pop(false),
            ),
            backgroundColor: Colors.blue,
            title: const Text("Account Details"),
            elevation: 0.0,
          ),
          body: SafeArea(
              child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(child: Container(), flex: 0),
                FormBuilder(
                  child: Column(children: <Widget>[
                    FormBuilderTextField(
                      name: "name",
                      // initialValue: data["name"],
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'NGO NAME',
                        border: OutlineInputBorder(
                          gapPadding: 10.0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormBuilderTextField(
                      name: "email",
                      // initialValue: data["email"],
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          gapPadding: 10.0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormBuilderPhoneField(
                      name: 'phone_number',
                      // initialValue: data["phone_number"],
                      decoration: const InputDecoration(
                        labelText: 'CONTACT NUMBER',
                        hintText: 'Phone Number',
                        border: OutlineInputBorder(
                          gapPadding: 10.0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                      priorityListByIsoCode: ['KE'],
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.required(),
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ]),
                ),
              ],
            ),
          )),
        ));
  }
}
