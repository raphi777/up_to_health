import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:up_to_health/data/notification.dart';
import 'package:up_to_health/services/notification_schedule.dart';

final notifications = [
  Notification(
      id: 0,
      title: 'Impfung',
      body:
          '''Sind deine Impfungen auf dem neuesten Stand? Falls du dir unsicher bist, vereinbare einen Termin bei deinem Hausarzt und lass dich beraten.''',
      schedule: nextInstanceOfYear(),
      matchDateTimeComponents: DateTimeComponents.time),
  Notification(
      id: 1,
      title: 'Hoden abtasten',
      body:
          '''Hast du diese Woche schon einmal deine Hoden abgetastet? Nein? Dann nimm dir kurz Zeit oder wirf einen kurzen Blick darauf, das nächste Mal wenn du Duschen gehst. Wie du weißt ist dies wirklich wichtig, um mögliche Tumore frühzeitig zu erkennen!''',
      schedule: nextInstanceOfSunday20(),
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime),
  Notification(
      id: 2,
      title: 'Brüste abtasten',
      body:
          '''Hast du diese Woche schon einmal deine Brüsten nach möglichen Knoten abgetastet? Nein? Dann nimm dir kurz Zeit oder wirf einen kurzen Blick darauf, bevor du das nächste Mal Duschen gehst. Wie du weißt ist dies wirklich wichtig, um mögliche Tumore frühzeitig zu erkennen!''',
      schedule: nextInstanceOfSunday20(),
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime),
  Notification(
      id: 3,
      title: 'STD Check: Test auf Geschlechtskrankheiten',
      body:
          '''Toll, dass du im Bett so aktiv bist ;-) Falls du nach wie vor noch häufig deinen Geschlechtspartner wechselst, solltest du auf Nummer Sicher gehen und hin und wieder einen Test auf Geschlechtskrankheiten machen lassen.''',
      schedule: nextInstanceOfYear(),
      matchDateTimeComponents: DateTimeComponents.time),
  Notification(
      id: 4,
      title: 'Blutuntersuchung',
      body:
          '''Anscheinend liegt deine letzte Blutabnahme und -untersuchung schon eine Weile zurück. Hier daher ein kleiner Reminder, dir von deinem Hausarzt einen Termin für einen solchen Check-up geben zu lassen.''',
      schedule: nextInstanceOfYear(),
      matchDateTimeComponents: DateTimeComponents.time),
  Notification(
      id: 5,
      title: 'Zahnarzt (Routine-Check)',
      body:
          '''Anscheinend liegt dein letzter Zahnarztbesuch schon eine Weile zurück. Hier daher ein kleiner Reminder, dir von deinem Zahnarzt einen Termin für Routinekontrolle inkl. Reinigung geben zu lassen.''',
      schedule: nextInstanceOfYear(),
      matchDateTimeComponents: DateTimeComponents.time),
  Notification(
      id: 6,
      title: 'Gynäkologe (Routine-Check)',
      body:
          '''Wenn Geschlecht weiblich und Alter über 20 Jahren, dann Vorschlag; 1x pro Jahr''',
      schedule: nextInstanceOfYear(),
      matchDateTimeComponents: DateTimeComponents.time),
  Notification(
      id: 7,
      title:
          'Altersbedingter routinemäßiger Gesundheits-Check-up beim Hausarzt',
      body:
          '''Wie du weißt solltest du einmal alle 3 Jahre zum generellen Gesundheits-Check-up zu deinem Hausarzt. Hier daher ein kleiner Reminder, dir hierfür einen Termin auszumachen.''',
      schedule: nextInstanceOf3Year(),
      matchDateTimeComponents: DateTimeComponents.time),
  Notification(
      id: 8,
      title: 'Augenarzt (Routine-Check)',
      body:
          '''Wie du weißt solltest du alle 5 Jahre zu einer Früherkennungsuntersuchung zum Augenarzt. Hier daher ein kleiner Reminder, dir hierfür einen Termin auszumachen.''',
      schedule: nextInstanceOf5Year(),
      matchDateTimeComponents: DateTimeComponents.time),
  Notification(
      id: 9,
      title: 'Augenarzt (Routine-Check)',
      body:
          '''Wie du weißt solltest du alle 2 Jahre zu einer Früherkennungsuntersuchung zum Augenarzt. Hier daher ein kleiner Reminder, dir hierfür einen Termin auszumachen.''',
      schedule: nextInstanceOf2Year(),
      matchDateTimeComponents: DateTimeComponents.time),
  Notification(
      id: 10,
      title: 'Augenarzt (Routine-Check)',
      body:
          '''You know the drill: Als Brillenträger solltest du einmal alle zwei Jahre zur Routineuntersuchung zum Augenarzt oder Optiker. Hier daher ein kleiner Reminder, dir hierfür einen Termin auszumachen.''',
      schedule: nextInstanceOf2Year(),
      matchDateTimeComponents: DateTimeComponents.time),
  Notification(
      id: 11,
      title: 'Augenarzt (Routine-Check)',
      body:
          '''You know the drill: Als Kontaktlinsenträger solltest du einmal jährlich zur Routineuntersuchung zum Augenarzt oder Optiker. Hier daher ein kleiner Reminder, dir hierfür einen Termin auszumachen.''',
      schedule: nextInstanceOfYear(),
      matchDateTimeComponents: DateTimeComponents.time),
  Notification(
      id: 12,
      title: 'Darmkrebsvorsorge beim Gastroenterologen',
      body:
          '''Wie du weißt solltest du einmal im Jahr zu einer Früherkennungsuntersuchung von Darmkrebs zum Gastroenterologen. Hier daher ein kleiner Reminder, dir hierfür einen Termin auszumachen.''',
      schedule: nextInstanceOfYear(),
      matchDateTimeComponents: DateTimeComponents.time),
  Notification(
      id: 13,
      title: 'Darmkrebsvorsorge beim Gastroenterologen',
      body:
          '''Wie du weißt solltest du einmal alle zwei Jahre zu einer Früherkennungsuntersuchung von Darmkrebs zum Gastroenterologen (oder alle 10 Jahre zu einer großen Darmspiegelung). Hier daher ein kleiner Reminder, dir hierfür einen Termin auszumachen.''',
      schedule: nextInstanceOf2Year(),
      matchDateTimeComponents: DateTimeComponents.time),
  Notification(
      id: 14,
      title: 'Darmkrebsvorsorge beim Gastroenterologen',
      body:
          '''Wie du weißt solltest du einmal im Jahr zu einer Früherkennungsuntersuchung von Darmkrebs zum Gastroenterologen (oder alle 10 Jahre zu einer großen Darmspiegelung). Hier daher ein kleiner Reminder, dir hierfür einen Termin auszumachen.''',
      schedule: nextInstanceOfYear(),
      matchDateTimeComponents: DateTimeComponents.time),
  Notification(
      id: 15,
      title: 'Darmkrebsvorsorge beim Gastroenterologen',
      body:
          '''Wie du weißt solltest du einmal alle zwei Jahre zu einer Früherkennungsuntersuchung von Darmkrebs zum Gastroenterologen (oder alle 10 Jahre zu einer großen Darmspiegelung). Hier daher ein kleiner Reminder, dir hierfür einen Termin auszumachen.''',
      schedule: nextInstanceOf2Year(),
      matchDateTimeComponents: DateTimeComponents.time),
  Notification(
      id: 16,
      title:
          'Krebsfrüherkennungsuntersuchung der Genitalien und Prostata beim Urologen',
      body:
          '''Wie du weißt solltest du einmal im Jahr zu einer Krebsfrüherkennungsuntersuchung zum Urologen. Hier daher ein kleiner Reminder, dir hierfür einen Termin auszumachen.''',
      schedule: nextInstanceOfYear(),
      matchDateTimeComponents: DateTimeComponents.time),
  Notification(
      id: 17,
      title: 'Hautkrebs-Screening beim Dermatologen',
      body:
          '''Wie du weißt solltest du alle zwei Jahre beim Dermatologen ein Hautkrebs-Screening durchführen lassen. Hier daher ein kleiner Reminder, dir hierfür einen Termin auszumachen.''',
      schedule: nextInstanceOf2Year(),
      matchDateTimeComponents: DateTimeComponents.time),
  Notification(
      id: 18,
      title: 'Wasser Trinken',
      body:
          '''Vergiss nicht genügend Wasser zu dir zu nehmen. Trinke am besten jetzt direkt ein Glas.''',
      schedule: nextInstanceOf2Hours(),
      matchDateTimeComponents: DateTimeComponents.time),
  Notification(
      id: 19,
      title: 'Einnahme deiner Nahrungsergänzungsmittel',
      body:
          '''Vergiss nicht deine Nahrungsergänzungsmittel (falls von deinem Arzt verordnet) jetzt gleich einzunehmen!''',
      schedule: nextInstanceOf8(),
      matchDateTimeComponents: DateTimeComponents.time),
  Notification(
      id: 20,
      title: 'Einnahme deiner Medikamente',
      body:
          '''Vergiss nicht deine Medikamente (falls von deinem Arzt verordnet) jetzt gleich einzunehmen!''',
      schedule: nextInstanceOf8(),
      matchDateTimeComponents: DateTimeComponents.time),
  Notification(
      id: 21,
      title: 'Test Notification',
      body:
      '''This is a test notification that appears every 10 minutes''',
      schedule: nextInstanceOf10Minutes(),
      matchDateTimeComponents: DateTimeComponents.time)
];
