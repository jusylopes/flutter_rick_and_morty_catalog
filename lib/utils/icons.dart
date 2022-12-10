class AppIcons {
  static const _defaultPath = 'assets/images';
  static const _characters = '$_defaultPath/characters_icons';

  static const portal = '$_defaultPath/portal.png';
  static const rickAndMorty = '$_defaultPath/rick_and_morty.png';
  static const notFound = '$_defaultPath/morty_not_found.png';
  static const morty = '$_characters/morty_smith.png';
  static const rick = '$_characters/rick_sanchez.png';
  static const summer = '$_characters/summer_smith.png';
  static const beth = '$_characters/beth_smith.png';
  static const jerry = '$_characters/jerry_smith.png';

  getIcon(String characterName) {
    switch (characterName) {
      case 'Morty Smith':
        return AppIcons.morty;
      case 'Rick Sanchez':
        return AppIcons.rick;
      case 'Summer Smith':
        return AppIcons.summer;
      case 'Beth Smith':
        return AppIcons.beth;
      case 'Jerry Smith':
        return AppIcons.jerry;
      default:
        portal;
    }
  }
}
