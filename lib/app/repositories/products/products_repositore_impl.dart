// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:delivery_app/app/models/product_model.dart';
import 'package:delivery_app/app/repositories/products/products_repository.dart';
import 'package:dio/dio.dart';

import '../../core/exceptions/repositoryExcepition.dart';
import '../../core/rest_client/custon_dio.dart';

class ProductsRepositoreImpl implements ProductsRepository {
  final CustonDio dio;

  ProductsRepositoreImpl({required this.dio});

  @override
  Future<List<ProductModel>> findAllProducts() async {
    try {
      final result = await dio.unuauth().get('/products');

      return result.data
          .map<ProductModel>((p) => ProductModel.fromMap(p))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar produtos01', error: e, stackTrace: s);
      throw RepositoryExcepition('Erro ao buscar produtos02');
    }
  }
}
