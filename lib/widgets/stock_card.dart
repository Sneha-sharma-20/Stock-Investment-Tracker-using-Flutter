import 'package:flutter/material.dart';
import '../models/stock.dart';
import 'package:provider/provider.dart';
import '../providers/stock_provider.dart';

class StockCard extends StatelessWidget {
  final Stock stock;

  const StockCard({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  stock.symbol,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    stock.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: stock.isFavorite ? Colors.red : null,
                  ),
                  onPressed: () {
                    context.read<StockProvider>().toggleFavorite(stock);
                  },
                ),
              ],
            ),
            Text(stock.name),
            const SizedBox(height: 8),
            Text(
              '\$${stock.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${stock.changePercentage >= 0 ? '+' : ''}${stock.changePercentage.toStringAsFixed(2)}%',
              style: TextStyle(
                color: stock.changePercentage >= 0 ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}