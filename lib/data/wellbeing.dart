import 'package:up_to_health/data/principals.dart';

final wellbeing = [
  Principal(
      id: 'wellbeing00',
      subCategory: 'Entspannung',
      algorithm: 'Wenn Angabe, dass überdurchschnittlich gestresst',
      description:
          '''Du bist momentan sehr gestresst und fühlst dich nicht ganz ausgeglichen? Unser Tipp: Achte auf einen konsequenten Schlafrhythmus und wende regelmäßig ein Entspannungsverfahren an. Yoga und Meditation sind hierfür mögliche Beispiele. Du wirst verwundert sein wie viele hilfreiche Anleitungen du im Internet dazu findest. Probiere es einfach mal aus!'''),
  Principal(
      id: 'wellbeing01',
      subCategory: 'Schlafhygiene',
      algorithm:
          'Wenn Angabe, dass weniger als 6 Stunden Schlaf oder dass an Schlafstörungen leidet',
      description:
          '''Fühlst du dich generell müde? Mit weniger als 6 Stunden Schlaf pro Nacht kein Wunder. Gesund ist es zudem auch nicht. Was dir möglicherweise helfen kann, um mehr Schlaf zu bekommen: Achte auf deine Schlafhygiene, indem du deinen Schlafrhytmus regelst und an Schlafritualen festhältst (z.B. ein entspannendes Bad, leichte Nachtmahlzeit, Gutenachtgeschichte über eine App). Powernapping über den Tag verteilt ist auch eine Möglichkeit, die dir helfen könnte. Falls du arbeitsbedingt nicht mehr schlafen kannst als du solltest (7-8 Stunden pro Nacht), überdenke eventuell deine Berufswahl :-)
          Falls du an Schlaflosigkeit (Insomnia) leidest, suche einen Arzt auf, da es sich hierbei um eine ernstzunehmende Krankheit handelt.'''),
  Principal(
      id: 'wellbeing02',
      subCategory: 'High-Performer Schicksal',
      algorithm: 'Wenn Angabe, dass in Banking, Consulting oder Recht arbeitet',
      description:
          '''Du scheinst einen sehr anspruchsvollen Job zu haben, der auch mit langen Arbeitszeiten einhergeht. Achte während der Arbeitszeit dennoch auf ausreichend Bewegung (nimm z.B. die Treppe anstelle des Aufzugs) und einen starken Geist (z.B. durch kurze Yoga- oder Meditationssessions). Achte auch besonders auf ausgewogene, vitamin- und nährstoffreiche Ernährung.'''),
  Principal(
      id: 'wellbeing03',
      subCategory: 'Pollenallergie',
      algorithm: 'Wenn Angabe, dass an Pollenallergie leidet',
      description:
          '''Bei starkem Pollenflug raten wir dir, zuhause die Fenster möglichst geschlossen halten. Um ruhig schlafen zu können, solltest du das Haare­waschen auf den Abend verlegen und deine Kleidung vor dem Schlafengehen im Bad liegen lassen, anstatt auf einem Stuhl neben dem Bett. Zudem könnten dir je nach Beschwerden Augentropfen oder salzwasserhaltige Nasensprays helfen.'''),
  Principal(
      id: 'wellbeing04',
      subCategory: 'Mentale Unterstützung',
      algorithm: 'Wenn Angabe, dass dem Burn-out nahe oder mental instabil',
      description:
          '''Du scheinst ja ganz schön unglücklich zu sein bzw. fühlst dich sehr erschöpft. Sprich am Besten mit Freunden oder deiner Familie einmal darüber - sie werden dir sicher gerne zur Seite stehen. Falls du aber das Gefühl hast, dass dich das nicht weiter bringen würde, lass dich von einem Psychotherapeuten beraten. Sie sind speziell ausgebildet, um dich in deiner Situation zu unterstützen und sind selbstverständlich auch an die ärztliche Schweigepflicht gebunden.'''),
  Principal(
      id: 'wellbeing05',
      subCategory: 'Diabetes-Check',
      algorithm:
          'Wenn Angabe, dass mehr als 4 Liter pro Tag getrunken und wenig Sport getrieben wird',
      description:
          '''Bei häufigem Wasserlassen, vermehrtem Durst und Gewichtsverlust, kontaktiere deinen Hausarzt und lass dich einmal durchchecken, da es sich möglicherweise um Symptome einer Zuckerkrankheit (Diabetes) handeln könnte.'''),
  Principal(
      id: 'wellbeing06',
      subCategory: 'Flüssigkeitszufuhr',
      algorithm:
          'Wenn Angabe, dass weniger als 1 Liter pro Tag getrunken wird oder Angabe, dass nicht sicher aber wahrscheinlich zu wenig',
      description:
          '''Wie viele andere auch weißt du sicherlich, wie wichtig es ist, genug zu trinken. Aber viele wissen auch nicht, wie sie es schaffen sollen, ihren Mindestbedarf zu decken, wobei Stress einer der wichtigsten Gründe ist. Dauerdruck sowohl im Beruf als auch im Privatleben führt gerne dazu, dass man den Griff zum Wasserglas vergisst. Nutze daher am besten die Benachrichtigungsfunktion von UpToHealth, um dich regelmäßig daran erinnern zu lassen. Wir empfehlen dir, circa [auf eine Dezimalstelle gerundete Berechnung: Körpergewicht in kg * 0.035 Liter]l Flüssigkeit pro Tag zu trinken, denn als guter Richtwert gelten 35 Milliliter pro Kilogramm Körpergewicht.'''),
  Principal(
      id: 'wellbeing07',
      subCategory: 'Vitamin D',
      algorithm: 'Wenn Angabe, dass weniger als 1 Stunde am Tag draußen',
      description:
          '''Da du angegeben hast, relativ wenig Zeit draußen zu verbringen, könnte es sein, dass dein Vitamin D-Spiegel etwas niedrig ist. Um dem Entgegenzuwirken würden wir dir empfehlen, zu versuchen öfter an die frische Luft und Sonnetanken zugehen (vergiss bloß nicht die Sonnencreme!) oder alternativ Vitamin D als Nahrungsergänzungsmittel zu dir zu nehmen.'''),
  Principal(
      id: 'wellbeing08',
      subCategory: 'Rückenschmerzen',
      algorithm: 'Wenn Angabe, dass an anhaltenden Rückenschmerzen leidet',
      description:
          '''Du leidest immer wieder unter Rückenschmerzen? Vieles kann dabei hinter der Ursache stecken, wie z.B. eine falsche Haltung am Schreibtisch bei der Arbeit. Suche am besten deinen Hausarzt auf, dieser kann dich einmal durchchecken und eventuell zu einem Physiotherapeuten überweisen.''')
];
