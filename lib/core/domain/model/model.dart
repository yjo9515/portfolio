import 'package:json_annotation/json_annotation.dart';

import '../../core.dart';

part 'generated/model.g.dart';

@JsonSerializable()
class BaseModel {
  final int? statusCode;
  final String? message;

  const BaseModel({this.statusCode, this.message});

  factory BaseModel.fromJson(Map<String, dynamic> json) => _$BaseModelFromJson(json);
}

@JsonSerializable()
class Model<T> extends BaseModel {
  @JsonKey(toJson: _dataToJson, fromJson: _dataFromJson)
  final T? data;

  const Model({this.data, super.statusCode, super.message});

  static T? _dataFromJson<T>(dynamic data) {
    if (data == null) return null;
    return switch (T) {
      LoginInfo => LoginInfo.fromJson(data),
      Room => Room.fromJson(data),
      bool || int || String => data,
      _ => null,
    } as T;
  }

  static Map<String, dynamic>? _dataToJson<T>(T? data) {
    return switch (T) {
      LoginInfo => (data as LoginInfo).toJson(),
      Room => (data as Room).toJson(),
      bool || int || String => <String, dynamic>{'data': data},
      _ => null,
    };
  }

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson<T>(json);

  Map<String, dynamic> toJson() => _$ModelToJson(this);
}

@JsonSerializable()
class ListModel<T> extends BaseModel {
  final Items<T>? data;
  final PageInfo? pageInfo;

  const ListModel({this.data, this.pageInfo, super.statusCode, super.message});

  factory ListModel.fromJson(Map<String, dynamic> json) => _$ListModelFromJson<T>(json);
}

@JsonSerializable()
class Items<T> {
  @JsonKey(toJson: _listToJson, fromJson: _listFromJson)
  final List<T>? items;

  const Items({this.items});

  static T? _listFromJson<T>(List<dynamic> json) {
    if (json.isEmpty) return null;
    if (T == List<LoginInfo>) return json.map((e) => LoginInfo.fromJson(e)).toList() as T;
    if (T == List<Room>) return json.map((e) => Room.fromJson(e)).toList() as T;
    return [] as T;
  }

  static List<Map<String, dynamic>?>? _listToJson<T>(T? items) {
    return (items as List)
        .map((element) => switch (element.runtimeType) {
              LoginInfo => (element as LoginInfo).toJson(),
              Room => (element as Room).toJson(),
              _ => null,
            })
        .toList();
  }

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson<T>(json);
}
