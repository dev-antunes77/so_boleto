import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/custom_app_bar/custom_app_bar.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class TutotialPage extends StatefulWidget {
  const TutotialPage({super.key});

  @override
  State<TutotialPage> createState() => _TutotialPageState();
}

class _TutotialPageState extends State<TutotialPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, AppThemeValues.spaceEnormous),
        child: CustomAppBar(
          title: 'teste',
          actions: [],
        ),
      ),
      body: Container(color: Colors.amber),
    );
  }
}
