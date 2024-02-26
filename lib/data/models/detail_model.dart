

class DetailModel {
  bool? success;
  Data? data;
  String? message;

  DetailModel({this.success, this.data, this.message});

  DetailModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? companyName;
  bool? salaryHidden;
  String? salaryFrom;
  String? salaryTo;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  List<int>? categoryId;
  int? companyId;
  int? positionId;
  String? address;
  List<int>? employmentTypeId;
  Null? salaryComment;
  int? workExperienceId;
  int? educationLevelId;
  String? vacancyDetail;
  List<Languages>? languages;
  List<String>? driverRights;
  List<int>? regionId;
  int? districtId;
  bool? resumeRequired;
  int? workerCount;
  int? status;
  String? publishedAt;
  String? expiredAt;
  String? positionName;
  String? salaryCurrency;
  String? imagePath;
  List<PublishedPortals>? publishedPortals;
  CreatedBy? createdBy;
  bool? isVerified;
  List<String>? publishedPortalsKeys;
  int? type;
  String? source;
  bool? onlyWithLink;
  bool? isWishlisted;
  bool? isResponsed;
  Company? company;
  List<Regions>? regions;
  int? finishedWorkerCount;
  StatisticInfo? statisticInfo;
  Position? position;
  District? district;

  Data(
      {this.id,
        this.companyName,
        this.salaryHidden,
        this.salaryFrom,
        this.salaryTo,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.categoryId,
        this.companyId,
        this.positionId,
        this.address,
        this.employmentTypeId,
        this.salaryComment,
        this.workExperienceId,
        this.educationLevelId,
        this.vacancyDetail,
        this.languages,
        this.driverRights,
        this.regionId,
        this.districtId,
        this.resumeRequired,
        this.workerCount,
        this.status,
        this.publishedAt,
        this.expiredAt,
        this.positionName,
        this.salaryCurrency,
        this.imagePath,
        this.publishedPortals,
        this.createdBy,
        this.isVerified,
        this.publishedPortalsKeys,
        this.type,
        this.source,
        this.onlyWithLink,
        this.isWishlisted,
        this.isResponsed,
        this.company,
        this.regions,
        this.finishedWorkerCount,
        this.statisticInfo,
        this.position,
      this.district});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name'];
    salaryHidden = json['salary_hidden'];
    salaryFrom = json['salary_from'];
    salaryTo = json['salary_to'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    categoryId = json['category_id'].cast<int>();
    companyId = json['company_id'];
    positionId = json['position_id'];
    address = json['address'];
    employmentTypeId = json['employment_type_id'].cast<int>();
    salaryComment = json['salary_comment'];
    workExperienceId = json['work_experience_id'];
    educationLevelId = json['education_level_id'];
    vacancyDetail = json['vacancy_detail'];
    if (json['languages'] != null) {
      languages = <Languages>[];
      json['languages'].forEach((v) {
        languages!.add(new Languages.fromJson(v));
      });
    }
    driverRights = json['driver_rights'].cast<String>();
    regionId = json['region_id'].cast<int>();
    districtId = json['district_id'];
    resumeRequired = json['resume_required'];
    workerCount = json['worker_count'];
    status = json['status'];
    publishedAt = json['published_at'];
    expiredAt = json['expired_at'];
    positionName = json['position_name'];
    salaryCurrency = json['salary_currency'];
    imagePath = json['image_path'];
    if (json['published_portals'] != null) {
      publishedPortals = <PublishedPortals>[];
      json['published_portals'].forEach((v) {
        publishedPortals!.add(new PublishedPortals.fromJson(v));
      });
    }
    createdBy = json['created_by'] != null
        ? new CreatedBy.fromJson(json['created_by'])
        : null;
    isVerified = json['is_verified'];
    publishedPortalsKeys = json['published_portals_keys'].cast<String>();
    type = json['type'];
    source = json['source'];
    onlyWithLink = json['only_with_link'];
    isWishlisted = json['is_wishlisted'];
    isResponsed = json['is_responsed'];
    company =
    json['company'] != null ? new Company.fromJson(json['company']) : null;
    if (json['regions'] != null) {
      regions = <Regions>[];
      json['regions'].forEach((v) {
        regions!.add(new Regions.fromJson(v));
      });
    }
    finishedWorkerCount = json['finished_worker_count'];
    statisticInfo = json['statistic_info'] != null
        ? new StatisticInfo.fromJson(json['statistic_info']) : null;

    district = json['district'] != null
        ? new District.fromJson(json['district'])
        : null;


    position = json['position'] != null
        ? new Position.fromJson(json['position'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_name'] = this.companyName;
    data['salary_hidden'] = this.salaryHidden;
    data['salary_from'] = this.salaryFrom;
    data['salary_to'] = this.salaryTo;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['category_id'] = this.categoryId;
    data['company_id'] = this.companyId;
    data['position_id'] = this.positionId;
    data['address'] = this.address;
    data['employment_type_id'] = this.employmentTypeId;
    data['salary_comment'] = this.salaryComment;
    data['work_experience_id'] = this.workExperienceId;
    data['education_level_id'] = this.educationLevelId;
    data['vacancy_detail'] = this.vacancyDetail;
    if (this.languages != null) {
      data['languages'] = this.languages!.map((v) => v.toJson()).toList();
    }
    data['driver_rights'] = this.driverRights;
    data['region_id'] = this.regionId;
    data['district_id'] = this.districtId;
    data['resume_required'] = this.resumeRequired;
    data['worker_count'] = this.workerCount;
    data['status'] = this.status;
    data['published_at'] = this.publishedAt;
    data['expired_at'] = this.expiredAt;
    data['position_name'] = this.positionName;
    data['salary_currency'] = this.salaryCurrency;
    data['image_path'] = this.imagePath;
    if (this.publishedPortals != null) {
      data['published_portals'] =
          this.publishedPortals!.map((v) => v.toJson()).toList();
    }
    if (this.createdBy != null) {
      data['created_by'] = this.createdBy!.toJson();
    }
    data['is_verified'] = this.isVerified;
    data['published_portals_keys'] = this.publishedPortalsKeys;
    data['type'] = this.type;
    data['source'] = this.source;
    data['only_with_link'] = this.onlyWithLink;
    data['is_wishlisted'] = this.isWishlisted;
    data['is_responsed'] = this.isResponsed;
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    if (this.regions != null) {
      data['regions'] = this.regions!.map((v) => v.toJson()).toList();
    }
    data['finished_worker_count'] = this.finishedWorkerCount;
    if (this.statisticInfo != null) {
      data['statistic_info'] = this.statisticInfo!.toJson();
    }
    if (this.district != null) {
      data['district'] = this.district!.toJson();
    }
    if (this.position != null) {
      data['position'] = this.position!.toJson();
    }
    return data;
  }
}

class Languages {
  int? languageId;
  LanguageNames? languageNames;
  int? languageLevelId;
  LanguageNames? languageLevelNames;

  Languages(
      {this.languageId,
        this.languageNames,
        this.languageLevelId,
        this.languageLevelNames});

  Languages.fromJson(Map<String, dynamic> json) {
    languageId = json['language_id'];
    languageNames = json['language_names'] != null
        ? new LanguageNames.fromJson(json['language_names'])
        : null;
    languageLevelId = json['language_level_id'];
    languageLevelNames = json['language_level_names'] != null
        ? new LanguageNames.fromJson(json['language_level_names'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['language_id'] = this.languageId;
    if (this.languageNames != null) {
      data['language_names'] = this.languageNames!.toJson();
    }
    data['language_level_id'] = this.languageLevelId;
    if (this.languageLevelNames != null) {
      data['language_level_names'] = this.languageLevelNames!.toJson();
    }
    return data;
  }
}

class LanguageNames {
  String? nameOz;
  String? nameRu;
  String? nameUz;

  LanguageNames({this.nameOz, this.nameRu, this.nameUz});

  LanguageNames.fromJson(Map<String, dynamic> json) {
    nameOz = json['name_oz'];
    nameRu = json['name_ru'];
    nameUz = json['name_uz'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_oz'] = this.nameOz;
    data['name_ru'] = this.nameRu;
    data['name_uz'] = this.nameUz;
    return data;
  }
}

class PublishedPortals {
  String? key;
  String? url;
  String? name;

  PublishedPortals({this.key, this.url, this.name});

  PublishedPortals.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    url = json['url'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['url'] = this.url;
    data['name'] = this.name;
    return data;
  }
}

class CreatedBy {
  int? id;
  String? username;
  bool? isActive;
  String? role;
  String? contactNumber;
  bool? smsNotificationActive;
  bool? emailNotificationActive;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;
  String? lastOnlineAt;
  Null? deletedAt;
  int? appType;
  String? fullName;
  int? companyId;
  String? lang;
  Null? telegramUserId;
  String? loginSource;
  Null? hhUserId;

  CreatedBy(
      {this.id,
        this.username,
        this.isActive,
        this.role,
        this.contactNumber,
        this.smsNotificationActive,
        this.emailNotificationActive,
        this.rememberToken,
        this.createdAt,
        this.updatedAt,
        this.lastOnlineAt,
        this.deletedAt,
        this.appType,
        this.fullName,
        this.companyId,
        this.lang,
        this.telegramUserId,
        this.loginSource,
        this.hhUserId});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    isActive = json['is_active'];
    role = json['role'];
    contactNumber = json['contact_number'];
    smsNotificationActive = json['sms_notification_active'];
    emailNotificationActive = json['email_notification_active'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lastOnlineAt = json['last_online_at'];
    deletedAt = json['deleted_at'];
    appType = json['app_type'];
    fullName = json['full_name'];
    companyId = json['company_id'];
    lang = json['lang'];
    telegramUserId = json['telegram_user_id'];
    loginSource = json['login_source'];
    hhUserId = json['hh_user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['is_active'] = this.isActive;
    data['role'] = this.role;
    data['contact_number'] = this.contactNumber;
    data['sms_notification_active'] = this.smsNotificationActive;
    data['email_notification_active'] = this.emailNotificationActive;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['last_online_at'] = this.lastOnlineAt;
    data['deleted_at'] = this.deletedAt;
    data['app_type'] = this.appType;
    data['full_name'] = this.fullName;
    data['company_id'] = this.companyId;
    data['lang'] = this.lang;
    data['telegram_user_id'] = this.telegramUserId;
    data['login_source'] = this.loginSource;
    data['hh_user_id'] = this.hhUserId;
    return data;
  }
}

class Company {
  int? id;
  String? name;
  Null? address;
  String? logoImage;
  int? userId;
  bool? isVerified;
  Null? vacancyKnowSources;
  int? vacancyCount;

  Company(
      {this.id,
        this.name,
        this.address,
        this.logoImage,

        this.userId,
        this.isVerified,
        this.vacancyKnowSources,
        this.vacancyCount});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    logoImage = json['logo_image'];
    userId = json['user_id'];
    isVerified = json['is_verified'];
    vacancyKnowSources = json['vacancy_know_sources'];
    vacancyCount = json['vacancy_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['logo_image'] = this.logoImage;
    data['user_id'] = this.userId;
    data['is_verified'] = this.isVerified;
    data['vacancy_know_sources'] = this.vacancyKnowSources;
    data['vacancy_count'] = this.vacancyCount;
    return data;
  }
}

class Regions {
  int? id;
  String? nameUz;
  String? nameRu;
  String? nameOz;
  String? slug;
  int? countryId;

  Regions(
      {this.id,
        this.nameUz,
        this.nameRu,
        this.nameOz,
        this.slug,
        this.countryId});

  Regions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameUz = json['name_uz'];
    nameRu = json['name_ru'];
    nameOz = json['name_oz'];
    slug = json['slug'];
    countryId = json['country_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_uz'] = this.nameUz;
    data['name_ru'] = this.nameRu;
    data['name_oz'] = this.nameOz;
    data['slug'] = this.slug;
    data['country_id'] = this.countryId;
    return data;
  }
}

class StatisticInfo {
  int? vacancyId;
  int? showesCount;
  int? responsesCount;
  int? responsesNewCount;

  StatisticInfo(
      {this.vacancyId,
        this.showesCount,
        this.responsesCount,
        this.responsesNewCount});

  StatisticInfo.fromJson(Map<String, dynamic> json) {
    vacancyId = json['vacancy_id'];
    showesCount = json['showes_count'];
    responsesCount = json['responses_count'];
    responsesNewCount = json['responses_new_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vacancy_id'] = this.vacancyId;
    data['showes_count'] = this.showesCount;
    data['responses_count'] = this.responsesCount;
    data['responses_new_count'] = this.responsesNewCount;
    return data;
  }
}

class District {
  String? nameUz;
  String? nameRu;
  String? nameOz;
  int? id;

  District({this.nameUz, this.nameRu, this.nameOz, this.id});

  District.fromJson(Map<String, dynamic> json) {
    nameUz = json['name_uz'];
    nameRu = json['name_ru'];
    nameOz = json['name_oz'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_uz'] = this.nameUz;
    data['name_ru'] = this.nameRu;
    data['name_oz'] = this.nameOz;
    data['id'] = this.id;
    return data;
  }
}

class Position {
  String? nameUz;
  String? nameOz;
  String? nameRu;
  int? id;

  Position({this.nameUz, this.nameOz, this.nameRu, this.id});

  Position.fromJson(Map<String, dynamic> json) {
    nameUz = json['name_uz'];
    nameOz = json['name_oz'];
    nameRu = json['name_ru'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_uz'] = this.nameUz;
    data['name_oz'] = this.nameOz;
    data['name_ru'] = this.nameRu;
    data['id'] = this.id;
    return data;
  }
}