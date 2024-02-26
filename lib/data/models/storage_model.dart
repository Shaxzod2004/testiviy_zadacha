

class StorageModel {
  int? id;
  String? positionName;
  String? salaryFrom;
  String? salaryTo;
  String? companyName;
  String? regions;

  StorageModel(
      {this.id,
        this.positionName,
        this.salaryFrom,
        this.salaryTo,
        this.companyName,
        this.regions});

  StorageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    positionName = json['positionName'];
    salaryFrom = json['salaryFrom'];
    salaryTo = json['salaryTo'];
    companyName = json['companyName'];
    regions = json['regions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['positionName'] = this.positionName;
    data['salaryFrom'] = this.salaryFrom;
    data['salaryTo'] = this.salaryTo;
    data['companyName'] = this.companyName;
    data['regions'] = this.regions;
    return data;
  }
}