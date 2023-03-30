import 'package:flutter/material.dart';
import 'package:ngo_app/modals/user.dart';
import 'package:ngo_app/screens/Community/community_screens.dart';
import 'package:ngo_app/services/database.dart';
import 'package:provider/provider.dart';

class Comu_recom extends StatefulWidget {
  const Comu_recom({super.key});

  @override
  State<Comu_recom> createState() => _Comu_recomState();
}

class _Comu_recomState extends State<Comu_recom> {
  String userUid = "";
  List comms = [];

  double getMinDiff(List data, double ml) {
    double min = 100.0;
    print(33);
    for (int i = 0; i < data.length; i++) {
      if (data[i]["ml"] - ml >= 0) {
        if (min > data[i]["ml"] - ml) {
          min = data[i]["ml"] - ml;
        }
      } else {
        if (min > ml - data[i]["ml"]) {
          min = ml - data[i]["ml"];
        }
      }
    }
    print(34);
    return min;
  }

  Future<List> commsToBeRecommFrom(commJoinedByMe) async {
    List peopleJoined = [];
    List mightReccom = [];

    peopleJoined = await DatabaseService().peopleJoinedComm(commJoinedByMe);
    mightReccom = await DatabaseService().commJoinedBySomeone(peopleJoined);
    var setJoined = Set.from(commJoinedByMe);
    var setReccom = Set.from(mightReccom);
    List result = List.from(setReccom.difference(setJoined));
    return result;
  }

  Future getCommsData(List reccomComms) async {
    List result = [];
    for (int i = 0; i < reccomComms.length; i++) {
      Map data = await DatabaseService().getCommData(reccomComms[i]);
      result.add(data);
    }
    return result;
  }

  Future RocommComm() async {
    comms = [];
    List commJoinedByMe =
        await DatabaseService().commJoinedBySomeone([userUid]);
    List rawComm = await commsToBeRecommFrom(commJoinedByMe);
    List commJoinedByMeData = await getCommsData(commJoinedByMe);
    List rawCommData = await getCommsData(rawComm);
    print(1);
    print(commJoinedByMe);
    print(2);
    print(commJoinedByMeData);
    print(3);
    print(rawComm);
    print(4);
    print(rawCommData);
    if (rawComm.length == 5) {
      comms = rawCommData;
    } else if (rawComm.length < 5) {
      int max = 5;
      print("else if");
      List allComms = await DatabaseService().getAllCommsUid();
      print(allComms);
      print(7);
      List remComms = List.from(Set.from(allComms)
          .difference(Set.from(commJoinedByMe))
          .difference(Set.from(rawComm)));

      if (remComms.length + rawCommData.length < 5) {
        max = remComms.length + rawCommData.length;
      }
      print(remComms);
      print(8);
      comms = [];
      comms = rawCommData;

      List recomms = [];

      for (int i = 0; i < max - rawComm.length; i++) {
        recomms.add(remComms[i]);
      }
      print(recomms);
      print(9);
      List recommsdata = await getCommsData(recomms);
      print(recommsdata);
      print(10);
      for (int i = 0; i < recommsdata.length; i++) {
        comms.add(recommsdata[i]);
      }
    } else {
      print("else");
      print(rawCommData);
      print(10);
      for (int i = 0; i < rawCommData.length; i++) {
        print(i);
        if (i == 2) {
          print(21);
          rawCommData[i];
          print(22);
        }
        rawCommData[i]["min"] =
            getMinDiff(commJoinedByMeData, rawCommData[i]["ml"]);
        print(rawCommData[i]["min"]);
      }
      // rawCommData
      // rawCommData.sort((m1, m2) {
      //   print(30);
      //   double m1Min = getMinDiff(commJoinedByMeData, m1["ml"]);
      //   print(m1Min);
      //   double m2Min = getMinDiff(commJoinedByMeData, m2["ml"]);
      //   print(m2Min);
      //   return m1Min.compareTo(m2Min);
      // });
      print(rawCommData);
      print(6);
      for (int i = 0; i < 5; i++) {
        comms.add(rawCommData[i]);
      }
    }
    print("hello");
    print(comms);
  }

  @override
  Widget build(BuildContext context) {
    userUid = Provider.of<CustUser?>(context)!.uid;
    // RocommComm()
    if (comms.length == 0) {
      return FutureBuilder(
        future: RocommComm(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              height: 400,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            if (comms.length == 0) {
              return Center(
                  child: Text("You already joined all the communities."));
            }
            return ListView.separated(
              itemBuilder: ((context, index) {
                return Card(
                  color: Colors.blue[50],
                  elevation: 0.0,
                  child: ListTile(
                    onTap: () {
                      print("dhfkas");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return community_profile(comms[index]);
                        }),
                      );
                    },
                    leading: comms[index]["Imgurl"] != null
                        ? CircleAvatar(
                            backgroundImage:
                                NetworkImage(comms[index]["Imgurl"]))
                        : CircleAvatar(child: Icon(Icons.person)),
                    title: Text(comms[index]["name"]),
                    subtitle: Text(comms[index]["tag"]),
                  ),
                );
              }),
              itemCount: comms.length,
              separatorBuilder: (context, index) => SizedBox(
                height: 2,
              ),
            );
          }
        }),
      );
    } else {
      return ListView.separated(
        itemBuilder: ((context, index) {
          return InkWell(
              onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return community_profile(comms[index]);
                      }),
                    )
                  },
              child: Card(
                color: Colors.blue[50],
                elevation: 0.0,
                child: ListTile(
                  leading: comms[index]["Imgurl"] != null
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(comms[index]["Imgurl"]))
                      : CircleAvatar(child: Icon(Icons.person)),
                  title: Text(comms[index]["name"]),
                  subtitle: Text(comms[index]["tag"]),
                ),
              ));
        }),
        itemCount: comms.length,
        separatorBuilder: (context, index) => SizedBox(
          height: 2,
        ),
      );
    }
  }
}
