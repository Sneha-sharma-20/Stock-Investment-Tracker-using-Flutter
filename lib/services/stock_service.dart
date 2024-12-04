import '../models/stock.dart';

class StockService {
  static const String baseUrl = 'https://finnhub.io/api/v1';
  static const String apiKey = 'demo';

  Future<List<Stock>> searchStocks(String query) async {
    // Simulated search results with realistic data
    final mockStocks = [
      Stock(
        symbol: 'AAPL',
        name: 'Apple Inc.',
        price: 173.50,
        change: 2.75,
        changePercentage: 1.61,
        isFavorite: false,
      ),
      Stock(
        symbol: 'MSFT',
        name: 'Microsoft Corporation',
        price: 332.42,
        change: -1.23,
        changePercentage: -0.37,
        isFavorite: false,
      ),
      Stock(
        symbol: 'GOOGL',
        name: 'Alphabet Inc.',
        price: 125.30,
        change: 1.45,
        changePercentage: 1.17,
        isFavorite: false,
      ),
      Stock(
        symbol: 'AMZN',
        name: 'Amazon.com Inc.',
        price: 127.12,
        change: -0.88,
        changePercentage: -0.69,
        isFavorite: false,
      ),
      Stock(
        symbol: 'TSLA',
        name: 'Tesla, Inc.',
        price: 238.45,
        change: 5.67,
        changePercentage: 2.44,
        isFavorite: false,
      ),
    ];

    return mockStocks
        .where((stock) =>
            stock.symbol.toLowerCase().contains(query.toLowerCase()) ||
            stock.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Future<List<Stock>> getTrendingStocks() async {
    return [
      Stock(
        symbol: 'NVDA',
        name: 'NVIDIA Corporation',
        price: 432.99,
        change: 12.45,
        changePercentage: 2.96,
        isFavorite: false,
      ),
      Stock(
        symbol: 'META',
        name: 'Meta Platforms Inc.',
        price: 298.67,
        change: 5.89,
        changePercentage: 2.01,
        isFavorite: false,
      ),
      Stock(
        symbol: 'AMD',
        name: 'Advanced Micro Devices',
        price: 109.45,
        change: 3.21,
        changePercentage: 3.02,
        isFavorite: false,
      ),
      Stock(
        symbol: 'ORCL',
        name: 'Oracle Corporation',
        price: 109.96,
        change: -1.23,
        changePercentage: -1.11,
        isFavorite: false,
      ),
      Stock(
        symbol: 'CRM',
        name: 'Salesforce Inc.',
        price: 211.34,
        change: 4.56,
        changePercentage: 2.21,
        isFavorite: false,
      ),
    ];
  }

  Future<List<Stock>> getInitialFavorites() async {
    return [
      Stock(
        symbol: 'AAPL',
        name: 'Apple Inc.',
        price: 173.50,
        change: 2.75,
        changePercentage: 1.61,
        isFavorite: true,
      ),
      Stock(
        symbol: 'MSFT',
        name: 'Microsoft Corporation',
        price: 332.42,
        change: -1.23,
        changePercentage: -0.37,
        isFavorite: true,
      ),
      Stock(
        symbol: 'GOOGL',
        name: 'Alphabet Inc.',
        price: 125.30,
        change: 1.45,
        changePercentage: 1.17,
        isFavorite: true,
      ),
      Stock(
        symbol: 'NVDA',
        name: 'NVIDIA Corporation',
        price: 432.99,
        change: 12.45,
        changePercentage: 2.96,
        isFavorite: true,
      ),
      Stock(
        symbol: 'JPM',
        name: 'JPMorgan Chase & Co.',
        price: 148.23,
        change: 0.85,
        changePercentage: 0.58,
        isFavorite: true,
      ),
      Stock(
        symbol: 'V',
        name: 'Visa Inc.',
        price: 242.15,
        change: 3.45,
        changePercentage: 1.44,
        isFavorite: true,
      ),
      Stock(
        symbol: 'WMT',
        name: 'Walmart Inc.',
        price: 156.89,
        change: -0.45,
        changePercentage: -0.29,
        isFavorite: true,
      ),
      Stock(
        symbol: 'PG',
        name: 'Procter & Gamble Co.',
        price: 152.67,
        change: 1.23,
        changePercentage: 0.81,
        isFavorite: true,
      ),
      Stock(
        symbol: 'KO',
        name: 'The Coca-Cola Company',
        price: 58.92,
        change: 0.34,
        changePercentage: 0.58,
        isFavorite: true,
      ),
      Stock(
        symbol: 'DIS',
        name: 'The Walt Disney Company',
        price: 84.50,
        change: -1.75,
        changePercentage: -2.03,
        isFavorite: true,
      ),
    ];
  }
}
