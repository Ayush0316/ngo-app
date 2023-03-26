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
                  title: "What is the mission of the Careezy App?",
                  content:
                      "The mission of the Careezy app is to fill the gap between NGOs and volunteers by bringing them closer without any unnecessary and cumbersome paperwork and formalities. Society needs volunteers, and it needs them now. Careezy aims to fulfill both demands free of cost and without inconvenience to individuals and organizations.",
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
                  title: "What is the belief in Careezy App?",
                  content:
                      "The Careezy app believes that we as citizens of the world have a necessary duty towards society to play a role in its betterment and development and that unnecessary paperwork, formalities, fees, and other hinderances of the modern world should not hinder this process.",
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
                  title: "Which areas does Careezy App work in?",
                  content:
                      "The Careezy app works in all areas a user wants to sign up for and in the areas highlighted by the NGO on the app while signing up. It is up to the luck of the volunteer whether they will get their preferred volunteer work or not. Other than that, there are no restrictions on the type of volunteer work available or can be made available on the Careezy app.",
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
                  title:
                      "Does Careezy App works in other countries outside India too?",
                  content:
                      "Currently, Careezy is only available for NGOs operating in India and people willing to volunteer in India.",
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
                  title: "How can an NGO apply for volunteers?",
                  content:
                      "An NGO can get volunteers by simply registering themselves with the Careezy app and posting their requirements, mission, and other relevant information on their profile; then, they will be reached by the volunteers willing to work with them.",
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
                  title: "Does Careezy charges any fees for registrations?",
                  content:
                      "The Careezy app is free for people willing to volunteer and organizations looking for volunteers.",
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
                  title: "How can one volunteer through the Careezy app?",
                  content:
                      "One can volunteer for the NGOs registered on the Careezy app just by registering themselves on the app and signing up for various volunteer listings available on the app in their nearby area.",
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
                  title:
                      "What is the minimum age to become a volunteer on the Careezy app?",
                  content:
                      "There is no age restriction from the Careezy team regarding volunteers, but check with the NGOs before registering to volunteer at their cause.",
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
                  title:
                      "What is the eligibility criteria for volunteering on the Careezy app?",
                  content:
                      "There are no eligibility criteria for volunteering on the Careezy app; anyone with a phone and access to the internet can register.",
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
                  title:
                      "What all volunteer work am I qualified to do through the Careezy app?",
                  content:
                      "You are qualified to do all kinds of volunteer work listed on the Careezy app, but please check with NGOs before signing up in case of any special requirements.",
                ),
              ]),
            ),
          ),
        ),
      );
}
