class CurrencySettings {
  String currencyCode;
  int decimalPlaces;
  bool symbolBefore;
  String decimalSeparator;
  String thousandSeparator;
  bool showDecimals;
  bool addSpace;

  CurrencySettings({
    required this.currencyCode,
    required this.decimalPlaces,
    required this.symbolBefore,
    required this.decimalSeparator,
    required this.thousandSeparator,
    required this.showDecimals,
    required this.addSpace,
  });
}
