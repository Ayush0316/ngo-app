import "package:flutter/material.dart";
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:ngo_app/modals/user.dart';
import 'package:ngo_app/services/UserProvider.dart';
import 'package:form_builder_phone_field/form_builder_phone_field.dart';
import 'package:ngo_app/screens/Account/change_password.dart';
import 'package:ngo_app/services/database.dart';
import 'package:provider/provider.dart';

class acc_details extends StatefulWidget {
  const acc_details({super.key});

  @override
  State<acc_details> createState() => _acc_detailsState();
}

class _acc_detailsState extends State<acc_details> {
  final instrest = [
    'Cleanliness Drives',
    'Teaching',
    'Medical',
    'Women Empowerment',
    'Pickup and Distribution',
    'Any Other',
  ];

  final types = [
    'Individual',
    'Organization',
    'Any Other',
  ];
  bool other1 = false;
  bool other2 = false;
  final _formKey = GlobalKey<FormBuilderState>();
  String? donator_type;
  String? voluteering_intrust;
  dynamic data;
  bool first = true;
  String status = " ";

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustUser?>(context);
    if (first) {
      first = false;
      data = Provider.of<Data>(context).data;
      donator_type = data["Donator type"];
      voluteering_intrust = data["Volunteering Interests"];

      if (!instrest.contains(voluteering_intrust)) {
        voluteering_intrust = "Any Other";
        other2 = true;
      }

      if (!types.contains(donator_type)) {
        donator_type = "Any Other";
        other1 = true;
      }
    }
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
                  key: _formKey,
                  child: Column(children: <Widget>[
                    FormBuilderTextField(
                      name: "name",
                      initialValue: data["name"],
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
                      initialValue: data["email"],
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
                      initialValue: data["phone_number"],
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
                      onChanged: (String? newValue) {
                        setState(() {
                          donator_type = newValue;
                          _formKey.currentState?.save();
                          if (newValue == "Any Other") {
                            other1 = true;
                          } else {
                            other1 = false;
                          }
                        });
                      },
                      value: donator_type,
                      items:
                          types.map<DropdownMenuItem<String>>((String value) {
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
                      visible: other1,
                      child: FormBuilderTextField(
                        name: "Donator type",
                        initialValue: data["Donator type"],
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
                        setState(() {
                          voluteering_intrust = newValue;
                          _formKey.currentState?.save();
                          if (newValue == "Any Other") {
                            other2 = true;
                          } else {
                            other2 = false;
                          }
                        });
                      },
                      value: voluteering_intrust,
                      items: instrest
                          .map<DropdownMenuItem<String>>((String value) {
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
                      visible: other2,
                      child: FormBuilderTextField(
                        name: "Volunteering Interests",
                        initialValue: data["Volunteering Interests"],
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
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Center(
                          child: Text(
                        status,
                        style: TextStyle(color: Colors.green),
                      )),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        _formKey.currentState?.save();
                        if (_formKey.currentState!.validate()) {
                          Map<String, dynamic> formData = {
                            ..._formKey.currentState!.value
                          };

                          if (voluteering_intrust != "Any Other") {
                            formData["Volunteering Interests"] =
                                voluteering_intrust;
                          }
                          if (donator_type != "Any Other") {
                            formData["Donator type"] = donator_type;
                          }
                          data["name"] = formData["name"];
                          data["email"] = formData["email"];
                          data["phone_number"] = formData["phone_number"];
                          data["Volunteering Interests"] =
                              formData["Volunteering Interests"];
                          data["Donator type"] = formData["Donator type"];

                          await DatabaseService(uid: user?.uid)
                              .updateUserData(data);
                          await Provider.of<Data>(context, listen: false)
                              .updateAccount(user?.uid);

                          setState(() {
                            first = true;
                            status = "Account data changed successfully";
                          });
                        }
                      },
                      child: const Text(
                        "SAVE DETAILS",
                        style: TextStyle(
                            letterSpacing: 0.3,
                            fontSize: 13,
                            fontWeight: FontWeight.w200,
                            color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        elevation: 0.0,
                        backgroundColor: Colors.blue,
                        padding:
                            EdgeInsets.symmetric(horizontal: 120, vertical: 10),
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
}
