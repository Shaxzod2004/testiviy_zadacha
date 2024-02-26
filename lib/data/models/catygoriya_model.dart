

class CatygoriyaModel {
  bool? success;
  List<Data>? data;
  String? message;

  CatygoriyaModel({this.success, this.data, this.message});

  CatygoriyaModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? slug;
  String? nameUz;
  String? nameOz;
  String? nameRu;
  String? groupId;
  int? count;
  List<Childs>? childs;

  Data(
      {this.id,
        this.slug,
        this.nameUz,
        this.nameOz,
        this.nameRu,
        this.groupId,
        this.count,
        this.childs});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    nameUz = json['name_uz'];
    nameOz = json['name_oz'];
    nameRu = json['name_ru'];
    groupId = json['group_id'];
    count = json['count'];
    if (json['childs'] != null) {
      childs = <Childs>[];
      json['childs'].forEach((v) {
        childs!.add(new Childs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['name_uz'] = this.nameUz;
    data['name_oz'] = this.nameOz;
    data['name_ru'] = this.nameRu;
    data['group_id'] = this.groupId;
    data['count'] = this.count;
    if (this.childs != null) {
      data['childs'] = this.childs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Childs {
  int? id;
  String? nameOz;
  String? nameRu;
  String? nameUz;
  Null? createdAt;
  Null? updatedAt;
  int? parentId;
  String? slug;
  Null? groupId;
  Null? hhId;
  Null? nameEn;
  Null? nameKr;

  Childs(
      {this.id,
        this.nameOz,
        this.nameRu,
        this.nameUz,
        this.createdAt,
        this.updatedAt,
        this.parentId,
        this.slug,
        this.groupId,
        this.hhId,
        this.nameEn,
        this.nameKr});

  Childs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameOz = json['name_oz'];
    nameRu = json['name_ru'];
    nameUz = json['name_uz'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    parentId = json['parent_id'];
    slug = json['slug'];
    groupId = json['group_id'];
    hhId = json['hh_id'];
    nameEn = json['name_en'];
    nameKr = json['name_kr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_oz'] = this.nameOz;
    data['name_ru'] = this.nameRu;
    data['name_uz'] = this.nameUz;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['parent_id'] = this.parentId;
    data['slug'] = this.slug;
    data['group_id'] = this.groupId;
    data['hh_id'] = this.hhId;
    data['name_en'] = this.nameEn;
    data['name_kr'] = this.nameKr;
    return data;
  }
}