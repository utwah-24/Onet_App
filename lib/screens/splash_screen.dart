import 'package:flutter/material.dart';
import 'package:state_management/custom_/custom_home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _rotateAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _textFadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeOutBack),
      ),
    );

    _rotateAnimation = Tween<double>(begin: 0.0, end: 2 * 3.14159).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeOutBack),
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.5, curve: Curves.easeIn),
      ),
    );

    _slideAnimation = Tween<double>(begin: 50.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.5, curve: Curves.easeOut),
      ),
    );

    _textFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.6, curve: Curves.easeIn),
      ),
    );

    _controller.forward().then((_) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const CustomHome()),
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.red.shade50,
              Colors.white,
            ],
          ),
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Transform.rotate(
                      angle: _rotateAnimation.value,
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: Image.asset(
                          'assets/logo.png',
                          width: 150,
                          height: 150,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Transform.translate(
                    offset: Offset(0, _slideAnimation.value),
                    child: FadeTransition(
                      opacity: _textFadeAnimation,
                      child: Column(
                        children: [
                          Text(
                            'Welcome to',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                              letterSpacing: 2,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'ONET',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                              letterSpacing: 4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  FadeTransition(
                    opacity: _textFadeAnimation,
                    child: Text(
                      'Your One-Stop Shop',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
