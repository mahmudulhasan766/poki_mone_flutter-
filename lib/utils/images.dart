class Images {
  static String get logo => 'logo'.png;
  static String get icon => 'icon'.svg;
  static String get profile => 'profile'.svg;
  static String get cancel => 'cancel'.svg;

}

extension on String {
  String get png => 'assets/images/$this.png';
  String get svg => 'assets/images/$this.svg';
}
