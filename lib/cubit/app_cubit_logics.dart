import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_state.dart';
import 'package:travel_app/pages/detailes_page.dart';
import 'package:travel_app/pages/home_page.dart';
import 'package:travel_app/pages/welcome_page.dart';

class AppCubitLogics extends StatelessWidget {
  const AppCubitLogics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitState>(builder: (context, state) {
        if (state is WelcomeState) {
          return const WelcomePage();
        } else if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoadedState) {
          return const HomePage();
        } else {
          return Container();
        }
        ;
      }),
    );
  }
}
