import 'package:clon_tik_tok/src/domain/entities/video_post.dart';
import 'package:clon_tik_tok/src/presentation/widgets/shared/video_buttons.dart';
import 'package:clon_tik_tok/src/presentation/widgets/video/fullscreen_player.dart';
import 'package:flutter/material.dart';

class VideoScrollabelView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollabelView({
    super.key,
    required this.videos,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];
        return Stack(
          children: [
            SizedBox.expand(
              child: FullScreenPlayer(
                name: videoPost.name,
                videoUrl: videoPost.videoUrl,
              ),
            ),
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost),
            ),
          ],
        );
      },
    );
  }
}
