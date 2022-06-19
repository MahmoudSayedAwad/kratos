import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kratos/presentation/resources/assets_manager.dart';
import 'package:kratos/presentation/resources/color_manager.dart';
import 'package:kratos/presentation/resources/font_manager.dart';
import 'package:kratos/presentation/resources/values_manager.dart';

SizedBox buildLogo() {
  return SizedBox(
    child: SvgPicture.asset(ImageAssets.splashLogo),
    height: AppSize.s120,
    width: double.infinity,
  );
}

Column buildHeader(BuildContext context, String first, String second) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        first,
        style: Theme.of(context).textTheme.displayLarge,
      ),
      const SizedBox(
        height: AppSize.s8,
      ),
      Text(
        second,
        style: Theme.of(context)
            .textTheme
            .labelSmall
            ?.copyWith(fontSize: FontSize.s16),
      ),
    ],
  );
}

Container buildTextFieldContainer(
    {bool readonly = false,
    required BuildContext context,
    TextEditingController? controller,
    required TextInputType type,
    void Function(String)? onSubmit,
    void Function(String)? onChange,
    void Function()? onTap,
    bool isPassword = false,
    String? Function(String?)? validate,
    String? label,
    IconData? prefix,
    IconData? suffix,
    void Function()? suffixPressed,
    bool isClickable = true,
    String? hint}) {
  return Container(
    child: Center(
      child: TextFormField(
        readOnly: readonly,
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        enabled: isClickable,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        onTap: onTap,
        validator: validate,
        decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            border: InputBorder.none,
            labelStyle: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontSize: FontSize.s16),
            floatingLabelAlignment: FloatingLabelAlignment.center,
            prefixIcon: Icon(
              prefix,
            ),
            suffixIcon: suffix != null
                ? IconButton(
                    onPressed: suffixPressed,
                    icon: Icon(
                      suffix,
                      color: ColorManager.primary,
                    ),
                  )
                : null,
            suffixIconColor: ColorManager.primary),
      ),
    ),
    width: double.infinity,
    height: AppSize.s80,
    decoration: BoxDecoration(
      color: ColorManager.white,
      borderRadius: BorderRadius.circular(AppSize.s30),
    ),
  );
}
