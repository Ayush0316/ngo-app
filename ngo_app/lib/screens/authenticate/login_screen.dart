import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:ngo_app/services/auth.dart';
import 'package:adaptive_layout/adaptive_layout.dart';

class LoginScreen extends StatefulWidget {
  final Function toggleView;
  const LoginScreen(this.toggleView, {super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  bool obscure = true;
  String error = "";
  final _formKey = GlobalKey<FormBuilderState>();

  Widget buildLogo() {
    // final urlLogo = 'images/logo.svg';

    return CircleAvatar(
      backgroundColor: Color(0xFFFCD5CE),
      backgroundImage: AssetImage('images/logo.png'),
      radius: 80,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB880E0),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
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
          )),
          padding: const EdgeInsets.only(top: 20, left: 32, right: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(), flex: 0),
              // buildLogo(),
              const SizedBox(height: 0),
              Text(
                'Login',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto-Black',
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(height: 30),
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
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
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
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFF0800F0),
                          fontSize: 18.0,
                          fontFamily: 'Roboto-Black',
                          color: Color(0xFF0800F0),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      _formKey.currentState?.save();
                      if (_formKey.currentState!.validate()) {
                        final formData = _formKey.currentState?.value;
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            formData?["email"], formData?["password"]);
                        if (result == null) {
                          setState(() {
                            error = "Username or password is incorrect!!";
                          });
                        }
                      }
                    },
                    child: const Text("Log in"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFCD5CE),
                      padding:
                          EdgeInsets.symmetric(horizontal: 44, vertical: 12),
                      textStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    error,
                    style: const TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  Row(children: <Widget>[
                    Expanded(
                      child: new Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: Divider(
                            color: Colors.black,
                            height: 36,
                            thickness: 3,
                          )),
                    ),
                    Text(
                      'OR',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Expanded(
                      child: new Container(
                          margin:
                              const EdgeInsets.only(left: 20.0, right: 10.0),
                          child: Divider(
                            color: Colors.black,
                            height: 36,
                            thickness: 3,
                          )),
                    ),
                  ]),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Roboto-Black',
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Create Account',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 20.0,
                      fontFamily: 'Roboto-Black',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            widget.toggleView(2);
                          },
                          child: const Text("NGO's"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFCD5CE),
                            padding: EdgeInsets.symmetric(
                                horizontal: 44, vertical: 12),
                            textStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            widget.toggleView(3);
                          },
                          child: const Text("Donators"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFCD5CE),
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 12),
                            textStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ])
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
