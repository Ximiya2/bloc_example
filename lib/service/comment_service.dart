import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../core/api/api.dart';
import '../core/dio_error_exception.dart';
import '../models/commentModel.dart';
import 'log_service.dart';

class GetCommetService {

  static Future<Either<String,List<CommentModel>>> getComment() async {
    try {
      Response res = await Dio().get(Urls.getComment);
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if(res.statusCode == 200) {
        List<CommentModel> userList = [];
        for(var e in (res.data as List)) {
          userList.add(CommentModel.fromJson(e));
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

  // static Future<List<CommentModel>?> getPostComment(int id) async {
  //   try {
  //     Response res = await DioConfig.inheritentce.createRequest().get(Urls.getSingleUserComment + '?postId=${id}');
  //     Log.i(res.data.toString());
  //     Log.i(res.statusCode.toString());
  //
  //     if(res.statusCode == 200) {
  //       List<CommentModel> userList = [];
  //       for(var e in (res.data as List)) {
  //         userList.add(CommentModel.fromJson(e));
  //       }
  //
  //       return userList;
  //     } else {
  //       Log.e('${res.statusMessage} ${res.statusCode}');
  //     }
  //   } on DioError catch (e) {
  //     Log.e(e.toString());
  //     if(e.response != null) {
  //       Log.e(e.response!.toString());
  //     } else {
  //       rethrow;
  //     }
  //   } catch (e) {
  //     Log.e(e.toString());
  //
  //   }
  //   return null;
  // }
  //
  // static Future<bool> createCommet(CommentModel newPost) async {
  //   try {
  //     Response res = await DioConfig.inheritentce.createRequest().post(
  //         Urls.getComment,
  //         data:  {
  //           "name" : newPost.name,
  //           "email" : newPost.email,
  //           "body" : newPost.body,
  //         }
  //     );
  //     Log.i(res.data.toString());
  //     Log.i(res.statusCode.toString());
  //
  //     if(res.statusCode == 200 || res.statusCode == 201) {
  //       return true;
  //     } else {
  //       Log.e('${res.statusMessage} ${res.statusCode}');
  //       return false;
  //     }
  //   } on DioError catch (e) {
  //     if(e.response != null) {
  //       Log.e(e.response!.toString());
  //       return false;
  //     } else {
  //       rethrow;
  //     }
  //   } catch (e) {
  //     Log.e(e.toString());
  //     return false;
  //   }
  //   // return null;
  // }
  //
  // static Future<bool> editComment(CommentModel newPost) async {
  //   try {
  //     Response res = await DioConfig.inheritentce.createRequest().put(
  //         Urls.updateComment + newPost.id.toString(),
  //         data:  {
  //           "name" : newPost.name,
  //           "email" : newPost.email,
  //           "body" : newPost.body,
  //         }
  //     );
  //     Log.i(res.data.toString());
  //     Log.i(res.statusCode.toString());
  //
  //     if(res.statusCode == 200 || res.statusCode == 201) {
  //       return true;
  //     } else {
  //       Log.e('${res.statusMessage} ${res.statusCode}');
  //       return false;
  //     }
  //   } on DioError catch (e) {
  //     if(e.response != null) {
  //       Log.e(e.response!.toString());
  //       return false;
  //     } else {
  //       rethrow;
  //     }
  //   } catch (e) {
  //     Log.e(e.toString());
  //     return false;
  //   }
  //   // return null;
  // }
  //
  // static Future<bool> deleteCommet(int id) async {
  //   try {
  //     Response res = await DioConfig.inheritentce.createRequest().delete(
  //       Urls.deleteComment + id.toString(),
  //     );
  //     Log.i(res.data.toString());
  //     Log.i(res.statusCode.toString());
  //
  //     if(res.statusCode == 200 || res.statusCode == 201) {
  //       return true;
  //     } else {
  //       Log.e('${res.statusMessage} ${res.statusCode}');
  //       return false;
  //     }
  //   } on DioError catch (e) {
  //     if(e.response != null) {
  //       Log.e(e.response!.toString());
  //       return false;
  //     } else {
  //       rethrow;
  //     }
  //   } catch (e) {
  //     Log.e(e.toString());
  //     return false;
  //   }
  //   // return null;
  // }
}

