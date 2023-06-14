// To parse this JSON data, do
//
//     final project = projectFromJson(jsonString);

import 'dart:convert';

Project projectFromJson(String str) => Project.fromJson(json.decode(str));

String projectToJson(Project data) => json.encode(data.toJson());

class Project {
  final String id;
  final String name;
  final String description;
  final String codeUrl;
  final String appUrl;
  final int coverImage;
  final List<String> images;
  final List<String> usedSkills;

  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.codeUrl,
    required this.appUrl,
    required this.coverImage,
    required this.images,
    required this.usedSkills,
  });

  Project copyWith({
    String? id,
    String? name,
    String? description,
    String? codeUrl,
    String? appUrl,
    int? coverImage,
    List<String>? images,
    List<String>? usedSkills,
  }) =>
      Project(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        codeUrl: codeUrl ?? this.codeUrl,
        appUrl: appUrl ?? this.appUrl,
        coverImage: coverImage ?? this.coverImage,
        images: images ?? this.images,
        usedSkills: usedSkills ?? this.usedSkills,
      );

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        codeUrl: json["code_url"],
        appUrl: json["app_url"],
        coverImage: json["cover_image"] ?? 0,
        images: List<String>.from(json["images"].map((x) => x)),
        usedSkills: List<String>.from(json["used_skills"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "code_url": codeUrl,
        "app_url": appUrl,
        "cover_image": coverImage,
        "images": List<dynamic>.from(images.map((x) => x)),
        "used_skills": List<dynamic>.from(usedSkills.map((x) => x)),
      };
}
