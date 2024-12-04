import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/stock_provider.dart';
import '../widgets/stock_card.dart';

class StockSearchBar extends StatelessWidget {
  const StockSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StockProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SearchBar(
                leading: const Icon(Icons.search),
                hintText: 'Search stocks by symbol or name...',
                onSubmitted: (query) {
                  if (query.isNotEmpty) {
                    provider.searchStocks(query);
                  }
                },
              ),
            ),
            if (provider.searchResults.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Search Results',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: provider.searchResults.length,
                      itemBuilder: (context, index) {
                        return StockCard(stock: provider.searchResults[index]);
                      },
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}