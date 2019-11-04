import 'package:SmartMeat/screens/smartMeat/stick.dart';

class Smartmeat {
  bool on;
  Stick stick1;
  Stick stick2;
  Stick stick3;
  Stick stick4;
  int temperature;

  Smartmeat(
      {this.on,
      this.stick1,
      this.stick2,
      this.stick3,
      this.stick4,
      this.temperature});

  Smartmeat.fromJson(Map<String, dynamic> json) {
    on = json['on'];
    stick1 = json['stick1'] != null ? new Stick.fromJson(json['stick1']) : null;
    stick2 = json['stick2'] != null ? new Stick.fromJson(json['stick2']) : null;
    stick3 = json['stick3'] != null ? new Stick.fromJson(json['stick3']) : null;
    stick4 = json['stick4'] != null ? new Stick.fromJson(json['stick4']) : null;
    temperature = json['temperature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['on'] = this.on;
    if (this.stick1 != null) {
      data['stick1'] = this.stick1.toJson();
    }
    if (this.stick2 != null) {
      data['stick2'] = this.stick2.toJson();
    }
    if (this.stick3 != null) {
      data['stick3'] = this.stick3.toJson();
    }
    if (this.stick4 != null) {
      data['stick4'] = this.stick4.toJson();
    }
    data['temperature'] = this.temperature;
    return data;
  }
}
