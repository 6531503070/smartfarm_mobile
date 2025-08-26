import 'package:flutter/material.dart' as material;
import 'package:shadcn_flutter/shadcn_flutter.dart';

import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartfarm_mobile/gen/assets.gen.dart';
import 'package:smartfarm_mobile/ui/hook/use_l10n.dart';
import 'package:smartfarm_mobile/ui/route/navigation_service.dart';
import 'package:smartfarm_mobile/ui/theme/app_colors.dart';
import 'package:smartfarm_mobile/util/login_manager.dart';
import 'package:smartfarm_mobile/util/performance_monitor.dart';

class LoginPage extends StatefulHookWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> with PerformanceTracking {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _rememberMe = false;
  bool _isSigningIn = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final GlobalKey<material.FormState> _formKey =
      GlobalKey<material.FormState>();

  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    final colors = AppColors.light();

    // Memoize the logo image to prevent recreation on every build
    final logoImage = useMemoized(() => Assets.images.logo.provider(), []);

    return Scaffold(
      headers: [
        AppBar(
          height: 0,
          title: const Text(""),
        ),
      ],
      footers: [],
      child: Form(
        key: _formKey,
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 350),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: logoImage,
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      l10n.projectName,
                      style: material.Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  const SizedBox(height: 60),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      l10n.welcomeSignIn,
                      style: material.Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 16),
                  material.TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.text,
                    inputFormatters: [EnglishAndEmailTextInputFormatter()],
                    validator: (value) {
                      // add email validation
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);
                      if (!emailValid) {
                        return 'Please enter a valid email';
                      }

                      return null;
                    },
                    decoration: const material.InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      prefixIcon: Icon(Icons.email_outlined),
                      border: material.OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  material.TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    obscureText: !_isPasswordVisible,
                    decoration: material.InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        border: const material.OutlineInputBorder(),
                        suffixIcon: material.IconButton(
                          icon: Icon(_isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        )),
                  ),
                  const SizedBox(height: 16),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/contact');
                        },
                        child: Text(
                          l10n.forgotPasswordOrContactUs,
                          style: TextStyle(color: colors.accent),
                        )),
                  ]),
                  const SizedBox(height: 16),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            colors.signIn,
                            colors.signIn,
                          ]),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: material.Colors.grey.withOpacity(0.7),
                                blurRadius: 5,
                                offset: const Offset(3, 3),
                                spreadRadius: 3)
                          ]),
                      child: material.ElevatedButton(
                        onPressed: _signIn,
                        style: material.ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          backgroundColor: Colors.transparent,
                          disabledForegroundColor:
                              Colors.transparent.withOpacity(0.38),
                          disabledBackgroundColor:
                              Colors.transparent.withOpacity(0.12),
                          shadowColor: Colors.transparent,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: _isSigningIn
                              ? const material.CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  l10n.signIn,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    NavigationService.navigateToHome();
  }
}
