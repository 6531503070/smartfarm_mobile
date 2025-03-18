import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartfarm_mobile/gen/assets.gen.dart';
import 'package:smartfarm_mobile/ui/component/bottom_bar.dart';
import 'package:smartfarm_mobile/ui/hook/use_l10n.dart';
import 'package:smartfarm_mobile/ui/theme_manager.dart';
import 'package:smartfarm_mobile/ui/theme/app_colors.dart';

class EnglishAndEmailTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text.replaceAll(RegExp(r'[^\w\s@.-]'), '');

    // Ensure the cursor position is maintained correctly
    final selectionIndex = newText.length;
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

class LoginPage extends StatefulHookWidget {
  const LoginPage({Key? key}) : super(key: key);
  
  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    final colors = AppColors.light();
    final themeMode = useState<String>("system");

    useEffect(() {
      Future<void> loadTheme() async {
        String savedTheme = await ThemeManager.loadTheme();
        themeMode.value = savedTheme;
      }

      loadTheme();
      return null;
    }, []);

    void setTheme(String value) async {
      await ThemeManager.saveTheme(value);
      themeMode.value = value;
    }

    ThemeMode currentThemeMode;
    switch (themeMode.value) {
      case "light":
        currentThemeMode = ThemeMode.light;
        break;
      case "dark":
        currentThemeMode = ThemeMode.dark;
        break;
      default:
        currentThemeMode = ThemeMode.system;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      
      body: Form(
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
                    image: Assets.images.logo.provider(),
                    height: 100,
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      l10n.projectName,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),

                  SizedBox(height: 60),
                  
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      l10n.welcomeSignIn,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  
                  SizedBox(height: 16),
                  
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.text,
                    inputFormatters: [EnglishAndEmailTextInputFormatter()],
                    validator: (value) {
                      // add email validation
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      
                      bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
                      if (!emailValid) {
                        return 'Please enter a valid email';
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  
                  TextFormField(
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
                    decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
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

                  SizedBox(height: 16),

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
                  
                  SizedBox(height: 16),
                  SizedBox(height: 16),
                   
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
                                color: Colors.grey.withOpacity(0.7),
                                blurRadius: 5,
                                offset: Offset(3, 3),
                                spreadRadius: 3)
                          ]),
                      
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 5),
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
                          padding: EdgeInsets.all(10.0),
                          child: _isSigningIn
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  l10n.signIn,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                        ),
                        onPressed: _signIn,
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
    if (!_formKey.currentState!.validate()) {
      setState(() {
        _isSigningIn = true;
      });

      setState(() {
        _isSigningIn = false;
      });
    } else {
      setState(() {
        _isSigningIn = true;
      });

      String email = emailController.text;
      String password = passwordController.text;

      setState(() {
        _isSigningIn = false;
      });

      bool isVerified = true;
      if (isVerified) {
        // showToast(message: "Sign in successfully");
        // globalEmail = email; // Store email globally
        // globalPassword = password; // Store password globally
        Navigator.pushNamed(context, '/home');
      }
    }
  }
}