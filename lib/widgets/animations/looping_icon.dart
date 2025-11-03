import 'package:flutter/material.dart';

typedef PainterBuilder = CustomPainter Function(double progress, Color color);

class LoopingIcon extends StatefulWidget {
  final double size;
  final Color? color;
  final Duration duration;
  final PainterBuilder painterBuilder;

  const LoopingIcon({
    super.key,
    required this.size,
    required this.duration,
    required this.painterBuilder,
    this.color,
  });

  @override
  State<LoopingIcon> createState() => _LoopingIconState();
}

class _LoopingIconState extends State<LoopingIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final effectiveColor = widget.color ?? Colors.white;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) => CustomPaint(
        size: Size(widget.size, widget.size),
        painter: widget.painterBuilder(_controller.value, effectiveColor),
      ),
    );
  }
}
