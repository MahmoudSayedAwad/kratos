
import 'package:flutter/material.dart';
import 'package:kratos/app/app_prefrences.dart';
import 'package:kratos/app/di.dart';
import 'package:kratos/presentation/resources/color_manager.dart';
import 'package:kratos/presentation/resources/font_manager.dart';
import 'package:kratos/presentation/resources/routes_manager.dart';
import 'package:kratos/presentation/resources/values_manager.dart';
import 'package:kratos/presentation/widgets/shared_widget.dart';

import '../../../../domain/models/models.dart';
import '../../../resources/assets_manager.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final AppPreferences _appPreferences = instance<AppPreferences>();
   final List<String> _list = ["Settings", "Privacy", "Security", "Log out"];
  _logout(BuildContext context) {
    // app prefs make that user logged out
    _appPreferences.logout();

    // clear cache of logged out user


    // navigate to login screen
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }

  @override
  Widget build(BuildContext context) {
    User user = _appPreferences.getUserLogged();
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: AppSize.s20,
              ),
              buildLogo(),
              const SizedBox(
                height: AppSize.s20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Account ',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: AppSize.s16,
                        color: ColorManager.darkGreyTextColor),
                    softWrap: false,
                  ),
                  PopupMenuButton(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1,color: ColorManager.primary),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      color: ColorManager.backgroundColor,
                      elevation: 20,
                      enabled: true,
                      onSelected: (value) {
                        if(value=="Log out"){
                          _logout(context);
                        }
                      },
                      itemBuilder: (context) {
                        return _list.map((String choice) {
                          return PopupMenuItem(
                            value: choice,
                            child: Text(choice),
                          );
                        }).toList();
                      })
                ],
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      child: Image.asset(ImageAssets.profilePicture),
                      height: AppSize.s120,
                      width: double.infinity,
                    ),
                    Text(
                      user.name,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: ColorManager.grey),
                      softWrap: false,
                    ),

                  ],
                ),
              ),
              const SizedBox(
                height: AppSize.s16,
              ),
              Text(
                'Personal information  ',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: AppSize.s16, color: ColorManager.darkGreyTextColor),
                softWrap: false,
              ),
              const SizedBox(
                height: AppSize.s16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Email ',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: AppSize.s16,
                            color: ColorManager.darkGreyTextColor),
                        softWrap: false,
                      ),
                      Text(
                        user.email,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: ColorManager.grey, fontSize: FontSize.s12),
                        softWrap: false,
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gender',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: AppSize.s16,
                            color: ColorManager.darkGreyTextColor),
                        softWrap: false,
                      ),
                      Text(
                        user.gender,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: ColorManager.grey, fontSize: FontSize.s12),
                        softWrap: false,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: AppSize.s16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Mobile Number',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: AppSize.s16,
                            color: ColorManager.darkGreyTextColor),
                        softWrap: false,
                      ),
                      Text(
                        user.phone,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: ColorManager.grey, fontSize: FontSize.s12),
                        softWrap: false,
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Age',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: AppSize.s16,
                            color: ColorManager.darkGreyTextColor),
                        softWrap: false,
                      ),
                      Text(
                        user.age.toString(),
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: ColorManager.grey, fontSize: FontSize.s12),
                        softWrap: false,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: AppSize.s16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your BMI',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: AppSize.s16,
                            color: ColorManager.darkGreyTextColor),
                        softWrap: false,
                      ),
                      Text(
                        (user.weight /
                                ((user.height / 100) * (user.height / 100)))
                            .toStringAsFixed(1),
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: ColorManager.grey, fontSize: FontSize.s12),
                        softWrap: false,
                      ),
                    ],
                  ),
                  Container(
                    height: 32,
                    width: 100,
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: ColorManager.white,
                          size: 16,
                        ),
                        const Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'GO Premium',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffffc107),
                      borderRadius: BorderRadius.circular(60.0),
                      border: Border.all(
                        width: 1.0,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(
                height: AppSize.s16,
              ),
              Text(
                'Language',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: AppSize.s16, color: ColorManager.darkGreyTextColor),
                softWrap: false,
              ),
              Text(
                "English",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: ColorManager.grey, fontSize: FontSize.s12),
                softWrap: false,
              ),
              const SizedBox(
                height: AppSize.s10,
              ),
              Text(
                'Rate The App',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: AppSize.s16, color: ColorManager.darkGreyTextColor),
                softWrap: false,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.star,
                    color: Color(0xffFFC420),
                    size: 15,
                  ),
                  Icon(
                    Icons.star,
                    color: Color(0xffFFC420),
                    size: 15,
                  ),
                  Icon(
                    Icons.star,
                    color: Color(0xffFFC420),
                    size: 15,
                  ),
                  Icon(
                    Icons.star,
                    color: Color(0xffFFC420),
                    size: 15,
                  )
                ],
              ),
              // Adobe XD layer: 'BG' (shape)
            ],
          ),
        ),
      ),
    );
  }

}

