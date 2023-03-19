import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import "package:ngo_app/services/auth.dart";
import 'package:ngo_app/services/UserProvider.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Data>(context).data;
    String name = data["name"] != null ? data["name"] : "Name";
    String url = data["Imgurl"] != null ? data["Imgurl"] : " ";
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Color.fromARGB(249, 255, 255, 255),
          appBar: AppBar(
            leading: BackButton(
              onPressed: () => Navigator.of(context).pop(false),
            ),
            backgroundColor: Colors.blue,
            title: Text(
              (data["name"] != null ? data["name"] : "name"),
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto-Black',
              ),
            ),
            elevation: 0.0,
          ),
          body: SafeArea(
              child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(child: Container(), flex: 0),
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(url),
                      ),
                      SizedBox(height: 10),
                      Text(
                        (data["name"] != null ? data["name"] : "name"),
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto-Black',
                        ),
                      ),
                      Text(
                        ('Location of the NGO'),
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Roboto-Black',
                        ),
                      ),
                      Text(
                        ('Service of the NGO'),
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Roboto-Black',
                        ),
                      ),
                      Text(
                        (data["email"] != null ? data["email"] : "Email"),
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Roboto-Black',
                        ),
                      ),
                      Text(
                        (data["phone_number"] != null
                            ? data["phone_number"]
                            : "Phone Number"),
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Roboto-Black',
                        ),
                      ),
                    ],
                  ))),
        ));
  }
}
