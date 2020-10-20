abstract class ChainBase {
  String getAddressFromSeedPhrase(String phrase, {dynamic params});
  String getAddressFromKeyStore(String keyStore, String password);
}
