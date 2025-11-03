import 'package:flutter/material.dart';

import 'drawer_item.dart';
import 'drawer_theme.dart';

class DrawerMenuWidget extends StatelessWidget {
  final List<DrawerItem> items;
  final String selectedId;
  final void Function(String itemId, String screen) onItemClick;

  const DrawerMenuWidget({
    super.key,
    required this.items,
    required this.selectedId,
    required this.onItemClick,
  });

  @override
  Widget build(BuildContext context) {
    final navigationItems = items
        .where((i) => i.type == DrawerItemType.navigation)
        .toList();
    final supportItems = items
        .where((i) => i.type == DrawerItemType.support)
        .toList();

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        ...navigationItems.map(
          (item) => _DrawerMenuItem(
            item: item,
            selected: item.id == selectedId,
            onTap: () => onItemClick(item.id, item.screen),
          ),
        ),
        if (supportItems.isNotEmpty) ...[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Divider(),
          ),
          ...supportItems.map(
            (item) => _DrawerMenuItem(
              item: item,
              selected: item.id == selectedId,
              onTap: () => onItemClick(item.id, item.screen),
            ),
          ),
        ],
      ],
    );
  }
}

class _DrawerMenuItem extends StatelessWidget {
  final DrawerItem item;
  final bool selected;
  final VoidCallback onTap;

  const _DrawerMenuItem({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: selected
              ? DrawerThemeConfig.selectedIndicatorColor.withValues(alpha:0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            Icon(
              item.icon,
              size: 20,
              color: selected
                  ? DrawerThemeConfig.iconSelectedColor
                  : theme.iconTheme.color,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                item.label,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (item.badge != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: theme.dividerColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(item.badge!, style: theme.textTheme.bodySmall),
              ),
          ],
        ),
      ),
    );
  }
}
