class CharactersModel {
  final String? name;
  final String? title;
  final String? vision;
  final String? weapon;
  final String? nation;
  final String? affiliation;
  final int? rarity;
  final String? constellation;
  final String? birthday;
  final String? description;
  final List<SkillTalents>? skillTalents;
  final List<PassiveTalents>? passiveTalents;
  final List<Constellations>? constellations;
  final String? visionKey;
  final String? weaponType;

  CharactersModel({
    this.name,
    this.title,
    this.vision,
    this.weapon,
    this.nation,
    this.affiliation,
    this.rarity,
    this.constellation,
    this.birthday,
    this.description,
    this.skillTalents,
    this.passiveTalents,
    this.constellations,
    this.visionKey,
    this.weaponType,
  });

  CharactersModel.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        title = json['title'] as String?,
        vision = json['vision'] as String?,
        weapon = json['weapon'] as String?,
        nation = json['nation'] as String?,
        affiliation = json['affiliation'] as String?,
        rarity = json['rarity'] as int?,
        constellation = json['constellation'] as String?,
        birthday = json['birthday'] as String?,
        description = json['description'] as String?,
        skillTalents = (json['skillTalents'] as List?)?.map((dynamic e) => SkillTalents.fromJson(e as Map<String,dynamic>)).toList(),
        passiveTalents = (json['passiveTalents'] as List?)?.map((dynamic e) => PassiveTalents.fromJson(e as Map<String,dynamic>)).toList(),
        constellations = (json['constellations'] as List?)?.map((dynamic e) => Constellations.fromJson(e as Map<String,dynamic>)).toList(),
        visionKey = json['vision_key'] as String?,
        weaponType = json['weapon_type'] as String?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'title' : title,
    'vision' : vision,
    'weapon' : weapon,
    'nation' : nation,
    'affiliation' : affiliation,
    'rarity' : rarity,
    'constellation' : constellation,
    'birthday' : birthday,
    'description' : description,
    'skillTalents' : skillTalents?.map((e) => e.toJson()).toList(),
    'passiveTalents' : passiveTalents?.map((e) => e.toJson()).toList(),
    'constellations' : constellations?.map((e) => e.toJson()).toList(),
    'vision_key' : visionKey,
    'weapon_type' : weaponType
  };
}

class SkillTalents {
  final String? name;
  final String? unlock;
  final String? description;
  final String? type;

  SkillTalents({
    this.name,
    this.unlock,
    this.description,
    this.type,
  });

  SkillTalents.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        unlock = json['unlock'] as String?,
        description = json['description'] as String?,
        type = json['type'] as String?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'unlock' : unlock,
    'description' : description,
    'type' : type
  };
}

class PassiveTalents {
  final String? name;
  final String? unlock;
  final String? description;
  final int? level;

  PassiveTalents({
    this.name,
    this.unlock,
    this.description,
    this.level,
  });

  PassiveTalents.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        unlock = json['unlock'] as String?,
        description = json['description'] as String?,
        level = json['level'] as int?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'unlock' : unlock,
    'description' : description,
    'level' : level
  };
}

class Constellations {
  final String? name;
  final String? unlock;
  final String? description;
  final int? level;

  Constellations({
    this.name,
    this.unlock,
    this.description,
    this.level,
  });

  Constellations.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        unlock = json['unlock'] as String?,
        description = json['description'] as String?,
        level = json['level'] as int?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'unlock' : unlock,
    'description' : description,
    'level' : level
  };
}