import 'dart:convert';

class Kuliner {
  final String resto;
  final String alamat;
  Kuliner({required this.resto, required this.alamat});

  Kuliner copyWith({
    String? resto,
    String? alamat,
  }) {
    return Kuliner(resto: resto ?? this.resto, alamat: alamat ?? this.alamat);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'resto': resto,
      'alamat': alamat,
    };
  }

  factory Kuliner.fromMap(Map<String, dynamic> map) {
    return Kuliner(
      resto: map['resto'] as String,
      alamat: map['alamat'] as String,
    );
  }
  String toJson() => json.encode(toMap());

  factory Kuliner.fromJson(String source) =>
      Kuliner.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Kuliner(resto: $resto, alamat: $alamat)';
  }

  @override
  bool operator ==(covariant Kuliner other) {
    if (identical(this, other)) return true;

    return other.resto == resto && other.alamat == alamat;
  }

  @override
  int get hashCode {
    return resto.hashCode ^ alamat.hashCode;
  }
}
