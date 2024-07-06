import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';

class Dot extends StatelessWidget {
  const Dot({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Center(
        child: Container(
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
            color: context.read<ThemeCubit>().state.selectedColors.primary,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
