import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../core/api/api.dart';
import '../core/dio_error_exception.dart';
import '../models/usersModel.dart';
import 'log_service.dart';

class GetUsersService {

  static Future<Either<String,List<UsersModel>>> getUsers() async {
    try {
      Response res = await Dio().get(Urls.getUsers);
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if(res.statusCode == 200) {
        List<UsersModel> userList = [];
        for(var e in (res.data as List)) {
          userList.add(UsersModel.fromJson(e));
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
  //
  // static Future<UsersModel?> getUserById(int id) async {
  //   try {
  //     Response res = await DioConfig.inheritentce.createRequest().get(Urls.getSingleUsers + id.toString());
  //     Log.i(res.data.toString());
  //     Log.i(res.statusCode.toString());
  //
  //     if(res.statusCode == 200) {
  //       UsersModel user  = UsersModel.fromJson(res.data);
  //
  //       return user;
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
  // static Future<bool> createUsers(UsersModel newPost) async {
  //   try {
  //     Response res = await DioConfig.inheritentce.createRequest().post(
  //         Urls.getUsers,
  //         data:  {
  //           "id" : newPost.id,
  //           "name" : newPost.name,
  //           "username" : newPost.username,
  //           "email" : newPost.email,
  //           "address" : newPost.address,
  //           "phone" : newPost.phone,
  //           "website" : newPost.website,
  //           "company" : newPost.company,
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
  // static Future<bool> editUsers(UsersModel newPost) async {
  //   try {
  //     Response res = await DioConfig.inheritentce.createRequest().put(
  //         Urls.updateUsers + newPost.id.toString(),
  //         data:  {
  //           "id" : newPost.id,
  //           "name" : newPost.name,
  //           "username" : newPost.username,
  //           "email" : newPost.email,
  //           "address" : newPost.address,
  //           "phone" : newPost.phone,
  //           "website" : newPost.website,
  //           "company" : newPost.company,
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
  // static Future<bool> deleteUsers(int id) async {
  //   try {
  //     Response res = await DioConfig.inheritentce.createRequest().delete(
  //       Urls.deleteUsers + id.toString(),
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

