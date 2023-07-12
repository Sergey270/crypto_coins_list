import 'package:flutter/material.dart';

import '../../../repositories/crypto_coins/cripto_coin_repository.dart';
import '../../../repositories/models/crypto_coin.dart';
import '../widgets/widgets.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({
    super.key,
  });

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinList;

  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CryptoCurrenciesList'),
      ),
      body: (_cryptoCoinList == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
        padding: const EdgeInsets.only(top: 16),
              itemCount: _cryptoCoinList!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, i) {
                final coin = _cryptoCoinList![i];
                return CryptoCoinTile(coin: coin);
              },
            ),

    );
  }

  Future<void> _loadCryptoCoins() async {
     _cryptoCoinList = await CryptoCoinRepository().getCoinList();
    setState(() {});
  }
}
