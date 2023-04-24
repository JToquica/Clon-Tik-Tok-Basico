import 'package:flutter/material.dart';

import 'package:clon_tik_tok/src/domain/entities/video_post.dart';
import 'package:clon_tik_tok/src/domain/repositories/video_posts_repository.dart';
// import 'package:clon_tik_tok/src/shared/data/local_video_posts.dart';
// import 'package:clon_tik_tok/src/infraestructure/models/local_video_model.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videosRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videosRepository});

  Future<void> loadNextPage() async {
    // final List<VideoPost> newVideos = videoPosts
    //     .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
    //     .toList();

    final newVideos = await videosRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
