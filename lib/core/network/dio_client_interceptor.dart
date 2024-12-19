import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'https://dev.ostello.co.in',
            connectTimeout: const Duration(milliseconds: 5000),
            receiveTimeout: const Duration(milliseconds: 3000),
          ),
        ) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Authorization headers injection
        options.headers['Authorization'] =
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjMxOWU1NWFlLTI2OWEtNGE4Ny1hZTBlLTExMDNlOWExODNiNyIsIm5hbWUiOiJTaGFoYmF6IEFsaSIsImVtYWlsIjoic2hhaGJhel9hbGlAcGxsbGZsZmwuY29uIiwidXNlcnR5cGUiOjMsInBob25lbnVtYmVyIjoiNzM5ODM1ODAxMiIsImlhdCI6MTczNDMyNzgzOCwiZXhwIjoxNzM0NDE0MjM4fQ.QeN_wU5z6S4UgAPHYwqWPW8Mqr64FvoLstxSiYphpIY';
        return handler.next(options);
      },
      onError: (error, handler) {
        // Error handling
        return handler.next(error);
      },
    ));
  }

  Dio get dio => _dio;
}
