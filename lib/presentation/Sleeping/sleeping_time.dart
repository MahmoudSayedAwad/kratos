import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kratos/app/app_prefrences.dart';
import 'package:kratos/presentation/resources/color_manager.dart';
import 'package:kratos/presentation/resources/routes_manager.dart';

import '../../app/di.dart';
import '../resources/assets_manager.dart';
import '../resources/values_manager.dart';

class SleepingTime extends StatelessWidget {
  SleepingTime({Key? key}) : super(key: key);
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _secondTimeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late int sleepingTime;
  late int wakeupTime;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.primary,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 16),
                  height: 120,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(80),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 22,
                        ),
                      ),
                      const FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Sleeping\n Time",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SvgPicture.asset(
                        ImageAssets.splashLogo,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: AppSize.s100,
                ),
                buildCard(
                  first: "When Did You Sleep ?",
                  readOnly: true,
                  keyboardType: TextInputType.datetime,
                  controller: _timeController,
                  onTap: () {
                    showTimePicker(
                            context: context, initialTime: TimeOfDay.now())
                        .then((value) => {
                              if (value != null)
                                {
                                  _timeController.text =
                                      value.format(context).toString(),
                                  sleepingTime = value.hour
                                }
                            });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'time must not be empty';
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: AppSize.s50,
                ),
                buildCard(
                  first: "WHEN DID YOU WAKEUP ?",
                  readOnly: true,
                  keyboardType: TextInputType.datetime,
                  controller: _secondTimeController,
                  onTap: () {
                    showTimePicker(
                            context: context, initialTime: TimeOfDay.now())
                        .then((value) => {
                              if (value != null)
                                {
                                  _secondTimeController.text =
                                      value.format(context).toString(),
                                  wakeupTime = value.hour
                                }
                            });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'time must not be empty';
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: AppSize.s32,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.25),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        int total = (wakeupTime - sleepingTime);

                        if (total.isNegative) {
                          total = total * -1;
                        }

                        _appPreferences
                            .setNum("sleeping", total)
                            .whenComplete(() {
                          Navigator.pushReplacementNamed(
                              context, Routes.mainRoute);
                        });
                      }
                    },
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Center(
                          child: Text(
                        "Save",
                        style: TextStyle(color: ColorManager.darkGreyTextColor),
                      )),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: ColorManager.white,
                      elevation: AppSize.s1_5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

Padding buildCard(
    {required String first,
    bool? readOnly,
    TextInputType? keyboardType,
    String? Function(dynamic value)? validator,
    Function()? onTap,
    controller}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: AppSize.s28),
    child: Container(
      padding: const EdgeInsets.fromLTRB(
          AppSize.s16, AppSize.s8, AppSize.s16, AppSize.s8),
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(AppSize.s28),
        border: Border.all(width: AppSize.s1, color: ColorManager.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FittedBox(
            child: Text(
              first,
              style: const TextStyle(
                fontSize: 23,
                color: Color(0xffd68a13),
                fontWeight: FontWeight.w700,
              ),
              softWrap: false,
            ),
          ),
          Expanded(
            child: TextFormField(
              onTap: onTap,
              readOnly: readOnly ?? false,
              controller: controller,
              keyboardType: keyboardType,
              validator: validator,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0, style: BorderStyle.none)),
                hintText: "Type Here ",
                hintStyle: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 15,
                  color: Color(0x80d68a13),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
