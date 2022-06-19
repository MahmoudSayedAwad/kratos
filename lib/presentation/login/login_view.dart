import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kratos/app/di.dart';
import 'package:kratos/presentation/login/bloc/login_states.dart';
import 'package:kratos/presentation/resources/color_manager.dart';
import 'package:kratos/presentation/resources/font_manager.dart';
import 'package:kratos/presentation/resources/routes_manager.dart';
import 'package:kratos/presentation/resources/values_manager.dart';
import 'package:kratos/presentation/widgets/shared_widget.dart';

import '../../app/app_prefrences.dart';
import 'bloc/login_bloc.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => instance<KratosLoginCubit>(),
      child: BlocConsumer<KratosLoginCubit, KratosLoginStates>(
        listener: (BuildContext context, state) {
          if (state is KratosLoginSuccessState) {
            _appPreferences.setUserLoggedIn();
            _appPreferences.setUserLogged(state.user);

            Navigator.pushReplacementNamed(context, Routes.mainRoute);
          }
          if (state is KratosLoginFailureState) {
            showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(state.failure!.message),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('ok'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
        builder: (BuildContext context, state) {
          KratosLoginCubit cubit = KratosLoginCubit.get(context);
          return Scaffold(
            backgroundColor: ColorManager.backgroundColor,
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: AppSize.s20),
                      child: buildLogo(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: AppSize.s16, top: AppSize.s10),
                      child: buildHeader(context, "Sign in", "Welcome Back"),
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    buildTextFieldContainer(
                      context: context,
                      label: "User Name",
                      type: TextInputType.name,
                      controller: nameController,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    buildTextFieldContainer(
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'password is too short';
                        } else if (value.length < 8) {
                          return "password must be 8 character or more ";
                        }
                        return null;
                      },
                      controller: passwordController,
                      context: context,
                      label: "Password",
                      type: TextInputType.visiblePassword,
                      isPassword: cubit.isPassword,
                      suffix: cubit.isPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      suffixPressed: () {
                        cubit.changePasswordVisibility();
                      },
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    Center(
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forget password?",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(fontSize: 16),
                            ))),
                    const SizedBox(
                      height: AppSize.s20,
                    ),

                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppSize.s20),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            cubit.userLogin(
                                name: nameController.text,
                                password: passwordController.text);
                          }
                        },
                        child: const SizedBox(
                          width: double.infinity,
                          height: AppSize.s50,
                          child: Center(child: Text("Let's Get Started")),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: ColorManager.secondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.s16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s32,
                    ),
                    Row(
                      children: [
                        Text(
                          'Does not have account?',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(color: ColorManager.secondary),
                        ),
                        TextButton(
                          child: Text(
                            'Sign UP',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                    color: ColorManager.secondary,
                                    decoration: TextDecoration.underline,
                                    fontSize: FontSize.s16),
                          ),
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, Routes.registerRoute);
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
