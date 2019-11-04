class Stick {
  bool active;
  String timeActive;

  Stick({this.active, this.timeActive});

  Stick.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    timeActive = json['time_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['time_active'] = this.timeActive;
    return data;
  }
}
