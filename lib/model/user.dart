// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  int id;
  String? nom;
  String? prenom;
  String? username;
  String? email;
  String? tel;

  User({
    required this.id,
    this.nom,
    this.prenom,
    this.username,
    this.email,
    this.tel,
  });

  User copyWith({
    int? id,
    String? nom,
    String? prenom,
    String? username,
    String? email,
    String? tel,
  }) {
    return User(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
      username: username ?? this.username,
      email: email ?? this.email,
      tel: tel ?? this.tel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nom': nom,
      'prenom': prenom,
      'username': username,
      'email': email,
      'tel': tel,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      nom: map['nom'] != null ? map['nom'] as String : null,
      prenom: map['prenom'] != null ? map['prenom'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      tel: map['tel'] != null ? map['tel'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, nom: $nom, prenom: $prenom, username: $username, email: $email, tel: $tel)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nom == nom &&
        other.prenom == prenom &&
        other.username == username &&
        other.email == email &&
        other.tel == tel;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nom.hashCode ^
        prenom.hashCode ^
        username.hashCode ^
        email.hashCode ^
        tel.hashCode;
  }
}
