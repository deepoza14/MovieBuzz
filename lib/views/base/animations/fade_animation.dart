import 'package:flutter/material.dart';

enum AnimationType {
  fadeIn,
  fadeOut,
}

enum FadeAnimationType {
  fixed,
  alwaysFade,
}

class FadeAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final AnimationType type;
  final FadeAnimationType fadeType;
  final bool isReverse;
  final Duration delayBeforeAnimation;

  const FadeAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.type = AnimationType.fadeIn,
    this.fadeType = FadeAnimationType.fixed,
    this.isReverse = false,
    this.delayBeforeAnimation = Duration.zero,
  });

  @override
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    if (widget.type == AnimationType.fadeIn) {
      _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    } else {
      _opacityAnimation = Tween<double>(begin: 1, end: 0).animate(_controller);
    }

    Future.delayed(widget.delayBeforeAnimation, () {
      if (widget.fadeType == FadeAnimationType.fixed) {
        _controller.forward();
      } else {
        _controller
            .forward()
            .then((value) => _controller..repeat(reverse: widget.isReverse));
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: widget.child,
    );
  }
}
