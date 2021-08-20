import 'package:up_to_health/data/principals.dart';

final untersuchungen = [
  Principal(
      id: 'untersuchungen00',
      subCategory: 'Zahnarzt (Routine-Check)',
      algorithm: 'Für alle',
      description:
          '''Die Vorsorge beim Zahnarzt gehört zu den wichtigen Präventionsmaßnahmen. Bei den regelmäßigen Kontrolluntersuchungen kann der Zahnarzt viele Krankheiten der Zähne und des Mundraums schon im Frühstadium erkennen und eine rechtzeitige Behandlung beginnen.'''),
  Principal(
      id: 'untersuchungen01',
      subCategory: 'Gynäkologe (Routine-Check)',
      algorithm: 'Wenn Geschlecht weiblich und Alter zwischen 20 und 30 Jahren',
      description:
          '''Die gynäkologische Krebsfrüherkennung ist eine Vorsorgeuntersuchung, um verschiedene häufige Krebsarten frühzeitig erkennen und behandeln zu können. Es wird daher geraten, einmal pro Jahr eine Genitaluntersuchung zur Früherkennung von Krebserkrankungen bei Frauen durchzuführen.'''),
  Principal(
      id: 'untersuchungen02',
      subCategory: 'Gynäkologe (Routine-Check)',
      algorithm:
          'Wenn Geschlecht weiblich und Alter zwischen 30 und 50 Jahren oder über 70',
      description:
          '''Die gynäkologische Krebsfrüherkennung ist eine Vorsorgeuntersuchung, um verschiedene häufige Krebsarten frühzeitig erkennen und behandeln zu können. Es wird daher geraten, einmal pro Jahr eine Genitaluntersuchung zur Früherkennung von Krebserkrankungen bei Frauen durchzuführen. Für alle Frauen ab 30 Jahren beinhaltet die Krebsvorsorge auch eine Brustuntersuchung. Zusätzlich gibt der Arzt Tipps für eine Selbstuntersuchung.'''),
  Principal(
      id: 'untersuchungen03',
      subCategory: 'Gynäkologe (Routine-Check)',
      algorithm: 'Wenn Geschlecht weiblich und Alter zwischen 50 und 69 Jahren',
      description:
          '''Die gynäkologische Krebsfrüherkennung ist eine Vorsorgeuntersuchung, um verschiedene häufige Krebsarten frühzeitig erkennen und behandeln zu können. Es wird daher geraten, einmal pro Jahr eine Genitaluntersuchung zur Früherkennung von Krebserkrankungen bei Frauen durchzuführen. Für alle Frauen ab 30 Jahren beinhaltet die Krebsvorsorge auch eine Brustuntersuchung. Zusätzlich gibt der Arzt Tipps für eine Selbstuntersuchung. Zusätzlich dazu wirst du alle zwei Jahre zur Mammographie (radiologischen Brustkrebs-Früherkennung) eingeladen.'''),
  Principal(
      id: 'untersuchungen04',
      subCategory: 'Routinemäßiger Gesundheitscheck-up',
      algorithm: 'Wenn Alter ab 35 Jahren',
      description:
          '''Erhöhte Cholesterin- oder Blutdruckwerte gelten als Vorboten von Herz-Kreislauf-Erkrankungen. Früh erkannt, lässt sich durch Bewegung, gesunde Ernährung, Stressreduktion oder eine medikamentöse Behandlung einem lebensgefährlichen Schlaganfall oder Herzinfarkt entgegensteuern. Beim Gesundheits-Check-up ab 35 Jahren werden diese und andere Gesundheitswerte überprüft. Zudem wird man hier auf eventuell bestehende Autoimmunerkrankungen (Rheuma, Morbus Crohn) und Stoffwechselstörungen (Diabetes, Schilddrüsenprobleme) durchgecheckt.'''),
  Principal(
      id: 'untersuchungen05',
      subCategory: 'Augenarzt (Routine-Check)',
      algorithm: 'Wenn Alter 40 Jahre bis 59',
      description:
          '''Alle 5 Jahre solltest du dich zur Glaukom-Früherkennung von einem Augenarzt untersuchen lassen. Sollten Risikofaktoren, wie z.B. familiäre Vorgeschichte, vorliegen, solltest du mit dem Augenarzt besprechen, ob eine häufigere Untersuchung notwendig ist.'''),
  Principal(
      id: 'untersuchungen06',
      subCategory: 'Augenarzt (Routine-Check)',
      algorithm: 'Wenn Alter ab 60 Jahren',
      description:
          '''Die AMD (altersbedingte Maculadegeneration), zu deren Risikofaktoren auch Rauchen und Bluthochdruck gehören, ist eine der häufigsten Ursachen für einen schweren Sehverlust im Alter. Ab dem 60. Lebensjahr wird eine Früherkennungsuntersuchung beim Augenarzt im Rhythmus von zwei Jahren empfohlen. Netzhaut-Veränderungen können so sehr viel früher erkannt werden, was sich positiv auf die Erhaltung der Sehfähigkeit auswirkt. Zudem führt der Augenarzt eine Glaukom-Früherkennungsuntersuchung durch. Sollten Risikofaktoren, wie z.B. familiäre Vorgeschichte, vorliegen, solltest du mit dem Augenarzt besprechen, ob eine häufigere Untersuchung notwendig ist.'''),
  Principal(
      id: 'untersuchungen07',
      subCategory: 'Augenarzt (Routine-Check)',
      algorithm: 'Wenn Angabe, ich sehe schlecht',
      description:
          '''Du trägst keine Brille/Kontaktlinsen und kannst nicht mehr so gut sehen? Wir würden dir empfehlen einen Termin bei einem Augenarzt oder Optiker zu vereinbaren, um deine Sehkraft untersuchen zu lassen.'''),
  Principal(
      id: 'untersuchungen08',
      subCategory: 'Augenarzt (Routine-Check)',
      algorithm: 'Wenn Angabe, dass Brille getragen wird',
      description:
          '''Als Brillenträger solltest du circa alle zwei Jahre zur Routineüberprüfung deiner Sehkraft zum Augenarzt oder Optiker. Dabei wird untersucht, ob deine aktuelle Brille noch die richtige ist oder ob die Brillenstärke angepasst werden muss.'''),
  Principal(
      id: 'untersuchungen09',
      subCategory: 'Augenarzt (Routine-Check)',
      algorithm: 'Wenn Angabe, dass Kontaktlinsen getragen werden',
      description:
          '''Als Kontaktlinsenträger solltest du einmal jährlich zur Routineüberprüfung deiner Sehkraft zum Augenarzt oder Optiker. Dabei wird untersucht, ob deine aktuellen Kontaktlinsen noch die richtigen sind oder ob eine Kontaktlinsenanpassung notwendig ist.'''),
  Principal(
      id: 'untersuchungen10',
      subCategory: 'Schlafapnoe Check',
      algorithm: 'Wenn Angabe bei Schnarchen "Ja, mit Atemaussetzer"',
      description:
          '''Schnarchen stellt an sich keine Gefahr für die Gesundheit dar und muss deswegen in den meisten Fällen nicht behandelt werden. Unregelmäßiges, lautes Schnarchen jedoch ist nicht nur eine lästige Eigenschaft, sondern kann zudem auf ernst zu nehmende Atmungsstörungen hinweisen. Mit steigendem Alter nimmt die Wahrscheinlichkeit zu, eine Schlafapnoe (Atemstillstand im Schlaf) zu bekommen, wobei vor allem Männer betroffen sind. Falls du frühzeitig auf Nummer sicher gehen möchtest, besprich das Thema mit deinem Hausarzt oder suche einen HNO Arzt auf.'''),
  Principal(
      id: 'untersuchungen11',
      subCategory: 'Darmkrebsvorsorge',
      algorithm: 'Wenn Geschlecht weiblich und Alter zwischen 50 und 55 Jahren',
      description:
          '''Krankheiten wie Darmkrebs haben im Frühstadium gute Heilungschancen. So entsteht Darmkrebs in 90 Prozent aller Fälle aus harmlosen Polypen. Diese gutartigen Wucherungen der Darmschleimhaut können sich innerhalb von sechs bis zehn Jahren unbemerkt zu bösartigen Tumoren entwickeln. Durch das rechtzeitige Erkennen und Entfernen der Polypen könnten nach Angaben der Felix-Burda-Stiftung über 80 Prozent der Darmkrebserkrankungen verhindert werden. Zur Früherkennung von Darmkrebs solltest du daher einmal jährlich zum Gastroenterologen, der bei dir einen Test auf verborgenes Blut im Stuhl durchführt.'''),
  Principal(
      id: 'untersuchungen12',
      subCategory: 'Darmkrebsvorsorge',
      algorithm: 'Wenn Geschlecht weiblich und Alter ab 55 Jahren',
      description:
          '''Krankheiten wie Darmkrebs haben im Frühstadium gute Heilungschancen. So entsteht Darmkrebs in 90 Prozent aller Fälle aus harmlosen Polypen. Diese gutartigen Wucherungen der Darmschleimhaut können sich innerhalb von sechs bis zehn Jahren unbemerkt zu bösartigen Tumoren entwickeln. Durch das rechtzeitige Erkennen und Entfernen der Polypen könnten nach Angaben der Felix-Burda-Stiftung über 80 Prozent der Darmkrebserkrankungen verhindert werden. Zur Früherkennung von Darmkrebs solltest du daher alle zwei Jahre zum Gastroenterologen, der bei dir einen Test auf verborgenes Blut im Stuhl durchführt - alternativ kannst du auch alle 10 Jahre eine große Darmspiegelung an dir durchführen lassen.'''),
  Principal(
      id: 'untersuchungen13',
      subCategory: 'Darmkrebsvorsorge',
      algorithm: 'Wenn Geschlecht männlich und Alter zwischen 50 und 55 Jahren',
      description:
          '''Krankheiten wie Darmkrebs haben im Frühstadium gute Heilungschancen. So entsteht Darmkrebs in 90 Prozent aller Fälle aus harmlosen Polypen. Diese gutartigen Wucherungen der Darmschleimhaut können sich innerhalb von sechs bis zehn Jahren unbemerkt zu bösartigen Tumoren entwickeln. Durch das rechtzeitige Erkennen und Entfernen der Polypen könnten nach Angaben der Felix-Burda-Stiftung über 80 Prozent der Darmkrebserkrankungen verhindert werden. Zur Früherkennung von Darmkrebs solltest du daher einmal jährlich zum Gastroenterologen, der bei dir einen Test auf verborgenes Blut im Stuhl durchführt - alternativ kannst du auch alle 10 Jahre eine große Darmspiegelung an dir durchführen lassen.'''),
  Principal(
      id: 'untersuchungen14',
      subCategory: 'Darmkrebsvorsorge',
      algorithm: 'Wenn Geschlecht männlich und Alter ab 55 Jahren',
      description:
          '''Krankheiten wie Darmkrebs haben im Frühstadium gute Heilungschancen. So entsteht Darmkrebs in 90 Prozent aller Fälle aus harmlosen Polypen. Diese gutartigen Wucherungen der Darmschleimhaut können sich innerhalb von sechs bis zehn Jahren unbemerkt zu bösartigen Tumoren entwickeln. Durch das rechtzeitige Erkennen und Entfernen der Polypen könnten nach Angaben der Felix-Burda-Stiftung über 80 Prozent der Darmkrebserkrankungen verhindert werden. Zur Früherkennung von Darmkrebs solltest du daher alle zwei Jahre zum Gastroenterologen, der bei dir einen Test auf verborgenes Blut im Stuhl durchführt - alternativ kannst du auch alle 10 Jahre eine große Darmspiegelung an dir durchführen lassen.'''),
  Principal(
      id: 'untersuchungen15',
      subCategory:
          'Krebsfrüherkennungsuntersuchung der \nGenitalien und Prostata',
      algorithm: 'Wenn männlich und Alter ab 45 Jahren',
      description:
          '''Ein Vorsorge-Check der Prostata kann Leben retten. Ab dem 45. Lebensjahr wird Männern jährlich eine Tastuntersuchung der Prostata und der äußeren Genitalien empfohlen, um die bösartige Tumorerkrankung frühzeitig zu erkennen.'''),
  Principal(
      id: 'untersuchungen16',
      subCategory: 'Hautkrebs-Screening',
      algorithm: 'Wenn Alter ab 35 Jahren',
      description:
          '''Männer und Frauen sollten ab dem 35. Lebensjahr alle zwei Jahre ein Hautkrebs-Screening durchführen lassen. Bei der Untersuchung wird die ganze Körperoberfläche auf mögliche Anzeichen einer Krebserkrankung geprüft.'''),
  Principal(
      id: 'untersuchungen17',
      subCategory: 'Aneurysmen-Screening',
      algorithm:
          'Wenn männlich, Alter ab 65 Jahren und Angabe, dass noch kein Aneurysmen-Screening',
      description:
          '''Männer über 65 Jahre entwickeln häufiger ein Aneurysma der Bauchschlagader als andere Menschen. Daher wird eine einmalige Früherkennungsuntersuchung (Ultraschalluntersuchung) der Bauchaorta angeboten. Sie dient dazu, große Aneurysmen zu entdecken, sodass sie vorbeugend operiert werden können. Denn vor allem bei einem großen Aneurysma besteht die Gefahr, dass es in den nächsten Jahren unerwartet reißt, was unter Umständen tödlich enden kann.'''),
  Principal(
      id: 'untersuchungen18',
      subCategory: 'Herzvorsorge',
      algorithm:
          'Wenn Angabe, dass an Herzrasen, Herzstolpern oder Herzstechen, möglicherweise in Verbindung mit Kurzatmigkeit, Erschöpfung, Müdigkeit oder geschwollenen Füßen leidet',
      description:
          '''Du hast angegeben, dass du an Herzrasen, Herzstolpern oder Herzstechen, möglicherweise in Verbindung mit Kurzatmigkeit, Erschöpfung, Müdigkeit oder geschwollenen Füßen leidest. Da dies unter Umständen auf eine Herzinsuffizienz hindeuten könnte, raten wir dir, dass du deinem Hausarzt von den Beschwerden berichtest und dich von ihm einmal untersuchen lässt.'''),
  Principal(
      id: 'untersuchungen19',
      subCategory: 'Leberuntersuchung',
      algorithm: 'Wenn Angabe, dass jeden Tag Alkohol konsumiert wird',
      description:
          '''Wenn du täglich Alkohol konsumierst, solltest du von deinem Hausarzt deine Lebergesundheit untersuchen lassen.''')
];
