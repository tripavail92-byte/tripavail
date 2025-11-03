import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripavail/features/onboarding/onboarding_screen.dart';
import 'package:tripavail/utils/app_labels.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/utils/theme/constants/app_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _bgController;
  late final AnimationController _logoController;
  late final AnimationController _textController;
  late final AnimationController _particlesController;
  late final AnimationController _glowController;
  late final AnimationController _pulseController;

  // Travel elements animations
  late final AnimationController _hotelController;
  late final AnimationController _planeController;
  late final AnimationController _carController;
  late final AnimationController _tourController;
  late final AnimationController _mountainController;

  late final Animation<double> _bgOpacity;
  late final Animation<double> _logoScale;
  late final Animation<double> _logoOpacity;
  late final Animation<double> _logoRotation;
  late final Animation<double> _textSlide;
  late final Animation<double> _textOpacity;
  late final Animation<double> _glowAnimation;
  late final Animation<double> _pulseAnimation;

  // Travel elements animations
  late final Animation<double> _hotelFloat;
  late final Animation<double> _hotelGlow;
  late final Animation<double> _planeMove;
  late final Animation<double> _planeTrail;
  late final Animation<double> _carMove;
  late final Animation<double> _tourRotate;
  late final Animation<double> _mountainFloat;

  @override
  void initState() {
    super.initState();

    // Background animation
    _bgController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _bgOpacity = CurvedAnimation(
      parent: _bgController,
      curve: Curves.easeInOut,
    );

    // Logo entrance animation
    _logoController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _logoScale = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.7, curve: Curves.elasticOut),
      ),
    );
    _logoOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
      ),
    );
    _logoRotation = Tween<double>(begin: -0.3, end: 0.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.2, 1.0, curve: Curves.elasticOut),
      ),
    );

    // Text animation
    _textController = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    );
    _textSlide = Tween<double>(begin: 50.0, end: 0.0).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeOutCubic),
    );
    _textOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
      ),
    );

    // Particles animation
    _particlesController = AnimationController(
      duration: const Duration(milliseconds: 8000),
      vsync: this,
    )..repeat();

    // Glow effect
    _glowController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..repeat();
    _glowAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );

    // Pulse effect
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);
    _pulseAnimation = CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    );

    // Travel elements animations
    // Hotel animation
    _hotelController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    _hotelFloat = Tween<double>(begin: 0.0, end: -10.0).animate(
      CurvedAnimation(parent: _hotelController, curve: Curves.easeInOut),
    );
    _hotelGlow = Tween<double>(begin: 0.4, end: 0.8).animate(
      CurvedAnimation(parent: _hotelController, curve: Curves.easeInOut),
    );
    _hotelController.repeat(reverse: true);

    // Plane animation
    _planeController = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    );
    _planeMove = Tween<double>(begin: -100.0, end: 100.0).animate(
      CurvedAnimation(parent: _planeController, curve: Curves.easeInOut),
    );
    _planeTrail = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _planeController, curve: Curves.linear));
    _planeController.repeat();

    // Car animation
    _carController = AnimationController(
      duration: const Duration(milliseconds: 3500),
      vsync: this,
    );
    _carMove = Tween<double>(
      begin: 80.0,
      end: -80.0,
    ).animate(CurvedAnimation(parent: _carController, curve: Curves.easeInOut));
    _carController.repeat();

    // Tour bus animation
    _tourController = AnimationController(
      duration: const Duration(milliseconds: 4500),
      vsync: this,
    );
    _tourRotate = Tween<double>(
      begin: 0.0,
      end: 2 * math.pi,
    ).animate(CurvedAnimation(parent: _tourController, curve: Curves.linear));
    _tourController.repeat();

    // Mountain/Adventure animation
    _mountainController = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    _mountainFloat = Tween<double>(begin: 0.0, end: -15.0).animate(
      CurvedAnimation(parent: _mountainController, curve: Curves.easeInOut),
    );
    _mountainController.repeat(reverse: true);

    _startAnimations();
    _routeNext();
  }

  void _startAnimations() async {
    _bgController.forward();
    await Future.delayed(const Duration(milliseconds: 300));
    _logoController.forward();
    await Future.delayed(const Duration(milliseconds: 800));
    _textController.forward();
  }

  Future<void> _routeNext() async {
    await Future.delayed(const Duration(milliseconds: 6000000));
    if (mounted) {
      Get.offAll(() => const OnboardingScreen());
    }
  }

  @override
  void dispose() {
    _bgController.dispose();
    _logoController.dispose();
    _textController.dispose();
    _particlesController.dispose();
    _glowController.dispose();
    _pulseController.dispose();
    _hotelController.dispose();
    _planeController.dispose();
    _carController.dispose();
    _tourController.dispose();
    _mountainController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Stack(
          children: [
            // Animated background
            AnimatedBuilder(
              animation: _bgOpacity,
              builder: (context, child) {
                return Opacity(
                  opacity: _bgOpacity.value,
                  child: _AnimatedBackground(),
                );
              },
            ),

            // Floating particles
            _FloatingParticles(controller: _particlesController),

            // Travel elements
            AnimatedBuilder(
              animation: Listenable.merge([
                _hotelController,
                _planeController,
                _carController,
                _tourController,
                _mountainController,
              ]),
              builder: (context, child) {
                return _TravelElements(
                  hotelFloat: _hotelFloat.value,
                  hotelGlow: _hotelGlow.value,
                  planeMove: _planeMove.value,
                  planeTrail: _planeTrail.value,
                  carMove: _carMove.value,
                  tourRotate: _tourRotate.value,
                  mountainFloat: _mountainFloat.value,
                );
              },
            ),

            // Main content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo with complex animations
                  AnimatedBuilder(
                    animation: Listenable.merge([
                      _logoController,
                      _glowController,
                      _pulseController,
                    ]),
                    builder: (context, child) {
                      final glowOpacity = _glowAnimation.value;
                      final pulseScale = 1.0 + (_pulseAnimation.value * 0.05);

                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          // Glow effect
                          Transform.scale(
                            scale: 2.0 + (glowOpacity * 0.5),
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: RadialGradient(
                                  colors: [
                                    AppColors.primaryColor.withValues(
                                      alpha: glowOpacity * 0.3,
                                    ),
                                    AppColors.primaryColor.withValues(
                                      alpha: 0.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // Logo
                          Transform.scale(
                            scale: _logoScale.value * pulseScale,
                            child: Transform.rotate(
                              angle: _logoRotation.value,
                              child: Opacity(
                                opacity: _logoOpacity.value,
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).scaffoldBackgroundColor,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.primaryColor
                                            .withValues(alpha: 0.4),
                                        blurRadius: 30,
                                        spreadRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.travel_explore,
                                      color: AppColors.primaryColor,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 40),

                  // App name and tagline
                  AnimatedBuilder(
                    animation: _textController,
                    builder: (context, child) {
                      final titleStyle =
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w900,
                            fontSize: 32,
                          ) ??
                          const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                          );
                      final subtitleStyle =
                          Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w300,
                          ) ??
                          const TextStyle(fontWeight: FontWeight.w300);
                      return Opacity(
                        opacity: _textOpacity.value,
                        child: Transform.translate(
                          offset: Offset(0, _textSlide.value),
                          child: Column(
                            children: [
                              Text(AppLabels.appName, style: titleStyle),
                              const SizedBox(height: 12),
                              Text(
                                AppLabels.splashTagline,
                                style: subtitleStyle,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Bottom loading indicator
            Positioned(
              bottom: 80,
              left: 0,
              right: 0,
              child: _LoadingIndicator(controller: _pulseController),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryColor.withValues(alpha: 0.1),
            Colors.transparent,
            AppColors.primaryColor.withValues(alpha: 0.05),
          ],
        ),
      ),
      child: Stack(
        children: List.generate(15, (index) {
          return _FloatingOrb(delay: index * 0.3, size: 60 + (index % 3) * 20);
        }),
      ),
    );
  }
}

class _FloatingOrb extends StatefulWidget {
  final double delay;
  final double size;

  const _FloatingOrb({required this.delay, required this.size});

  @override
  State<_FloatingOrb> createState() => _FloatingOrbState();
}

class _FloatingOrbState extends State<_FloatingOrb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 3000 + (widget.delay * 1000).round()),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    Future.delayed(Duration(milliseconds: (widget.delay * 100).round()), () {
      if (mounted) _controller.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final screenSize = MediaQuery.of(context).size;
        final x =
            (screenSize.width * 0.1) +
            (screenSize.width *
                0.8 *
                math.sin(_animation.value * math.pi * 2 + widget.delay));
        final y =
            (screenSize.height * 0.1) +
            (screenSize.height *
                0.8 *
                math.cos(_animation.value * math.pi * 2 + widget.delay));

        return Positioned(
          left: x,
          top: y,
          child: Opacity(
            opacity:
                (0.1 +
                        (0.2 *
                                math.sin(
                                  _animation.value * math.pi + widget.delay,
                                ))
                            .abs())
                    .clamp(0.0, 1.0),
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primaryColor.withValues(alpha: 0.3),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _FloatingParticles extends StatelessWidget {
  final AnimationController controller;

  const _FloatingParticles({required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Stack(
          children: List.generate(20, (index) {
            final screenSize = MediaQuery.of(context).size;
            final time = controller.value + (index * 0.1);
            final x = screenSize.width * (0.1 + 0.8 * (time * 1.5 % 1.0));
            final y =
                screenSize.height *
                (0.2 + 0.6 * math.sin(time * math.pi * 2 + index));

            return Positioned(
              left: x,
              top: y,
              child: Opacity(
                opacity: (0.3 + 0.7 * math.sin(time * math.pi * 4).abs()).clamp(
                  0.0,
                  1.0,
                ),
                child: Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withValues(alpha: 0.3),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  final AnimationController controller;

  const _LoadingIndicator({required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Column(
          children: [
            Text(
              AppLabels.splashLoadingText,
              style: AppTextStyle.bodyMedium.copyWith(
                color: Colors.black45,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                final delay = index * 0.2;
                final value = (controller.value - delay).clamp(0.0, 1.0);
                final scale = value < 0.5
                    ? 1.0 + (value * 0.5)
                    : 1.5 - ((value - 0.5) * 0.5);

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: Transform.scale(
                    scale: scale,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withValues(alpha: 0.7),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }
}

class _TravelElements extends StatelessWidget {
  final double hotelFloat;
  final double hotelGlow;
  final double planeMove;
  final double planeTrail;
  final double carMove;
  final double tourRotate;
  final double mountainFloat;

  const _TravelElements({
    required this.hotelFloat,
    required this.hotelGlow,
    required this.planeMove,
    required this.planeTrail,
    required this.carMove,
    required this.tourRotate,
    required this.mountainFloat,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Floating Hotel (top right)
        Positioned(
          right: 40,
          top: 120 + hotelFloat,
          child: _TravelHotel(glowIntensity: hotelGlow),
        ),

        // Moving Plane (top left to right)
        Positioned(
          left: 60 + planeMove.clamp(-100, 100) + 100,
          top: 80,
          child: _TravelPlane(trailProgress: planeTrail),
        ),

        // Moving Car (bottom)
        Positioned(
          left: 80 + carMove.clamp(-80, 80) + 80,
          bottom: 180,
          child: _TravelCar(),
        ),

        // Rotating Tour Bus (center left)
        Positioned(
          left: 30,
          top: 250,
          child: Transform.rotate(
            angle: tourRotate * 0.1, // Slow rotation
            child: _TravelTourBus(),
          ),
        ),

        // Floating Mountains/Adventure (background)
        Positioned(
          left: 20,
          bottom: 120 + mountainFloat,
          child: _AdventureMountains(),
        ),
      ],
    );
  }
}

class _TravelHotel extends StatelessWidget {
  final double glowIntensity;

  const _TravelHotel({required this.glowIntensity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 70,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFE53E3E), Color(0xFFC53030)],
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: const Color(
              0xFFE53E3E,
            ).withValues(alpha: glowIntensity * 0.4),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Hotel sign
          Positioned(
            top: -6,
            left: 8,
            child: Container(
              width: 44,
              height: 10,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Center(
                child: Text(
                  'HOTEL',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 6,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          // Windows
          ...List.generate(4, (index) {
            return Positioned(
              left: 8 + (index % 2) * 20,
              top: 20 + (index ~/ 2) * 15,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.yellow[200],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _TravelPlane extends StatelessWidget {
  final double trailProgress;

  const _TravelPlane({required this.trailProgress});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Trail effect
        ...List.generate(6, (index) {
          final progress = (trailProgress - (index * 0.15)).clamp(0.0, 1.0);
          final opacity =
              (1.0 - progress) * (0.6 - index * 0.1).clamp(0.0, 1.0);
          return Positioned(
            left: 40 + (index * 6) * progress,
            top: 12 + (index * 1.5),
            child: Opacity(
              opacity: opacity,
              child: Container(
                width: 3 - (index * 0.2),
                height: 3 - (index * 0.2),
                decoration: BoxDecoration(
                  color: Colors.cyan[200],
                  shape: BoxShape.circle,
                ),
              ),
            ),
          );
        }),
        // Main plane
        Container(
          width: 50,
          height: 24,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF3182CE), Color(0xFF2C5282)],
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF3182CE).withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(Icons.flight, color: Colors.white, size: 16),
        ),
      ],
    );
  }
}

class _TravelCar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 28,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF4299E1), Color(0xFF3182CE)],
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3182CE).withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Windshield
          Positioned(
            top: 4,
            left: 8,
            child: Container(
              width: 12,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.lightBlue[100],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          // Wheels
          Positioned(
            bottom: -3,
            left: 6,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.black87,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -3,
            right: 6,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.black87,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TravelTourBus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 32,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF56565), Color(0xFFE53E3E)],
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE53E3E).withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Tour sign
          Positioned(
            top: 2,
            left: 8,
            child: Container(
              width: 44,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Center(
                child: Text(
                  'TOUR',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 6,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          // Windows
          Positioned(
            top: 12,
            left: 6,
            child: Container(
              width: 10,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.lightBlue[100],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Positioned(
            top: 12,
            left: 20,
            child: Container(
              width: 10,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.lightBlue[100],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Positioned(
            top: 12,
            right: 6,
            child: Container(
              width: 10,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.lightBlue[100],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          // Wheels
          Positioned(
            bottom: -4,
            left: 8,
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Colors.black87,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -4,
            right: 8,
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Colors.black87,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AdventureMountains extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(80, 60), painter: _MountainPainter());
  }
}

class _MountainPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    final path = Path();

    // Mountain peaks
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.6);
    path.lineTo(size.width * 0.3, size.height * 0.3);
    path.lineTo(size.width * 0.6, size.height * 0.5);
    path.lineTo(size.width * 0.8, size.height * 0.2);
    path.lineTo(size.width, size.height * 0.4);
    path.lineTo(size.width, size.height);
    path.close();

    paint.shader = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF059669), // Green mountain top
        Color(0xFF7C2D12), // Brown mountain base
      ],
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(path, paint);

    // Snow on peaks
    final snowPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.8)
      ..style = PaintingStyle.fill;

    final snowPath = Path();
    snowPath.moveTo(size.width * 0.25, size.height * 0.32);
    snowPath.lineTo(size.width * 0.35, size.height * 0.32);
    snowPath.lineTo(size.width * 0.3, size.height * 0.3);
    snowPath.close();

    snowPath.moveTo(size.width * 0.75, size.height * 0.22);
    snowPath.lineTo(size.width * 0.85, size.height * 0.22);
    snowPath.lineTo(size.width * 0.8, size.height * 0.2);
    snowPath.close();

    canvas.drawPath(snowPath, snowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
