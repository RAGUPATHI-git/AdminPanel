import 'package:adminpanel/core/constants/fonts.dart';
import 'package:adminpanel/core/constants/gradients.dart';
import 'package:adminpanel/core/constants/sizes.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class DPaginationTable extends StatefulWidget {
  const DPaginationTable(
      {super.key,
      required this.columnSpacing,
      required this.minWidth,
      this.verticalScroll,
      required this.rowsPerPage,
      required this.source,
      required this.dataRowHeight,
      required this.column,
      this.checkBox = false});

  final double columnSpacing;
  final double minWidth;
  final bool? verticalScroll;
  final int rowsPerPage;
  final DataTableSource source;
  final double dataRowHeight;
  final List<DataColumn2> column;
  final bool checkBox;

  @override
  State<DPaginationTable> createState() => _DPaginationTableState();
}

class _DPaginationTableState extends State<DPaginationTable> {
  @override
  Widget build(BuildContext context) {
    // final HistoryController controller = Get.put(HistoryController());
    return PaginatedDataTable2(
      columnSpacing: widget.columnSpacing,
      minWidth: widget.minWidth,
      isVerticalScrollBarVisible: widget.verticalScroll,
      dividerThickness: 1,
      isHorizontalScrollBarVisible: true,
      border: TableBorder(borderRadius: BorderRadius.circular(10)),
      showCheckboxColumn: widget.checkBox,
      horizontalMargin: 12,
      dataRowHeight: widget.dataRowHeight,
      headingTextStyle: DFont.tableHeading,
      headingRowColor:
          WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        // Set color for data rows
        return Colors.blue; // example color
      }),
      rowsPerPage: widget.rowsPerPage,
      showFirstLastButtons: true,
      fixedColumnsColor: Colors.black,
      headingRowDecoration: const BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(DSizes.borderRadiusMd),
        topRight: Radius.circular(DSizes.borderRadiusMd),
      )),
      columns: List.of(widget.column),
      source: widget.source,
    );
  }
}
