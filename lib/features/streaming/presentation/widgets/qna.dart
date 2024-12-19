import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello/config/common/widgets/custom_text.dart';
import 'package:ostello/core/res/assets_paths.dart';
import 'package:ostello/core/res/colors.dart';
import 'package:ostello/core/utils/device_utils.dart';
import 'package:ostello/features/streaming/presentation/providers/doubts_provider.dart';
import 'package:ostello/features/streaming/presentation/providers/qna_provider.dart';
import 'package:ostello/features/streaming/presentation/providers/streaming_provider.dart';

class Qna extends ConsumerWidget {
  const Qna({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(qnaNotifierProvider);
    final streamingProvider = ref.watch(streamingNotifierProvider);
    final doubtsProvider = ref.watch(doubtsNotifierProvider);

    final deviceHeight = DeviceUtils.getDeviceHeight(context);
    final deviceWidth = DeviceUtils.getDeviceWidth(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomText(
              text: "Q&A",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            InkWell(
              onTap: () => streamingProvider.toggleAllQuestionPage(),
              child: const CustomText(
                text: "See All",
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            )
          ],
        ),
        SizedBox(
          height: deviceHeight * 0.02,
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: doubtsProvider.doubts.length,
          itemBuilder: (context, index) {
            final item = doubtsProvider.doubts[index];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 22, // Adjust size
                  backgroundImage: AssetImage(AssetsPath.profilePath),
                ),
                SizedBox(
                  width: deviceWidth * 0.02,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: item.student.name!,
                        color: AppColors.grayTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: deviceHeight * 0.01,
                      ),
                      CustomText(
                        text: item.doubtText,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      SizedBox(
                        height: deviceHeight * 0.01,
                      ),
                      CustomText(
                        text: item.doubtDescription,
                        fontSize: 14,
                        maxLines: 2,
                        color: AppColors.mutedTextColor,
                      ),
                      SizedBox(
                        height: deviceHeight * 0.01,
                      ),
                      CustomText(
                        text: "${item.replies.length} Replies",
                        fontSize: 12,
                        color: AppColors.primaryTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                )
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            height: deviceHeight * 0.02,
          ),
        )
      ],
    );
  }
}
