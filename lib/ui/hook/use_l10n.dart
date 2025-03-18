import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartfarm_mobile/gen_l10n/l10n.dart';

L10n useL10n() {
  final context = useContext();
  return L10n.of(context)!;
}