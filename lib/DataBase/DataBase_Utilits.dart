import 'package:chat/models/MyUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseUtilits {
  static CollectionReference<MyUser> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.Collection_name)
        .withConverter<MyUser>(
            fromFirestore: (snap, _) => MyUser.fromJson(snap.data()!),
            toFirestore: (user, _) => user.toJson());
  }

  static Future<void> addUserToFirebase(MyUser myUser) {
    return getUserCollection().doc(myUser.id).set(myUser);
  }

  static Future<MyUser?> getUserFromFirebase(String id) async {
    var UserRef = await getUserCollection().doc(id).get();
    return UserRef.data();
  }
}
