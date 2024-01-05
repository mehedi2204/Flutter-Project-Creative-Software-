class meetingList {
  List<Meeting>? meeting;

  meetingList({this.meeting});

  meetingList.fromJson(Map<String, dynamic> json) {
    if (json['meeting'] != null) {
      meeting = <Meeting>[];
      json['meeting'].forEach((v) {
        meeting!.add(new Meeting.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meeting != null) {
      data['meeting'] = this.meeting!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meeting {
  int? id;
  String? meetingNo;
  String? businessName;
  String? mobileNo;
  String? subject;
  String? description;
  String? startDate;
  String? startTime;
  String? endDate;
  String? endTime;
  String? duration;
  String? private;
  String? addParticipants;
  String? meetingLocation;
  String? displayReminder;
  String? emailReminder;
  String? sendInvitations;
  String? status;
  String? assignedTo;
  String? createdAt;
  String? updatedAt;
  Business? business;

  Meeting(
      {this.id,
        this.meetingNo,
        this.businessName,
        this.mobileNo,
        this.subject,
        this.description,
        this.startDate,
        this.startTime,
        this.endDate,
        this.endTime,
        this.duration,
        this.private,
        this.addParticipants,
        this.meetingLocation,
        this.displayReminder,
        this.emailReminder,
        this.sendInvitations,
        this.status,
        this.assignedTo,
        this.createdAt,
        this.updatedAt,
        this.business});

  Meeting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    meetingNo = json['meeting_no'];
    businessName = json['business_name'];
    mobileNo = json['mobile_no'];
    subject = json['subject'];
    description = json['description'];
    startDate = json['start_date'];
    startTime = json['start_time'];
    endDate = json['end_date'];
    endTime = json['end_time'];
    duration = json['duration'];
    private = json['private'];
    addParticipants = json['add_participants'];
    meetingLocation = json['meeting_location'];
    displayReminder = json['display_reminder'];
    emailReminder = json['email_reminder'];
    sendInvitations = json['send_invitations'];
    status = json['status'];
    assignedTo = json['assigned_to'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    business = json['business'] != null
        ? new Business.fromJson(json['business'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['meeting_no'] = this.meetingNo;
    data['business_name'] = this.businessName;
    data['mobile_no'] = this.mobileNo;
    data['subject'] = this.subject;
    data['description'] = this.description;
    data['start_date'] = this.startDate;
    data['start_time'] = this.startTime;
    data['end_date'] = this.endDate;
    data['end_time'] = this.endTime;
    data['duration'] = this.duration;
    data['private'] = this.private;
    data['add_participants'] = this.addParticipants;
    data['meeting_location'] = this.meetingLocation;
    data['display_reminder'] = this.displayReminder;
    data['email_reminder'] = this.emailReminder;
    data['send_invitations'] = this.sendInvitations;
    data['status'] = this.status;
    data['assigned_to'] = this.assignedTo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.business != null) {
      data['business'] = this.business!.toJson();
    }
    return data;
  }
}

class Business {
  int? id;
  String? customerNo;
  String? companyId;
  String? customerGroupId;
  String? productId;
  String? businessName;
  String? customerName;
  String? businessRole;
  String? typeOfBusiness;
  String? tradeLicenseNo;
  String? businessIndustries;
  String? numberOfEmployees;
  String? businessAge;
  String? totalInvestment;
  String? mobileNo;
  String? secondaryMobileNo;
  String? email;
  String? website;
  String? gender;
  String? dateOfBirth;
  String? nidOrPassport;
  String? profession;
  String? religion;
  String? country;
  String? city;
  String? address;
  String? currency;
  String? language;
  String? leadStatus;
  String? status;
  String? assignedBy;
  String? createdAt;
  String? updatedAt;

  Business(
      {this.id,
        this.customerNo,
        this.companyId,
        this.customerGroupId,
        this.productId,
        this.businessName,
        this.customerName,
        this.businessRole,
        this.typeOfBusiness,
        this.tradeLicenseNo,
        this.businessIndustries,
        this.numberOfEmployees,
        this.businessAge,
        this.totalInvestment,
        this.mobileNo,
        this.secondaryMobileNo,
        this.email,
        this.website,
        this.gender,
        this.dateOfBirth,
        this.nidOrPassport,
        this.profession,
        this.religion,
        this.country,
        this.city,
        this.address,
        this.currency,
        this.language,
        this.leadStatus,
        this.status,
        this.assignedBy,
        this.createdAt,
        this.updatedAt});

  Business.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerNo = json['customer_no'];
    companyId = json['company_id'];
    customerGroupId = json['customer_group_id'];
    productId = json['product_id'];
    businessName = json['business_name'];
    customerName = json['customer_name'];
    businessRole = json['business_role'];
    typeOfBusiness = json['type_of_business'];
    tradeLicenseNo = json['trade_license_no'];
    businessIndustries = json['business_industries'];
    numberOfEmployees = json['number_of_employees'];
    businessAge = json['business_age'];
    totalInvestment = json['total_investment'];
    mobileNo = json['mobile_no'];
    secondaryMobileNo = json['secondary_mobile_no'];
    email = json['email'];
    website = json['website'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    nidOrPassport = json['nid_or_passport'];
    profession = json['profession'];
    religion = json['religion'];
    country = json['country'];
    city = json['city'];
    address = json['address'];
    currency = json['currency'];
    language = json['language'];
    leadStatus = json['lead_status'];
    status = json['status'];
    assignedBy = json['assigned_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_no'] = this.customerNo;
    data['company_id'] = this.companyId;
    data['customer_group_id'] = this.customerGroupId;
    data['product_id'] = this.productId;
    data['business_name'] = this.businessName;
    data['customer_name'] = this.customerName;
    data['business_role'] = this.businessRole;
    data['type_of_business'] = this.typeOfBusiness;
    data['trade_license_no'] = this.tradeLicenseNo;
    data['business_industries'] = this.businessIndustries;
    data['number_of_employees'] = this.numberOfEmployees;
    data['business_age'] = this.businessAge;
    data['total_investment'] = this.totalInvestment;
    data['mobile_no'] = this.mobileNo;
    data['secondary_mobile_no'] = this.secondaryMobileNo;
    data['email'] = this.email;
    data['website'] = this.website;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['nid_or_passport'] = this.nidOrPassport;
    data['profession'] = this.profession;
    data['religion'] = this.religion;
    data['country'] = this.country;
    data['city'] = this.city;
    data['address'] = this.address;
    data['currency'] = this.currency;
    data['language'] = this.language;
    data['lead_status'] = this.leadStatus;
    data['status'] = this.status;
    data['assigned_by'] = this.assignedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
