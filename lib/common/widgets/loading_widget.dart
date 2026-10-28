
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.message = 'Loading...',
    this.subtitle = 'Please wait while we fetch your data.',
    this.color,
    this.showMessage = true,
  });

  final String message;
  final String? subtitle;
  final Color? color;
  final bool showMessage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final indicatorColor = color ?? theme.colorScheme.primary;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 52,
              width: 52,
              child: CircularProgressIndicator(
                strokeWidth: 4,
                color: indicatorColor,
                backgroundColor:
                indicatorColor.withValues(alpha: 0.12),
                strokeCap: StrokeCap.round,
              ),
            ),

            if (showMessage) ...[
              const SizedBox(height: 24),
              Text(
                message,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),

              if (subtitle != null) ...[
                const SizedBox(height: 8),
                Text(
                  subtitle!,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    height: 1.5,
                  ),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
