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

  Future getNgosName() async {
    Map<String, String> uid = {};
    List<String> data = [];
    Map<String, dynamic> result = {};
    await ngosCollection.get().then((snapshot) {
      snapshot.docs.forEach(
        (element) {
          Map<String, dynamic> tmp = element.data() as Map<String, dynamic>;
          data.add(tmp["name"]);
          uid[tmp["name"]] = element.id;
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
        data.add(tmp);
      });
    });
    return data;
  }

  Future iAmInterested(
      String targetNgo, String name, String type, DateTime now) async {
    return await interests.add({
      "user": uid,
      "ngo": targetNgo,
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
  Future<List<Map<String, dynamic>>> getHistory(String type) async {
    List<Map<String, dynamic>> data = [];
    await interests.where(type, isEqualTo: uid).get().then((snapshot) {
      snapshot.docs.forEach((element) {
        Map<String, dynamic> tmp = element.data() as Map<String, dynamic>;
        data.add(tmp);
      });
    });
    return data;
  }

  // Future<List<Map<String, dynamic>>> getHistoryNgo() async {
  //   List<Map<String, dynamic>> data = [];
  //   await interests.where("ngo", isEqualTo: uid).get().then((snapshot) {
  //     snapshot.docs.forEach((element) {
  //       Map<String, dynamic> tmp = element.data() as Map<String, dynamic>;
  //       data.add(tmp);
  //     });
  //   });
  //   return data;
  // }
}
