import "package:cloud_firestore/cloud_firestore.dart";

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // User collection refrence
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("Users");

  // Ngo collection refrence
  final CollectionReference ngosCollection =
      FirebaseFirestore.instance.collection("Ngos");

  // New user registration
  Future updateUserData(Map<String, dynamic> userData) async {
    return await usersCollection.doc(uid).set(userData);
  }

  // New ngo registration
  Future updateNgoData(Map<String, dynamic> ngoData) async {
    return await ngosCollection.doc(uid).set(ngoData);
  }

  // Get info about Ngos/Users.
  Future<Map<String, dynamic>> getData() async {
    print("funciton called!!");
    dynamic data;
    data =
        await usersCollection.doc(uid).get().then((DocumentSnapshot doc) async {
      if (doc.exists) {
        print("It is a user");
        print(doc);
        return doc.data() as Map<String, dynamic>;
      } else {
        print("It may be a ngo");
        return await ngosCollection.doc(uid).get().then((DocumentSnapshot doc) {
          return doc.data() as Map<String, dynamic>;
        });
      }
    });
    print(data);
    return data;
  }
}
