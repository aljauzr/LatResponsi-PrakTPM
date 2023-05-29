class WeaponsModel {
  final String? name;
  final String? type;
  final int? rarity;
  final int? baseAttack;
  final String? subStat;
  final String? passiveName;
  final String? passiveDesc;
  final String? location;
  final String? ascensionMaterial;

  WeaponsModel({
    this.name,
    this.type,
    this.rarity,
    this.baseAttack,
    this.subStat,
    this.passiveName,
    this.passiveDesc,
    this.location,
    this.ascensionMaterial,
  });

  WeaponsModel.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        type = json['type'] as String?,
        rarity = json['rarity'] as int?,
        baseAttack = json['baseAttack'] as int?,
        subStat = json['subStat'] as String?,
        passiveName = json['passiveName'] as String?,
        passiveDesc = json['passiveDesc'] as String?,
        location = json['location'] as String?,
        ascensionMaterial = json['ascensionMaterial'] as String?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'type' : type,
    'rarity' : rarity,
    'baseAttack' : baseAttack,
    'subStat' : subStat,
    'passiveName' : passiveName,
    'passiveDesc' : passiveDesc,
    'location' : location,
    'ascensionMaterial' : ascensionMaterial
  };
}