import 'package:ecom/common/widgets/loading_widget.dart';
import 'package:ecom/features/products/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../products/presentation/providers/product_providers.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(productListNotifierProvider.notifier).getAllProducts();
    });

    _scrollController.addListener(() {
      if (!_scrollController.hasClients) return;

      final notifier = ref.read(productListNotifierProvider.notifier);
      final state = ref.read(productListNotifierProvider);

      if (_scrollController.position.extentAfter < 200 &&
          !state.isLoading &&
          !state.isLoadingMore &&
          state.metaData != null &&
          state.metaData!.nextPage != 0) {
        notifier.loadMoreProducts();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Consumer(
        builder: (context, ref, _) {
          final state = ref.watch(productListNotifierProvider);

          if (state.isLoading && state.products.isEmpty) {
            return const LoadingWidget();
          }

          if (state.failure != null && state.products.isEmpty) {
            return Center(
              child: Text(
                state.failure!.message,
                textAlign: TextAlign.center,
              ),
            );
          }

          if (state.products.isEmpty) {
            return const Center(
              child: Text('No products found'),
            );
          }

          return GridView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(12),
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.63,
            ),
            itemCount: state.products.length +
                (state.isLoadingMore ? 2 : 0),
            itemBuilder: (context, index) {
              if (index >= state.products.length) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final product = state.products[index];

              return ProductCard(
                product: product,
                onTap: () {
                  // TODO: Navigate to product details.
                },
                onAddToCart: () {
                  // TODO: Add product to cart.
                },
                onFavorite: () {
                  // TODO: Toggle favorite state.
                },
              );
            },
          );
        },
      ),
    );
  }
}