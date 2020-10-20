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

class SubstrateChainName {
  static const String polkadot = 'polkadot'; //0
  static const String reserved1 = 'reserved1'; // 1
  static const String kusama = 'kusama'; // 2
  static const String reserved3 = 'reserved3'; // 3
  static const String katalchain = 'katalchain'; // 4
  static const String plasm = 'plasm'; // 5
  static const String bifost = 'bifrost'; //6
  static const String edgeware = 'edgeware'; // 7
  static const String karura = 'karura'; // 8
  static const String reynolds = 'reynolds'; // 9
  static const String acala = 'acala'; // 10
  static const String laminar = 'laminar'; // 11
  static const String polymath = 'polymath'; // 12
  static const String substratee = 'substratee'; // 13
  static const String kulupu = 'kulupu'; // 16
  static const String dark = 'dark'; // 17
  static const String darwinia = 'darwinia'; // 18
  static const String geek = 'geek'; // 19
  static const String stafi = 'stafi'; // 20
  static const String dockTestnet = 'dock-testnet'; // 21
  static const String dockMainnet = 'dock-mainnet'; // 22
  static const String shift = 'shift'; // 23
  static const String zero = 'zero'; // 24
  static const String alphaville = 'alphaville'; // 25
  static const String subsocial = 'subsocial'; // 28
  static const String phala = 'phala'; // 30
  static const String robonomics = 'robonomics'; // 32
  static const String datahighway = 'datahighway'; // 33
  static const String centrifuge = 'centrifuge'; //36
  static const String nodle = 'nodle'; // 37
  static const String substrate = 'substrate'; // 42
  static const String reserved43 = 'reserved43'; // 43
  static const String chainx = 'chainx'; // 44
  static const String reserved46 = 'reserved46'; // 46
  static const String reserved47 = 'reserved47'; // 47
}

// phala:wss://poc2.phala.network/ws
