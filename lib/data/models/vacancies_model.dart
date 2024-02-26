

class VacanciesModel {
  bool? success;
  Data? data;
  String? message;

  VacanciesModel({this.success, this.data, this.message});

  VacanciesModel.fromJson(Map<String, dynamic> json) {
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
  int? currentPage;
  List<DataVacancies>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  Null? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  Data(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <DataVacancies>[];
      json['data'].forEach((v) {
        data!.add(new DataVacancies.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class DataVacancies {
  int? id;
  List<int>? categoryId;
  int? companyId;
  String? companyName;
  bool? salaryHidden;
  String? salaryFrom;
  String? salaryTo;
  int? positionId;
  String? positionName;
  List<int>? regionId;
  List<int>? employmentTypeId;
  Null? salaryComment;
  int? workExperienceId;
  int? educationLevelId;
  bool? resumeRequired;
  int? workerCount;
  bool? isActive;
  String? salaryCurrency;
  String? imagePath;
  String? publishedAt;
  String? expiredAt;
  bool? isWishlisted;
  List<Regions>? regions;
  int? finishedWorkerCount;
  StatisticInfo? statisticInfo;
  Company? company;
  Position? position;

  DataVacancies(
      {this.id,
        this.categoryId,
        this.companyId,
        this.companyName,
        this.salaryHidden,
        this.salaryFrom,
        this.salaryTo,
        this.positionId,
        this.positionName,
        this.regionId,
        this.employmentTypeId,
        this.salaryComment,
        this.workExperienceId,
        this.educationLevelId,
        this.resumeRequired,
        this.workerCount,
        this.isActive,
        this.salaryCurrency,
        this.imagePath,
        this.publishedAt,
        this.expiredAt,
        this.isWishlisted,
        this.regions,
        this.finishedWorkerCount,
        this.statisticInfo,
        this.company,
        this.position});

  DataVacancies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'].cast<int>();
    companyId = json['company_id'];
    companyName = json['company_name'];
    salaryHidden = json['salary_hidden'];
    salaryFrom = json['salary_from'];
    salaryTo = json['salary_to'];
    positionId = json['position_id'];
    positionName = json['position_name'];
    regionId = json['region_id'].cast<int>();
    employmentTypeId = json['employment_type_id'].cast<int>();
    salaryComment = json['salary_comment'];
    workExperienceId = json['work_experience_id'];
    educationLevelId = json['education_level_id'];
    resumeRequired = json['resume_required'];
    workerCount = json['worker_count'];
    isActive = json['is_active'];
    salaryCurrency = json['salary_currency'];
    imagePath = json['image_path'];
    publishedAt = json['published_at'];
    expiredAt = json['expired_at'];
    isWishlisted = json['is_wishlisted'];
    if (json['regions'] != null) {
      regions = <Regions>[];
      json['regions'].forEach((v) {
        regions!.add(new Regions.fromJson(v));
      });
    }
    finishedWorkerCount = json['finished_worker_count'];
    statisticInfo = json['statistic_info'] != null
        ? new StatisticInfo.fromJson(json['statistic_info'])
        : null;
    company =
    json['company'] != null ? new Company.fromJson(json['company']) : null;
    position = json['position'] != null
        ? new Position.fromJson(json['position'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['company_id'] = this.companyId;
    data['company_name'] = this.companyName;
    data['salary_hidden'] = this.salaryHidden;
    data['salary_from'] = this.salaryFrom;
    data['salary_to'] = this.salaryTo;
    data['position_id'] = this.positionId;
    data['position_name'] = this.positionName;
    data['region_id'] = this.regionId;
    data['employment_type_id'] = this.employmentTypeId;
    data['salary_comment'] = this.salaryComment;
    data['work_experience_id'] = this.workExperienceId;
    data['education_level_id'] = this.educationLevelId;
    data['resume_required'] = this.resumeRequired;
    data['worker_count'] = this.workerCount;
    data['is_active'] = this.isActive;
    data['salary_currency'] = this.salaryCurrency;
    data['image_path'] = this.imagePath;
    data['published_at'] = this.publishedAt;
    data['expired_at'] = this.expiredAt;
    data['is_wishlisted'] = this.isWishlisted;
    if (this.regions != null) {
      data['regions'] = this.regions!.map((v) => v.toJson()).toList();
    }
    data['finished_worker_count'] = this.finishedWorkerCount;
    if (this.statisticInfo != null) {
      data['statistic_info'] = this.statisticInfo!.toJson();
    }
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    if (this.position != null) {
      data['position'] = this.position!.toJson();
    }
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

class Company {
  int? id;
  String? logoImage;
  bool? isVerified;
  int? vacancyCount;
  Null? statistics;
  Null? user;

  Company(
      {this.id,
        this.logoImage,
        this.isVerified,
        this.vacancyCount,
        this.statistics,
        this.user});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoImage = json['logo_image'];
    isVerified = json['is_verified'];
    vacancyCount = json['vacancy_count'];
    statistics = json['statistics'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['logo_image'] = this.logoImage;
    data['is_verified'] = this.isVerified;
    data['vacancy_count'] = this.vacancyCount;
    data['statistics'] = this.statistics;
    data['user'] = this.user;
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

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}