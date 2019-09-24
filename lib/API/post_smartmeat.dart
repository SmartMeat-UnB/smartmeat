// To parse this JSON data, do
//
//     final postSmartMeat = postSmartMeatFromJson(jsonString);

import 'dart:convert';

PostSmartMeat postSmartMeatFromJson(String str) => PostSmartMeat.fromJson(json.decode(str));

String postSmartMeatToJson(PostSmartMeat data) => json.encode(data.toJson());

class PostSmartMeat {
    bool on;
    Sticks sticks;
    int temperature;

    PostSmartMeat({
        this.on,
        this.sticks,
        this.temperature,
    });

    factory PostSmartMeat.fromJson(Map<String, dynamic> json) => PostSmartMeat(
        on: json["on"],
        sticks: Sticks.fromJson(json["sticks"]),
        temperature: json["temperature"],
    );

    Map<String, dynamic> toJson() => {
        "on": on,
        "sticks": sticks.toJson(),
        "temperature": temperature,
    };
}

class Sticks {
    Stick stick1;
    Stick stick2;
    Stick stick3;
    Stick stick4;

    Sticks({
        this.stick1,
        this.stick2,
        this.stick3,
        this.stick4,
    });

    factory Sticks.fromJson(Map<String, dynamic> json) => Sticks(
        stick1: Stick.fromJson(json["stick1"]),
        stick2: Stick.fromJson(json["stick2"]),
        stick3: Stick.fromJson(json["stick3"]),
        stick4: Stick.fromJson(json["stick4"]),
    );

    Map<String, dynamic> toJson() => {
        "stick1": stick1.toJson(),
        "stick2": stick2.toJson(),
        "stick3": stick3.toJson(),
        "stick4": stick4.toJson(),
    };
}

class Stick {
    bool active;
    String timeActive;

    Stick({
        this.active,
        this.timeActive,
    });

    factory Stick.fromJson(Map<String, dynamic> json) => Stick(
        active: json["active"],
        timeActive: json["time_active"],
    );

    Map<String, dynamic> toJson() => {
        "active": active,
        "time_active": timeActive,
    };
}
