import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final String uid;
  DatabaseService({this.uid});

  void createUser() async {
    try {
      await firestore
          .collection('users')
          .doc(uid)
          .set({}, SetOptions(merge: true));
    } catch (e) {}
  }

  void createTransaction(
      String date, String category, String description, String total) async {
    try {
      await firestore.collection('users').doc(uid).collection('expenses').add({
        'date': date,
        'category': category,
        'description': description,
        'total': total,
      });
    } catch (e) {
      print(e);
    }
  }

  void deleteTransaction(String date) async {
    try {
      firestore
          .collection('users')
          .doc(uid)
          .collection('expenses')
          .where('date', isEqualTo: date)
          .get()
          .then((snapshot) {
        snapshot.docs.first.reference.delete();
      });
    } catch (e) {
      print(e);
    }
  }

  Future<int> getTotalExpense() async {
    int total = 0;
    try {
      await firestore
          .collection('users')
          .doc(uid)
          .collection('expenses')
          .get()
          .then((snapshot) {
        snapshot.docs.forEach((result) {
          total += int.parse(result.data()['total']);
        });
      });
    } catch (e) {
      print(e);
    }

    return total;
  }

  Future<int> getTodayExpense() async {
    DateTime now = new DateTime.now();
    DateTime todaysdate =
        new DateTime(now.day, now.month, now.year); // set todays date

    int todaytotal = 0;
    try {
      await firestore
          .collection('users')
          .doc(uid)
          .collection('expenses')
          .get()
          .then((snapshot) {
        snapshot.docs.forEach((result) {
          DateTime strDate = DateTime.parse(result.data()['date']);
          DateTime newDate = new DateTime(strDate.day, strDate.month,
              strDate.year); // set the document date

          if (todaysdate.isAtSameMomentAs(newDate)) {
            todaytotal += int.parse(result.data()[
                'total']); // compares the document date and todays date, and if true, count it as todays spending
          } else {}
        });
      });
    } catch (e) {
      print(e);
    }
    return todaytotal;
  }

  void setBudget(String budget) async {
    try {
      await firestore.collection('users').doc(uid).set({
        'budget': budget,
      });
    } catch (e) {
      print(e);
    }
  }

  void setDefaultBudget() async {
    try {
      await firestore.collection('users').doc(uid).set({
        'budget': "0",
      });
      print("Default Budget set to 0");
    } catch (e) {
      print("Default Budget error");
    }
  }

  Future<String> getBudget() async {
    String budget = '';
    try {
      await firestore.collection('users').doc(uid).get().then((doc) {
        if (doc.exists) {
          budget = doc.data()['budget'];
        } else {
          print('failure');
        }
      });
    } catch (e) {
      print(e);
    }
    return budget;
  }

  void minusBudget(String price) async {
    var temp;
    await getBudget().then((value) {
      temp = value;
    });

    int result = int.parse(temp) - int.parse(price);

    try {
      await firestore.collection('users').doc(uid).set({
        'budget': result.toString(),
      });
    } catch (e) {
      print(e);
    }
  }
}
