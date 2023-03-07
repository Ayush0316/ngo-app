import "package:flutter/material.dart";
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class req_volunteers extends StatefulWidget {
  const req_volunteers({super.key});

  @override
  State<req_volunteers> createState() => _req_volunteersState();
}

class _req_volunteersState extends State<req_volunteers> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  bool isHomePageSelected = true;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: _key,
          backgroundColor: Color.fromARGB(249, 255, 255, 255),
          appBar: AppBar(
            leading: BackButton(
              onPressed: () => Navigator.of(context).pop(false),
            ),
            backgroundColor: Colors.blue,
            title: const Text("Volunteers Required"),
            elevation: 0.0,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FormBuilder(
                          child: Column(
                        children: [
                          FormBuilderTextField(
                            name: 'vol_title',
                            decoration: const InputDecoration(
                              labelText: 'WORK TITLE',
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
                                labelText: 'WORK DETAILS AND DESCRIPTION',
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
                              labelText: 'VOLUNTEERING FIELD',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
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
                          SizedBox(
                            height: 40,
                          ),
                          ElevatedButton(
                            onPressed: () async {},
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
                        ],
                      ))
                    ]),
              ),
            ),
          ),
        ),
      );
}
