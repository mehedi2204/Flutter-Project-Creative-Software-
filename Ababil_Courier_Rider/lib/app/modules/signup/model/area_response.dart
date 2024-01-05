class AreaResponse {
  int? id;
  dynamic inside;
  String? district;
  String? area;
  dynamic postCode;
  dynamic hDelivery;
  dynamic oneRe;
  dynamic oneUr;
  dynamic plusRe;
  dynamic plusUr;
  dynamic cod;
  dynamic insurance;
  String? createdAt;
  String? updatedAt;

  AreaResponse(
      {this.id,
      this.inside,
      this.district,
      this.area,
      this.postCode,
      this.hDelivery,
      this.oneRe,
      this.oneUr,
      this.plusRe,
      this.plusUr,
      this.cod,
      this.insurance,
      this.createdAt,
      this.updatedAt});

  AreaResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    inside = int.parse(json['inside']);
    district = json['district'];
    area = json['area'];
    postCode = int.parse(json['post_code']);
    hDelivery = json['h_delivery'];
    oneRe = int.parse(json['oneRe']);
    oneUr = int.parse(json['oneUr']);
    plusRe = int.parse(json['plusRe']);
    plusUr = int.parse(json['plusUr']);
    cod = int.parse(json['cod']);
    insurance = int.parse(json['insurance']);
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['inside'] = inside;
    data['district'] = district;
    data['area'] = area;
    data['post_code'] = postCode;
    data['h_delivery'] = hDelivery;
    data['oneRe'] = oneRe;
    data['oneUr'] = oneUr;
    data['plusRe'] = plusRe;
    data['plusUr'] = plusUr;
    data['cod'] = cod;
    data['insurance'] = insurance;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
