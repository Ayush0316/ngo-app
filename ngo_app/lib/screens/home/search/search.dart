import 'package:flutter/material.dart';
import "package:ngo_app/services/database.dart";
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class searchBar extends StatefulWidget {
  const searchBar({super.key});

  @override
  State<searchBar> createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  List<String> data = [];

  AutoCompleteTextField? searchTextField;

  TextEditingController controller = new TextEditingController();

  _searchBarState();

  @override
  void initState() {
    data = DatabaseService().getNgosName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: new Column(
      children: <Widget>[
        new Column(
          children: <Widget>[
            searchTextField = AutoCompleteTextField<String>(
                // width: double.infinity,
                // height: 45,
                decoration: InputDecoration(
                  hintText: "Search NGO by name",
                  hintStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
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
                itemSubmitted: (item) {
                  setState(() =>
                      searchTextField?.textField?.controller?.text = item);
                },
                key: key,
                clearOnSubmit: false,
                suggestions: data,
                itemBuilder: (context, item) => Text(item),
                itemSorter: (a, b) {
                  return a.compareTo(b);
                },
                itemFilter: (item, query) {
                  return item.toLowerCase().startsWith(query.toLowerCase());
                })
          ],
        )
      ],
    ));
  }
}
