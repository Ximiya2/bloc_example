import 'package:bloc_example/core/dio_error_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../core/api/api.dart';
import '../models/postModel.dart';
import 'log_service.dart';

class GetPostService {

  static Future<Either<String,List<PostModel>>> getPosts() async {
    try {
      Response res =
      await Dio().get(Urls.getPosts);
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if(res.statusCode == 200) {
        List<PostModel> userList = [];
        for(var e in (res.data as List)) {
          userList.add(PostModel.fromJson(e));
        }

        return right(userList);
      } else {
        Log.e('${res.statusMessage} ${res.statusCode}');
        return left('Something is wroing');
      }
    } on DioError catch (e) {
      Log.e(DioExceptions.fromDioError(e).toString());
      return left(DioExceptions.fromDioError(e).toString());
    } catch (m) {
      Log.e(m.toString());
      return left(m.toString());
    }
  }

  static Future<Either<String,bool>> deletePost(int id) async {
    try {
      Response res = await Dio().delete(
        Urls.deletePost + id.toString(),
      );
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if(res.statusCode == 200 || res.statusCode == 201) {
        return right(true);
      } else {
        Log.e('${res.statusMessage} ${res.statusCode} ${res.statusCode}');
        return left(res.statusMessage.toString());
      }
    } on DioError catch (e) {
      Log.e(e.response!.toString());
      return left(e.response.toString());
    } catch (e) {
      Log.e(e.toString());
      return left(e.toString());
    }
  }

    static Future<Either<String,bool>> editPost(PostModel newPost) async {
    try {
      Response res = await Dio().put(
          Urls.editPost + newPost.userId.toString(),
          data:  {
            "userId" : newPost.userId,
            "title" : newPost.title,
            "body" : newPost.body,
          }
      );
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if(res.statusCode == 200 || res.statusCode == 201) {
        return right(true);
      } else {
        Log.e('${res.statusMessage} ${res.statusCode}');
        return left(res.statusMessage.toString());
      }
    } on DioError catch (e) {
      Log.e(e.response!.toString());
      return left(e.response!.toString());
    } catch (e) {
      Log.e(e.toString());
      return left(e.toString());
    }
  }

static Future<Either<String,bool>> addPost(PostModel newPost) async {
    try {
      Response res = await Dio().post(
          Urls.addPost,
              data:  {
            "userId" : newPost.userId,
            "title" : newPost.title,
            "body" : newPost.body,
      }
      );
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if(res.statusCode == 200 || res.statusCode == 201) {
        return right(true);
      } else {
        Log.e('${res.statusMessage} ${res.statusCode}');
        return left(res.statusMessage.toString());
      }
    } on DioError catch (e) {
      Log.e(e.response!.toString());
      return left(e.response!.toString());
    } catch (e) {
      Log.e(e.toString());
      return left(e.toString());
    }
  }

}

