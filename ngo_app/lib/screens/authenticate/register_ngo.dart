import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:ngo_app/services/auth.dart';

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
  final _formKey = GlobalKey<FormBuilderState>();
  String error = "";
  RegExp passwordCheck =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCD5CE),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Register Ngo",
          style: TextStyle(
            fontSize: 24.0,
            fontFamily: 'Roboto-Black',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          padding: const EdgeInsets.only(top: 20, left: 32, right: 32),
          width: double.infinity,
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
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.only(top: 20, left: 32, right: 32),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(child: Container(), flex: 0),
                FormBuilder(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    FormBuilderTextField(
                      name: "ngo_email",
                      decoration: const InputDecoration(
                        labelText: 'EMAIL',
                        suffixIcon: Icon(
                          Icons.email,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                    ),
                    const SizedBox(
                      height: 15,
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
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
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
                    const SizedBox(
                      height: 12,
                    ),
                    FormBuilderTextField(
                      name: "confirm_password",
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
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                    const SizedBox(height: 15),
                    FormBuilderTextField(
                      name: "ngo_name",
                      decoration: const InputDecoration(
                        labelText: 'NGO Name',
                        suffixIcon: Icon(
                          Icons.corporate_fare,
                          // color: Colors.blue,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
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
                    // FormBuilderCheckbox(name: name, title: title)
                    ElevatedButton(
                      onPressed: () async {
                        _formKey.currentState?.save();
                        if (_formKey.currentState!.validate()) {
                          final formData = _formKey.currentState?.value;
                          if (formData?["password"] !=
                              formData?["confirm_password"]) {
                            setState(() {
                              error = "Password must match confirm Password!!";
                            });
                          } else {
                            dynamic result =
                                await _auth.registerWithEmailAndPassword(
                                    formData?["email"], formData?["password"]);

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
                        textStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
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
            )),
      ),
    );
  }
}
