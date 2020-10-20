import 'package:flutter/foundation.dart';
import 'package:substrate_sign_flutter/substrate_sign_flutter.dart';
import 'package:wallet4d/common/chain_base.dart';
import 'package:wallet4d/constant/chain_spec.dart';

// https://github.com/paritytech/substrate/blob/master/primitives/core/src/crypto.rs#L444-L516
// ss58_address_format!(
// 	PolkadotAccount =>
// 		(0, "polkadot", "Polkadot Relay-chain, standard account (*25519).")
// 	Reserved1 =>
// 		(1, "reserved1", "Reserved for future use (1).")
// 	KusamaAccount =>
// 		(2, "kusama", "Kusama Relay-chain, standard account (*25519).")
// 	Reserved3 =>
// 		(3, "reserved3", "Reserved for future use (3).")
// 	KatalChainAccount =>
// 		(4, "katalchain", "Katal Chain, standard account (*25519).")
// 	PlasmAccount =>
// 		(5, "plasm", "Plasm Network, standard account (*25519).")
// 	BifrostAccount =>
// 		(6, "bifrost", "Bifrost mainnet, direct checksum, standard account (*25519).")
// 	EdgewareAccount =>
// 		(7, "edgeware", "Edgeware mainnet, standard account (*25519).")
// 	KaruraAccount =>
// 		(8, "karura", "Acala Karura canary network, standard account (*25519).")
// 	ReynoldsAccount =>
// 		(9, "reynolds", "Laminar Reynolds canary network, standard account (*25519).")
// 	AcalaAccount =>
// 		(10, "acala", "Acala mainnet, standard account (*25519).")
// 	LaminarAccount =>
// 		(11, "laminar", "Laminar mainnet, standard account (*25519).")
// 	PolymathAccount =>
// 		(12, "polymath", "Polymath network, standard account (*25519).")
// 	SubstraTeeAccount =>
// 		(13, "substratee", "Any SubstraTEE off-chain network private account (*25519).")
// 	KulupuAccount =>
// 		(16, "kulupu", "Kulupu mainnet, standard account (*25519).")
// 	DarkAccount =>
// 		(17, "dark", "Dark mainnet, standard account (*25519).")
// 	DarwiniaAccount =>
// 		(18, "darwinia", "Darwinia Chain mainnet, standard account (*25519).")
// 	GeekAccount =>
// 		(19, "geek", "GeekCash mainnet, standard account (*25519).")
// 	StafiAccount =>
// 		(20, "stafi", "Stafi mainnet, standard account (*25519).")
// 	DockTestAccount =>
// 		(21, "dock-testnet", "Dock testnet, standard account (*25519).")
// 	DockMainAccount =>
// 		(22, "dock-mainnet", "Dock mainnet, standard account (*25519).")
// 	ShiftNrg =>
// 		(23, "shift", "ShiftNrg mainnet, standard account (*25519).")
// 	ZeroAccount =>
// 		(24, "zero", "ZERO mainnet, standard account (*25519).")
// 	AlphavilleAccount =>
// 		(25, "alphaville", "ZERO testnet, standard account (*25519).")
// 	SubsocialAccount =>
// 		(28, "subsocial", "Subsocial network, standard account (*25519).")
// 	PhalaAccount =>
// 		(30, "phala", "Phala Network, standard account (*25519).")
// 	RobonomicsAccount =>
// 		(32, "robonomics", "Any Robonomics network standard account (*25519).")
// 	DataHighwayAccount =>
// 		(33, "datahighway", "DataHighway mainnet, standard account (*25519).")
// 	CentrifugeAccount =>
// 		(36, "centrifuge", "Centrifuge Chain mainnet, standard account (*25519).")
// 	NodleAccount =>
// 		(37, "nodle", "Nodle Chain mainnet, standard account (*25519).")
// 	SubstrateAccount =>
// 		(42, "substrate", "Any Substrate network, standard account (*25519).")
// 	Reserved43 =>
// 		(43, "reserved43", "Reserved for future use (43).")
// 	ChainXAccount =>
// 		(44, "chainx", "ChainX mainnet, standard account (*25519).")
// 	Reserved46 =>
// 		(46, "reserved46", "Reserved for future use (46).")
// 	Reserved47 =>
// 		(47, "reserved47", "Reserved for future use (47).")
// 	// Note: 48 and above are reserved.
// );

class SubstrateChain implements ChainBase {
  int chainId;
  String chainName;
  String address;
  bool isLocked = true;
  String _suri;
  Map<String, dynamic> selectedEndpoint;

  List<Map<String, dynamic>> get endpointList => this.endpoints.values.toList();

  String get getAddress => address;

  Map<String, dynamic> endpoints = Map();
  static int getChainId(String chainName) {
    switch (chainName) {
      case SubstrateChainName.polkadot:
        return 0;
      case SubstrateChainName.reserved1:
        return 1;
      case SubstrateChainName.kusama:
        return 2;
      case SubstrateChainName.reserved3:
        return 3;
      case SubstrateChainName.katalchain:
        return 4;
      case SubstrateChainName.plasm:
        return 5;
      case SubstrateChainName.bifost:
        return 6;
      case SubstrateChainName.edgeware:
        return 7;
      case SubstrateChainName.karura:
        return 8;
      case SubstrateChainName.reynolds:
        return 9;
      case SubstrateChainName.acala:
        return 10;
      case SubstrateChainName.laminar:
        return 11;
      case SubstrateChainName.polymath:
        return 12;
      case SubstrateChainName.substratee:
        return 13;
      case SubstrateChainName.kulupu:
        return 16;
      case SubstrateChainName.dark:
        return 17;
      case SubstrateChainName.darwinia:
        return 18;
      case SubstrateChainName.geek:
        return 19;
      case SubstrateChainName.stafi:
        return 20;
      case SubstrateChainName.dockTestnet:
        return 21;
      case SubstrateChainName.dockMainnet:
        return 22;
      case SubstrateChainName.shift:
        return 23;
      case SubstrateChainName.zero:
        return 24;
      case SubstrateChainName.alphaville:
        return 25;
      case SubstrateChainName.subsocial:
        return 28;
      case SubstrateChainName.phala:
        return 30;
      case SubstrateChainName.robonomics:
        return 32;
      case SubstrateChainName.datahighway:
        return 33;
      case SubstrateChainName.centrifuge:
        return 36;
      case SubstrateChainName.nodle:
        return 37;
      case SubstrateChainName.substrate:
        return 42;
      case SubstrateChainName.reserved43:
        return 43;
      case SubstrateChainName.chainx:
        return 44;
      case SubstrateChainName.reserved46:
        return 46;
      case SubstrateChainName.reserved47:
        return 47;
      default:
        return null;
    }
  }

  static String getChainName(int chainId) {
    switch (chainId) {
      case 0:
        return SubstrateChainName.polkadot;
      case 1:
        return SubstrateChainName.reserved1;
      case 2:
        return SubstrateChainName.kusama;
      case 3:
        return SubstrateChainName.reserved3;
      case 4:
        return SubstrateChainName.katalchain;
      case 5:
        return SubstrateChainName.plasm;
      case 6:
        return SubstrateChainName.bifost;
      case 7:
        return SubstrateChainName.edgeware;
      case 8:
        return SubstrateChainName.karura;
      case 9:
        return SubstrateChainName.reynolds;
      case 10:
        return SubstrateChainName.acala;
      case 11:
        return SubstrateChainName.laminar;
      case 12:
        return SubstrateChainName.polymath;
      case 13:
        return SubstrateChainName.substratee;
      case 16:
        return SubstrateChainName.kulupu;
      case 17:
        return SubstrateChainName.dark;
      case 18:
        return SubstrateChainName.darwinia;
      case 19:
        return SubstrateChainName.geek;
      case 20:
        return SubstrateChainName.stafi;
      case 21:
        return SubstrateChainName.dockTestnet;
      case 22:
        return SubstrateChainName.dockMainnet;
      case 23:
        return SubstrateChainName.shift;
      case 24:
        return SubstrateChainName.zero;
      case 25:
        return SubstrateChainName.alphaville;
      case 28:
        return SubstrateChainName.subsocial;
      case 30:
        return SubstrateChainName.phala;
      case 32:
        return SubstrateChainName.robonomics;
      case 33:
        return SubstrateChainName.datahighway;
      case 36:
        return SubstrateChainName.centrifuge;
      case 37:
        return SubstrateChainName.nodle;
      case 42:
        return SubstrateChainName.substrate;
      case 43:
        return SubstrateChainName.reserved43;
      case 44:
        return SubstrateChainName.chainx;
      case 46:
        return SubstrateChainName.reserved46;
      case 47:
        return SubstrateChainName.reserved47;
      default:
        return null;
    }
  }

  factory SubstrateChain.fromName(String chainName) {
    var chainId = SubstrateChain.getChainId(chainName);
    return SubstrateChain._internal(chainId, chainName);
  }
  factory SubstrateChain.fromId(int chainId) {
    var chainName = SubstrateChain.getChainName(chainId);
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

  Map<String, dynamic> selectEndpoint(String endpointName) {
    this.selectedEndpoint = endpoints[endpointName];
    return this.selectedEndpoint;
  }

  Map<String, dynamic> selectEndpointWithSeq(int seq) {
    this.selectedEndpoint = endpointList[seq];
    return this.selectedEndpoint;
  }

  toMap() => {"chainName": this.chainName, "chainId": this.chainId, "isLocked": this.isLocked};

  @override
  String getAddressFromSeedPhrase(String seedPhrase, {dynamic params}) {
    var seed = seedPhrase + "//" + this.chainName + "///";
    this.address = substrateAddress(seed, this.chainId);
    return this.address;
  }

  @override
  String getAddressFromKeyStore(String keyStore, String password) {
    var seedPhrase = decryptData(keyStore, password);
    var suri = seedPhrase + "//" + this.chainName + "///";
    this.address = substrateAddress(suri, this.chainId);
    return this.address;
  }

  unlock({String keyStore, String password}) {
    try {
      if (this.isLocked == false) {
        return;
      } else {
        var seedPhrase = decryptData(keyStore, password);
        if (seedPhrase != null) {
          this.isLocked = false;
          this._suri = seedPhrase + "//" + this.chainName + "///";
        } else {
          this.isLocked = true;
          this._suri = null;
        }
      }
    } catch (e) {
      this.isLocked = true;
      this._suri = null;
      throw e;
    }
  }

  String sign(String message) {
    try {
      if (this.isLocked == true) {
        throw "The account is locked, unlock it first";
      } else {
        var result = substrateSign(this._suri, message);
        if (result != null) {
          // lock after sign
          this.isLocked = true;
          this._suri = null;
          return result;
        } else {
          return null;
        }
      }
    } catch (e) {
      this.isLocked = true;
      this._suri = null;
      throw e;
    }
  }
}
