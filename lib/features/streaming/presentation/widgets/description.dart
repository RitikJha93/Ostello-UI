import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello/config/common/widgets/custom_text.dart';
import 'package:ostello/core/res/colors.dart';
import 'package:ostello/features/streaming/presentation/providers/streaming_provider.dart';
import 'package:ostello/features/streaming/presentation/widgets/streaming_tabs.dart';
import 'package:ostello/features/streaming/presentation/widgets/tab_view.dart';

class Description extends StatelessWidget {
  final StreamingNotifier provider;
  final WidgetRef ref;

  const Description({super.key, required this.provider, required this.ref});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: "Algebra 12: Functions 4",
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              const SizedBox(height: 2),
              const CustomText(
                text:
                    "Most shocking news Most shocking Most shocking news ..More",
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 40, // Fixed height for StreamingTabs
                child: StreamingTabs(
                  provider: provider,
                  ref: ref,
                ),
              ),
              const SizedBox(height: 16),
              // Flexible scrollable TabView
              Expanded(
                child: TabView(provider: provider, ref: ref),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 16,
          left: 14,
          right: 14,
          child: SizedBox(
            width: deviceWidth * 0.8,
            child: OutlinedButton(
              onPressed: () {
                provider.toggleQuestionPage();
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Ask a Question",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkTextColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
