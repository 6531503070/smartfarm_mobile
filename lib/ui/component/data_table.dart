import 'dart:ui';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart'
    hide Table, TableRow, TableCell;
import 'package:smartfarm_mobile/ui/hook/use_l10n.dart';
import 'package:smartfarm_mobile/ui/settings.dart';
import 'package:flutter/material.dart';

class DataTable extends HookWidget {
  final List<String> headers;
  final List<List<String>> rows;
  final bool headerRightAlign;
  final bool cellRightAlign;

  const DataTable({
    Key? key,
    required this.headers,
    required this.rows,
    this.headerRightAlign = false,
    this.cellRightAlign = false,
  }) : super(key: key);

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
      columnWidths: const {},
      children: [
        TableRow(
          children: headers
              .map((header) => buildHeaderCell(header, headerRightAlign))
              .toList(),
        ),
        ...rows.map((row) => TableRow(
              children:
                  row.map((cell) => buildCell(cell, cellRightAlign)).toList(),
            )),
      ],
    );
  }
}
