import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:clon_tik_tok/src/config/theme/app_theme.dart';
import 'package:clon_tik_tok/src/presentation/providers/discover_provider.dart';
import 'package:clon_tik_tok/src/presentation/screens/discover/discover_screen.dart';
import 'package:clon_tik_tok/src/infraestructure/datasources/local_video_datasource_impl.dart';
import 'package:clon_tik_tok/src/infraestructure/repositories/video_posts_repository_impl.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository =
        VideoPostsRepositoryImpl(videosDatasource: LocalVideoDatasource());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider(videosRepository: videoPostRepository)
            ..loadNextPage(),
        ),
      ],
      child: MaterialApp(
        title: "Material App",
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
