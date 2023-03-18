import "package:flutter/material.dart";
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ngo_app/modals/user.dart';
import 'package:ngo_app/services/UserProvider.dart';
import 'package:ngo_app/services/database.dart';
import 'package:provider/provider.dart';

class manage_address extends StatefulWidget {
  const manage_address({super.key});

  @override
  State<manage_address> createState() => _manage_addressState();
}

class _manage_addressState extends State<manage_address> {
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
          title: const Text("Manage Address"),
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
                      name: "address",
                      initialValue: data["address"],
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.location_on,
                        ),
                        labelText: 'Address',
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
                      name: "pin_code",
                      initialValue: data["pin_code"],
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Postal/ZIP Code',
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
                      name: "city",
                      initialValue: data["city"],
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Town/City',
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
                      name: "state",
                      initialValue: data["state"],
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'State',
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
                      name: "country",
                      initialValue: data["country"],
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Country',
                        border: OutlineInputBorder(
                          gapPadding: 10.0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
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
                          data["address"] = formData["address"];
                          data["pin_code"] = formData["pin_code"];
                          data["city"] = formData["city"];
                          data["state"] = formData["state"];
                          data["country"] = formData["country"];

                          if (data["type"] == "Ngo") {
                            await DatabaseService(uid: user?.uid)
                                .updateNgoData(data);
                          } else {
                            await DatabaseService(uid: user?.uid)
                                .updateUserData(data);
                          }
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
