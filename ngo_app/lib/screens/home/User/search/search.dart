import 'package:flutter/material.dart';
import 'package:ngo_app/screens/Community/community_screens.dart';
import 'package:ngo_app/screens/home/Profile/ngo_profile.dart';
import "package:ngo_app/services/database.dart";
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class searchBar extends StatefulWidget {
  const searchBar({super.key});

  @override
  State<searchBar> createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  dynamic result;

  AutoCompleteTextField? searchTextField;

  TextEditingController controller = new TextEditingController();

  _searchBarState();

  @override
  Widget build(BuildContext context) {
    if (result == null) {
      return FutureBuilder(
          future: DatabaseService().getSearchOptions(),
          builder: (context, userData) {
            if (userData.connectionState == ConnectionState.done) {
              if (userData.data != null) {
                result = userData.data;
                return Container(
                    child: new Column(children: <Widget>[
                  new Column(children: <Widget>[
                    searchTextField = AutoCompleteTextField<String>(
                        decoration: InputDecoration(
                          hintText: "Search NGOs/Communities",
                          hintStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w100),
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          contentPadding: EdgeInsets.all(12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        itemSubmitted: (item) async {
                          if (item == "") {
                            setState(() {
                              result = null;
                            });
                          }
                          // searchTextField?.textField?.controller?.text = item;
                          dynamic targetItemData = result["uid"][item];
                          if (targetItemData["type"] == "ngo") {
                            dynamic targetUid = targetItemData["uid"];
                            dynamic targetData =
                                await DatabaseService(uid: targetUid).getData();

                            targetData["uid"] = targetUid;
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => profile(
                                      data: targetData,
                                      user: true,
                                    )));
                          } else {
                            dynamic targetUid = targetItemData["uid"];
                            dynamic targetData =
                                await DatabaseService().getCommData(targetUid);

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    community_profile(targetData)));
                          }
                          setState(() {
                            result = null;
                          });
                        },
                        key: key,
                        suggestions: result["data"],
                        itemBuilder: (context, item) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(item),
                            ),
                        itemSorter: (a, b) {
                          return a.compareTo(b);
                        },
                        itemFilter: (item, query) {
                          return item
                              .toLowerCase()
                              .startsWith(query.toLowerCase());
                        })
                  ])
                ]));
              } else {
                return CircularProgressIndicator();
              }
            } else {
              print("called!!");
              return CircularProgressIndicator();
            }
          });
    } else {
      return Container(
          child: new Column(children: <Widget>[
        new Column(children: <Widget>[
          searchTextField = AutoCompleteTextField<String>(
              // width: double.infinity,
              // height: 45,
              onFocusChanged: (value) {
                setState(() {
                  result = null;
                });
              },
              decoration: InputDecoration(
                hintText: "Search NGOs/Communities",
                hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
                prefixIcon: const Icon(Icons.search),
                filled: true,
                contentPadding: EdgeInsets.all(12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              itemSubmitted: (item) async {
                if (item == "") {
                  result = null;
                }
                // WidgetsFlutterBinding.ensureInitialized();
                // searchTextField?.textField?.controller?.text = item;

                dynamic targetItemData = result["uid"][item];
                if (targetItemData["type"] == "ngo") {
                  dynamic targetUid = targetItemData["uid"];
                  dynamic targetData =
                      await DatabaseService(uid: targetUid).getData();

                  targetData["uid"] = targetUid;
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => profile(
                            data: targetData,
                            user: true,
                          )));
                } else {
                  dynamic targetUid = targetItemData["uid"];
                  dynamic targetData =
                      await DatabaseService().getCommData(targetUid);

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => community_profile(targetData)));
                }
                setState(() {
                  result = null;
                });
              },
              key: key,
              suggestions: result["data"],
              itemBuilder: (context, item) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(item),
                  ),
              itemSorter: (a, b) {
                return a.compareTo(b);
              },
              itemFilter: (item, query) {
                return item.toLowerCase().startsWith(query.toLowerCase());
              })
        ])
      ]));
    }
  }
}
