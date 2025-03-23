import 'package:adminpanel/common/layouts/tables/pagination_table.dart';
import 'package:adminpanel/core/constants/animations.dart';
import 'package:adminpanel/core/constants/gradients.dart';
import 'package:adminpanel/core/constants/input%20fields/basic_input.dart';
import 'package:adminpanel/features/students/student%20list/data/data%20source/student_datasource.dart';
import 'package:adminpanel/features/students/student%20list/domain/entities/student_list_entity.dart';
import 'package:adminpanel/features/students/student%20list/presentation/cubit/students_cubit.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class StudentListDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final studentCubit = context.read<StudentCubit>();
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: DGradients.premiumWhite),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: BasicInput(
                    label: "Search",
                    controller: searchController,
                    onChanged: (value) => studentCubit.searchStudents(value),
                  )),
            ),
            Expanded(
              child: BlocBuilder<StudentCubit, List<Student>>(
                builder: (context, students) {
                  if (students.isEmpty) {
                    return Center(
                        child: SizedBox(
                      height: 100,
                      width: 100,
                      child: LottieBuilder.asset(DAnimations.loading),
                    ));
                  }
                  return Row(
                    children: [
                      const SizedBox(
                        width: 0.1,
                      ),
                      Expanded(
                        child: Container(
                          height: 500,
                          width: 1500 - 230,
                          child: DPaginationTable(
                            columnSpacing: 12,
                            minWidth: 786,
                            rowsPerPage: 10,
                            source: StudentDataSource(students),
                            dataRowHeight: 56,
                            column: const [
                              DataColumn2(label: Text('Reg.No')),
                              DataColumn2(label: Text('Name')),
                              DataColumn2(label: Text('Department')),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
