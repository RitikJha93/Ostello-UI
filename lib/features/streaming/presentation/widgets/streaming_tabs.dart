import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello/config/common/widgets/custom_text.dart';
import 'package:ostello/config/common/widgets/svg_icon.dart';
import 'package:ostello/core/res/colors.dart';
import 'package:ostello/features/streaming/presentation/providers/streaming_provider.dart';

class StreamingTabs extends StatelessWidget {
  final StreamingNotifier provider;
  final WidgetRef ref;
  const StreamingTabs({super.key, required this.provider, required this.ref});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: provider.tabItems.length,
      itemBuilder: (context, index) {
        final item = provider.tabItems[index];

        return InkWell(
          onTap: () =>
              ref.read(streamingNotifierProvider).updateTabIndex(index),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
                color: provider.activeTabIdx == index
                    ? AppColors.mutedPrimaryBgColor
                    : AppColors.secondaryBackgroundColor,
                border: Border.all(
                    color: provider.activeTabIdx == index
                        ? AppColors.primaryBorderColor
                        : Colors.transparent,
                    width: provider.activeTabIdx == index ? 1 : 0),
                borderRadius: BorderRadius.circular(28)),
            child: Row(
              children: [
                SvgIcon(svgPath: item["icon"]),
                const SizedBox(width: 8),
                CustomText(
                  text: item["label"],
                  fontWeight: FontWeight.w500,
                  color: provider.activeTabIdx == index
                      ? AppColors.primaryTextColor
                      : AppColors.secondaryTextColor,
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 10,
      ),
    );
  }
}
