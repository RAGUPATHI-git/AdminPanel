import 'package:adminpanel/common/layouts/tables/pagination_table.dart';
import 'package:adminpanel/core/constants/animations.dart';
import 'package:adminpanel/core/constants/gradients.dart';
import 'package:adminpanel/core/constants/input%20fields/basic_input.dart';
import 'package:adminpanel/core/constants/input%20fields/drop_down_input.dart';
import 'package:adminpanel/core/constants/sizes.dart';
import 'package:adminpanel/core/helper%20functions/department.dart';
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

    String selectedDepartment = 'All';
    String selectedYear = 'All';
    return Scaffold(
      body: Container(
        // decoration: const BoxDecoration(gradient:),
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
            Row(
              children: [
                SizedBox(
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropDownInput(
                        label: "Department",
                        items: HelperFunctions.departmentNames,
                        onChanged: (value) {
                          if (value != null) {
                            selectedDepartment = value;
                            studentCubit.filterByDepartment(value);
                          }
                        }),
                  ),
                ),
                const SizedBox(
                  width: DSizes.spaceBtwItems,
                ),
                SizedBox(
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropDownInput(
                        label: "Year",
                        items: HelperFunctions.yearNames,
                        onChanged: (value) {
                          if (value != null) {
                            selectedYear = value;
                            studentCubit.filterByYear(value);
                          }
                        }),
                  ),
                ),
                const SizedBox(
                  width: DSizes.spaceBtwItems,
                ),
              ],
            ),
            Expanded(
              child: BlocBuilder<StudentCubit, List<Student>>(
                builder: (context, students) {
                  if (students.isEmpty) {
                    return Center(
                        child: SizedBox(
                      height: 300,
                      width: 300,
                      child: LottieBuilder.asset(DAnimations.noData),
                    ));
                  }
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 0.1,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 2),
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
                                  DataColumn2(label: Text('Year')),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
