// To parse this JSON data, do
//
//     final project = projectFromJson(jsonString);

import 'dart:convert';

Project projectFromJson(String str) => Project.fromJson(json.decode(str));

String projectToJson(Project data) => json.encode(data.toJson());

class Project {
  final String name;
  final String description;
  final String codeUrl;
  final String appUrl;
  final List<String> images;
  final List<String> usedSkills;

  Project({
    required this.name,
    required this.description,
    required this.codeUrl,
    required this.appUrl,
    required this.images,
    required this.usedSkills,
  });

  Project copyWith({
    String? name,
    String? description,
    String? codeUrl,
    String? appUrl,
    List<String>? images,
    List<String>? usedSkills,
  }) =>
      Project(
        name: name ?? this.name,
        description: description ?? this.description,
        codeUrl: codeUrl ?? this.codeUrl,
        appUrl: appUrl ?? this.appUrl,
        images: images ?? this.images,
        usedSkills: usedSkills ?? this.usedSkills,
      );

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        name: json["name"],
        description: json["description"],
        codeUrl: json["code_url"],
        appUrl: json["app_url"],
        images: List<String>.from(json["images"].map((x) => x)),
        usedSkills: List<String>.from(json["used_skills"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "code_url": codeUrl,
        "app_url": appUrl,
        "images": List<dynamic>.from(images.map((x) => x)),
        "used_skills": List<dynamic>.from(usedSkills.map((x) => x)),
      };
}
