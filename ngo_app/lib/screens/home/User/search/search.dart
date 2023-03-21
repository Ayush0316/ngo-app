import 'package:flutter/material.dart';
import 'package:ngo_app/modals/chatRoomModel.dart';
import 'package:ngo_app/modals/user.dart';
import 'package:ngo_app/screens/chatRoom/ChatRoomPage.dart';
import 'package:ngo_app/screens/home/Profile/ngo_profile.dart';
import "package:ngo_app/services/database.dart";
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:provider/provider.dart';

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
    return FutureBuilder(
        future: DatabaseService().getNgosName(),
        builder: (context, userData) {
          if (userData.connectionState == ConnectionState.done) {
            if (userData.data != null) {
              result = userData.data;
              return Container(
                  child: new Column(children: <Widget>[
                new Column(children: <Widget>[
                  searchTextField = AutoCompleteTextField<String>(
                      // width: double.infinity,
                      // height: 45,
                      decoration: InputDecoration(
                        hintText: "Search NGO by name",
                        hintStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w100),
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {});
                          },
                          icon: Icon(Icons.mic),
                        ),
                        contentPadding: EdgeInsets.all(12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      itemSubmitted: (item) async {
                        searchTextField?.textField?.controller?.text = item;
                        dynamic targetUid = result["uid"][item];
                        dynamic targetData =
                            await DatabaseService(uid: targetUid).getData();

                        targetData["uid"] = targetUid;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => profile(
                                  data: targetData,
                                  user: true,
                                )));
                      },
                      key: key,
                      clearOnSubmit: true,
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
            return CircularProgressIndicator();
          }
        });
  }
}
