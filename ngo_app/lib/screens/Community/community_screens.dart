import "package:flutter/material.dart";
import 'package:ngo_app/responsive.dart';
import 'package:flutter/services.dart';

final snackBar = SnackBar(
  content: const Text('URl Copied to clipboard'),
);

class community_profile extends StatelessWidget {
  const community_profile({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
            "name of the community",
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
                    backgroundImage: AssetImage(
                      "images/logo.png",
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'name of the community',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto-Black',
                    ),
                  ),
                  Text(
                    'main fileds of comunity working',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto-Black',
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'community admins contact details',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Roboto-Black',
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                      minHeight: 100,
                      maxHeight: Responsive.isSmallScreen(context)
                          ? height / 3
                          : height,
                      maxWidth:
                          Responsive.isSmallScreen(context) ? width : width,
                      minWidth:
                          Responsive.isSmallScreen(context) ? width : width,
                    ),
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 15, bottom: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      ('text about the working of the community'),
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto-Black',
                      ),
                    ),
                  ),
                  Text(
                    'Socials',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto-Black',
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 60,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          side: BorderSide(
                            color: Colors.blue,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      // olor: Colors.blue,
                      // elevation: 0.0,
                      onPressed: () => {},
                      onLongPress: () async {
                        //copy the link address and show message
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 10, right: 10, bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              // data["website"],
                              'website link, socials of the community like instagram or personal website',

                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto-Black',
                              ),
                            ),
                            Icon(
                              Icons.link,
                              size: 30,
                              color: Colors.white,
                            )
                            //join the community 
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ]),
          ),
        ),
      ),
    );
  }
}
