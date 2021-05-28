import 'package:cloud_firestore/cloud_firestore.dart';

class UthUser {
  String email;
  String ass01Name;
  String ass02Gender;
  DateTime ass03Birthday;
  int ass04Height;
  int ass05Weight;
  String ass06Smoker;
  String ass07Visionaid;
  String ass08Nutrition;
  String ass09Water;
  String ass10Alcohol;
  String ass11Sport;
  String ass12Industry;
  String ass13Bodyposture;
  bool ass14Backpain;
  String ass15Stress;
  String ass16Physicalcondition;
  String ass17Outdoors;
  String ass18Sleep;
  String ass19Snoring;
  String ass20Sex;
  String ass21Supplements;
  String ass22Preexistingdiseases;
  String ass23Allergies;
  bool ass24Medication;
  DateTime ass25Bloodsample;
  DateTime ass26Dentist;
  DateTime ass27Generalpractitioner;
  bool ass28Heart;
  bool ass29Aneurysmen;
  bool ass30Pregnant;
  String ass31Insurance;

  UthUser({
    this.email,
    this.ass01Name,
    this.ass02Gender,
    this.ass03Birthday,
    this.ass04Height,
    this.ass05Weight,
    this.ass06Smoker,
    this.ass07Visionaid,
    this.ass08Nutrition,
    this.ass09Water,
    this.ass10Alcohol,
    this.ass11Sport,
    this.ass12Industry,
    this.ass13Bodyposture,
    this.ass14Backpain,
    this.ass15Stress,
    this.ass16Physicalcondition,
    this.ass17Outdoors,
    this.ass18Sleep,
    this.ass19Snoring,
    this.ass20Sex,
    this.ass21Supplements,
    this.ass22Preexistingdiseases,
    this.ass23Allergies,
    this.ass24Medication,
    this.ass25Bloodsample,
    this.ass26Dentist,
    this.ass27Generalpractitioner,
    this.ass28Heart,
    this.ass29Aneurysmen = false,
    this.ass30Pregnant = false,
    this.ass31Insurance
  });

  Map<String, dynamic> toJson() =>
      {
        'email' : email,
        'ass01Name' : ass01Name,
        'ass02Gender' : ass02Gender,
        'ass03Birthday' : ass03Birthday,
        'ass04Height' : ass04Height,
        'ass05Weight' : ass05Weight,
        'ass06Smoker' : ass06Smoker,
        'ass07Visionaid' : ass07Visionaid,
        'ass08Nutrition' : ass08Nutrition,
        'ass09Water' : ass09Water,
        'ass10Alcohol' : ass10Alcohol,
        'ass11Sport' : ass11Sport,
        'ass12Industry' : ass12Industry,
        'ass13Bodyposture' : ass13Bodyposture,
        'ass14Backpain' : ass14Backpain,
        'ass15Stress' : ass15Stress,
        'ass16Physicalcondition' : ass16Physicalcondition,
        'ass17Outdoors' : ass17Outdoors,
        'ass18Sleep' : ass18Sleep,
        'ass19Snoring' : ass19Snoring,
        'ass20Sex' : ass20Sex,
        'ass21Supplements' : ass21Supplements,
        'ass22Preexistingdiseases' : ass22Preexistingdiseases,
        'ass23Allergies' : ass23Allergies,
        'ass24Medication' : ass24Medication,
        'ass25Bloodsample' : ass25Bloodsample,
        'ass26Dentist' : ass26Dentist,
        'ass27Generalpractitioner' : ass27Generalpractitioner,
        'ass28Heart' : ass28Heart,
        'ass29Aneurysmen' : ass29Aneurysmen,
        'ass30Pregnant' : ass30Pregnant,
        'ass31Insurance' : ass31Insurance
      };

  void fromMap(Map map) {
    Timestamp timeBirthday = map['ass03Birthday'];
    var ass03Birthday = DateTime.fromMicrosecondsSinceEpoch(timeBirthday.millisecondsSinceEpoch);
    Timestamp timeBloodsample = map['ass25Bloodsample'];
    var ass25Bloodsample = DateTime.fromMicrosecondsSinceEpoch(timeBloodsample.millisecondsSinceEpoch);
    Timestamp timeDentist = map['ass26Dentist'];
    var ass26Dentist = DateTime.fromMicrosecondsSinceEpoch(timeDentist.millisecondsSinceEpoch);
    Timestamp timeGeneralpractitioner = map['ass27Generalpractitioner'];
    var ass27Generalpractitioner = DateTime.fromMicrosecondsSinceEpoch(timeGeneralpractitioner.millisecondsSinceEpoch);

    this.email = map['email'];
    this.ass01Name = map['ass01Name'];
    this.ass02Gender = map['ass02Gender'];
    this.ass03Birthday = ass03Birthday;
    this.ass04Height = map['ass04Height'];
    this.ass05Weight = map['ass05Weight'];
    this.ass06Smoker = map['ass06Smoker'];
    this.ass07Visionaid = map['ass07Visionaid'];
    this.ass08Nutrition = map['ass08Nutrition'];
    this.ass09Water = map['ass09Water'];
    this.ass10Alcohol = map['ass10Alcohol'];
    this.ass11Sport = map['ass11Sport'];
    this.ass12Industry = map['ass12Industry'];
    this.ass13Bodyposture = map['ass13Bodyposture'];
    this.ass14Backpain = map['ass14Backpain'];
    this.ass15Stress = map['ass15Stress'];
    this.ass16Physicalcondition = map['ass16Physicalcondition'];
    this.ass17Outdoors = map['ass17Outdoors'];
    this.ass18Sleep = map['ass18Sleep'];
    this.ass19Snoring = map['ass19Snoring'];
    this.ass20Sex = map['ass20Sex'];
    this.ass21Supplements = map['ass21Supplements'];
    this.ass22Preexistingdiseases = map['ass22Preexistingdiseases'];
    this.ass23Allergies = map['ass23Allergies'];
    this.ass24Medication = map['ass24Medication'];
    this.ass25Bloodsample = ass25Bloodsample;
    this.ass26Dentist = ass26Dentist;
    this.ass27Generalpractitioner = ass27Generalpractitioner;
    this.ass28Heart = map['ass28Heart'];
    this.ass29Aneurysmen = map['ass29Aneurysmen'];
    this.ass30Pregnant = map['ass30Pregnant'];
    this.ass31Insurance = map['ass31Insurance'];
  }

  int getAge() {
    DateTime now = new DateTime.now();
    double age = now.difference(this.ass03Birthday).inDays / 365;
    return age.toInt();
  }
}