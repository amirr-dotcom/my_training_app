class Training {
  String? url;
  String? title;
  String? address;
  String? date;
  double? price;
  double? discountPrice;
  String? timeRange;
  String? traineeName;
  String? traineeTitle;
  String? summary;

  Training(
      {this.url,
        this.title,
        this.address,
        this.date,
        this.price,
        this.discountPrice,
        this.timeRange,
        this.traineeName,
        this.summary,
        this.traineeTitle});

  Training.fromJson(Map<dynamic, dynamic> json) {
    url = json['url'];
    title = json['title'];
    address = json['address'];
    date = json['date'];
    price = json['price'];
    discountPrice = json['discount_price'];
    timeRange = json['time_range'];
    traineeName = json['trainee_name'];
    traineeTitle = json['trainee_title'];
    summary = json['summary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['title'] = title;
    data['address'] = address;
    data['date'] = date;
    data['price'] = price;
    data['discount_price'] = discountPrice;
    data['time_range'] = timeRange;
    data['trainee_name'] = traineeName;
    data['trainee_title'] = traineeTitle;
    data['summary'] = summary;
    return data;
  }
}
