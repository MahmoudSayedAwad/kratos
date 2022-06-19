
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kratos/presentation/resources/assets_manager.dart';
import 'package:kratos/presentation/resources/color_manager.dart';
import 'package:kratos/presentation/resources/values_manager.dart';

class PremiumPage extends StatelessWidget {
   PremiumPage({Key? key}) : super(key: key);
final List<String>img=[ImageAssets.bronze,ImageAssets.silver,ImageAssets.gold];
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        SizedBox(
          child: SvgPicture.asset(ImageAssets.splashLogo),
          height: AppSize.s140,
          width: double.infinity,
        ),
        Expanded(
          child: ListView.separated(
            scrollDirection: Axis.horizontal, itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 8,right: 8,top: 32,bottom: 32),
                child: Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(img[index]),fit: BoxFit.cover),

                  borderRadius: BorderRadius.circular(79),
                  border: Border.all(width: AppSize.s1, color: ColorManager.grey),
                ),
                ),
              );

          }
            , separatorBuilder: (BuildContext context, int index) {return const SizedBox(width: AppSize.s4,);  }, itemCount: img.length,

          ),
        ),
      ],
    );
  }

 
}
