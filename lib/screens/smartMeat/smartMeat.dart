class Autogenerated {
  Smartmeat smartmeat;

  Autogenerated({this.smartmeat});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    smartmeat = json['smartmeat'] != null
        ? new Smartmeat.fromJson(json['smartmeat'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.smartmeat != null) {
      data['smartmeat'] = this.smartmeat.toJson();
    }
    return data;
  }
}
