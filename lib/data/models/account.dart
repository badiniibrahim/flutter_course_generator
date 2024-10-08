class Account {
  String? uid;
  int bank = 0;
  DateTime? nextFreeQuestion;
  bool? unlimited;
  String? imageUrl;
  String? displayName;
  String? email;
  String? appStatus;

  Account();

  bool get adFree {
    if (unlimited == true) {
      return true;
    } else {
      return false;
    }
  }

  Map<String, dynamic> toJson() => {
        'bank': bank,
        'nextFreeQuestion': nextFreeQuestion,
        'unlimited': unlimited,
        'imageUrl': imageUrl,
        'displayName': displayName,
        'email': email,
        "appStatus": appStatus
      };

  Account.fromSnapshot(snapshot, this.uid)
      : bank = snapshot.data()['bank'],
        imageUrl = snapshot.data()['userImage'],
        displayName = snapshot.data()['userName'],
        email = snapshot.data()['userEmail'],
        appStatus = snapshot.data()['appStatus'],
        nextFreeQuestion = snapshot.data()['nextFreeQuestion']?.toDate(),
        unlimited = snapshot.data()['unlimited'];
}
