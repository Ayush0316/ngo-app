import "package:flutter/material.dart";
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:ngo_app/services/auth.dart';
import 'package:form_builder_phone_field/form_builder_phone_field.dart';
import 'package:ngo_app/screens/Account/change_password.dart';

class acc_details extends StatefulWidget {
  const acc_details({super.key});

  @override
  State<acc_details> createState() => _acc_detailsState();
}

class _acc_detailsState extends State<acc_details> {
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
            title: const Text("Account Details"),
            elevation: 0.0,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
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
                          labelText: 'NAME',
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
                      DropdownButtonFormField(
                        decoration: const InputDecoration(
                          labelText: 'DONATOR TYPE',
                          hintText: 'Select any category',
                          border: OutlineInputBorder(
                            gapPadding: 10.0,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                        dropdownColor: Color.fromARGB(255, 189, 236, 243),
                        onChanged: (String? newValue) {},
                        items: <String>[
                          'Individual',
                          'Organization',
                          'Any Other',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Visibility(
                        // visible: other1,
                        child: FormBuilderTextField(
                          name: "Donator type",
                          decoration: const InputDecoration(
                            labelText: "If Other (Specify)",
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField(
                        decoration: const InputDecoration(
                          labelText: 'Volunteering Interests',
                          hintText: 'Select any category',
                          border: OutlineInputBorder(
                            gapPadding: 10.0,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                        dropdownColor: Color.fromARGB(255, 189, 236, 243),
                        onChanged: (String? newValue) {
                          setState(() {});
                        },
                        items: <String>[
                          'Cleanliness Drives',
                          'Teaching',
                          'Medical',
                          'Women Empowerment',
                          'Pickup and Distribution',
                          'Any Other',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Visibility(
                        // visible: other1,
                        child: FormBuilderTextField(
                          name: "Donator type",
                          decoration: const InputDecoration(
                            labelText: "If Other (Specify)",
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)))),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const edit_password()));
                          },
                          child: Text(
                            "CHANGE PASSWORD",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto-Black',
                            ),
                          )),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {},
                        child: const Text(
                          "SAVE DETAILS",
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
                              horizontal: 120, vertical: 10),
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
