import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartfarm_mobile/gen/assets.gen.dart';
import 'package:smartfarm_mobile/ui/component/bottom_bar.dart';
import 'package:smartfarm_mobile/ui/hook/use_l10n.dart';
import 'package:smartfarm_mobile/ui/theme/app_colors.dart';

class HomePage extends StatefulHookWidget {
  const HomePage({Key? key}) : super(key: key);
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    final colors = AppColors.light();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.background,
        elevation: 4,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text(
          "Home",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,

        leadingWidth: 160,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 6),
              child: Image(
                image: Assets.images.logo.provider(),
                width: 120,
                height: kToolbarHeight / 1.75,
                fit: BoxFit.fitHeight,
              ),
            ),
          ],
        ),
        
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                
              },
            ),
          ),
        ],
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '<Home>',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomBar(currentIndex: 1),
    );
  }
}