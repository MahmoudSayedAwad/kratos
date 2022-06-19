import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kratos/app/app_prefrences.dart';
import 'package:kratos/app/di.dart';
import 'package:kratos/presentation/register/bloc/register_bloc.dart';
import 'package:kratos/presentation/register/bloc/states.dart';
import 'package:kratos/presentation/resources/color_manager.dart';
import 'package:kratos/presentation/resources/font_manager.dart';
import 'package:kratos/presentation/resources/routes_manager.dart';
import 'package:kratos/presentation/resources/values_manager.dart';
import 'package:kratos/presentation/widgets/shared_widget.dart';

class MedicationScreen extends StatelessWidget {
  MedicationScreen({Key? key}) : super(key: key);

  final bool isMale = true;
  final bool switchButton = true;

  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _toTimeController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final ageController=TextEditingController();
  //final _genderController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final String startWork = TimeOfDay.now().hour.toString();
  final String endWork = TimeOfDay.now().hour.toString();
  final AppPreferences appPreferences = instance<AppPreferences>();
  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;

    return BlocProvider(
      create: (context) => instance<KratosRegisterCubit>(),
      child: BlocConsumer<KratosRegisterCubit, KratosRegisterStates>(
        listener: (BuildContext context, state) {
          if (state is KratosLoginByIDSuccessState) {
            appPreferences.setUserLogged(state.user);
            appPreferences.setUserLoggedIn();
            Navigator.pushReplacementNamed(context, Routes.bmiRoute,
                arguments: state.user);
          }
        },
        builder: (BuildContext context, Object? state) {
          KratosRegisterCubit cubit = KratosRegisterCubit.get(context);
          return Scaffold(
            backgroundColor: ColorManager.backgroundColor,
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: AppSize.s20),
                      child: buildLogo(),
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: buildTextFieldContainer(
                              controller: _weightController,
                              context: context,
                              type: TextInputType.number,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return "this field must not be empty";
                                } else if (int.parse(value) < 50) {
                                  return "weight must be greater than 50";
                                }
                                return null;
                              },
                              label: "Weight"),
                        ),
                        const SizedBox(
                          width: AppSize.s16,
                        ),
                        Expanded(
                          child: buildTextFieldContainer(
                              controller: _heightController,
                              context: context,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return "this field must not be empty";
                                } else if (int.parse(value) < 100) {
                                  return "height must be greater than 100";
                                }
                                return null;
                              },
                              type: TextInputType.number,
                              label: "Height"),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: buildTextFieldContainer(
                            controller: ageController,
                              context: context,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return "this field must not be empty";
                                } else if (int.parse(value) < 16) {
                                  return "age must be greater than 16";
                                }
                                return null;
                              },
                              type: TextInputType.number,
                              label: "Age"),
                        ),
                        const SizedBox(
                          width: AppSize.s16,
                        ),
                        Expanded(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppSize.s12,
                                  vertical: AppSize.s8),
                              child: Column(
                                children: [
                                  Align(
                                    child: Text(
                                      "Gender",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(fontSize: FontSize.s16),
                                    ),
                                    alignment: Alignment.topCenter,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            if(!cubit.isMale) {
                                              cubit.changeGender();
                                            }
                                          },
                                          child: Container(
                                            height: AppSize.s40,
                                            decoration: BoxDecoration(
                                              color: cubit.isMale
                                                  ? ColorManager.primary
                                                  : ColorManager.grey,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      AppSize.s28),
                                            ),
                                            child: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  "Male",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineMedium
                                                      ?.copyWith(
                                                          fontSize:
                                                              FontSize.s16,
                                                          color: ColorManager
                                                              .white),
                                                )),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: AppSize.s20,
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            if(cubit.isMale) {
                                              cubit.changeGender();
                                            }
                                          },
                                          child: Container(
                                            height: AppSize.s40,
                                            decoration: BoxDecoration(
                                              color: cubit.isMale
                                                  ? ColorManager.grey
                                                  : ColorManager.primary,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      AppSize.s28),
                                            ),
                                            child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                "Female",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineMedium
                                                    ?.copyWith(
                                                        fontSize: FontSize.s16,
                                                        color:
                                                            ColorManager.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            width: double.infinity,
                            height: AppSize.s90,
                            decoration: BoxDecoration(
                              color: ColorManager.white,
                              borderRadius: BorderRadius.circular(AppSize.s30),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    Container(
                      constraints: const BoxConstraints(
                        maxHeight: AppSize.s120,
                        minHeight: AppSize.s80,
                      ),
                      padding: const EdgeInsets.all(AppSize.s8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(AppSize.s30),
                      ),
                      child: Column(
                        children: [
                          Align(
                            child: Text(
                              "Working Hour",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(fontSize: FontSize.s16),
                            ),
                            alignment: Alignment.topCenter,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "From:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                          fontSize: FontSize.s16,
                                          color:
                                              ColorManager.darkGreyTextColor),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  readOnly: true,
                                  keyboardType: TextInputType.datetime,
                                  controller: _timeController,
                                  onTap: () {
                                    showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now())
                                        .then((value) => {
                                              if (value != null)
                                                _timeController.text = value
                                                    .format(context)
                                                    .toString()
                                            });
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'time must not be empty';
                                    }

                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "08:00 AM",
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                            fontSize: FontSize.s16,
                                            color:
                                                ColorManager.darkGreyTextColor),
                                    border: InputBorder.none,
                                    labelStyle: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(fontSize: FontSize.s16),
                                    floatingLabelAlignment:
                                        FloatingLabelAlignment.center,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "To:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                          fontSize: FontSize.s16,
                                          color:
                                              ColorManager.darkGreyTextColor),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _toTimeController,
                                  readOnly: true,
                                  onTap: () {
                                    showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now())
                                        .then((value) => {
                                              if (value != null)
                                                _toTimeController.text = value
                                                    .format(context)
                                                    .toString()
                                            });
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'time must not be empty';
                                    }

                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    // labelText: "To",
                                    hintText: "08:00 PM",
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                            fontSize: FontSize.s16,
                                            color:
                                                ColorManager.darkGreyTextColor),

                                    border: InputBorder.none,
                                    labelStyle: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(fontSize: FontSize.s16),
                                    floatingLabelAlignment:
                                        FloatingLabelAlignment.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(AppSize.s8),
                          child: Text("Do You Have Any Diseases"),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(AppSize.s8),
                          child: Switch(
                            value: cubit.switchButton,
                            onChanged: (value) {
                              cubit.changeSwitchButton(value);
                            },
                            activeColor: ColorManager.primary,
                          ),
                        )
                      ],
                    ),
                    buildTextFieldContainer(
                      context: context,
                      type: TextInputType.multiline,
                      hint: "Write Here",
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: ()  {
                          if (formKey.currentState!.validate()) {
                            cubit.userRegister(
                              name: arguments['name'],
                              password: arguments['password'],
                              height: int.parse(_heightController.text),
                              weight: int.parse(_weightController.text),
                              workingHours: _timeController.text,
                              gender: cubit.isMale ? 'Male' : 'female',
                              email: arguments['email'],
                              phone: arguments['phone'],
                              age: int.parse(ageController.text),
                            );
                          }
                        },
                        child: const SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: Center(child: Text("Save")),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: ColorManager.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.s16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSize.s20,)
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
