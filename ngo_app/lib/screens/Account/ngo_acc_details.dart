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
  final service = [
    'Nutrition',
    'Environment and Forest',
    'Education and Literacy',
    'Tribal Affairs',
    'Water Resources',
    'Sports',
    'Tourism',
    'Human Rights',
    'Any Other',
  ];

  String? Service;
  bool other = false;
  final _formKey = GlobalKey<FormBuilderState>();
  String status = " ";
  dynamic data;
  bool first = true;
  dynamic user;

  @override
  Widget build(BuildContext context) {
    if (first) {
      user = Provider.of<CustUser?>(context);
      first = false;
      data = Provider.of<Data>(context).data;
      Service = data["Service"];

      if (!service.contains(Service)) {
        Service = "Any Other";
        other = true;
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
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(child: Container(), flex: 0),
                      FormBuilder(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            FormBuilderTextField(
                              name: "name",
                              initialValue: data["name"],
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
                              initialValue: data["email"],
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'EMAIL',
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
                                hintText: 'Select any category',
                                labelText: 'SERVICE',
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
                                  Service = newValue;
                                  _formKey.currentState?.save();
                                  if (newValue == "Any other") {
                                    other = true;
                                  } else {
                                    other = false;
                                  }
                                });
                              },
                              value: Service,
                              items: service.map<DropdownMenuItem<String>>(
                                  (String value) {
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
                            // FormBuilderCheckbox(name: name, title: title)
                            const SizedBox(
                              height: 10,
                            ),
                            Visibility(
                              visible: other,
                              child: FormBuilderTextField(
                                name: "Service",
                                initialValue: data["Service"],
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      gapPadding: 10.0,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    labelText: "If other(specify)",
                                    hintText: "Deatail about your Ngo work."),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Scrollbar(
                              thickness: 8,
                              // scrollbarOrientation:
                              radius: Radius.circular(10),
                              child: FormBuilderTextField(
                                keyboardType: TextInputType.multiline,
                                scrollPadding: const EdgeInsets.all(20.0),
                                // textCapitalization: TextCapitalization.sentences,
                                maxLines: 5,
                                name: "about",
                                initialValue: data["about"],
                                decoration: const InputDecoration(
                                  labelText: 'ABOUT THE NGO',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            FormBuilderTextField(
                              name: "website",
                              initialValue: data["website"],
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.link_sharp),
                                labelText: 'WEBSITE',
                                border: OutlineInputBorder(
                                  gapPadding: 10.0,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            FormBuilderTextField(
                              name: "socials",
                              initialValue: data["socials"],
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.group),
                                labelText: 'SOCIALS',
                                border: OutlineInputBorder(
                                  gapPadding: 10.0,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)))),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const edit_password()));
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

                                  if (Service != "Any Other") {
                                    formData["Service"] = Service;
                                  }

                                  data["name"] = formData["name"];
                                  data["email"] = formData["email"];
                                  data["phone_number"] =
                                      formData["phone_number"];
                                  data["Service"] = formData["Service"];
                                  data["about"] = formData["about"];
                                  data["website"] = formData["website"];
                                  data["socials"] = formData["socials"];

                                  await DatabaseService(uid: user?.uid)
                                      .updateNgoData(data);
                                  await Provider.of<Data>(context,
                                          listen: false)
                                      .updateAccount(user?.uid);

                                  setState(() {
                                    first = true;
                                    status =
                                        "Account data changed successfully";
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: 120, vertical: 10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            )));
  }
}
