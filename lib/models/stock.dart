class Stock {
  final String symbol;
  final String name;
  final double price;
  final double change;
  final double changePercentage;
  bool isFavorite;

  Stock({
    required this.symbol,
    required this.name,
    required this.price,
    required this.change,
    required this.changePercentage,
    this.isFavorite = false,
  });

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      symbol: json['symbol'],
      name: json['name'],
      price: json['price'].toDouble(),
      change: json['change'].toDouble(),
      changePercentage: json['changePercentage'].toDouble(),
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Stock &&
          runtimeType == other.runtimeType &&
          symbol == other.symbol;

  @override
  int get hashCode => symbol.hashCode;

  get currentValue => null;

  get amountInvested => null;
}
