import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final _firestore = FirebaseFirestore.instance;

class Grocery {
  final String name;
  final String description;
  final String region;
  final String mhd;

  Grocery({
    required this.name,
    required this.description,
    required this.mhd,
    required this.region,
  });
  factory Grocery.fromFirestore (
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Grocery(
      name: data?['name'],
      description: data?['description'],
      region: data?['region'],
      mhd: data?['mhd'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (region != null) "state": region,
      if (description != null) "country": description,
      if (mhd != null) "capital": mhd,
    };
  }
}

void getGrocery ()async {
  final ref = _firestore.collection("groceries")
      .doc("8VaIqWc4VhJMVJYKzau0")
      .withConverter(
    fromFirestore: Grocery.fromFirestore,
    toFirestore: (Grocery grocery, _) => grocery.toFirestore(),
  );
  final docSnap = await ref.get();
  final grocery = docSnap.data(); // Convert to City object
  if (grocery != null) {
    print(grocery);
  } else {
    print("No such document.");
  }
}

