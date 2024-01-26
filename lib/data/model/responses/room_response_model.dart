import 'dart:convert';

class RoomResponseModel {
  final String? message;
  final List<Room>? data;

  RoomResponseModel({
    this.message,
    this.data,
  });

  factory RoomResponseModel.fromJson(String str) =>
      RoomResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RoomResponseModel.fromMap(Map<String, dynamic> json) =>
      RoomResponseModel(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Room>.from(json["data"]!.map((x) => Room.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Room {
  final int? id;
  final String? name;
  final String? description;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Room({
    this.id,
    this.name,
    this.description,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory Room.fromJson(String str) => Room.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Room.fromMap(Map<String, dynamic> json) => Room(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
