import 'package:flutter/material.dart';
import 'package:tiktok/domain/entities/video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initalLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    //todo: load videos

    notifyListeners();
  }
}
