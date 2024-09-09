import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class TeddyLoginScreen extends StatefulWidget {
  const TeddyLoginScreen({super.key});

  @override
  TeddyLoginScreenState createState() => TeddyLoginScreenState();
}

class TeddyLoginScreenState extends State<TeddyLoginScreen> {
  Artboard? _riveArtboard;
  late RiveAnimationController _idleController;
  late RiveAnimationController _lookAtTextController;
  late RiveAnimationController _handsUpController;
  late RiveAnimationController _handsDownController;
  late RiveAnimationController _successController;
  late RiveAnimationController _failController;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    // Load the Rive file and controllers
    rootBundle.load('assets/teddy.riv').then(
      (data) async {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;

        _idleController = SimpleAnimation('idle');
        _lookAtTextController = SimpleAnimation('look');
        _handsUpController = SimpleAnimation('hands_up');
        _handsDownController = SimpleAnimation('hands_down');
        _successController = SimpleAnimation('success');
        _failController = SimpleAnimation('fail');

        artboard.addController(_idleController);
        setState(() => _riveArtboard = artboard);
      },
    );

    // Set up focus listeners for email and password fields
    _emailFocusNode.addListener(() {
      if (_emailFocusNode.hasFocus) {
        _changeToLookAtText();
      } else {
        _changeToIdle();
      }
    });

    _passwordFocusNode.addListener(() {
      if (_passwordFocusNode.hasFocus) {
        _changeToHandsUp();
      } else {
        _changeToHandsDown();
      }
    });
  }

  // Animation Controls
  void _changeToLookAtText() {
    _riveArtboard?.addController(_lookAtTextController);
  }

  void _changeToHandsUp() {
    _riveArtboard?.addController(_handsUpController);
  }

  void _changeToHandsDown() {
    _riveArtboard?.addController(_handsDownController);
  }

  void _changeToSuccess() {
    _riveArtboard?.addController(_successController);
  }

  void _changeToFail() {
    _riveArtboard?.addController(_failController);
  }

  void _changeToIdle() {
    _riveArtboard?.addController(_idleController);
  }

  void _validateLogin() {
    // Dummy validation
    if (_passwordController.text == '1234') {
      _changeToSuccess();
    } else {
      _changeToFail();
    }
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_riveArtboard != null)
              SizedBox(
                height: 300,
                child: Rive(
                  artboard: _riveArtboard!,
                  fit: BoxFit.contain,
                ),
              ),
            TextField(
              controller: _emailController,
              focusNode: _emailFocusNode,
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (value) {
                // Teddy can look at the text when typing
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              focusNode: _passwordFocusNode,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _validateLogin,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
