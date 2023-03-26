import "package:flutter/material.dart";
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:ngo_app/modals/user.dart';
import 'package:ngo_app/services/UserProvider.dart';
import 'package:ngo_app/services/database.dart';
import 'package:provider/provider.dart';

class req_donations extends StatefulWidget {
  const req_donations({super.key});

  @override
  State<req_donations> createState() => _req_donationsState();
}

class _req_donationsState extends State<req_donations> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  bool other = false;
  String? field;
  String error = " ";
  final _formKey = GlobalKey<FormBuilderState>();

  bool isHomePageSelected = true;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustUser?>(context);
    final uid = user!.uid;
    final data = Provider.of<Data>(context).data;
    final name = data["name"];
    final Imgurl = data["Imgurl"];

    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            key: _key,
            backgroundColor: Color.fromARGB(249, 255, 255, 255),
            appBar: AppBar(
              leading: BackButton(
                onPressed: () => Navigator.of(context).pop(false),
              ),
              backgroundColor: Colors.blue,
              title: const Text("Donations Required"),
              elevation: 0.0,
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                child: Container(
                    child: FormBuilder(
                        key: _formKey,
                        child: Column(
                          children: [
                            FormBuilderTextField(
                              name: 'title',
                              decoration: const InputDecoration(
                                labelText: 'DONATION TITLE',
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
                                maxLines: 4,
                                name: 'details',
                                decoration: const InputDecoration(
                                  labelText: 'DONATION DETAILS AND DESCRIPTION',
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
                            SizedBox(
                              height: 20,
                            ),
                            DropdownButtonFormField(
                              decoration: const InputDecoration(
                                hintText: 'Select any category',
                                labelText: 'DONATION  FIELD',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                              dropdownColor: Color.fromARGB(255, 189, 236, 243),
                              onChanged: (String? newValue) {
                                setState(() {
                                  field = newValue;
                                  _formKey.currentState?.save();
                                  if (newValue == "Any Other") {
                                    other = true;
                                  } else {
                                    other = false;
                                  }
                                });
                              },
                              items: <String>[
                                'Nutrition',
                                'Environment and Forest',
                                'Education and Literacy',
                                'Tribal Affairs',
                                'Water Resources',
                                'Sports',
                                'Tourism',
                                'Human Rights',
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
                            Visibility(
                              visible: other,
                              child: FormBuilderTextField(
                                name: "Field",
                                decoration: const InputDecoration(
                                  labelText: "If other(specify)",
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                _formKey.currentState?.save();
                                if (_formKey.currentState!.validate()) {
                                  Map<String, dynamic> formData = {
                                    ..._formKey.currentState!.value
                                  };
                                  if (field != "Any Other") {
                                    formData["Field"] = field;
                                  }
                                  formData['name'] = name;
                                  formData["uid"] = uid;
                                  formData['Imgurl'] = Imgurl;
                                  await DatabaseService().don_Req(formData);
                                  setState(() {
                                    error = "Request posted successfully!!";
                                  });
                                }
                              },
                              child: const Text(
                                "SUBMIT",
                                style: TextStyle(
                                    letterSpacing: 0.8,
                                    fontSize: 20,
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
                                    horizontal: 140, vertical: 10),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              error,
                              style: const TextStyle(color: Colors.green),
                            )
                          ],
                        ))),
              ),
            )));
  }
}
