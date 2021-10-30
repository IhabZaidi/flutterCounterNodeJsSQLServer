class DataG {
  late int countervalue;

  DataG({required this.countervalue});

  DataG.fromJson(Map<String, dynamic> json) {
    countervalue = json['countervalue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['countervalue'] = countervalue;
    return data;
  }
}