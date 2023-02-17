import "package:cloud_firestore/cloud_firestore.dart";

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // collection refrence
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection("Users");

  final CollectionReference _ngosCollection =
      FirebaseFirestore.instance.collection("Ngos");

  Future updateUserData(Map<String, dynamic> userData) async {
    print(userData);
    return await _usersCollection.doc(uid).set(userData);
  }

  Future updateNgoData(Map<String, dynamic> ngoData) async {
    print(ngoData);
    return await _ngosCollection.doc(uid).set(ngoData);
  }
}
