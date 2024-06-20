import 'package:flutter/material.dart';
import 'package:task_app/constants/hd_colors.dart';
import 'package:task_app/main.dart';
import 'package:task_app/task_list_widget.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation1;
  late Animation<Color?> _colorAnimation2;
  late Animation<Color?> _colorAnimation3;
  late Animation<Color?> _colorAnimation4;
  late Animation<Color?> _colorAnimation5;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat(reverse: true);

    _colorAnimation1 = ColorTween(
      begin: HDColors.orangeDark,
      end: HDColors.lemonLight,
    ).animate(_controller);

    _colorAnimation2 = ColorTween(
      begin: HDColors.lemonLight,
      end: HDColors.orangeDark,
    ).animate(_controller);

    _colorAnimation3 = ColorTween(
      begin: HDColors.orangeLight,
      end: HDColors.lemonLight,
    ).animate(_controller);
    _colorAnimation4 = ColorTween(
      begin: HDColors.lemonLight,
      end: HDColors.orangeLight,
    ).animate(_controller);
    _colorAnimation5 = ColorTween(
      begin: HDColors.raspberryLight,
      end: HDColors.lemonLight,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  tileMode: TileMode.mirror,
                  colors: [
                    _colorAnimation1.value!,
                    _colorAnimation2.value!,
                    _colorAnimation3.value!,
                    _colorAnimation4.value!,
                    _colorAnimation5.value!,
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
