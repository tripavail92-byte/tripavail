import 'package:flutter/material.dart';

import 'drawer_header.dart';
import 'drawer_item.dart';
import 'drawer_menu.dart';
import 'partner_mode_switch.dart';

class DrawerManager extends StatefulWidget {
  final bool isOpen;
  final VoidCallback onClose;
  final String role;
  final String selectedItemId;
  final List<DrawerItem> items;
  final DrawerMeta meta;
  final void Function(String itemId, String screen) onItemClick;
  final VoidCallback onBecomePartner;
  final VoidCallback onSwitchToTraveler;

  const DrawerManager({
    super.key,
    required this.isOpen,
    required this.onClose,
    required this.role,
    required this.selectedItemId,
    required this.items,
    required this.meta,
    required this.onItemClick,
    required this.onBecomePartner,
    required this.onSwitchToTraveler,
  });

  @override
  State<DrawerManager> createState() => _DrawerManagerState();
}

class _DrawerManagerState extends State<DrawerManager>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  static const double _drawerWidth = 320;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    );
    if (widget.isOpen) {
      _controller.value = 1;
    }
  }

  @override
  void didUpdateWidget(covariant DrawerManager oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isOpen && !oldWidget.isOpen) {
      _controller.forward();
    } else if (!widget.isOpen && oldWidget.isOpen) {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !_controller.isAnimating && !widget.isOpen,
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              if (_controller.value == 0) return const SizedBox.shrink();
              return Opacity(
                opacity: _controller.value * 0.5,
                child: GestureDetector(
                  onTap: widget.onClose,
                  child: Container(color: Colors.black),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final translateX =
                  -_drawerWidth + (_drawerWidth * _controller.value);
              return Transform.translate(
                offset: Offset(translateX, 0),
                child: SizedBox(width: _drawerWidth, child: child),
              );
            },
            child: DrawerContent(
              meta: widget.meta,
              items: widget.items,
              selectedItemId: widget.selectedItemId,
              onItemClick: widget.onItemClick,
              onClose: widget.onClose,
              onBecomePartner: widget.onBecomePartner,
              onSwitchToTraveler: widget.onSwitchToTraveler,
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerContent extends StatelessWidget {
  final DrawerMeta meta;
  final List<DrawerItem> items;
  final String selectedItemId;
  final void Function(String, String) onItemClick;
  final VoidCallback onClose;
  final VoidCallback onBecomePartner;
  final VoidCallback onSwitchToTraveler;

  const DrawerContent({
    super.key,
    required this.meta,
    required this.items,
    required this.selectedItemId,
    required this.onItemClick,
    required this.onClose,
    required this.onBecomePartner,
    required this.onSwitchToTraveler,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.surface,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: onClose,
              ),
            ),
            DrawerHeaderWidget(meta: meta),
            Expanded(
              child: DrawerMenuWidget(
                items: items,
                selectedId: selectedItemId,
                onItemClick: (id, screen) {
                  onItemClick(id, screen);
                },
              ),
            ),
            PartnerModeSwitchWidget(
              isPartnerMode: meta.userRole != 'traveler',
              onBecomePartner: onBecomePartner,
              onSwitchToTraveler: onSwitchToTraveler,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
