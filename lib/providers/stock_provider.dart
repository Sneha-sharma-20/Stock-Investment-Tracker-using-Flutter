import 'package:flutter/foundation.dart';
import '../models/stock.dart';
import '../services/stock_service.dart';

class StockProvider with ChangeNotifier {
  final List<Stock> _favorites = [];
  final List<Stock> _trending = [];
  final List<Stock> _searchResults = [];
  final StockService _stockService = StockService();

  List<Stock> get favorites => _favorites;
  List<Stock> get trending => _trending;
  List<Stock> get searchResults => _searchResults;

  StockProvider() {
    _initializeData();
  }

  List<Stock> get favoriteStocks => _favorites;

  Future<void> _initializeData() async {
    await fetchTrendingStocks();
    await _loadInitialFavorites();
  }

  Future<void> _loadInitialFavorites() async {
    try {
      final initialFavorites = await _stockService.getInitialFavorites();
      _favorites.addAll(initialFavorites);
      notifyListeners();
    } catch (e) {
      // Handle error silently
    }
  }

  Future<void> searchStocks(String query) async {
    try {
      _searchResults.clear();
      final results = await _stockService.searchStocks(query);
      for (var stock in results) {
        stock.isFavorite = _favorites.any((fav) => fav.symbol == stock.symbol);
      }
      _searchResults.addAll(results);
      notifyListeners();
    } catch (e) {
      // Handle error silently
    }
  }

  void toggleFavorite(Stock stock) {
    final existingIndex =
        _favorites.indexWhere((s) => s.symbol == stock.symbol);
    if (existingIndex >= 0) {
      _favorites.removeAt(existingIndex);
      stock.isFavorite = false;
    } else {
      stock.isFavorite = true;
      _favorites.add(stock);
    }

    for (var s in [..._searchResults, ..._trending]) {
      if (s.symbol == stock.symbol) {
        s.isFavorite = stock.isFavorite;
      }
    }

    notifyListeners();
  }

  Future<void> fetchTrendingStocks() async {
    try {
      _trending.clear();
      final trendingStocks = await _stockService.getTrendingStocks();
      for (var stock in trendingStocks) {
        stock.isFavorite = _favorites.any((fav) => fav.symbol == stock.symbol);
      }
      _trending.addAll(trendingStocks);
      notifyListeners();
    } catch (e) {
      // Handle error silently
    }
  }
}
