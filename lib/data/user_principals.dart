import 'package:up_to_health/data/principals.dart';
import 'package:up_to_health/data/untersuchungen.dart';
import 'package:up_to_health/data/uth_user.dart';

class UserPrincipals {

  List<Principal> getUntersuchungen(UthUser user) {
    List<Principal> allPrincipals = untersuchungen.toList();
    List<Principal> userPrincipals;

    // Zahnarzt
    userPrincipals.add(allPrincipals[0]);
    // Gyn 1
    if (user.ass02Gender == 'FEMALE' && user.getAge() >= 20 && user.getAge() < 30) {
      userPrincipals.add(allPrincipals[1]);
    }
    // Gyn 2
    if (user.ass02Gender == 'FEMALE' && ((user.getAge() >= 30 && user.getAge() < 50) || user.getAge() > 70)) {
      userPrincipals.add(allPrincipals[2]);
    }
    // Gyn 3
    if (user.ass02Gender == 'FEMALE' && user.getAge() >= 50 && user.getAge() < 70) {
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
    if () {
      userPrincipals.add(allPrincipals[11]);
    }
    // Darmkrebs 2
    if () {
      userPrincipals.add(allPrincipals[12]);
    }
    // Darmkrebs 3
    if () {
      userPrincipals.add(allPrincipals[13]);
    }
    // Darmkrebs 4
    if () {
      userPrincipals.add(allPrincipals[14]);
    }
    // Krebsfrüherkennung
    if () {
      userPrincipals.add(allPrincipals[15]);
    }
    // Hautkrebs-Screening
    if () {
      userPrincipals.add(allPrincipals[16]);
    }
    // Aneurysmen-Screening
    if () {
      userPrincipals.add(allPrincipals[17]);
    }
    // Herzvorsorge
    if () {
      userPrincipals.add(allPrincipals[18]);
    }
    // Leberuntersuchung
    if () {
      userPrincipals.add(allPrincipals[19]);
    }
  }

}