import 'package:flutter/material.dart';
import '../../domain/entities/product_entity.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.onAddToCart,
    this.onFavorite,
    this.isFavorite = false,
  });

  final ProductEntity product;
  final VoidCallback? onTap;
  final VoidCallback? onAddToCart;
  final VoidCallback? onFavorite;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Card(
      elevation: 2,
      shadowColor: colors.shadow.withValues(alpha: 0.08),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: colors.outlineVariant.withValues(alpha: 0.5)),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image and favorite button
            Expanded(
              flex: 5,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    color: colors.surfaceContainerHighest.withValues(
                      alpha: 0.35,
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Image.network(
                      product.imageCover,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            size: 40,
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Material(
                      color: colors.surface,
                      shape: const CircleBorder(),
                      child: IconButton(
                        onPressed: onFavorite,
                        tooltip: isFavorite
                            ? 'Remove from favorites'
                            : 'Add to favorites',
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? colors.error : colors.onSurface,
                          size: 21,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 38,
                          minHeight: 38,
                        ),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  if (product.quantity <= 0)
                    Positioned(
                      left: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: colors.error,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'Out of stock',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // Product details
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.category.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),

                    Text(
                      product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          size: 17,
                          color: Color(0xFFF59E0B),
                        ),
                        const SizedBox(width: 3),
                        Text(
                          product.ratingsAverage.toStringAsFixed(1),
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            '(${product.ratingsQuantity})',
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colors.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: colors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    SizedBox(
                      width: double.infinity,
                      height: 38,
                      child: FilledButton(
                        onPressed: product.quantity > 0 ? onAddToCart : null,
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),
                        child: const FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.shopping_cart_outlined, size: 17),
                              SizedBox(width: 6),
                              Text('Add to Cart'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
