class ticketListModel {
  List<TicketList>? ticketList;

  ticketListModel({this.ticketList});

  ticketListModel.fromJson(Map<String, dynamic> json) {
    if (json['ticket_list'] != null) {
      ticketList = <TicketList>[];
      json['ticket_list'].forEach((v) {
        ticketList!.add(new TicketList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ticketList != null) {
      data['ticket_list'] = this.ticketList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TicketList {
  int? id;
  String? subject;
  String? department;
  String? service;
  String? priority;
  String? message;
  String? file;
  String? status;
  String? createdAt;
  String? updatedAt;

  TicketList(
      {this.id,
        this.subject,
        this.department,
        this.service,
        this.priority,
        this.message,
        this.file,
        this.status,
        this.createdAt,
        this.updatedAt});

  TicketList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subject = json['subject'];
    department = json['department'];
    service = json['service'];
    priority = json['priority'];
    message = json['message'];
    file = json['file'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subject'] = this.subject;
    data['department'] = this.department;
    data['service'] = this.service;
    data['priority'] = this.priority;
    data['message'] = this.message;
    data['file'] = this.file;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
