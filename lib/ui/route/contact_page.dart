import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:flutter/material.dart' as material;

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartfarm_mobile/ui/hook/use_l10n.dart';
import 'package:smartfarm_mobile/ui/theme/app_colors.dart';

class ContactPage extends HookWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    final colors = AppColors.light();

    return Scaffold(
      // Header-Content
      headers: [],

      // Footer-Content
      footers: [],

      backgroundColor: colors.background,
      child: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - material.kToolbarHeight,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: DefaultTextStyle(
                  style: const TextStyle(fontSize: 22), // Increased font size
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Body-Content
                      CardButton(
                        size: ButtonSize(2),
                        onPressed: () {},
                        child: const Basic(
                          title: Text('Contact us'),
                          subtitle: Text('(email, facebook)'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(''),
                              Text('Email:'),
                              Text('- 6531503070@lamduan.mfu.ac.th'),
                              Text('- 6531503074@lamduan.mfu.ac.th'),
                              Text('- 6531503078@lamduan.mfu.ac.th'),
                              Text('- 6531503086@lamduan.mfu.ac.th'),
                              Text(''),
                              Text('Facebook:'),
                              Text('- facebook.com/smartfarm'),
                            ],
                          ),
                        ),
                      ),
                      
                      SizedBox(height: 32),

                      PrimaryButton(
                        size: ButtonSize(1.4),
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text('Back to Login'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),

      // bottomNavigationBar: BottomBar(currentIndex: -1),
    );
  }
}