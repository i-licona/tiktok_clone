import 'package:tiktok/domain/datasources/video_post_datasource.dart';
import 'package:tiktok/domain/entities/video_post.dart';
import 'package:tiktok/domain/repositories/video_post_repository.dart';

class VideoPostRepositoryImp implements VideoPostRepository{
  final VideoPostDatasource videosPostDatasource;

  VideoPostRepositoryImp({
    required this.videosPostDatasource
  });
  
  @override
  Future<List<VideoPost>> getFavoriteVideoByUser(String userId) {
    // TODO: implement getFavoriteVideoByUser
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    // TODO: implement getTrendingVideosByPage
    return videosPostDatasource.getTrendingVideosByPage(page);
  }

}