import 'package:flutter/foundation.dart';
import 'package:substrate_sign_flutter/substrate_sign_flutter.dart';
import 'package:wallet4d/common/chain_base.dart';
import 'package:wallet4d/constant/chain_spec.dart';

class SubstrateChain implements ChainBase {
  int chainId;
  String chainName;

  Map<String, dynamic> endpoints = Map();
  static int getChainId(String chainName) {
    switch (chainName) {
      case SubstrateChainName.polkadot:
        return 0;
      case SubstrateChainName.kusama:
        return 2;
      case SubstrateChainName.acala:
        return 42;
      case SubstrateChainName.laminar:
        return 42;
      case SubstrateChainName.phala:
        return 42;
      default:
        return null;
    }
  }

  factory SubstrateChain.fromName(String chainName) {
    var chainId = SubstrateChain.getChainId(chainName);
    return SubstrateChain._internal(chainId, chainName);
  }

  SubstrateChain._internal(this.chainId, this.chainName);

  void addEndpoint(
      {String endpointName, String description, @required String endpoint, dynamic extra}) {
    endpoints.putIfAbsent(
        endpointName,
        () => {
              "endpointName": endpointName,
              "description": description,
              "endpoint": endpoint,
              "extra": extra.toString()
            });
  }

  @override
  String getAddressFromSeedPhrase(String seedPhrase, {dynamic params}) {
    // TODO: implement getAddressFromPhrase
    // throw UnimplementedError();

    var seed = seedPhrase + "//" + this.chainName + "///";
    return substrateAddress(seed, this.chainId);
  }
}
