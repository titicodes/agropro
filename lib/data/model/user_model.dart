class UserModel {
  String id;
  String name;
  String email;
  String role; // 'buyer' or 'seller'

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
  });

  // Factory method to create a user from Firestore data
  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      role: data['role'],
    );
  }

  // Convert to a map to store in Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
    };
  }
}
