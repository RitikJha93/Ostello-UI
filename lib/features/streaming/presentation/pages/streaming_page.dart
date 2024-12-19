import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello/features/streaming/presentation/providers/doubts_provider.dart';
import 'package:ostello/features/streaming/presentation/providers/streaming_provider.dart';
import 'package:ostello/features/streaming/presentation/widgets/all_question.dart';
import 'package:ostello/features/streaming/presentation/widgets/ask_question.dart';
import 'package:ostello/features/streaming/presentation/widgets/description.dart';
import 'package:ostello/features/streaming/presentation/widgets/header.dart';

class StreamingPage extends ConsumerStatefulWidget {
  const StreamingPage({super.key});

  @override
  ConsumerState<StreamingPage> createState() => _StreamingPageState();
}

class _StreamingPageState extends ConsumerState<StreamingPage> {

  @override
  Widget build(BuildContext context) {
    final doubtsProvider = ref.watch(doubtsNotifierProvider);
    final streamingProvider = ref.watch(streamingNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Header(),
            if (doubtsProvider.isLoading)
              const Center(child: CircularProgressIndicator())
            else if (doubtsProvider.errorMessage != null)
              Center(child: Text(doubtsProvider.errorMessage!))
            else
              Expanded(
                child: streamingProvider.isQuestionPage
                    ? AskQuestion()
                    : streamingProvider.isAllQuestionPage
                        ? const AllQuestion()
                        : Description(
                            provider: streamingProvider,
                            ref: ref,
                          ),
              ),
          ],
        ),
      ),
    );
  }
}
