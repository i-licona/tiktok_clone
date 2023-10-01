import 'package:flutter/material.dart';
import 'package:tiktok/domain/entities/video_post.dart';
import 'package:tiktok/infrastructure/repositories/video_post_repository_impl.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepositoryImp videoPostRepository;
  

  bool initalLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({
    required this.videoPostRepository
  });

  Future<void> loadNextPage() async {
    // await Future.delayed(const Duration(seconds: 2));
    // final List<VideoPost> newVideos = videoPosts.map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity()).toList();
    final newVideos = await videoPostRepository.getTrendingVideosByPage(1);
    videos.addAll(newVideos);
    initalLoading = false;
    notifyListeners();
  }
} 
