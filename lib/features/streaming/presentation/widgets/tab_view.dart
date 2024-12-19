import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello/features/streaming/presentation/providers/streaming_provider.dart';
import 'package:ostello/features/streaming/presentation/widgets/qna.dart';

class TabView extends StatelessWidget {
  final StreamingNotifier provider;
  final WidgetRef ref;

  const TabView({super.key, required this.provider, required this.ref});

  Widget tabViewWidget() {
    switch (provider.activeTabIdx) {
      case 0:
        return Container(
          color: Colors.grey[200],
          child: const Center(child: Text("Chats")),
        );
      case 1:
        return const Qna();
      case 2:
        return Container(
          color: Colors.blue[200],
          child: const Center(child: Text("Notes")),
        );
      case 3:
        return Container(
          color: Colors.green[200],
          child: const Center(child: Text("Rewards section")),
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 80, top: 16, left: 20, right: 20),
      child: SingleChildScrollView(
        child: tabViewWidget(), // Scrollable content for the active tab
      ),
    );
  }
}
