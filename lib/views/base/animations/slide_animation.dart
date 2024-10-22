import 'dart:async';
import 'package:flutter/material.dart';

enum SlideAnimationType {
  fixed,
  alwaysFade,
}

/// Define a global key for each widget
/// final slideKey = GlobalKey<_SlideAnimationState>();
/// Use `SlideKey.currentState?.Slide();`to shake the widget.

abstract class AnimationControllerState<T extends StatefulWidget>
    extends State<T> with TickerProviderStateMixin {
  // controller
  late AnimationController _controller;
  late Animation<Offset> _position;

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }
}

class SlideAnimation extends StatefulWidget {
  final Widget child;
  final List<Duration> duration;
  final List<Offset> beginPosition;
  final List<Offset> endPosition;
  final List<Curve> setCurves;
  final SlideAnimationType type;
  final bool isReverse;
  final List<Duration> delayBeforeAnimation;
  final bool isAutoAnimation;

  const SlideAnimation({
    super.key,
    required this.child,
    this.duration = const [],
    this.beginPosition = const [],
    this.endPosition = const [],
    this.setCurves = const [],
    this.type = SlideAnimationType.fixed,
    this.isReverse = false,
    this.delayBeforeAnimation = const [],
    this.isAutoAnimation = true,
  });

  @override
  State<SlideAnimation> createState() => SlideAnimationState();
}

class SlideAnimationState extends AnimationControllerState<SlideAnimation> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    setAnimation();
  }

  void setAnimation() {
    //controller
    _controller = AnimationController(
        duration: widget.duration.isEmpty
            ? const Duration(milliseconds: 600)
            : widget.duration[currentIndex],
        vsync: this)
      ..addStatusListener((status) {
        if (_controller.isCompleted &&
            widget.duration.length != 1 &&
            widget.isAutoAnimation) {
          // log("${widget.beginPosition[currentIndex]} , index : $currentIndex");
          // if / else
          if (currentIndex != (widget.beginPosition.length - 1)) {
            // log("Finished"); ---------------------------- :)
            currentIndex++;
            setState(() {});
            _controller.dispose();
            setAnimation();
            // --------------------------------------------- :)
          }
        }
      });

    // position
    _position = Tween<Offset>(
      begin: widget.beginPosition[currentIndex],
      end: widget.endPosition[currentIndex],
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.setCurves.isEmpty
          ? Curves.ease
          : widget.setCurves[currentIndex],
    ));

    // if / else
    if (widget.type == SlideAnimationType.fixed) {
      // fixed

      Future.delayed(
          widget.delayBeforeAnimation.isEmpty
              ? Duration.zero
              : widget.delayBeforeAnimation[currentIndex], () {
        _controller.forward();
      });
    }
    //
    else {
      // rotate
      Future.delayed(
          widget.delayBeforeAnimation.isEmpty
              ? Duration.zero
              : widget.delayBeforeAnimation[currentIndex], () {
        _controller
            .forward()
            .then((value) => _controller.repeat(reverse: widget.isReverse));
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  slideNext() {
    if (currentIndex != (widget.beginPosition.length - 1)) {
      // log("Finished"); ---------------------------- :)
      currentIndex++;
      setState(() {});
      _controller.dispose();
      setAnimation();
      // --------------------------------------------- :)
    }
  }

  slideBack() {
    if (currentIndex != (widget.beginPosition.length - 1)) {
      // log("Finished"); ---------------------------- :)
      currentIndex--;
      setState(() {});
      _controller.dispose();
      setAnimation();
      // --------------------------------------------- :)
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransitionXY(
      position: _position,
      child: widget.child,
    );
  }
}

// animated slide
class SlideTransitionXY extends AnimatedWidget {
  const SlideTransitionXY({
    super.key,
    required Animation<Offset> position,
    required this.child,
  }) : super(listenable: position);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Animation<Offset> position = listenable as Animation<Offset>;

    return Transform.translate(
      offset: position.value,
      child: child,
    );
  }
}
