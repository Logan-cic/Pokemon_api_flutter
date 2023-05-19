import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class CardAnimation extends StatefulWidget {
  final Widget child;

  const CardAnimation({Key? key, required this.child}) : super(key: key);

  @override
  _CardAnimationState createState() => _CardAnimationState();
}

class _CardAnimationState extends State<CardAnimation> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _opacityAnimation;
  Animation<Offset>? _translateAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_animationController!);
    _translateAnimation = Tween<Offset>(begin: Offset(0.25, 0), end: Offset.zero).animate(_animationController!);

    _animationController?.forward();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_translateAnimation!.value.dx * MediaQuery.of(context).size.width, 0),
          child: Opacity(
            opacity: _opacityAnimation!.value,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
