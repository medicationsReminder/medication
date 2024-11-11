import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String userID;
  final String name;
  final String email;
  final List<String>? viewedMedications;  // IDs of medications the user has viewed

  UserModel({
    required this.userID,
    required this.name,
    required this.email,
    this.viewedMedications,
  });

  // Factory method to create a User instance from Firestore data
  factory UserModel.fromJson(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      userID: doc.id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      viewedMedications: List<String>.from(data['viewedMedications'] ?? []),
    );
  }

  // Convert a User instance to a map for Firestore
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'viewedMedications': viewedMedications,
    };
  }
}
