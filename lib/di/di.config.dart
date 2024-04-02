// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/categories_screen/presentation/cubit/catalogViewModel.dart'
    as _i35;
import '../features/categories_screen/presentation/cubit/categoriesViewModel.dart'
    as _i32;
import '../features/home_screen/data/data_sources/dataSourceContarcts/brands_data_source_contract.dart'
    as _i8;
import '../features/home_screen/data/data_sources/dataSourceContarcts/categories_data_source_contract.dart'
    as _i12;
import '../features/home_screen/data/data_sources/dataSourceContarcts/products_data_source_contract.dart'
    as _i25;
import '../features/home_screen/data/data_sources/dataSources/brandsOnlineDataSource.dart'
    as _i9;
import '../features/home_screen/data/data_sources/dataSources/categoriesOnlinDataSource.dart'
    as _i13;
import '../features/home_screen/data/data_sources/dataSources/productsOnlineDataSource.dart'
    as _i26;
import '../features/home_screen/data/data_sources/remote/api_manager.dart'
    as _i3;
import '../features/home_screen/data/repositories/brandRepositoryImp.dart'
    as _i11;
import '../features/home_screen/data/repositories/categoriesRepositoryImp.dart'
    as _i15;
import '../features/home_screen/data/repositories/productsRepositoryImp.dart'
    as _i28;
import '../features/home_screen/domain/repositories/brands_repository.dart'
    as _i10;
import '../features/home_screen/domain/repositories/categories_repository.dart'
    as _i14;
import '../features/home_screen/domain/repositories/products_repository.dart'
    as _i27;
import '../features/home_screen/domain/use_cases/getBrandsUseCase.dart' as _i20;
import '../features/home_screen/domain/use_cases/getCategoriesUseCase.dart'
    as _i21;
import '../features/home_screen/domain/use_cases/getProductsUseCase.dart'
    as _i33;
import '../features/home_screen/presentation/cubit/homeScreenViewModel.dart'
    as _i34;
import '../features/login_screen/domain/use_cases/LoginUseCase.dart' as _i23;
import '../features/login_screen/presentation/cubit/loginViewModel.dart'
    as _i24;
import '../features/register_screen/data/data_sources/AuthenticationOnlineDataSource.dart'
    as _i5;
import '../features/register_screen/data/dataSourceContract/AuthenticationDataSource.dart'
    as _i4;
import '../features/register_screen/data/repositories/authenticationRepositoryImp.dart'
    as _i7;
import '../features/register_screen/domain/repositories/authentication_repository.dart'
    as _i6;
import '../features/register_screen/domain/use_cases/RegisterUseCase.dart'
    as _i29;
import '../features/register_screen/presentation/cubit/register_view_model_cubit.dart'
    as _i30;
import '../features/wish_list_screen/data/data_sources/dataSourceContract/favorites_data_source_contract.dart'
    as _i16;
import '../features/wish_list_screen/data/data_sources/dataSources/favoritesOnlineDataSource.dart'
    as _i17;
import '../features/wish_list_screen/data/repositories/favoritesRepositoryImp.dart'
    as _i19;
import '../features/wish_list_screen/domain/repositories/favorites_repository.dart'
    as _i18;
import '../features/wish_list_screen/domain/use_cases/getFavoritesUseCase.dart'
    as _i22;
import '../features/wish_list_screen/presentation/cubit/wishListViewModel.dart'
    as _i31;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(_i3.ApiManager());
    gh.factory<_i4.AuthenticationDataSource>(() =>
        _i5.AuthenticationOnlineDataSource(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i6.AuthenticationRepository>(() =>
        _i7.AuthenticationRepositoryImp(gh<_i4.AuthenticationDataSource>()));
    gh.factory<_i8.BrandsDataSourceContract>(
        () => _i9.BrandsOnlineDataSource(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i10.BrandsRepository>(
        () => _i11.BrandRepositoryImp(gh<_i8.BrandsDataSourceContract>()));
    gh.factory<_i12.CategoriesDataSourceContract>(
        () => _i13.CategoriesOnlineDataSourceImp(gh<_i3.ApiManager>()));
    gh.factory<_i14.CategoriesRepository>(() =>
        _i15.CategoriesRepositoryImp(gh<_i12.CategoriesDataSourceContract>()));
    gh.factory<_i16.FavoritesDataSourceContract>(
        () => _i17.FavoritesOnlineDataSource(gh<_i3.ApiManager>()));
    gh.factory<_i18.FavoritesRepository>(() =>
        _i19.FavoritesRepositoryImp(gh<_i16.FavoritesDataSourceContract>()));
    gh.factory<_i20.GetBrandsUseCase>(
        () => _i20.GetBrandsUseCase(gh<_i10.BrandsRepository>()));
    gh.factory<_i21.GetCategoriesUseCase>(
        () => _i21.GetCategoriesUseCase(gh<_i14.CategoriesRepository>()));
    gh.factory<_i22.GetFavoritesUseCase>(
        () => _i22.GetFavoritesUseCase(gh<_i18.FavoritesRepository>()));
    gh.factory<_i23.LoginUseCase>(
        () => _i23.LoginUseCase(gh<_i6.AuthenticationRepository>()));
    gh.factory<_i24.LoginViewModel>(
        () => _i24.LoginViewModel(gh<_i23.LoginUseCase>()));
    gh.factory<_i25.ProductsDataSourceContract>(
        () => _i26.ProductsOnlineDataSource(gh<_i3.ApiManager>()));
    gh.factory<_i27.ProductsRepository>(() =>
        _i28.ProductsRepositoryImp(gh<_i25.ProductsDataSourceContract>()));
    gh.factory<_i29.RegisterUseCase>(
        () => _i29.RegisterUseCase(gh<_i6.AuthenticationRepository>()));
    gh.factory<_i30.RegisterViewModel>(
        () => _i30.RegisterViewModel(gh<_i29.RegisterUseCase>()));
    gh.factory<_i31.WishListViewModel>(
        () => _i31.WishListViewModel(gh<_i22.GetFavoritesUseCase>()));
    gh.factory<_i32.CategoriesScreenViewModel>(
        () => _i32.CategoriesScreenViewModel(gh<_i21.GetCategoriesUseCase>()));
    gh.factory<_i33.GetProductsUseCase>(
        () => _i33.GetProductsUseCase(gh<_i27.ProductsRepository>()));
    gh.factory<_i34.HomeScreenViewModel>(() => _i34.HomeScreenViewModel(
          gh<_i21.GetCategoriesUseCase>(),
          gh<_i20.GetBrandsUseCase>(),
          gh<_i33.GetProductsUseCase>(),
        ));
    gh.factory<_i35.CatalogScreenViewModel>(
        () => _i35.CatalogScreenViewModel(gh<_i33.GetProductsUseCase>()));
    return this;
  }
}
