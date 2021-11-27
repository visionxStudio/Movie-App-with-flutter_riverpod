import 'dart:convert';

import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:movieapp/src/common/constants/assets.dart';
import 'package:movieapp/src/common/constants/strings.dart';
import 'package:movieapp/src/models/app_config.dart';
import 'package:movieapp/src/routes/app_routes.gr.dart';
import 'package:movieapp/src/services/http_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _setup(context);
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        // Navigate to homepage
        context.router.replace(const HomepageRoute());
      },
    );
  }

  Future<void> _setup(BuildContext context) async {
    final GetIt getIt = GetIt.instance;
    final configFile = await rootBundle.loadString('assets/config/main.json');
    final configData = jsonDecode(configFile);
    getIt.registerSingleton<AppConfig>(
      AppConfig(
        apiKey: configData["API_KEY"],
        baseApiUrl: configData["BASE_API_URL"],
        baseImageApiUrl: configData["BASE_IMAGE_API_URL"],
      ),
    );
    getIt.registerSingleton<HttpService>(HttpService());
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
