import "package:flutter/material.dart";
import 'package:ngo_app/responsive.dart';
import 'package:ngo_app/screens/home/Profile/ngo_profile.dart';
import 'package:ngo_app/services/database.dart';

class ngo_list extends StatelessWidget {
  final List<String> textList;
  const ngo_list({super.key, required this.textList});

  @override
  Widget build(BuildContext context) {
// double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List ngoNames = [];
    Future getNames() async {
      ngoNames = await DatabaseService().getNgosNameByService(textList[0]);
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
                  child: Text(
                    textList[1],
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFFF333333),
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto-Black',
                    ),
                  ),
                ),
                preferredSize: Size.zero),
            elevation: 0.0,
          ),
          body: SafeArea(
            child: Container(
                padding: const EdgeInsets.only(top: 0, left: 10, right: 10),
                child: FutureBuilder(
                  future: getNames(),
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
                                  return profile(
                                      data: ngoNames[index], user: true);
                                  // return details(
                                  //     notification: notifications[index]);
                                }),
                              )
                            },
                            child: Card(
                              color: Colors.blue[50],
                              elevation: 0.0,
                              child: ListTile(
                                leading: ngoNames[index]["Imgurl"] != null
                                    ? CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            ngoNames[index]["Imgurl"]))
                                    : CircleAvatar(child: Icon(Icons.person)),
                                title: Text(ngoNames[index]["name"]),
                                subtitle: Text(ngoNames[index]["address"] +
                                    " " +
                                    ngoNames[index]["city"] +
                                    ", " +
                                    ngoNames[index]["state"]),
                              ),
                            ),
                          );
                        }),
                        itemCount: ngoNames.length,
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
          ),
        ));
  }
}
