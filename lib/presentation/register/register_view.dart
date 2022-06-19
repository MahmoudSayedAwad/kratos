import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kratos/app/di.dart';
import 'package:kratos/presentation/register/bloc/register_bloc.dart';
import 'package:kratos/presentation/register/bloc/states.dart';
import 'package:kratos/presentation/resources/color_manager.dart';
import 'package:kratos/presentation/resources/font_manager.dart';
import 'package:kratos/presentation/resources/routes_manager.dart';
import 'package:kratos/presentation/resources/strings_manager.dart';
import 'package:kratos/presentation/resources/values_manager.dart';
import 'package:kratos/presentation/widgets/shared_widget.dart';

import '../../app/function.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => instance<KratosRegisterCubit>(),
      child: BlocConsumer<KratosRegisterCubit, KratosRegisterStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          KratosRegisterCubit cubit = KratosRegisterCubit.get(context);
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
                      child: buildHeader(
                          context, AppStrings.signUp, AppStrings.signUpHeader),
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    buildTextFieldContainer(
                      context: context,
                      label: "E-mail",

                      type: TextInputType.emailAddress,
                      controller: emailController,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your name';
                        }else if(!isEmailValid(value)){
                          return "please write Email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    buildTextFieldContainer(
                      context: context,
                      label: AppStrings.fullName,
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
                      context: context,
                      label: AppStrings.phoneNumber,
                      type: TextInputType.phone,
                      controller: phoneController,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'please enter your phone number';
                        }else if(value.length!=11){
                          return "phone number must be 11 character ";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    buildTextFieldContainer(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      suffix: cubit.suffix,
                      isPassword: cubit.isPassword,
                      suffixPressed: () {
                        cubit.changePasswordVisibility();
                      },
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'password is too short';
                        }else if(value.length<8){
                          return "password must be 8 character or more ";
                        }
                        return null;
                      },
                      context: context,
                      label: AppStrings.password,
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppSize.s20),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: SizedBox(
                          width: double.infinity,
                          height: AppSize.s50,
                          child: Center(
                              child: Text(
                            AppStrings.connectWithFacebook,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(fontSize: FontSize.s16,color: const Color(0xff0066FF)),
                          )),
                        ),
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                            width: AppSize.s1,
                            color: Color(0xff0066FF),
                          ),
                          primary: ColorManager.backgroundColor,
                          elevation: AppSize.s0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.s16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: AppSize.s20),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: SizedBox(
                          width: double.infinity,
                          height: AppSize.s50,
                          child: Center(
                              child: Text(
                                "Connect with google",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(fontSize: FontSize.s16,color: const Color(0xffEF6F6F)),
                              )),
                        ),
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                            width: AppSize.s1,
                            color: Color(0xffEF6F6F),
                          ),
                          primary: ColorManager.backgroundColor,
                          elevation: AppSize.s0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.s16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppSize.s20),
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.pushNamed(context, Routes.medicationRoute,
                                arguments: {
                                  "name": nameController.text,
                                  "password": passwordController.text,
                                  "phone":phoneController.text,
                                  "email":emailController.text
                                });
                          }
                        },
                        child: const SizedBox(
                          width: double.infinity,
                          height: AppSize.s50,
                          child: Center(child: Text(AppStrings.letsGetStarted)),
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
                      height: AppSize.s30,
                    ),
                    Row(
                      children: [
                        Text(
                          AppStrings.doYouHaveAccount,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(color: ColorManager.secondary),
                        ),
                        TextButton(
                          child: Text(
                            AppStrings.signIn,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                    color: ColorManager.secondary,
                                    decoration: TextDecoration.underline,
                                    fontSize: FontSize.s16),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.loginRoute);

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
