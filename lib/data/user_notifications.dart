import 'package:up_to_health/data/notification.dart';
import 'package:up_to_health/data/uth_user.dart';
import 'package:up_to_health/data/notifications.dart';

class UserNotifications {

  List<Notification> getNotifications(UthUser user) {
    List<Notification> allNotifications = notifications.toList();
    List<Notification> userNotificaitons = [];
    print(allNotifications[0]);

    //Impfung
    userNotificaitons.add(allNotifications[0]);
    // Hoden
    if (user.ass02Gender == 'MALE' && user.getAge() >= 16) {
      userNotificaitons.add(allNotifications[1]);
    }
    // Brüste
    if (user.ass02Gender == 'FEMALE' && user.getAge() >= 20) {
      userNotificaitons.add(allNotifications[2]);
    }
    // STD
    if (user.ass20Sex != "Inaktiv") {
      userNotificaitons.add(allNotifications[3]);
    }
    // Blutuntersuchung
    userNotificaitons.add(allNotifications[4]);
    // Zahnarzt
    userNotificaitons.add(allNotifications[5]);
    // Gyn
    if (user.ass02Gender == 'FEMALE' && user.getAge() >= 20) {
      userNotificaitons.add(allNotifications[6]);
    }
    // Checkup Hausarzt
    if (user.getAge() >= 35) {
      userNotificaitons.add(allNotifications[7]);
    }
    // Augenarzt 1
    if (user.getAge() >= 40 && user.getAge() < 60) {
      userNotificaitons.add(allNotifications[8]);
    }
    // Augenarzt 2
    if (user.getAge() >= 60) {
      userNotificaitons.add(allNotifications[9]);
    }
    // Augenarzt 3
    if (user.ass07Visionaid == "Ja ich bin eine Brillenschlange") {
      userNotificaitons.add(allNotifications[10]);
    }
    // Augenarzt 4
    if (user.ass07Visionaid == "Ja ich trage Kontaktlinsen") {
      userNotificaitons.add(allNotifications[11]);
    }
    // Darm 1
    if (user.ass02Gender == 'FEMALE' && user.getAge() >= 50 && user.getAge() < 55) {
      userNotificaitons.add(allNotifications[12]);
    }
    // Darm 2
    if (user.ass02Gender == 'FEMALE' && user.getAge() >= 55) {
      userNotificaitons.add(allNotifications[13]);
    }
    // Darm 3
    if (user.ass02Gender == 'MALE' && user.getAge() >= 50 && user.getAge() < 55) {
      userNotificaitons.add(allNotifications[14]);
    }
    // Darm 4
    if (user.ass02Gender == 'MALE' && user.getAge() >= 55) {
      userNotificaitons.add(allNotifications[15]);
    }
    // Krebs Genitalien Prostata
    if (user.ass02Gender == 'MALE' && user.getAge() >= 45) {
      userNotificaitons.add(allNotifications[16]);
    }
    // Hautkrebs
    if (user.getAge() >= 35) {
      userNotificaitons.add(allNotifications[17]);
    }
    // Wasser
    if (user.ass09Water == "Weniger als 1 Liter" ||
        user.ass09Water == "Nicht sicher vermute zu wenig") {
      userNotificaitons.add(allNotifications[18]);
    }
    // Nahrungsergänzung
    if (user.ass21Supplements != 'Nein') {
      userNotificaitons.add(allNotifications[19]);
    }
    // Medikamente
    if (user.ass24Medication == true) {
      userNotificaitons.add(allNotifications[20]);
    }
    // Test
    userNotificaitons.add(allNotifications[21]);

    return userNotificaitons;
  }
}