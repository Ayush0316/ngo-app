import "package:flutter/material.dart";
import "package:getwidget/getwidget.dart";

class faq extends StatefulWidget {
  const faq({super.key});

  @override
  State<faq> createState() => _faqState();
}

class _faqState extends State<faq> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.blue[50],
          appBar: AppBar(
            leading: BackButton(
              onPressed: () => Navigator.of(context).pop(false),
            ),
            backgroundColor: Colors.blue,
            title: const Text("FAQ's"),
            elevation: 0.0,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(children: <Widget>[
                GFAccordion(
                  // collapsedIcon: Icon(Icons.add),
                  // expandedIcon: Icon(Icons.minimize),4
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    // fontWeight: FontWeight.normal,
                    fontFamily: 'Roboto-Black',
                  ),
                  titleBorderRadius: const BorderRadius.all(Radius.circular(8)),
                  contentBorderRadius:
                      const BorderRadius.all(Radius.circular(8)),
                  title: "Lorem Ipsum is simply dummy",
                  content:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                ),
                GFAccordion(
                  // collapsedIcon: Icon(Icons.add),
                  // expandedIcon: Icon(Icons.minimize),4
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    // fontWeight: FontWeight.normal,
                    fontFamily: 'Roboto-Black',
                  ),
                  titleBorderRadius: const BorderRadius.all(Radius.circular(8)),
                  contentBorderRadius:
                      const BorderRadius.all(Radius.circular(8)),
                  title: "Lorem Ipsum is simply dummy",
                  content:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                ),
              ]),
            ),
          ),
        ),
      );
}
