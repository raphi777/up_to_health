import 'package:up_to_health/data/principals.dart';

final todos = [
  Principal(
      id: 'todos00',
      subCategory: 'Impfschutz Prüfen',
      algorithm: 'Für alle',
      description:
          '''Wir empfehlen dir, deinen eigenen Impfschutz regelmäßig von deinem Hausarzt prüfen zu lassen, denn manche empfohlenen Impfungen, wie z.B. Tetanus, müssen regelmäßig aufgefrischt werden.'''),
  Principal(
      id: 'todos01',
      subCategory: 'Hoden Abtasten',
      algorithm: 'Wenn Geschlecht männlich und Alter ab 16 Jahren',
      description:
          '''Einmal im Monat sollte jeder Mann seine Hoden zu Hause selbst abtasten. Es ist die einfachste Methode, um Veränderungen in den Hoden zu erkennen und Hodenkrebs frühzeitig zu entdecken.'''),
  Principal(
      id: 'todos02',
      subCategory: 'Brüste Abtasten',
      algorithm: 'Wenn Geschlecht weiblich und Alter ab 20 Jahren',
      description:
          '''Brustkrebs ist die häufigste Krebsart bei Frauen. Wird er im frühen Stadium erkannt, sind die Chancen auf Heilung gut. Daher ist die Früherkennung von großer Bedeutung, ganz besonders wenn es in deiner Familie Risikofaktoren geben sollte, die die Wahrscheinlichkeit einer Erkrankung erhöhen. Es ist daher ratsam, dass du dich regelmäßig selbst nach möglichen Knoten in der Brust abtastest. Achte darauf, dass du bei deinem jährlichen Check-up beim Gynäkologen in die Selbstuntersuchung der Brust eingewiesen wirst, falls noch nicht geschehen.'''),
  Principal(
      id: 'todos03',
      subCategory: 'Lebe gesünder',
      algorithm:
          'Wenn BMI > upper end und Couch Potatoe ODER BMI > upper end und Ernährung ungesund',
      description:
          '''Der Body Mass Index (BMI) ist ein Mess- und Richtwert, der sich aus dem Verhältnis von Körpergewicht zu Körpergröße ergibt. Wenn du wissen möchtest, wie du dein Gewicht einordnen kannst, ist der BMI ein praktischer Richtwert. Du hast auf Basis deiner Eingaben einen BMI von [X] - basierend auf deinem Geschlecht und Alter liegst du damit über dem idealen Durchschnitt. Unter Umständen bedeutet dies, dass du an Übergewicht leidest. Allerdings solltest du das Ergebnis nicht überbewerten und im Zweifel immer mit einem Arzt deines Vertrauens besprechen. Das größte Problem des BMIs ist, dass er nicht zwischen Muskel- und Fettmasse differenziert. Im ersten Schritt könntest du dir allerdings einmal überlegen, ob du etwas an deiner Ernährung ändern oder mehr Sport treiben solltest.'''),
  Principal(
      id: 'todos04',
      subCategory: 'Aufmerksamkeit für deinen Körper',
      algorithm: 'Wenn BMI < lower end',
      description:
          '''Der Body Mass Index (BMI) ist ein Mess- und Richtwert, der sich aus dem Verhältnis von Körpergewicht zu Körpergröße ergibt. Wenn du wissen möchtest, wie du dein Gewicht einordnen kannst, ist der BMI ein praktischer Richtwert. Du hast auf Basis deiner Eingaben einen BMI von [X] - basierend auf deinem Geschlecht und Alter liegst du damit unter dem idealen Durchschnitt. Unter Umständen bedeutet dies, dass du an Untergewicht leidest. Allerdings solltest du das Ergebnis nicht überbewerten und im Zweifel immer mit einem Arzt deines Vertrauens besprechen. Das größte Problem des BMIs ist, dass er nicht zwischen Muskel- und Fettmasse differenziert. Im ersten Schritt könntest du dir allerdings einmal überlegen, ob du eventuell nicht genügend isst. Essstörungen und damit einhergehende Mangelernährung sind ernstzunehmende Themen mit möglicherweise schwerwiegenden gesundheitlichen Folgen, weswegen du diesbezüglich umgehend mit einem Arzt sprechen solltest.'''),
  Principal(
      id: 'todos05',
      subCategory: 'Schwangerschaft',
      algorithm:
          'Wenn weiblich und bei der Frage, ob schwanger, mit "ja" geantwortet',
      description:
          '''Herzlichen Glückwunsch! Sicher befindest du dich bereits in Absprache mit deinem Gynäkologen oder Hebamme, falls nicht würden wir raten dich zu deiner Schwangerschaft eingehend beraten zu lassen. Dennoch wollen wir dir ein paar generelle Tipps für deine Schwangerschaft mit auf den Weg geben:
              - Achte auf eine gesunde Ernährung: Zu den Lebensmitteln, auf die du jetzt verzichten musst, gehören rohes Fleisch, Rohmilchprodukte, rohe Eier und roher Fisch; trinke täglich mindestens zwei Liter Wasser oder ungesüßten Tee; auf koffeinhaltige Getränke solltest du auch weitgehend verzichten
              - Meide Alkohol, Nikotin, Drogen und Medikamente (jede Einnahme von Medikamenten solltest du mit deinem Arzt besprechen)
              - Nimm regelmäßig Nahrungsergänzungsmittel, wie Folsäure, Vitamin B, Eisen und Jod, zu dir
              - Creme dich regelmäßig ein, denn deine Haut braucht jetzt eine Extraportion Pflege
              - Leichte Bewegung tut dir und deinem Kind gut: Melde dich am besten für einen Fitnesskurs für Schwangere an
              - Eine zahnärztliche Untersuchung wird ebenfalls empfohlen''')
];
