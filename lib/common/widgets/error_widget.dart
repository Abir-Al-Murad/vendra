import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    super.key,
    this.errorMessage = 'An error occurred',
    this.iconData = Icons.error_outline_rounded,
    this.onRetry,
  });

  final String errorMessage;
  final IconData iconData;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 88,
              width: 88,
              decoration: BoxDecoration(
                color: colorScheme.error.withValues(alpha: 0.10),
                shape: BoxShape.circle,
              ),
              child: Icon(iconData, size: 44, color: colorScheme.error),
            ),
            const SizedBox(height: 24),

            Text(
              'Oops! Something went wrong',
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),

            if (onRetry != null) ...[
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('Try Again'),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
