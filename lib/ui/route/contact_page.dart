import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartfarm_mobile/ui/hook/use_l10n.dart';
import 'package:smartfarm_mobile/ui/theme/app_colors.dart';

class ContactPage extends StatefulHookWidget {
  const ContactPage({Key? key}) : super(key: key);
  
  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    final colors = AppColors.light();

    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
     
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Contact Information:',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}