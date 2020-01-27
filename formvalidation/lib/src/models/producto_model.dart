import 'dart:convert';

class ProductoModel {
  String id;
  String titulo;
  double valor;
  bool disponible;
  String fotoUrl;

  ProductoModel({
    this.id,
    this.titulo = '',
    this.valor = 0.0,
    this.disponible = true,
    this.fotoUrl,
  });

  ProductoModel copyWith({
    String id,
    String titulo,
    double valor,
    bool disponible,
    String fotoUrl,
  }) =>
      ProductoModel(
        id: id ?? this.id,
        titulo: titulo ?? this.titulo,
        valor: valor ?? this.valor,
        disponible: disponible ?? this.disponible,
        fotoUrl: fotoUrl ?? this.fotoUrl,
      );

  factory ProductoModel.fromRawJson(String str) => ProductoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductoModel.fromJson(Map<String, dynamic> json) => ProductoModel(
        id: json["id"] == null ? null : json["id"],
        titulo: json["titulo"] == null ? null : json["titulo"],
        valor: json["valor"] == null ? null : json["valor"],
        disponible: json["disponible"] == null ? null : json["disponible"],
        fotoUrl: json["fotoUrl"] == null ? null : json["fotoUrl"],
      );

  Map<String, dynamic> toJson() => {
        // "id": id == null ? null : id,
        "titulo": titulo == null ? null : titulo,
        "valor": valor == null ? null : valor,
        "disponible": disponible == null ? null : disponible,
        "fotoUrl": fotoUrl == null ? null : fotoUrl,
      };
}
