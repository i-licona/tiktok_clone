import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok/config/theme/app_theme.dart';
import 'package:tiktok/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:tiktok/infrastructure/repositories/video_post_repository_impl.dart';
import 'package:tiktok/presentation/providers/discover_provider.dart';
import 'package:tiktok/presentation/screen/discover/discover_screen.dart';
import 'package:tiktok/presentation/widgets/video/video_background.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final videoPostRespository = VideoPostRepositoryImp(
      videosPostDatasource: LocalVideoDatasource()
    ); 
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (BuildContext context) => DiscoverProvider(videoPostRepository: videoPostRespository)..loadNextPage(), 
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme() ,
        title: 'TikTok',
        home: const DiscoverScreen()
      ),
    );
  }
}
