import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/loading_page/widgets/dot.dart';

class LoadingAnimation extends StatefulWidget {
  final Duration duration;

  const LoadingAnimation({
    super.key,
    this.duration = const Duration(milliseconds: 1000),
  });

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;
  late Animation<double> _animation4;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: widget.duration, vsync: this);

    _animation1 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.7, curve: Curves.ease),
      ),
    );

    _animation2 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.1, 0.8, curve: Curves.ease),
      ),
    );

    _animation3 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.9, curve: Curves.ease),
      ),
    );

    _animation4 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1.0, curve: Curves.ease),
      ),
    );

    _controller.addListener(() {
      setState(() {});
    });

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.translate(
          offset: _getOffset(_animation1),
          child: const Dot(),
        ),
        Transform.translate(
          offset: _getOffset(_animation2),
          child: const Dot(),
        ),
        Transform.translate(
          offset: _getOffset(_animation3),
          child: const Dot(),
        ),
        Transform.translate(
          offset: _getOffset(_animation4),
          child: const Dot(),
        ),
      ],
    );
  }

  Offset _getOffset(Animation<double> animation) => Offset(
        0.0,
        -30 *
            (animation.value <= 0.50 ? animation.value : 1.0 - animation.value),
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
