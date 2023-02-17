import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:ngo_app/services/auth.dart';
import 'package:form_builder_phone_field/form_builder_phone_field.dart';

class RegisterNgo extends StatefulWidget {
  final Function toggleView;
  const RegisterNgo(this.toggleView, {super.key});

  @override
  State<RegisterNgo> createState() => _RegisterNgoState();
}

class _RegisterNgoState extends State<RegisterNgo> {
  final AuthService _auth = AuthService();
  bool obscure = true;
  bool obscure_conf = true;
  bool other = false;
  String? service;
  final _formKey = GlobalKey<FormBuilderState>();
  String error = "";
  RegExp passwordCheck =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Register NGO",
          style: TextStyle(
            fontSize: 24.0,
            fontFamily: 'Roboto-Black',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFB880E0),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            padding: const EdgeInsets.only(top: 20, left: 32, right: 32),
            width: double.infinity,
            color: Colors.black38,
            height: 2.0,
          ),
        ),
        actions: <Widget>[
          TextButton.icon(
              onPressed: () {
                widget.toggleView(1);
              },
              icon: const Icon(Icons.person),
              label: const Text(
                "Sign in",
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Roboto-Black',
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ))
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFB880E0),
              Color(0xFFF385A4),
              Color.fromARGB(247, 223, 128, 109),
            ],
            stops: [
              0.3,
              0.6,
              1,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 5, left: 32, right: 32),
          // width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(), flex: 0),
              FormBuilder(
                key: _formKey,
                child: Column(children: <Widget>[
                  FormBuilderTextField(
                    name: "email",
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'EMAIL',
                      suffixIcon: Icon(
                        Icons.email,
                      ),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                  FormBuilderTextField(
                    name: "password",
                    obscureText: obscure,
                    decoration: InputDecoration(
                      labelText: 'PASSWORD',
                      suffixIcon: IconButton(
                          onPressed: () {
                            _formKey.currentState?.save();
                            setState(() {
                              obscure = !obscure;
                            });
                          },
                          icon: Icon(Icons.remove_red_eye_outlined)),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(8,
                          errorText: "Length must greater than 8"),
                      FormBuilderValidators.match(
                          '(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])',
                          errorText:
                              "Must contain 1 upper case, 1 lower case, 1 digit, 1 special char")
                    ]),
                  ),
                  FormBuilderTextField(
                    name: "confirm_password",
                    obscureText: obscure_conf,
                    decoration: InputDecoration(
                      labelText: 'CONFIRM PASSWORD',
                      suffixIcon: IconButton(
                          onPressed: () {
                            _formKey.currentState?.save();
                            setState(() {
                              obscure_conf = !obscure_conf;
                            });
                          },
                          icon: Icon(Icons.remove_red_eye_outlined)),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  FormBuilderTextField(
                    name: "ngo_name",
                    decoration: const InputDecoration(
                      labelText: 'NGO Name',
                      suffixIcon: Icon(
                        Icons.corporate_fare,
                      ),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      hintText: 'Select any category',
                      labelText: 'SERVICE',
                    ),
                    dropdownColor: Color(0xFFEFDBE3),
                    onChanged: (String? newValue) {
                      setState(() {
                        service = newValue;
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
                  // FormBuilderCheckbox(name: name, title: title)
                  Visibility(
                    visible: other,
                    child: FormBuilderTextField(
                      name: "Service",
                      decoration: const InputDecoration(
                          labelText: "If other(specify)",
                          hintText: "Deatail about your Ngo work."),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                  ),
                  FormBuilderPhoneField(
                    name: 'phone_number',
                    decoration: const InputDecoration(
                      labelText: 'CONTACT NUMBER',
                      hintText: 'Phone Number',
                    ),
                    priorityListByIsoCode: ['KE'],
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.numeric(),
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  FormBuilderTextField(
                    name: "address",
                    decoration: const InputDecoration(
                      labelText: 'ADDRESS',
                      suffixIcon: Icon(
                        Icons.location_on,
                      ),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.maxLength(100),
                    ]),
                  ),
                  FormBuilderTextField(
                    name: "pin_code",
                    decoration: const InputDecoration(
                      labelText: 'POSTAL CODE/ZIP',
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  FormBuilderTextField(
                    name: "city",
                    decoration: const InputDecoration(
                      labelText: 'TOWN/CITY',
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  FormBuilderTextField(
                    name: "state",
                    decoration: const InputDecoration(
                      labelText: 'STATE',
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  FormBuilderTextField(
                    name: "country",
                    decoration: const InputDecoration(
                      labelText: 'COUNTRY',
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      _formKey.currentState?.save();
                      if (_formKey.currentState!.validate()) {
                        Map<String, dynamic> formData = {
                          ..._formKey.currentState!.value
                        };
                        if (formData["password"] !=
                            formData["confirm_password"]) {
                          setState(() {
                            error = "Password must match confirm Password!!";
                          });
                        } else {
                          if (formData["Service"] == null) {
                            formData["Service"] = service;
                          }
                          formData["type"] = "Ngo";
                          dynamic result = await _auth
                              .registerWithEmailAndPassword(formData);

                          if (result == null) {
                            setState(() {
                              error = "Invalid Email Id!!";
                            });
                          }
                        }
                      }
                    },
                    child: const Text("REGISTER"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 44, vertical: 12),
                      textStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    error,
                    style: const TextStyle(color: Colors.red),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
