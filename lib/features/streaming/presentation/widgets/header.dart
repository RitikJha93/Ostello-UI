import 'package:flutter/material.dart';
import 'package:ostello/config/common/widgets/custom_text.dart';
import 'package:ostello/config/common/widgets/svg_icon.dart';
import 'package:ostello/core/res/assets_paths.dart';
import 'package:ostello/core/utils/device_utils.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = DeviceUtils.getDeviceHeight(context);
    final deviceWidth = DeviceUtils.getDeviceHeight(context);
    return SizedBox(
      height: deviceHeight * 0.25,
      width: deviceWidth,
      child: Stack(
        children: [
          Image.asset(
            AssetsPath.thumbnailPath,
            fit: BoxFit.cover,
            width: deviceWidth,
            alignment: Alignment.topCenter,
          ),
          Positioned(
              top: 10,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xffFFFFFF).withOpacity(0.2)),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: const Color(0xff5A5E69),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Row(
                      children: [
                        SvgIcon(svgPath: AssetsPath.personIconPath),
                        SizedBox(
                          width: 2,
                        ),
                        CustomText(
                          text: "37.8k",
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )
                      ],
                    ),
                  )
                ],
              )),
          Positioned(
            bottom: 10,
            right: 16,
            child: Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xff000000).withOpacity(0.4)),
              child: const SvgIcon(svgPath: AssetsPath.expandIconPath),
            ),
          )
        ],
      ),
    );
  }
}
