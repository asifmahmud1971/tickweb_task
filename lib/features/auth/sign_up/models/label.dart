class Label {
  final String label;
  final String value;

  Label(this.label, this.value);

  static final genders = <Label>[
    Label('Male', 'male'),
    Label('Female', 'female'),
    Label('Diverse', 'diverse'),
    Label('Not Share', ''),
  ];

  static final countries = <Label>[
    Label('United States', 'US'),
    Label('United Kingdom', 'GB'),
    Label('Canada', 'CA'),
    Label('Australia', 'AU'),
    Label('Germany', 'DE'),
    Label('France', 'FR'),
    Label('Japan', 'JP'),
    Label('China', 'CN'),
    Label('India', 'IN'),
    Label('Brazil', 'BR'),
    Label('Mexico', 'MX'),
    Label('South Korea', 'KR'),
    Label('Italy', 'IT'),
    Label('Spain', 'ES'),
    Label('Russia', 'RU'),
    Label('South Africa', 'ZA'),
    Label('Nigeria', 'NG'),
    Label('Egypt', 'EG'),
    Label('Saudi Arabia', 'SA'),
    Label('Argentina', 'AR'),
    Label('Sweden', 'SE'),
    Label('Norway', 'NO'),
    Label('Finland', 'FI'),
    Label('Denmark', 'DK'),
    Label('Netherlands', 'NL'),
    Label('Belgium', 'BE'),
    Label('Switzerland', 'CH'),
    Label('Austria', 'AT'),
    Label('Ireland', 'IE'),
    Label('New Zealand', 'NZ'),
  ];
}