import "package:flutter/material.dart";
import 'package:ngo_app/responsive.dart';
import 'package:ngo_app/screens/Community/community_screens.dart';
import 'package:ngo_app/services/database.dart';

class community_option extends StatelessWidget {
  // final String text;
  // final String subheading;
  final List<String> textList;
  const community_option({super.key, required this.textList});

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List comm = [];
    Future getComm() async {
      comm = await DatabaseService().getCommDataByTag(textList[0]);
    }

    return GestureDetector(
        //add search bar
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Color.fromARGB(249, 255, 255, 255),
          appBar: AppBar(
            toolbarHeight:
                Responsive.isSmallScreen(context) ? height / 6 : height,
            leading: BackButton(
              onPressed: () => Navigator.of(context).pop(false),
            ),
            backgroundColor: Colors.blue,
            title: Text(
              // name,
              textList[0],
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto-Black',
              ),
            ),
            bottom: PreferredSize(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 0, left: 20, right: 20, bottom: 10),
                  child: Text(textList[1]),
                ),
                preferredSize: Size.zero),
            elevation: 0.0,
          ),
          body: SafeArea(
              child: FutureBuilder(
            future: getComm(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.separated(
                  itemBuilder: ((context, index) {
                    return InkWell(
                        onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return community_profile(comm[index]);
                                }),
                              )
                            },
                        child: Card(
                          color: Colors.blue[50],
                          elevation: 0.0,
                          child: ListTile(
                            leading: comm[index]["Imgurl"] != null
                                ? CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(comm[index]["Imgurl"]))
                                : CircleAvatar(child: Icon(Icons.person)),
                            title: Text(comm[index]["name"]),
                            subtitle: Text(comm[index]["tag"]),
                          ),
                        ));
                  }),
                  itemCount: comm.length,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 2,
                  ),
                );
              }
            }),
            // child: SingleChildScrollView(
            // padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     //this will contain the entire list of the ngos in this rerspective section
            //   ],
            // ))
          )),
        ));
  }
}
