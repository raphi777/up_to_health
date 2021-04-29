class Principal {
  String subCategory;
  String algorithm;
  String description;

  Principal({this.subCategory, this.algorithm, this.description});

  void fromMap(Map map) {
    this.subCategory = map['Sub-Category'];
    this.algorithm = map['Empfehlungsalgorithmus'];
    this.description = map['Beschreibung für den Nutzer'];
  }
}