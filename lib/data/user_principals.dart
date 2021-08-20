import 'package:up_to_health/data/antiaging.dart';
import 'package:up_to_health/data/labortests.dart';
import 'package:up_to_health/data/principals.dart';
import 'package:up_to_health/data/todos.dart';
import 'package:up_to_health/data/untersuchungen.dart';
import 'package:up_to_health/data/uth_user.dart';
import 'package:up_to_health/data/wellbeing.dart';

class UserPrincipals {

  List<Principal> getUntersuchungen(UthUser user) {
    List<Principal> allPrincipals = untersuchungen.toList();
    List<Principal> userPrincipals = [];

    // Zahnarzt
    userPrincipals.add(allPrincipals[0]);
    // Gyn 1
    if (user.ass02Gender == 'FEMALE' && user.getAge() >= 20 &&
        user.getAge() < 30) {
      userPrincipals.add(allPrincipals[1]);
    }
    // Gyn 2
    if (user.ass02Gender == 'FEMALE' &&
        ((user.getAge() >= 30 && user.getAge() < 50) || user.getAge() > 70)) {
      userPrincipals.add(allPrincipals[2]);
    }
    // Gyn 3
    if (user.ass02Gender == 'FEMALE' && user.getAge() >= 50 &&
        user.getAge() < 70) {
      userPrincipals.add(allPrincipals[3]);
    }
    // Routine Check-up
    if (user.getAge() >= 35) {
      userPrincipals.add(allPrincipals[4]);
    }
    // Augenarzt 1
    if (user.getAge() >= 40 && user.getAge() < 60) {
      userPrincipals.add(allPrincipals[5]);
    }
    // Augenarzt 2
    if (user.getAge() >= 60) {
      userPrincipals.add(allPrincipals[6]);
    }
    // Augenarzt 3
    if (user.ass07Visionaid == "Nein aber ich sehe etwas schlechter") {
      userPrincipals.add(allPrincipals[7]);
    }
    // Augenarzt 4
    if (user.ass07Visionaid == "Ja ich bin eine Brillenschlange") {
      userPrincipals.add(allPrincipals[8]);
    }
    // Augenarzt 5
    if (user.ass07Visionaid == "Ja ich trage Kontaktlinsen") {
      userPrincipals.add(allPrincipals[9]);
    }
    // Schlafapnoe
    if (user.ass19Snoring == "Ja mit Atemaussetzern") {
      userPrincipals.add(allPrincipals[10]);
    }
    // Darmkrebs 1
    if (user.ass02Gender == "FEMALE" && user.getAge() >= 50 &&
        user.getAge() < 55) {
      userPrincipals.add(allPrincipals[11]);
    }
    // Darmkrebs 2
    if (user.ass02Gender == "FEMALE" && user.getAge() >= 55) {
      userPrincipals.add(allPrincipals[12]);
    }
    // Darmkrebs 3
    if (user.ass02Gender == "MALE" && user.getAge() > 50 &&
        user.getAge() < 55) {
      userPrincipals.add(allPrincipals[13]);
    }
    // Darmkrebs 4
    if (user.ass02Gender == "MALE" && user.getAge() >= 55) {
      userPrincipals.add(allPrincipals[14]);
    }
    // Krebsfrüherkennung
    if (user.ass02Gender == "MALE" && user.getAge() >= 45) {
      userPrincipals.add(allPrincipals[15]);
    }
    // Hautkrebs-Screening
    if (user.getAge() >= 35) {
      userPrincipals.add(allPrincipals[16]);
    }
    // Aneurysmen-Screening
    if (user.ass02Gender == "MALE" && user.getAge() >= 65 &&
        user.ass29Aneurysmen) {
      userPrincipals.add(allPrincipals[17]);
    }
    // Herzvorsorge
    if (user.ass28Heart) {
      userPrincipals.add(allPrincipals[18]);
    }
    // Leberuntersuchung
    if (user.ass10Alcohol == "Jeden Tag") {
      userPrincipals.add(allPrincipals[19]);
    }
    return userPrincipals;
  }

  List<Principal> getLabortests(UthUser user) {
    List<Principal> allPrincipals = labortests.toList();
    List<Principal> userPrincipals = [];

    // STD
    if (user.ass20Sex != "Inaktiv") {
      userPrincipals.add(allPrincipals[0]);
    }
    // Blutuntersuchung
    userPrincipals.add(allPrincipals[1]);

    return userPrincipals;
  }

  List<Principal> getTodos(UthUser user) {
    List<Principal> allPrincipals = todos.toList();
    List<Principal> userPrincipals = [];

    // Impfschutz
    userPrincipals.add(allPrincipals[0]);
    // Hoden
    if (user.ass02Gender == 'MALE' && user.getAge() >= 16) {
      userPrincipals.add(allPrincipals[1]);
    }
    // Brüste
    if (user.ass02Gender == 'FEMALE' && user.getAge() >= 20) {
      userPrincipals.add(allPrincipals[2]);
    }
    // Lebe gesünder
    if ((user.getBMI() > 27 && user.ass11Sport == "Couch Potatoe") ||
        user.ass08Nutrition == "Ungesund") {
      userPrincipals.add(allPrincipals[3]);
    }
    // Aufmerksamkeit
    if (user.getBMI() < 18) {
      userPrincipals.add(allPrincipals[4]);
    }
    // Schwangerschaft
    if (user.ass02Gender == 'FEMALE' && user.ass30Pregnant) {
      userPrincipals.add(allPrincipals[5]);
    }
    return userPrincipals;
  }

  List<Principal> getAntiaging(UthUser user) {
    List<Principal> allPrincipals = antiaging.toList();
    List<Principal> userPrincipals = [];

    // UV
    userPrincipals.add(allPrincipals[0]);
    // Intervalltraining
    if (user.ass22Preexistingdiseases != "Herzerkrankung") {
      userPrincipals.add(allPrincipals[1]);
    }
    // Intervallfasten
    if (user.getBMI() > 18 && !user.ass30Pregnant) {
      userPrincipals.add(allPrincipals[2]);
    }
    // Gesunde Ernährung
    userPrincipals.add(allPrincipals[3]);
    // Verzicht
    userPrincipals.add(allPrincipals[4]);

    return userPrincipals;
  }

  List<Principal> getWellbeing(UthUser user) {
    List<Principal> allPrincipals = wellbeing.toList();
    List<Principal> userPrincipals = [];

    // Entspannung
    if (user.ass15Stress == "Schon sehr stressig aber es macht mir Spaß" ||
        user.ass15Stress == "Dem Burnout nahe") {
      userPrincipals.add(allPrincipals[0]);
    }
    // Schlafhygiene
    if (user.ass18Sleep == "Weniger als 6 Stunden" ||
        user.ass18Sleep == "Schlafstörungen") {
      userPrincipals.add(allPrincipals[1]);
    }
    // High-Performer
    if (user.ass12Industry == "Investment Banking" ||
        user.ass12Industry == "Recht" ||
        user.ass12Industry == "Unternehmensberatung") {
      userPrincipals.add(allPrincipals[2]);
    }
    // Pollenallergie
    if (user.ass23Allergies == "Pollenallergie (Heuschnupfen)") {
      userPrincipals.add(allPrincipals[3]);
    }
    // Psychotherapeut
    if (user.ass15Stress == "Dem Burnout nahe" ||
        user.ass16Physicalcondition == "Unzufrieden") {
      userPrincipals.add(allPrincipals[4]);
    }
    // Diabetes-Check
    if (user.ass09Water == "Mehr als 4 Liter" &&
        (user.ass11Sport == "Wenig" || user.ass11Sport == "Couch Potatoe")) {
      userPrincipals.add(allPrincipals[5]);
    }
    // Flüssigkeitszufuhr
    if (user.ass09Water == "Weniger als 1 Liter" ||
        user.ass09Water == "Nicht sicher vermute zu wenig") {
      userPrincipals.add(allPrincipals[6]);
    }
    // Vitamin D
    if (user.ass17Outdoors == "Weniger als eine Stunde" || user.ass17Outdoors == "So gut wie gar nicht") {
      userPrincipals.add(allPrincipals[7]);
    }
    // Rückenschmerzen
    if (user.ass14Backpain) {
      userPrincipals.add(allPrincipals[8]);
    }

    return userPrincipals;
  }
}