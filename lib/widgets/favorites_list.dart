import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/stock_provider.dart';

class FavoritesList extends StatelessWidget {
  const FavoritesList({super.key});

  String getStockSymbolEmoji(String symbol) {
    final Map<String, String> symbolEmojis = {
      'AAPL': '🍎', // Apple
      'MSFT': '💻', // Microsoft
      'GOOGL': '🔍', // Google
      'NVDA': '🎮', // NVIDIA
      'JPM': '🏦', // JPMorgan
      'V': '💳', // Visa
      'WMT': '🛒', // Walmart
      'PG': '🧴', // P&G
      'KO': '🥤', // Coca-Cola
      'DIS': '🏰', // Disney
    };
    return symbolEmojis[symbol] ?? '📈';
  }

  double getRandomAmount() {
    final random = Random();
    return random.nextDouble() * 1000; // Random amount between 0 and 1000
  }

  @override
  Widget build(BuildContext context) {
    final stockProvider = Provider.of<StockProvider>(context);
    final favoriteStocks = stockProvider.favoriteStocks;

    if (favoriteStocks.isEmpty) {
      return const Center(
        child: Text(
          'No favorite stocks added.',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: favoriteStocks.length,
      itemBuilder: (context, index) {
        final stock = favoriteStocks[index];
        final amountInvested = getRandomAmount();
        return Card(
          elevation: 5,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: CircleAvatar(
              child: Text(
                getStockSymbolEmoji(stock.symbol),
                style: const TextStyle(fontSize: 24),
              ),
            ),
            title: Text(
              stock.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(stock.symbol),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$${amountInvested.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Flexible(
                  child: IconButton(
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      stockProvider.toggleFavorite(stock);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
