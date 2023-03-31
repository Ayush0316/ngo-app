import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:ngo_app/services/auth.dart';
import "package:ngo_app/screens/authenticate/forgetPassword.dart";
// import 'package:adaptive_layout/adaptive_layout.dart';

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

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget buildLogo() {
    return CircleAvatar(
      backgroundColor: Color(0xFFFCD5CE),
      backgroundImage: AssetImage('images/logo.png'),
      radius: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 50, left: 32, right: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(child: Container(), flex: 0),
                // buildLogo(),
                Text(
                  'Careezy',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 42.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto-BoldItalic',
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Login',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 38.0,
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
                          color: Colors.blue,
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
                          icon: Icon(obscure
                              ? Icons.remove_red_eye_outlined
                              : Icons.visibility_off_outlined),
                          color: Colors.blue,
                        ),
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
                        child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ForgotPassword()));
                            },
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
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        showLoaderDialog(context);
                        _formKey.currentState?.save();
                        if (_formKey.currentState!.validate()) {
                          final formData = _formKey.currentState?.value;
                          dynamic result =
                              await _auth.signInWithEmailAndPassword(
                                  formData?["email"], formData?["password"]);
                          Navigator.pop(context);
                          if (result == null) {
                            setState(() {
                              error = "Username or password is incorrect!!";
                            });
                          }
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                            color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0.0,
                        backgroundColor: Colors.blue,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 10),
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
                            child: const Text(
                              "NGO's",
                              style: TextStyle(
                                  fontSize: 16,
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
                                  horizontal: 50, vertical: 10),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              widget.toggleView(3);
                            },
                            child: const Text(
                              "Donators",
                              style: TextStyle(
                                  fontSize: 16,
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
                                  horizontal: 45, vertical: 10),
                            ),
                          ),
                        ])
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
