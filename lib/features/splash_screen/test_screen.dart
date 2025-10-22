import 'dart:math';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            children: [
              CustomPaint(
                painter: _GlobePainter(_controller.value),
                size: size,
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: size.height * 0.13,
                child: Column(
                  children: [
                    AnimatedOpacity(
                      opacity: _controller.value > 0.1
                          ? 1
                          : 0,
                      duration: Duration(milliseconds: 600),
                      child: Transform.scale(
                        scale:
                            0.8 + 0.2 * _controller.value,
                        child: Text(
                          'TripAvail',
                          style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2,
                            shadows: [
                              Shadow(
                                color: Colors.black
                                    .withValues(alpha: 0.3),
                                blurRadius: 12,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 14),
                    AnimatedOpacity(
                      opacity: _controller.value > 0.2
                          ? 1
                          : 0,
                      duration: Duration(milliseconds: 600),
                      child: Text(
                        'Explore the world. Experience luxury. Travel proud.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 36),
                    AnimatedOpacity(
                      opacity: _controller.value > 0.4
                          ? 1
                          : 0,
                      duration: Duration(milliseconds: 600),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 48,
                            vertical: 16,
                          ),
                          backgroundColor: const Color(
                            0xFFD4AF37,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(30),
                          ),
                          elevation: 12,
                        ),
                        onPressed: () {
                          // TODO: Navigate to next screen
                        },
                        child: Text(
                          'Start Your Journey',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _GlobePainter extends CustomPainter {
  final double progress;
  _GlobePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    // Background
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()
        ..shader =
            LinearGradient(
              colors: [
                Color(0xFF232526),
                Color(0xFF283E51),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(
              Rect.fromLTWH(0, 0, size.width, size.height),
            ),
    );

    // Glowing globe
    final globeCenter = Offset(
      size.width / 2,
      size.height * 0.38,
    );
    final globeRadius = size.width * 0.32;
    canvas.drawCircle(
      globeCenter,
      globeRadius,
      Paint()
        ..shader =
            RadialGradient(
              colors: [
                Color(0xFFD4AF37),
                Color(0xFF232526),
                Colors.transparent,
              ],
              stops: [0.0, 0.7, 1.0],
            ).createShader(
              Rect.fromCircle(
                center: globeCenter,
                radius: globeRadius,
              ),
            ),
    );
    canvas.drawCircle(
      globeCenter,
      globeRadius * (0.98 + 0.02 * sin(progress * 2 * pi)),
      Paint()
        ..color = Colors.white.withValues(
          alpha: 0.08 + 0.08 * sin(progress * 2 * pi),
        )
        ..maskFilter = MaskFilter.blur(
          BlurStyle.normal,
          16,
        ),
    );

    // Flight paths
    final pathPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.18)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    for (int i = 0; i < 3; i++) {
      double angle =
          pi / 4 + i * pi / 6 + progress * pi / 2;
      Path path = Path();
      path.moveTo(globeCenter.dx, globeCenter.dy);
      path.quadraticBezierTo(
        globeCenter.dx + globeRadius * cos(angle) * 0.5,
        globeCenter.dy - globeRadius * sin(angle) * 0.7,
        globeCenter.dx + globeRadius * cos(angle),
        globeCenter.dy - globeRadius * sin(angle),
      );
      canvas.drawPath(path, pathPaint);
    }

    // Moving travel icons
    _drawIcon(
      canvas,
      globeCenter +
          Offset(
            globeRadius * cos(progress * pi * 2),
            -globeRadius * sin(progress * pi * 2),
          ),
      Icons.flight,
      Colors.blueAccent,
      1 - progress,
    );
    _drawIcon(
      canvas,
      globeCenter +
          Offset(
            -globeRadius * cos(progress * pi),
            globeRadius * sin(progress * pi),
          ),
      Icons.hotel,
      Colors.amber,
      progress,
    );
    _drawIcon(
      canvas,
      globeCenter +
          Offset(
            globeRadius * cos(progress * pi * 1.5),
            globeRadius * sin(progress * pi * 1.5),
          ),
      Icons.explore,
      Colors.greenAccent,
      0.5 + 0.5 * sin(progress * 2 * pi),
    );
  }

  void _drawIcon(
    Canvas canvas,
    Offset pos,
    IconData icon,
    Color color,
    double glow,
  ) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontSize: 38,
          fontFamily: icon.fontFamily,
          color: color.withValues(alpha: 0.85),
          shadows: [
            Shadow(
              color: color.withValues(alpha: glow),
              blurRadius: 18,
            ),
          ],
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, pos - Offset(19, 19));
  }

  @override
  bool shouldRepaint(covariant _GlobePainter oldDelegate) =>
      oldDelegate.progress != progress;
}
