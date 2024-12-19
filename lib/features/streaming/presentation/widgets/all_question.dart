import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello/config/common/widgets/custom_text.dart';
import 'package:ostello/config/common/widgets/svg_icon.dart';
import 'package:ostello/core/res/assets_paths.dart';
import 'package:ostello/core/res/colors.dart';
import 'package:ostello/core/utils/device_utils.dart';
import 'package:ostello/features/streaming/presentation/providers/doubts_provider.dart';
import 'package:ostello/features/streaming/presentation/providers/qna_provider.dart';
import 'package:ostello/features/streaming/presentation/providers/streaming_provider.dart';

class AllQuestion extends ConsumerWidget {
  const AllQuestion({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamingProvider = ref.watch(streamingNotifierProvider);
    final doubtsProvider = ref.watch(doubtsNotifierProvider);
    final qnaProvider = ref.watch(qnaNotifierProvider);
    final deviceWidth = DeviceUtils.getDeviceWidth(context);
    final deviceHeight = DeviceUtils.getDeviceHeight(context);

    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        streamingProvider.toggleAllQuestionPage();
                      },
                      child: const CustomText(
                        text: "Back",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const CustomText(
                      text: "Questions",
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    const Spacer(flex: 2),
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
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CircleAvatar(
                              radius: 22, // Adjust size
                              backgroundImage:
                                  AssetImage(AssetsPath.profilePath),
                            ),
                            SizedBox(
                              width: deviceWidth * 0.02,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                    color: AppColors.mutedTextColor,
                                  ),
                                  SizedBox(
                                    height: deviceHeight * 0.01,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: deviceHeight * 0.02,
                        ),
                        // Check if replies exist and display them
                        if (item.replies.isNotEmpty)
                          ...item.replies.map((reply) {
                            return Padding(
                              padding:
                                  EdgeInsets.only(bottom: deviceHeight * 0.02),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CircleAvatar(
                                    radius: 22, // Adjust size for reply
                                    backgroundImage:
                                        AssetImage(AssetsPath.profilePath),
                                  ),
                                  SizedBox(
                                    width: deviceWidth * 0.02,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: reply.replyText,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: AppColors.mutedTextColor,
                                        ),
                                        SizedBox(
                                          height: deviceHeight * 0.01,
                                        ),
                                        CustomText(
                                          text: reply.senderName,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                        SizedBox(
                                          height: deviceHeight * 0.01,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: deviceHeight * 0.02,
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 14,
          right: 14,
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.only(bottom: deviceHeight * 0.02),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Write a reply...",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              width: 1, color: AppColors.darkTextColor)),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
                SizedBox(width: deviceWidth * 0.02),
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xff272A34),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const SvgIcon(svgPath: AssetsPath.sendIconPath),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
