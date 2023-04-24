import 'package:clon_tik_tok/src/presentation/widgets/shared/video_scrollable_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:clon_tik_tok/src/presentation/providers/discover_provider.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final discoverProvider = context.watch<DiscoverProvider>();
    return Scaffold(
      body: discoverProvider.initialLoading
          ? const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
          : VideoScrollabelView(videos: discoverProvider.videos),
    );
  }
}
