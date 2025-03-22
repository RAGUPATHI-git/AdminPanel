import 'package:adminpanel/features/test/bussiness_logic/entities/test_entity.dart';
import 'package:adminpanel/features/test/presentation/cubit/test_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class TestDesktop extends StatelessWidget {
  const TestDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TestCubit, TestState>(
      listener: (context, state) {
        if (state is TestSuccess) {
          showTopSnackBar(Overlay.of(context),
              CustomSnackBar.success(message: state.message));
        }
        if(state is TestDelete){
               showTopSnackBar(Overlay.of(context),
              CustomSnackBar.error(message: state.message));
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Users')),
        body: BlocBuilder<TestCubit, TestState>(
          builder: (context, state) {
            if (state is TestLoaded) {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text('Age: ${user.age}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () =>
                          context.read<TestCubit>().deleteUser(user.id),
                    ),
                  );
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            final user = TestEntity(id: '1', name: 'John Doe', age: 25);
            context.read<TestCubit>().addUser(user);
          },
        ),
      ),
    );
  }
}
