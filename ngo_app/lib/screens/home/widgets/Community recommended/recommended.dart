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
    if (rawComm.length == 5) {
      comms = rawCommData;
      return;
    } else if (rawComm.length < 5) {
      int max = 5;
      List allComms = await DatabaseService().getAllCommsUid();
      List remComms = List.from(Set.from(allComms)
          .difference(Set.from(commJoinedByMe))
          .difference(Set.from(rawComm)));

      if (remComms.length + rawCommData.length < 5) {
        max = remComms.length + rawCommData.length;
      }

      List recomms = [];

      for (int i = 0; i < max - rawComm.length; i++) {
        recomms.add(remComms[i]);
      }
      List recommsdata = await getCommsData(recomms);
      comms = [];
      comms = rawCommData;
      for (int i = 0; i < recommsdata.length; i++) {
        comms.add(recommsdata[i]);
      }
      return;
    } else {
      rawCommData.sort((m1, m2) {
        double m1Min = getMinDiff(commJoinedByMeData, m1["ml"].toDouble());
        double m2Min = getMinDiff(commJoinedByMeData, m2["ml"].toDouble());
        return m1Min.compareTo(m2Min);
      });
      comms = [];
      for (int i = 0; i < 5; i++) {
        comms.add(rawCommData[i]);
      }
      return;
    }
  }

  bool first = true;

  @override
  Widget build(BuildContext context) {
    userUid = Provider.of<CustUser?>(context)!.uid;
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
                    first = false;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return community_profile(comms[index]);
                      }),
                    );
                    setState(() {});
                  },
                  leading: comms[index]["Imgurl"] != null
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(comms[index]["Imgurl"]))
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
  }
}
