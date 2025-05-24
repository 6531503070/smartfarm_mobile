import 'dart:ui';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:smartfarm_mobile/ui/hook/use_l10n.dart';
import 'package:smartfarm_mobile/ui/settings.dart';

class DataTable extends HookWidget {
  const DataTable({Key? key}) : super(key: key);

  TableCell buildHeaderCell(String text, [bool alignRight = false]) {
    return TableCell(
      child: Container(
        padding: const EdgeInsets.all(8),
        alignment: alignRight ? Alignment.centerRight : null,
        child: Text(text).muted().semiBold(),
      ),
    );
  }

  TableCell buildCell(String text, [bool alignRight = false]) {
    return TableCell(
      child: Container(
        padding: const EdgeInsets.all(8),
        alignment: alignRight ? Alignment.centerRight : null,
        child: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      rows: [
        TableRow(
          cells: [
            buildHeaderCell('Zone'),
            buildHeaderCell('Status'),
            buildHeaderCell('Overall Yield'),
            buildHeaderCell('Size/Grade'),
          ],
        ),
        TableRow(
          cells: [
            buildCell('Zone 1'),
            buildCell('Growing'),
            buildCell('High'),
            buildCell('Large/A'),
          ],
        ),
        TableRow(
          cells: [
            buildCell('Zone 2'),
            buildCell('Seeding'),
            buildCell('Medium'),
            buildCell('Medium/B'),
          ],
        ),
        TableRow(
          cells: [
            buildCell('Zone 1'),
            buildCell('Harvesting'),
            buildCell('High'),
            buildCell('Large/A'),
          ],
        ),
        TableRow(
          cells: [
            buildCell('Zone 3'),
            buildCell('Shipped'),
            buildCell('Low'),
            buildCell('Small/C'),
          ],
        ),
        TableRow(
          cells: [
            buildCell('Zone 2'),
            buildCell('Spoiled'),
            buildCell('N/A'),
            buildCell('N/A'),
          ],
        ),
        TableRow(
          cells: [
            buildCell('Zone 1'),
            buildCell('Growing'),
            buildCell('Medium'),
            buildCell('Medium/B'),
          ],
        ),
        TableRow(
          cells: [
            buildCell('Zone 1'),
            buildCell('Harvesting'),
            buildCell('High'),
            buildCell('Large/A'),
          ],
        ),
      ],
    );
  }
}
