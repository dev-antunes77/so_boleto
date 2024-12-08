import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/components/custom_pop_scope/custom_pop_scope.dart';
import 'package:so_boleto/core/components/loading_page/loading_animation.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/core/utils/form_validator.dart';
import 'package:so_boleto/domain/models/user_data.dart';
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
  late InitialCubit cubit;

  void _togglePasswordVisibility() =>
      setState(() => _isPasswordVisible = !_isPasswordVisible);

  void _toggleSignUpAndSignIn() => setState(() {
        _isSignUp = !_isSignUp;
        _emailController.text = '';
        _passwordController.text = '';
      });

  void _onTextChanged(TextEditingController controller) {
    String text = controller.text;
    if (text.isEmpty) {
      return;
    }
    String capitalizedText = text[0].toUpperCase() + text.substring(1);
    if (text != capitalizedText) {
      controller.text = capitalizedText;
      controller.selection = TextSelection.fromPosition(
        TextPosition(offset: capitalizedText.length),
      );
    }
  }

  @override
  void initState() {
    cubit = context.read<InitialCubit>();
    cubit.state.user == null ? _isSignUp = true : false;
    _nameController.addListener(() => _onTextChanged(_nameController));
    _lastNameController.addListener(() => _onTextChanged(_lastNameController));
    super.initState();
  }

  @override
  void dispose() {
    _nameController.removeListener(() => _onTextChanged(_nameController));
    _lastNameController
        .removeListener(() => _onTextChanged(_lastNameController));
    _nameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPopScope(
      leaveTheApp: true,
      child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        body: SingleChildScrollView(
          child: BlocConsumer<InitialCubit, InitialState>(
            listenWhen: (previous, current) =>
                previous.status != current.status,
            buildWhen: (previous, current) => previous.status != current.status,
            bloc: cubit,
            listener: (context, state) {
              if (state.status == BaseStateStatus.generalError) {
                context.pop(true);
                context.showSnackBar(state.callbackMessage);
              }
              _whenStateIsLoading(state.status == BaseStateStatus.loading);
              _whenLogInIsSuccessful(state.status == BaseStateStatus.success);
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
                            child: Text(
                                _isSignUp
                                    ? AppLocalizations.current.signUp
                                    : AppLocalizations.current.signIn,
                                style: context.textLarge)),
                        if (_isSignUp) ...[
                          AppThemeValues.spaceVerticalLarge,
                          TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: AppLocalizations.current.loginName,
                              icon: const Icon(Icons.person_4_outlined),
                            ),
                            validator: FormValidator.validateNames,
                          ),
                          AppThemeValues.spaceVerticalLarge,
                          TextFormField(
                            controller: _lastNameController,
                            decoration: InputDecoration(
                              labelText: AppLocalizations.current.loginSurename,
                              icon: const Icon(Icons.person_4),
                            ),
                            validator: FormValidator.validateNames,
                          ),
                        ],
                        AppThemeValues.spaceVerticalLarge,
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.current.loginEmail,
                            icon: const Icon(Icons.email),
                          ),
                          validator: FormValidator.validateEmailField,
                        ),
                        AppThemeValues.spaceVerticalLarge,
                        TextFormField(
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.current.loginPassword,
                            icon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: _isPasswordVisible
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              onPressed: _togglePasswordVisibility,
                            ),
                          ),
                        ),
                        AppThemeValues.spaceVerticalImense,
                        PillButton(
                            child: Text(
                              _isSignUp
                                  ? AppLocalizations.current.signUpTitle
                                  : AppLocalizations.current.signInTitle,
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
                                    ? AppLocalizations
                                        .current.loginHasAccountAlready
                                    : AppLocalizations.current.loginNoAccount,
                                style: context.textRobotoMediumToLarge.copyWith(
                                  color: AppColors.black,
                                ),
                              ),
                              TextSpan(
                                text: _isSignUp
                                    ? AppLocalizations.current.signIn
                                    : AppLocalizations.current.loginHere,
                                style: context.textRobotoMediumToLarge.copyWith(
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
      ),
    );
  }

  _whenStateIsLoading(bool match) {
    if (match) {
      showDialog(
        context: context,
        builder: (context) => const LoadingAnimation(),
      );
    }
  }

  _whenLogInIsSuccessful(bool match) {
    context.navigateTo(Routes.home);

    // if (match) {
    //   if (cubit.state.user!.hasSeenOnboarding) {
    //     context.navigateTo(Routes.home);
    //   } else {
    //     context.navigateTo(Routes.onboarding);
    //   }
    // }
  }

  _onSignUp() => cubit.onSignUp(_buildUser());

  _onSignIn() => cubit.onSignIn(
        _emailController.text,
        _passwordController.text.encodePassword(),
      );

  _buildUser() => UserData(
        name: _nameController.text,
        lastName: _lastNameController.text,
        email: _emailController.text,
        password: _passwordController.text.encodePassword(),
      );
}
