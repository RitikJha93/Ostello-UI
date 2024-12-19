import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello/config/common/widgets/custom_text.dart';
import 'package:ostello/core/res/colors.dart';
import 'package:ostello/features/streaming/presentation/providers/doubts_provider.dart';
import 'package:ostello/features/streaming/presentation/providers/streaming_provider.dart';

// Providers to track the state of the input fields
final questionProvider = StateProvider<String>((ref) => "");
final detailsProvider = StateProvider<String>((ref) => "");

final isSubmitEnabledProvider = Provider<bool>((ref) {
  final question = ref.watch(questionProvider);
  final details = ref.watch(detailsProvider);
  return question.isNotEmpty && details.isNotEmpty;
});

class AskQuestion extends ConsumerWidget {
  AskQuestion({super.key});

  final TextEditingController questionController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final doubtsProvider = ref.watch(doubtsNotifierProvider);
    final streamingProvider = ref.watch(streamingNotifierProvider);
    final isSubmitEnabled = ref.watch(isSubmitEnabledProvider);
    final deviceWidth = MediaQuery.of(context).size.width;

    // Listeners to update providers based on input field changes
    questionController.addListener(() {
      ref.read(questionProvider.notifier).state = questionController.text;
    });

    detailsController.addListener(() {
      ref.read(detailsProvider.notifier).state = detailsController.text;
    });

    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row: Cancel Button and New Question Title
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        streamingProvider.toggleQuestionPage();
                      },
                      child: const CustomText(
                        text: "Cancel",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const CustomText(
                      text: "New Question",
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
                const Divider(),
                const SizedBox(height: 16),

                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.mutedTextColor)),
                  child: const CustomText(
                      text: "27. Algebra 12: Functions 4 Trignometry",
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                // Form Section for adding title and details
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: questionController,
                            decoration: const InputDecoration(
                              labelText: "Question Title",
                              border: UnderlineInputBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: detailsController,
                            minLines: 1,
                            maxLines: null,
                            decoration: const InputDecoration(
                              labelText: "Details",
                              border: UnderlineInputBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Submit Button to add new question
          Positioned(
            bottom: 16,
            left: 14,
            right: 14,
            child: SizedBox(
              width: deviceWidth * 0.8,
              child: Consumer(
                builder: (context, ref, child) {
                  final doubtsProvider = ref.watch(doubtsNotifierProvider);

                  return OutlinedButton(
                    onPressed: isSubmitEnabled
                        ? () {
                            doubtsProvider.addDoubtApi(
                              questionController.text,
                              detailsController.text,
                            );
                            questionController.clear();
                            detailsController.clear();
                          }
                        : null,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: BorderSide(
                        color: isSubmitEnabled
                            ? AppColors.primaryColor
                            : AppColors.mutedTextColor,
                      ),
                    ),
                    child: doubtsProvider.addLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          )
                        : CustomText(
                            text: "Submit",
                            color: isSubmitEnabled
                                ? AppColors.primaryTextColor
                                : AppColors.mutedTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
