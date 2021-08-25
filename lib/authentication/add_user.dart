import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:up_to_health/data/daily_score.dart';
import 'package:up_to_health/data/uth_user.dart';

class AddUser {
  Future<void> addUserToFirebase(UthUser user) async {
    var currentUser = FirebaseAuth.instance.currentUser;
    print(currentUser);
    updateFirestore(user, currentUser);
    print("added user to firestore");
  }

  void updateFirestore(UthUser user, var currentUser) {
    /* Add remaining data to Firestore */
    FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .set(user.toJson());
  }

  void updateSingleFirestoreParam(var data, String param) {
    var currentUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .update({'$param' : data});
  }

  void setDailyScoreFirestoreParam(DailyScore dailyScore) {
    var currentUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .collection('dailyScores')
        .doc(dailyScore.date.toString())
        .set({'score' : dailyScore.score});
  }
}
