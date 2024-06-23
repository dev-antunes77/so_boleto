import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/components/custom_pop_scope/custom_pop_scope.dart';
import 'package:so_boleto/core/components/loading_page/loading_page.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/core/utils/form_validator.dart';
import 'package:so_boleto/domain/models/user.dart';
import 'package:so_boleto/presenter/initial/cubit/initial_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isSignUp = false;

  void _togglePasswordVisibility() =>
      setState(() => _isPasswordVisible = !_isPasswordVisible);

  void _toggleSignUpAndSignIn() => setState(() {
        _isSignUp = !_isSignUp;
        _emailController.text = '';
        _passwordController.text = '';
      });

  late InitialCubit cubit;

  @override
  void initState() {
    cubit = context.read<InitialCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPopScope(
      leaveTheApp: true,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: BlocConsumer<InitialCubit, InitialState>(
          listenWhen: (previous, current) => previous.status != current.status,
          buildWhen: (previous, current) => previous.status != current.status,
          bloc: cubit,
          listener: (context, state) {
            if (state.status == BaseStateStatus.loading) {
              showDialog(
                context: context,
                builder: (context) => const LoadingPage2(),
              );
            }
            if (state.status == BaseStateStatus.generalError) {
              context.pop(true);
              context.showSnackBar(state.callbackMessage);
            }
            if (state.status == BaseStateStatus.success) {
              if (cubit.state.user!.hasSeenOnbording) {
                context.navigateTo(Routes.home);
              } else {
                context.navigateTo(Routes.onboarding);
              }
            }
          },
          builder: (context, state) {
            return state.when(
              onState: (_) => Padding(
                padding: const EdgeInsets.all(AppThemeValues.spaceMassive),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: Text(_isSignUp ? 'Cadastre-se' : 'Entre',
                              style: context.textLarge)),
                      if (_isSignUp) ...[
                        AppThemeValues.spaceVerticalLarge,
                        TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            labelText: 'Nome',
                            icon: Icon(Icons.person),
                          ),
                          validator: FormValidator.validateNames,
                        ),
                        AppThemeValues.spaceVerticalLarge,
                        TextFormField(
                          controller: _lastNameController,
                          decoration: const InputDecoration(
                            labelText: 'Sobrenome',
                            icon: Icon(Icons.person),
                          ),
                          validator: FormValidator.validateNames,
                        ),
                      ],
                      AppThemeValues.spaceVerticalLarge,
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          icon: Icon(Icons.email),
                        ),
                        validator: FormValidator.validateEmailField,
                      ),
                      AppThemeValues.spaceVerticalLarge,
                      TextFormField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          icon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: _isPasswordVisible
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                            onPressed: _togglePasswordVisibility,
                          ),
                        ),
                      ),
                      AppThemeValues.spaceVerticalLarge,
                      PillButton(
                          child: Text(
                            _isSignUp ? 'Cadastrar' : 'Entrar',
                          ),
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              _isSignUp ? _onSignUp() : _onSignIn();
                            }
                          }),
                      AppThemeValues.spaceVerticalLarge,
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: _isSignUp
                                  ? 'Já possui conta?  '
                                  : 'Ainda não tem conta? Cadastre-se  ',
                              style: context.textRobotoSmall,
                            ),
                            TextSpan(
                              text: _isSignUp ? 'Entrar' : 'Aqui',
                              style: context.textRobotoSmall.copyWith(
                                color: AppColors.primary,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => _toggleSignUpAndSignIn(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _onSignUp() => cubit.onSignUp(_buildUser());

  _onSignIn() => cubit.onSignIn(
        _emailController.text,
        _passwordController.text.encodePassword(),
      );

  _buildUser() => UserModel(
        name: _nameController.text,
        lastName: _lastNameController.text,
        email: _emailController.text,
        password: _passwordController.text.encodePassword(),
      );
}
