import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    this.title = 'Nothing here yet',
    this.message = 'There is no data to display right now.',
    this.iconData = Icons.inbox_outlined,
    this.buttonText,
    this.onAction,
  });

  final String title;
  final String message;
  final IconData iconData;
  final String? buttonText;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                color: colors.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(iconData, size: 52, color: colors.onPrimaryContainer),
            ),
            const SizedBox(height: 24),

            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                  height: 1.6,
                ),
              ),
            ),

            if (buttonText != null && onAction != null) ...[
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: onAction,
                icon: const Icon(Icons.add_rounded),
                label: Text(buttonText!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
