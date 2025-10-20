import 'package:flutter/material.dart';

// Traveler illustration from the provided code (animation part only)
class AnimatedTravelerIllustration extends StatefulWidget {
  const AnimatedTravelerIllustration({super.key});

  @override
  State<AnimatedTravelerIllustration> createState() =>
      _AnimatedTravelerIllustrationState();
}

class _AnimatedTravelerIllustrationState
    extends State<AnimatedTravelerIllustration>
    with TickerProviderStateMixin {
  late AnimationController _illustrationController;
  late AnimationController _suitcase1Controller;
  late AnimationController _suitcase2Controller;
  late AnimationController _suitcase3Controller;

  @override
  void initState() {
    super.initState();
    _illustrationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..forward();

    _suitcase1Controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    _suitcase2Controller = AnimationController(
      duration: const Duration(milliseconds: 2200),
      vsync: this,
    );

    _suitcase3Controller = AnimationController(
      duration: const Duration(milliseconds: 2400),
      vsync: this,
    );

    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted)
        _suitcase2Controller.repeat(reverse: true);
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted)
        _suitcase3Controller.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    _illustrationController.dispose();
    _suitcase1Controller.dispose();
    _suitcase2Controller.dispose();
    _suitcase3Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _illustrationController,
      child: SlideTransition(
        position:
            Tween<Offset>(
              begin: const Offset(0, 0.08),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: _illustrationController,
                curve: Curves.easeOut,
              ),
            ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double targetHeight =
                (constraints.maxHeight == double.infinity ||
                    constraints.maxHeight == 0)
                ? 220
                : constraints.maxHeight;
            final double h = targetHeight.clamp(180, 260);
            final double base = h / 3.0; // scale unit
            return SizedBox(
              height: h,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      crossAxisAlignment:
                          CrossAxisAlignment.end,
                      children: [
                        _animatedSuitcase(
                          controller: _suitcase1Controller,
                          width: base * 0.9,
                          height: base * 1.25,
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFFF6B6B),
                              Color(0xFFF44336),
                            ],
                          ),
                          shadowColor: const Color(
                            0xFFF44336,
                          ).withOpacity(0.3),
                          borderRadius: 8,
                          handleWidth: base * 0.45,
                          bounceDistance: -6,
                          stickers: const [
                            _StickerSpec(
                              offset: Offset(8, 12),
                              size: Size(12, 12),
                              color: Color(0xFFFFEB3B),
                              isCircle: true,
                            ),
                          ],
                        ),
                        SizedBox(width: base * 0.3),
                        _animatedSuitcase(
                          controller: _suitcase2Controller,
                          width: base * 1.05,
                          height: base * 1.45,
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF4ECDC4),
                              Color(0xFF00BCD4),
                            ],
                          ),
                          shadowColor: const Color(
                            0xFF00BCD4,
                          ).withOpacity(0.3),
                          borderRadius: 10,
                          handleWidth: base * 0.55,
                          bounceDistance: -8,
                          stickers: const [
                            _StickerSpec(
                              offset: Offset(8, 16),
                              size: Size(12, 12),
                              color: Color(0xFFF44336),
                              isCircle: true,
                            ),
                            _StickerSpec(
                              offset: Offset(12, 61),
                              size: Size(12, 12),
                              color: Color(0xFF00E676),
                              isCircle: true,
                            ),
                          ],
                        ),
                        SizedBox(width: base * 0.3),
                        _animatedSuitcase(
                          controller: _suitcase3Controller,
                          width: base * 0.8,
                          height: base * 1.1,
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF9C27B0),
                              Color(0xFF7B1FA2),
                            ],
                          ),
                          shadowColor: const Color(
                            0xFF7B1FA2,
                          ).withOpacity(0.3),
                          borderRadius: 7,
                          handleWidth: base * 0.36,
                          bounceDistance: -4,
                          stickers: const [
                            _StickerSpec(
                              offset: Offset(8, 58),
                              size: Size(12, 8),
                              color: Colors.white,
                              isCircle: false,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Decorative emoji badges
                  const Positioned(
                    top: -24,
                    left: 32,
                    child: Text(
                      '✈️',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  const Positioned(
                    top: -8,
                    right: 48,
                    child: Text(
                      '🗺️',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const Positioned(
                    bottom: 8,
                    right: 16,
                    child: Text(
                      '📸',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _animatedSuitcase({
    required AnimationController controller,
    required double width,
    required double height,
    required Gradient gradient,
    required Color shadowColor,
    required double borderRadius,
    required double handleWidth,
    required double bounceDistance,
    List<_StickerSpec> stickers = const [],
  }) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final bounceValue =
            Tween<double>(begin: 0, end: bounceDistance)
                .animate(
                  CurvedAnimation(
                    parent: controller,
                    curve: Curves.easeInOut,
                  ),
                )
                .value;

        return Transform.translate(
          offset: Offset(0, bounceValue),
          child: SizedBox(
            width: width,
            height: height + 10,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 10,
                  child: Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      gradient: gradient,
                      borderRadius: BorderRadius.circular(
                        borderRadius,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor,
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        ...stickers.map(
                          (s) => Positioned(
                            left: s.offset.dx,
                            top: s.offset.dy,
                            child: Container(
                              width: s.size.width,
                              height: s.size.height,
                              decoration: BoxDecoration(
                                color: s.color,
                                borderRadius: s.isCircle
                                    ? BorderRadius.circular(
                                        100,
                                      )
                                    : BorderRadius.circular(
                                        2,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: (width - handleWidth) / 2,
                  child: Container(
                    width: handleWidth,
                    height: 12,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade700,
                        width: 2,
                      ),
                      borderRadius:
                          const BorderRadius.vertical(
                            top: Radius.circular(8),
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _StickerSpec {
  final Offset offset;
  final Size size;
  final Color color;
  final bool isCircle;
  const _StickerSpec({
    required this.offset,
    required this.size,
    required this.color,
    required this.isCircle,
  });
}
