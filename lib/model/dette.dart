// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

import 'package:ma_money/model/user.dart';

class Dette {
  int? id;
  User? preteur;
  User? empreteur;
  String? preteur_manuelle;
  String? empreteur_manuelle;
  double montant;
  String? lieux;
  String? description;
  DateTime? created_at;

  Dette({
    this.id,
    this.preteur,
    this.empreteur,
    this.preteur_manuelle,
    this.empreteur_manuelle,
    required this.montant,
    this.lieux,
    this.description,
    this.created_at,
  });

  Dette copyWith({
    int? id,
    User? preteur,
    User? empreteur,
    String? preteur_manuelle,
    String? empreteur_manuelle,
    double? montant,
    String? lieux,
    String? description,
    DateTime? created_at,
  }) {
    return Dette(
      id: id ?? this.id,
      preteur: preteur ?? this.preteur,
      empreteur: empreteur ?? this.empreteur,
      preteur_manuelle: preteur_manuelle ?? this.preteur_manuelle,
      empreteur_manuelle: empreteur_manuelle ?? this.empreteur_manuelle,
      montant: montant ?? this.montant,
      lieux: lieux ?? this.lieux,
      description: description ?? this.description,
      created_at: created_at ?? this.created_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'preteur': preteur?.toMap(),
      'empreteur': empreteur?.toMap(),
      'preteur_manuelle': preteur_manuelle,
      'empreteur_manuelle': empreteur_manuelle,
      'montant': montant,
      'lieux': lieux,
      'description': description,
      'created_at': created_at?.millisecondsSinceEpoch,
    };
  }

  factory Dette.fromMap(Map<String, dynamic> map) {
    return Dette(
      id: map['id'] != null ? map['id'] as int : null,
      preteur: map['preteur'] != null
          ? User.fromMap(map['preteur'] as Map<String, dynamic>)
          : null,
      empreteur: map['empreteur'] != null
          ? User.fromMap(map['empreteur'] as Map<String, dynamic>)
          : null,
      preteur_manuelle: map['preteur_manuelle'] != null
          ? map['preteur_manuelle'] as String
          : null,
      empreteur_manuelle: map['empreteur_manuelle'] != null
          ? map['empreteur_manuelle'] as String
          : null,
      montant: map['montant'] as double,
      lieux: map['lieux'] != null ? map['lieux'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      created_at: map['created_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['created_at'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Dette.fromJson(String source) =>
      Dette.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Dette(id: $id, preteur: $preteur, empreteur: $empreteur, preteur_manuelle: $preteur_manuelle, empreteur_manuelle: $empreteur_manuelle, montant: $montant, lieux: $lieux, description: $description, created_at: $created_at)';
  }

  @override
  bool operator ==(covariant Dette other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.preteur == preteur &&
        other.empreteur == empreteur &&
        other.preteur_manuelle == preteur_manuelle &&
        other.empreteur_manuelle == empreteur_manuelle &&
        other.montant == montant &&
        other.lieux == lieux &&
        other.description == description &&
        other.created_at == created_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        preteur.hashCode ^
        empreteur.hashCode ^
        preteur_manuelle.hashCode ^
        empreteur_manuelle.hashCode ^
        montant.hashCode ^
        lieux.hashCode ^
        description.hashCode ^
        created_at.hashCode;
  }
}
