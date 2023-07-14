import 'package:crypto_coins_list/repositories/crypto_coins/abstract_coin_repository.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/cripto_coin_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'crypto_coins_list_app.dart';


void main() {
  GetIt.I.registerLazySingleton<AbstractCoinRepository>(()=> CryptoCoinRepository(dio: Dio()));

  runApp(const CryptoCurrenciesListApp());
}






