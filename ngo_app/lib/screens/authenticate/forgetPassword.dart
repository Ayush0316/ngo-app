import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:ngo_app/screens/authenticate/authenticate.dart';
import 'package:ngo_app/services/auth.dart';
import 'package:ngo_app/responsive.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String status = " ";
  final _formKey = GlobalKey<FormBuilderState>();
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: SafeArea(
            child: Container(
              height: Responsive.isSmallScreen(context) ? height / 2 : height,
              // decoration: BoxDecoration(color: Colors.deepOrange),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Card(
                  color: Colors.blue[50],
                  child: Column(
                    children: [
                      FormBuilder(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Flexible(child: Container(), flex: 0),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30, left: 10, right: 10),
                              child: RichText(
                                text: TextSpan(
                                  text: 'Forgot your Password',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontFamily: 'Roboto-Black',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 10, right: 10),
                              child: RichText(
                                text: TextSpan(
                                  text:
                                      "Enter your email address and we'll send you a link to reset you Password",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'Roboto-Black',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 10, right: 10),
                              child: FormBuilderTextField(
                                name: "email",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.email(),
                                ]),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  labelText: 'Enter Email Address',
                                  suffixIcon: Icon(
                                    Icons.mail,
                                    color: Colors.lightBlue,
                                  ),
                                  // errorStyle: TextStyle(color: Colors.white),
                                  // labelStyle: TextStyle(color: Colors.white),
                                  // hintStyle: TextStyle(color: Colors.white),
                                  // focusedBorder: UnderlineInputBorder(
                                  //   borderSide: BorderSide(color: Colors.white),
                                  // ),
                                  // enabledBorder: UnderlineInputBorder(
                                  //   borderSide: BorderSide(color: Colors.white),
                                  // ),
                                  // errorBorder: UnderlineInputBorder(
                                  //   borderSide: BorderSide(color: Colors.white),
                                  // ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30, left: 10, right: 10),
                              child: ElevatedButton(
                                child: Text(
                                  'Send Email',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    // fontFamily: 'Roboto-Black',
                                    // fontWeight: FontWeight.w400,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  elevation: 0.0,
                                  backgroundColor: Colors.lightBlue,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 120, vertical: 15),
                                ),
                                onPressed: () async {
                                  _formKey.currentState?.save();
                                  if (_formKey.currentState!.validate()) {
                                    final formData =
                                        _formKey.currentState?.value;
                                    final result = await _auth
                                        .resetPassword(formData!["email"]);
                                    setState(() {
                                      status = result;
                                    });
                                  } else {
                                    setState(() {
                                      status = "Invalid email id!!";
                                    });
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(status,
                                  style: const TextStyle(color: Colors.red)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 0, left: 10, right: 10),
                              child: TextButton(
                                child: Text(
                                  'Back To Login',
                                  style: TextStyle(
                                    color: Color(0xFF0800F0),
                                    fontSize: 18,
                                    fontFamily: 'Roboto-Black',
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFF0800F0),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Authenticate()));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
