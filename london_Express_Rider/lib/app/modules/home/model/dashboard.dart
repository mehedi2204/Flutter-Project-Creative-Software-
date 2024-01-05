class Dashboard {
  int? todayPickup;
  int? totalPickup;
  int? todayPickupAssign;
  int? totalPickupAssign;
  int? todayDelivery;
  int? totalDelivery;
  int? todayReturn;
  int? totalReturn;
  int? todayTransfer;
  int? totalTransfer;
  int? todayDelivered;
  int? monthlyDelivered;

  Dashboard(
      {this.todayPickup,
        this.totalPickup,
        this.todayPickupAssign,
        this.totalPickupAssign,
        this.todayDelivery,
        this.totalDelivery,
        this.todayReturn,
        this.totalReturn,
        this.todayTransfer,
        this.totalTransfer,
        this.todayDelivered,
        this.monthlyDelivered});

  Dashboard.fromJson(Map<String, dynamic> json) {
    todayPickup = json['today_pickup'];
    totalPickup = json['total_pickup'];
    todayPickupAssign = json['today_pickupassign'];
    totalPickupAssign = json['total_pickupassign'];
    todayDelivery = json['today_delivery'];
    totalDelivery = json['total_delivery'];
    todayReturn = json['today_return'];
    totalReturn = json['total_return'];
    todayTransfer = json['today_transfer'];
    totalTransfer = json['total_transfer'];
    todayDelivered = json['today_delivered'];
    monthlyDelivered = json['monthly_delivered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['today_pickup'] = this.todayPickup;
    data['total_pickup'] = this.totalPickup;
    data['today_pickupassign'] = this.todayPickupAssign;
    data['total_pickupassign'] = this.totalPickupAssign;
    data['today_delivery'] = this.todayDelivery;
    data['total_delivery'] = this.totalDelivery;
    data['today_return'] = this.todayReturn;
    data['total_return'] = this.totalReturn;
    data['today_transfer'] = this.todayTransfer;
    data['total_transfer'] = this.totalTransfer;
    data['today_delivered'] = this.todayDelivered;
    data['monthly_delivered'] = this.monthlyDelivered;
    return data;
  }
}
