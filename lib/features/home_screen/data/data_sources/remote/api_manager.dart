import 'dart:convert';
import 'package:e_commerce/features/home_screen/data/models/BrandsResponse/BrandsResponse.dart';
import 'package:e_commerce/features/home_screen/data/models/ProductResponse/ProductResponse.dart';
import 'package:e_commerce/features/home_screen/data/models/categoriesResponse/CategoriesResponse.dart';
import 'package:e_commerce/features/home_screen/domain/repositories/products_repository.dart';
import 'package:e_commerce/features/register_screen/data/models/RegisterResponse.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@singleton
@injectable
class ApiManager {
  static const baseUrl = 'ecommerce.routemisr.com';

  Future<CategoriesResponse> getCategories() async {
    var url = Uri.https(
        baseUrl, 'api/v1/categories',
    );
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var categoryResponse = CategoriesResponse.fromJson(json);
    return categoryResponse;
  }

  Future<BrandsResponse> getBrands() async {
    var url = Uri.https(
      baseUrl, 'api/v1/brands',
    );
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var brandsResponse = BrandsResponse.fromJson(json);
    return brandsResponse;
  }

  Future<ProductResponse> getProducts({ProductSort? sort , String? categoryId}) async {
    var parameters={};
    if(sort != null){
      parameters['sort'] = sort.value;
    }
    var url = Uri.https(
      baseUrl, 'api/v1/products',
    );
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var productsResponse = ProductResponse.fromJson(json);
    return productsResponse;
  }

  Future<RegisterResponse> register(
      String name,
      String phone,
      String email,
      String password ,
      String rePassword) async {
    var url = Uri.https(baseUrl, 'api/v1/auth/signup');

    var body = {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'rePassword' : rePassword,
    };

    var requestBody = jsonEncode(body);
    var contentLength = utf8.encode(requestBody).length.toString();

    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Content-Length': contentLength,
      },
      body: requestBody,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body);
      return RegisterResponse.fromJson(jsonResponse);
    }
    if (response.statusCode == 409) {
      throw Exception('Failed to register: User already exists');
    } else {
      throw Exception('Failed to register: ${response.statusCode}');
    }
  }

  Future<RegisterResponse> login(
      String email,
      String password ,
      ) async {
    var url = Uri.https(baseUrl, 'api/v1/auth/signin');

    var body = {
      'email': email,
      'password': password,
    };

    var requestBody = jsonEncode(body);
    var contentLength = utf8.encode(requestBody).length.toString();

    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Content-Length': contentLength,
      },
      body: requestBody,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body);
      return RegisterResponse.fromJson(jsonResponse);
    }
    if (response.statusCode == 409) {
      throw Exception('Failed to Login');
    }if (response.statusCode == 401) {
      throw Exception('Wrong email or password');
    } else {
      throw Exception('Failed to Login: ${response.statusCode}');
    }
  }

  Future<ProductResponse> getFavorites(String token) async {
    var url = Uri.https(
      baseUrl, 'api/v1/wishlist',
    );
    var response = await http.get(
        url,
      headers: {
        'token': token,
      },
    );
    var json = jsonDecode(response.body);
    var favoritesResponse = ProductResponse.fromJson(json);
    return favoritesResponse;
  }


}

