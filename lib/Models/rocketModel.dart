import 'dart:convert';

RocketModel rocketModelFromJson(String str) =>
    RocketModel.fromJson(json.decode(str));

String rocketModelToJson(RocketModel data) => json.encode(data.toJson());

class RocketModel {
  RocketModel({
    this.height,
    this.diameter,
    this.mass,
    this.firstStage,
    this.secondStage,
    this.engines,
    this.landingLegs,
    this.payloadWeights,
    this.flickrImages,
    this.name,
    this.type,
    this.active,
    this.stages,
    this.boosters,
    this.costPerLaunch,
    this.successRatePct,
    this.firstFlight,
    this.country,
    this.company,
    this.wikipedia,
    this.description,
    this.id,
  });

  Diameter height;
  Diameter diameter;
  Mass mass;
  FirstStage firstStage;
  SecondStage secondStage;
  Engines engines;
  LandingLegs landingLegs;
  List<PayloadWeight> payloadWeights;
  List<String> flickrImages;
  String name;
  String type;
  bool active;
  int stages;
  int boosters;
  int costPerLaunch;
  int successRatePct;
  DateTime firstFlight;
  String country;
  String company;
  String wikipedia;
  String description;
  String id;

  factory RocketModel.fromJson(Map<String, dynamic> json) => RocketModel(
        height:
            json["height"] == null ? null : Diameter.fromJson(json["height"]),
        diameter: json["diameter"] == null
            ? null
            : Diameter.fromJson(json["diameter"]),
        mass: json["mass"] == null ? null : Mass.fromJson(json["mass"]),
        firstStage: json["first_stage"] == null
            ? null
            : FirstStage.fromJson(json["first_stage"]),
        secondStage: json["second_stage"] == null
            ? null
            : SecondStage.fromJson(json["second_stage"]),
        engines:
            json["engines"] == null ? null : Engines.fromJson(json["engines"]),
        landingLegs: json["landing_legs"] == null
            ? null
            : LandingLegs.fromJson(json["landing_legs"]),
        payloadWeights: json["payload_weights"] == null
            ? null
            : List<PayloadWeight>.from(
                json["payload_weights"].map((x) => PayloadWeight.fromJson(x))),
        flickrImages: json["flickr_images"] == null
            ? null
            : List<String>.from(json["flickr_images"].map((x) => x)),
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : json["type"],
        active: json["active"] == null ? null : json["active"],
        stages: json["stages"] == null ? null : json["stages"],
        boosters: json["boosters"] == null ? null : json["boosters"],
        costPerLaunch:
            json["cost_per_launch"] == null ? null : json["cost_per_launch"],
        successRatePct:
            json["success_rate_pct"] == null ? null : json["success_rate_pct"],
        firstFlight: json["first_flight"] == null
            ? null
            : DateTime.parse(json["first_flight"]),
        country: json["country"] == null ? null : json["country"],
        company: json["company"] == null ? null : json["company"],
        wikipedia: json["wikipedia"] == null ? null : json["wikipedia"],
        description: json["description"] == null ? null : json["description"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "height": height == null ? null : height.toJson(),
        "diameter": diameter == null ? null : diameter.toJson(),
        "mass": mass == null ? null : mass.toJson(),
        "first_stage": firstStage == null ? null : firstStage.toJson(),
        "second_stage": secondStage == null ? null : secondStage.toJson(),
        "engines": engines == null ? null : engines.toJson(),
        "landing_legs": landingLegs == null ? null : landingLegs.toJson(),
        "payload_weights": payloadWeights == null
            ? null
            : List<dynamic>.from(payloadWeights.map((x) => x.toJson())),
        "flickr_images": flickrImages == null
            ? null
            : List<dynamic>.from(flickrImages.map((x) => x)),
        "name": name == null ? null : name,
        "type": type == null ? null : type,
        "active": active == null ? null : active,
        "stages": stages == null ? null : stages,
        "boosters": boosters == null ? null : boosters,
        "cost_per_launch": costPerLaunch == null ? null : costPerLaunch,
        "success_rate_pct": successRatePct == null ? null : successRatePct,
        "first_flight": firstFlight == null
            ? null
            : "${firstFlight.year.toString().padLeft(4, '0')}-${firstFlight.month.toString().padLeft(2, '0')}-${firstFlight.day.toString().padLeft(2, '0')}",
        "country": country == null ? null : country,
        "company": company == null ? null : company,
        "wikipedia": wikipedia == null ? null : wikipedia,
        "description": description == null ? null : description,
        "id": id == null ? null : id,
      };
}

class Diameter {
  Diameter({
    this.meters,
    this.feet,
  });

  double meters;
  double feet;

  factory Diameter.fromJson(Map<String, dynamic> json) => Diameter(
        meters: json["meters"] == null ? null : json["meters"].toDouble(),
        feet: json["feet"] == null ? null : json["feet"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "meters": meters == null ? null : meters,
        "feet": feet == null ? null : feet,
      };
}

class Engines {
  Engines({
    this.isp,
    this.thrustSeaLevel,
    this.thrustVacuum,
    this.number,
    this.type,
    this.version,
    this.layout,
    this.engineLossMax,
    this.propellant1,
    this.propellant2,
    this.thrustToWeight,
  });

  Isp isp;
  Thrust thrustSeaLevel;
  Thrust thrustVacuum;
  int number;
  String type;
  String version;
  String layout;
  int engineLossMax;
  String propellant1;
  String propellant2;
  double thrustToWeight;

  factory Engines.fromJson(Map<String, dynamic> json) => Engines(
        isp: json["isp"] == null ? null : Isp.fromJson(json["isp"]),
        thrustSeaLevel: json["thrust_sea_level"] == null
            ? null
            : Thrust.fromJson(json["thrust_sea_level"]),
        thrustVacuum: json["thrust_vacuum"] == null
            ? null
            : Thrust.fromJson(json["thrust_vacuum"]),
        number: json["number"] == null ? null : json["number"],
        type: json["type"] == null ? null : json["type"],
        version: json["version"] == null ? null : json["version"],
        layout: json["layout"] == null ? null : json["layout"],
        engineLossMax:
            json["engine_loss_max"] == null ? null : json["engine_loss_max"],
        propellant1: json["propellant_1"] == null ? null : json["propellant_1"],
        propellant2: json["propellant_2"] == null ? null : json["propellant_2"],
        thrustToWeight: json["thrust_to_weight"] == null
            ? null
            : json["thrust_to_weight"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "isp": isp == null ? null : isp.toJson(),
        "thrust_sea_level":
            thrustSeaLevel == null ? null : thrustSeaLevel.toJson(),
        "thrust_vacuum": thrustVacuum == null ? null : thrustVacuum.toJson(),
        "number": number == null ? null : number,
        "type": type == null ? null : type,
        "version": version == null ? null : version,
        "layout": layout == null ? null : layout,
        "engine_loss_max": engineLossMax == null ? null : engineLossMax,
        "propellant_1": propellant1 == null ? null : propellant1,
        "propellant_2": propellant2 == null ? null : propellant2,
        "thrust_to_weight": thrustToWeight == null ? null : thrustToWeight,
      };
}

class Isp {
  Isp({
    this.seaLevel,
    this.vacuum,
  });

  int seaLevel;
  int vacuum;

  factory Isp.fromJson(Map<String, dynamic> json) => Isp(
        seaLevel: json["sea_level"] == null ? null : json["sea_level"],
        vacuum: json["vacuum"] == null ? null : json["vacuum"],
      );

  Map<String, dynamic> toJson() => {
        "sea_level": seaLevel == null ? null : seaLevel,
        "vacuum": vacuum == null ? null : vacuum,
      };
}

class Thrust {
  Thrust({
    this.kN,
    this.lbf,
  });

  int kN;
  int lbf;

  factory Thrust.fromJson(Map<String, dynamic> json) => Thrust(
        kN: json["kN"] == null ? null : json["kN"],
        lbf: json["lbf"] == null ? null : json["lbf"],
      );

  Map<String, dynamic> toJson() => {
        "kN": kN == null ? null : kN,
        "lbf": lbf == null ? null : lbf,
      };
}

class FirstStage {
  FirstStage({
    this.thrustSeaLevel,
    this.thrustVacuum,
    this.reusable,
    this.engines,
    this.fuelAmountTons,
    this.burnTimeSec,
  });

  Thrust thrustSeaLevel;
  Thrust thrustVacuum;
  bool reusable;
  int engines;
  double fuelAmountTons;
  int burnTimeSec;

  factory FirstStage.fromJson(Map<String, dynamic> json) => FirstStage(
        thrustSeaLevel: json["thrust_sea_level"] == null
            ? null
            : Thrust.fromJson(json["thrust_sea_level"]),
        thrustVacuum: json["thrust_vacuum"] == null
            ? null
            : Thrust.fromJson(json["thrust_vacuum"]),
        reusable: json["reusable"] == null ? null : json["reusable"],
        engines: json["engines"] == null ? null : json["engines"],
        fuelAmountTons:
            json["fuel_amount_tons"] == null ? null : json["fuel_amount_tons"],
        burnTimeSec:
            json["burn_time_sec"] == null ? null : json["burn_time_sec"],
      );

  Map<String, dynamic> toJson() => {
        "thrust_sea_level":
            thrustSeaLevel == null ? null : thrustSeaLevel.toJson(),
        "thrust_vacuum": thrustVacuum == null ? null : thrustVacuum.toJson(),
        "reusable": reusable == null ? null : reusable,
        "engines": engines == null ? null : engines,
        "fuel_amount_tons": fuelAmountTons == null ? null : fuelAmountTons,
        "burn_time_sec": burnTimeSec == null ? null : burnTimeSec,
      };
}

class LandingLegs {
  LandingLegs({
    this.number,
    this.material,
  });

  int number;
  String material;

  factory LandingLegs.fromJson(Map<String, dynamic> json) => LandingLegs(
        number: json["number"] == null ? null : json["number"],
        material: json["material"] == null ? null : json["material"],
      );

  Map<String, dynamic> toJson() => {
        "number": number == null ? null : number,
        "material": material == null ? null : material,
      };
}

class Mass {
  Mass({
    this.kg,
    this.lb,
  });

  int kg;
  int lb;

  factory Mass.fromJson(Map<String, dynamic> json) => Mass(
        kg: json["kg"] == null ? null : json["kg"],
        lb: json["lb"] == null ? null : json["lb"],
      );

  Map<String, dynamic> toJson() => {
        "kg": kg == null ? null : kg,
        "lb": lb == null ? null : lb,
      };
}

class PayloadWeight {
  PayloadWeight({
    this.id,
    this.name,
    this.kg,
    this.lb,
  });

  String id;
  String name;
  int kg;
  int lb;

  factory PayloadWeight.fromJson(Map<String, dynamic> json) => PayloadWeight(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        kg: json["kg"] == null ? null : json["kg"],
        lb: json["lb"] == null ? null : json["lb"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "kg": kg == null ? null : kg,
        "lb": lb == null ? null : lb,
      };
}

class SecondStage {
  SecondStage({
    this.thrust,
    this.payloads,
    this.reusable,
    this.engines,
    this.fuelAmountTons,
    this.burnTimeSec,
  });

  Thrust thrust;
  Payloads payloads;
  bool reusable;
  int engines;
  double fuelAmountTons;
  int burnTimeSec;

  factory SecondStage.fromJson(Map<String, dynamic> json) => SecondStage(
        thrust: json["thrust"] == null ? null : Thrust.fromJson(json["thrust"]),
        payloads: json["payloads"] == null
            ? null
            : Payloads.fromJson(json["payloads"]),
        reusable: json["reusable"] == null ? null : json["reusable"],
        engines: json["engines"] == null ? null : json["engines"],
        fuelAmountTons:
            json["fuel_amount_tons"] == null ? null : json["fuel_amount_tons"],
        burnTimeSec:
            json["burn_time_sec"] == null ? null : json["burn_time_sec"],
      );

  Map<String, dynamic> toJson() => {
        "thrust": thrust == null ? null : thrust.toJson(),
        "payloads": payloads == null ? null : payloads.toJson(),
        "reusable": reusable == null ? null : reusable,
        "engines": engines == null ? null : engines,
        "fuel_amount_tons": fuelAmountTons == null ? null : fuelAmountTons,
        "burn_time_sec": burnTimeSec == null ? null : burnTimeSec,
      };
}

class Payloads {
  Payloads({
    this.compositeFairing,
    this.option1,
  });

  CompositeFairing compositeFairing;
  String option1;

  factory Payloads.fromJson(Map<String, dynamic> json) => Payloads(
        compositeFairing: json["composite_fairing"] == null
            ? null
            : CompositeFairing.fromJson(json["composite_fairing"]),
        option1: json["option_1"] == null ? null : json["option_1"],
      );

  Map<String, dynamic> toJson() => {
        "composite_fairing":
            compositeFairing == null ? null : compositeFairing.toJson(),
        "option_1": option1 == null ? null : option1,
      };
}

class CompositeFairing {
  CompositeFairing({
    this.height,
    this.diameter,
  });

  Diameter height;
  Diameter diameter;

  factory CompositeFairing.fromJson(Map<String, dynamic> json) =>
      CompositeFairing(
        height:
            json["height"] == null ? null : Diameter.fromJson(json["height"]),
        diameter: json["diameter"] == null
            ? null
            : Diameter.fromJson(json["diameter"]),
      );

  Map<String, dynamic> toJson() => {
        "height": height == null ? null : height.toJson(),
        "diameter": diameter == null ? null : diameter.toJson(),
      };
}
