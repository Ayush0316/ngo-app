import "package:cloud_firestore/cloud_firestore.dart";

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

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

  List<String> getNgosName() {
    List<String> data = [];
    ngosCollection.get().then((snapshot) {
      snapshot.docs.forEach(
        (element) {
          Map<String, dynamic> tmp = element.data() as Map<String, dynamic>;
          data.add(tmp["ngo_name"]);
        },
      );
      return data;
    });
    return data;
  }
}
