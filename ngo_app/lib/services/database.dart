import "package:cloud_firestore/cloud_firestore.dart";
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ngo_app/modals/chatRoomModel.dart';
import 'package:uuid/uuid.dart';

dynamic uuid = Uuid();

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  // User collection refrence
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("Users");

  // Ngo collection refrence
  final CollectionReference ngosCollection =
      FirebaseFirestore.instance.collection("Ngos");

  final CollectionReference donations =
      FirebaseFirestore.instance.collection("Donations");

  final CollectionReference voluteers =
      FirebaseFirestore.instance.collection("Volunteers");

  final CollectionReference interests =
      FirebaseFirestore.instance.collection("Interests");

  final CollectionReference communities =
      FirebaseFirestore.instance.collection("Communities");

  // New user registration
  Future updateUserData(Map<String, dynamic> userData) async {
    return await usersCollection.doc(uid).set(userData);
  }

  // New ngo registration
  Future updateNgoData(Map<String, dynamic> ngoData) async {
    return await ngosCollection.doc(uid).set(ngoData);
  }

  // Image Storage ref
  Reference images = FirebaseStorage.instance.ref("profilepictures");

  // Get info about Ngos/Users.
  Future<Map<String, dynamic>> getData() async {
    dynamic data;
    data =
        await usersCollection.doc(uid).get().then((DocumentSnapshot doc) async {
      if (doc.exists) {
        return doc.data() as Map<String, dynamic>;
      } else {
        return await ngosCollection.doc(uid).get().then((DocumentSnapshot doc) {
          return (doc.data() != null)
              ? doc.data() as Map<String, dynamic>
              : {"error": "result not found."};
        });
      }
    });
    return data;
  }

  Future getSearchOptions() async {
    Map<String, dynamic> uid = {};
    List<String> data = [];
    Map<String, dynamic> result = {};
    await ngosCollection.get().then((snapshot) {
      snapshot.docs.forEach(
        (element) {
          Map<String, dynamic> tmp = element.data() as Map<String, dynamic>;
          data.add(tmp["name"]);
          Map<String, dynamic> ele = {"uid": element.id, "type": "ngo"};
          uid[tmp["name"]] = ele;
        },
      );
    });
    communities.get().then((snapshot) {
      snapshot.docs.forEach(
        (element) {
          Map<String, dynamic> tmp = element.data() as Map<String, dynamic>;
          data.add(tmp["name"]);
          Map<String, dynamic> ele = {"uid": element.id, "type": "comm"};
          uid[tmp["name"]] = ele;
        },
      );
    });
    result["data"] = data;
    result["uid"] = uid;
    return result;
  }

  Future getNgosNameByService(String service) async {
    List<String> options = [
      'Nutrition',
      'Environment',
      'Human Rights',
      'Sports',
      'Education',
      'Tourism',
      'Health',
      'Employment'
    ];
    List<Map<String, dynamic>> data = [];
    if (service != "Others") {
      await ngosCollection
          .where("Service", isEqualTo: service)
          .get()
          .then((snapshot) {
        snapshot.docs.forEach((element) {
          Map<String, dynamic> tmp = element.data() as Map<String, dynamic>;
          data.add(tmp);
        });
      });
    } else {
      await ngosCollection
          .where("Service", whereNotIn: options)
          .get()
          .then((snapshot) {
        snapshot.docs.forEach((element) {
          Map<String, dynamic> tmp = element.data() as Map<String, dynamic>;
          data.add(tmp);
        });
      });
    }
    return data;
  }

  // ****** Notifications ********* //

  Future don_Req(Map<String, dynamic> request) async {
    return await donations.add(request);
  }

  Future vol_req(Map<String, dynamic> request) async {
    return await voluteers.add(request);
  }

  Future<List<Map<String, dynamic>>> notifications() async {
    List<Map<String, dynamic>> data = [];
    await donations.get().then((snapshot) {
      snapshot.docs.forEach((element) {
        Map<String, dynamic> tmp = element.data() as Map<String, dynamic>;
        tmp["req_uid"] = element.id;
        tmp["type"] = "Donated";
        data.add(tmp);
      });
    });

    return data;
  }

  Future<List<Map<String, dynamic>>> vol_notifications(String interest) async {
    List<Map<String, dynamic>> data = [];
    await voluteers.where("Field", isEqualTo: interest).get().then((snapshot) {
      snapshot.docs.forEach((element) {
        Map<String, dynamic> tmp = element.data() as Map<String, dynamic>;
        tmp["req_uid"] = element.id;
        tmp["type"] = "Volunteered";
        data.add(tmp);
      });
    });
    return data;
  }

  Future<Map<String, dynamic>> getDonationData(String uid) async {
    Map<String, dynamic> data = {};
    await donations.doc(uid).get().then((DocumentSnapshot doc) async {
      Map<String, dynamic> tmp = doc.data() as Map<String, dynamic>;
      tmp["req_uid"] = doc.id;
      data = tmp;
    });
    return data;
  }

  Future<Map<String, dynamic>> getVolData(String uid) async {
    Map<String, dynamic> data = {};
    await voluteers.doc(uid).get().then((DocumentSnapshot doc) async {
      Map<String, dynamic> tmp = doc.data() as Map<String, dynamic>;
      tmp["req_uid"] = doc.id;
      data = tmp;
    });
    return data;
  }

  Future iAmInterested(String targetNgo, String name, String type, String req,
      DateTime now) async {
    return await interests.add({
      "user": uid,
      "ngo": targetNgo,
      "uid": req,
      "name": name,
      "createdon": now,
      "type": type
    });
  }

  Future<String?> uploadImage(dynamic imageFile) async {
    UploadTask uploadTask = images.child(uid!).putFile(imageFile!);

    TaskSnapshot snapshot = await uploadTask;

    String? imageUrl = await snapshot.ref.getDownloadURL();
    return imageUrl;
  }

  Future<ChatRoomModel> getChatroomModel(dynamic target) async {
    ChatRoomModel? chatRoom;

    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("chatrooms")
        .where("participants.${uid}", isEqualTo: true)
        .where("participants.${target["uid"]}", isEqualTo: true)
        .get();

    if (snapshot.docs.length > 0) {
      // Fetch the existing one
      var docData = snapshot.docs[0].data();
      ChatRoomModel existingChatroom =
          ChatRoomModel.fromMap(docData as Map<String, dynamic>);

      chatRoom = existingChatroom;
    } else {
      ChatRoomModel newChatroom = ChatRoomModel(
        chatroomid: uuid.v1(),
        participants: {
          uid.toString(): true,
          target["uid"]: true,
        },
      );

      await FirebaseFirestore.instance
          .collection("chatrooms")
          .doc(newChatroom.chatroomid)
          .set(newChatroom.toMap());

      chatRoom = newChatroom;
    }

    return chatRoom;
  }

  // ************ History ********** //
  Future<List<Map<String, dynamic>>> getHistory() async {
    List<Map<String, dynamic>> data = [];
    await interests
        .where('user', isEqualTo: uid)
        .orderBy("createdon", descending: true)
        .get()
        .then((snapshot) {
      snapshot.docs.forEach((element) {
        Map<String, dynamic> tmp = element.data() as Map<String, dynamic>;
        data.add(tmp);
      });
    });
    return data;
  }

  Future<List<Map<String, dynamic>>> getHistoryNgo() async {
    List<Map<String, dynamic>> data = [];
    await donations.where("uid", isEqualTo: uid).get().then((snapshot) {
      snapshot.docs.forEach((element) {
        Map<String, dynamic> tmp = element.data() as Map<String, dynamic>;
        tmp["type"] = 'donations';
        data.add(tmp);
      });
    });
    await voluteers.where("uid", isEqualTo: uid).get().then((snapshot) {
      snapshot.docs.forEach((element) {
        Map<String, dynamic> tmp = element.data() as Map<String, dynamic>;
        tmp["type"] = 'volunteers';
        data.add(tmp);
      });
    });
    await interests
        .where("user", isEqualTo: uid)
        .where("type", isEqualTo: "Community")
        .get()
        .then((snapshot) {
      snapshot.docs.forEach((element) {
        Map<String, dynamic> tmp = element.data() as Map<String, dynamic>;
        data.add(tmp);
      });
    });
    data.sort((m1, m2) {
      return m2["createdon"].compareTo(m1["createdon"]);
    });
    return data;
  }

  // ************** Communities *************************
  Future register_community(Map<String, dynamic> data) async {
    return await communities.doc(uid).set(data);
  }

  Future getCommDataByTag(String tag) async {
    List<String> options = [
      "Art & Culture",
      "Children",
      "Environment & Forests",
      "Medical",
      "Family Welfare",
      "Legal Awareness & Aid",
      "Vocational Training",
      "Women's development & Empowerment",
      "Youth Affairs",
      "Agriculture",
      "Teaching",
      "Human Rights",
      "Panchayti Raj",
      "Urban Development & Poverty Alleviation",
      "Women's Development & Empowerment",
      "Civic Issues",
      "Differently Abled",
      "Tourism",
      "Sports",
      "Aged/Elderly",
      "Nutrition",
      "HIV/AIDS",
      "Minority Issues",
      "Science & Technoloy",
      "Water Resources",
      "Information & Commnication Technology",
      "Skill Development",
      "Micro Finance",
      "Rural Development",
      "Food Processing",
      "Dairying & Fisheries",
      "Animal Husbandry",
      "Tribal Affairs",
      "Drinking Water",
      "Micro Small & Medium Enterprises",
      "Labours & Employement",
      "Industrial Reseach",
      "New & Renewable Energy",
      "Advocacy",
      "Prisoner's Issues",
      "Housing",
      "Land Resources",
      "Disaster Management",
      "Biotechnology",
      "Monuments Conservation",
      "Student Counselling",
      "Clean City",
      "Peace",
      "Dalit Upliftment",
      "Any Other",
    ];
    List<Map<String, dynamic>> data = [];
    if (tag != "More") {
      await communities.where("tag", isEqualTo: tag).get().then((snapshot) {
        snapshot.docs.forEach((element) {
          Map<String, dynamic> tmp = element.data() as Map<String, dynamic>;
          tmp["uid"] = element.id;
          data.add(tmp);
        });
      });
    } else {
      await communities
          .where("tag", whereNotIn: options)
          .get()
          .then((snapshot) {
        snapshot.docs.forEach((element) {
          Map<String, dynamic> tmp = element.data() as Map<String, dynamic>;
          tmp["uid"] = element.id;
          data.add(tmp);
        });
      });
    }
    return data;
  }

  Future joinComm(Map<String, dynamic> data) async {
    await interests.add(data);
  }

  Future isJoined(String comm_uid) async {
    bool exists = false;
    await interests
        .where("comm_uid", isEqualTo: comm_uid)
        .where("user", isEqualTo: uid)
        .get()
        .then((snapshot) {
      if (snapshot.docs.length > 0) {
        exists = true;
      }
    });
    return exists;
  }

  Future<List> getAllCommsUid() async {
    List data = [];
    await communities.get().then((snapshot) {
      snapshot.docs.forEach((element) {
        data.add(element.id);
      });
    });
    return data;
  }

  Future<Map<String, dynamic>> getCommData(String uid) async {
    Map<String, dynamic> data = {};
    await communities.doc(uid).get().then((DocumentSnapshot doc) async {
      Map<String, dynamic> tmp = doc.data() as Map<String, dynamic>;
      tmp["uid"] = uid;
      data = tmp;
    });
    return data;
  }

  Future<List> commJoinedBySomeone(List personUid) async {
    List data = [];
    for (int i = 0; i < personUid.length; i++) {
      await interests
          .where("user", isEqualTo: personUid[i])
          .where("type", isEqualTo: "Community")
          .get()
          .then((snapshot) {
        snapshot.docs.forEach((element) {
          Map<String, dynamic> tmp = element.data() as Map<String, dynamic>;
          data.add(tmp["comm_uid"]);
        });
      });
    }
    return data;
  }

  Future<List> peopleJoinedComm(List commUid) async {
    List data = [];
    for (int i = 0; i < commUid.length; i++) {
      await interests
          .where("comm_uid", isEqualTo: commUid[i])
          .where("type", isEqualTo: "Community")
          .get()
          .then((snapshot) {
        snapshot.docs.forEach((element) {
          Map<String, dynamic> tmp = element.data() as Map<String, dynamic>;
          data.add(tmp["user"]);
        });
      });
    }
    return data;
  }
}
