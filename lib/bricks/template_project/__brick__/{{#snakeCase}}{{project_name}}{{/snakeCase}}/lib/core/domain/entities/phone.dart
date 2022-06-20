class Phone {
  final String number;
  final String code;

  String get fullNumber => '$code$number';

  Phone(this.number, this.code);
}