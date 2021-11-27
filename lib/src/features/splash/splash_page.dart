import 'package:flutter/material.dart';
import 'package:movieapp/src/common/constants/assets.dart';
import 'package:movieapp/src/common/constants/strings.dart';

class SplashPage extends StatefulWidget {
  // final VoidCallback onInitializationComplete;
  // const SplashPage({Key? key, required this.onInitializationComplete})
  // : super(key: key);
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // widget.onInitializationComplete;
    Future.delayed(const Duration(milliseconds: 1500), () {
      // Navigate to homepage
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: AppStrings.kAppName,
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  // animation duration
  int duration = 1500;
  late final AnimationController _controller = AnimationController(
    duration: Duration(milliseconds: duration),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();
    _controller.animateTo(1.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _animation,
        child: SafeArea(
          child: Center(
            child: Image.asset(ImageAsset.kLogo),
          ),
        ),
      ),
    );
  }
}
