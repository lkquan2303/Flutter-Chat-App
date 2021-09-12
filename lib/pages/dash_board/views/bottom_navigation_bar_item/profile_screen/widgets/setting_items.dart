import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_svg/svg.dart';

import '../../../../../../constants/constants.dart';
import '../../../../../../constants/size_config.dart';

class SettingItems extends StatelessWidget {
  final String icon, settingTitle;
  final VoidCallback onTapSetting;
  // ignore: sort_constructors_first
  const SettingItems({
    Key? key,
    // ignore: always_put_required_named_parameters_first
    required this.icon,
    // ignore: always_put_required_named_parameters_first
    required this.settingTitle,
    // ignore: always_put_required_named_parameters_first
    required this.onTapSetting,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: getProportionateScreenHeight(25)),
      child: InkWell(
        onTap: onTapSetting,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenHeight(15),
          ),
          height: getProportionateScreenHeight(45),
          decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(
              0.05,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                color: kPrimaryColor,
                height: getProportionateScreenHeight(20),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                settingTitle,
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(15),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              SvgPicture.asset('assets/icons/arrow_right.svg')
            ],
          ),
        ),
      ),
    );
  }
}
