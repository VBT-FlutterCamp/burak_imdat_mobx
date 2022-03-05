import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable()
class TaskModel {
  int? page;
  @JsonKey(name: 'per_page')
  int? perPage;
  int? total;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  List<Data>? data;
  Support? support;

  TaskModel({this.page, this.perPage, this.total, this.totalPages, this.data, this.support});

  factory TaskModel.fromJson(Map<String, dynamic> json) => _$TaskModelFromJson(json);
}

@JsonSerializable()
class Data {
  int? id;
  String? email;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  String? avatar;

  Data({this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class Support {
  String? url;
  String? text;

  Support({this.url, this.text});

  factory Support.fromJson(Map<String, dynamic> json) => _$SupportFromJson(json);
}
