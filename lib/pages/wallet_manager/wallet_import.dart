import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:thrio/thrio.dart';

import 'package:wallet4d/components/buttons.dart';
import 'package:wallet4d/pages/base_scaffold.dart';
import 'package:wallet4d/services/wallet_service.dart';

import 'package:wallet4d/utils/k_dimens_util.dart';
import 'package:wallet4d/utils/k_gaps_util.dart';
import 'package:wallet4d/utils/k_theme_util.dart';
import 'package:wallet4d/utils/k_word_list.dart';

import 'wallet_create.i18n.dart';

class WalletImportPage extends StatefulWidget {
  WalletImportPage({Key key, this.title, this.name, this.params}) : super(key: key);
  final String title;
  final String name;
  final dynamic params;
  @override
  _WalletImportPageState createState() => _WalletImportPageState();
}

class _WalletImportPageState extends State<WalletImportPage> {
  int step = 1;
  String _phrases = "";
  int matched = 0;
  bool _passwordSaved = false;
  bool _walletNameSaved = false;
  bool _phrasesVerified = false;
  bool _loading = false;
  // GlobalKey<FormState> _formKeyImport = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _passwordRetype;
  String _password;
  String _walletName;

  TextEditingController _importPhrasesContoller = TextEditingController();
  TextEditingController _walletNameContoller = TextEditingController();
  TextEditingController _passwordContoller = TextEditingController();
  TextEditingController _passwordRetypeContoller = TextEditingController();

  @override
  void initState() {
    extractParams();
    // createPhrases();
    super.initState();
  }

  @override
  void dispose() {
    _passwordContoller.dispose();
    _passwordRetypeContoller.dispose();
    super.dispose();
  }

  extractParams() {}

  verifyPhrases(String phrases) {
    try {
      List<String> phrasesList = phrases.trimLeft().trimRight().split(" ");
      bool isLengthCorrect = false;
      if (phrasesList.length == 12 || phrasesList.length == 18 || phrasesList.length == 24) {
        isLengthCorrect = true;
      }

      bool isAllInWordList =
          phrasesList.firstWhere((element) => !WORDLIST.contains(element), orElse: () => null) !=
                  null
              ? false
              : true;
      return isLengthCorrect && isAllInWordList;
    } catch (e) {
      throw (e);
    }
  }

  validateForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _passwordSaved = true;
        _walletNameSaved = true;
      });
    }
  }

  finishWalletCreation() async {
    // _phrases
    // JhStorageUtils.saveString(key, value)
    try {
      setState(() {
        _loading = true;
      });
      FocusScope.of(context).requestFocus(FocusNode());
      print("_walletName: $_walletName");
      var result = await WalletService.saveWallet(_phrases, _walletName, _password);
      if (result) {
        /// TODO: this is so ugly
        await ThrioNavigator.remove(url: "/wallet");
        setState(() {
          _loading = false;
        });

        /// TODO: this is so ugly
        await ThrioNavigator.push(url: "/wallet", params: {"from": "/wallet/import"});
      }
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BaseScaffold(
      name: widget.name,
      params: widget.params,
      pageBody: LoadingOverlay(
          isLoading: _loading,
          opacity: 0.6,
          color: KColor.kWeiXinBgColor,
          child: buildPageBody(context)),
      onPageNotify: onPageNotify,
    );
  }

  onPageNotify(params) async {
    var receivedParams = Map<String, dynamic>.from(params);
    var fromRoute = receivedParams["from"];
    if (fromRoute == "/wallet/terms") {
      // await ThrioNavigator.notify(url: "/wallet/terms", name: "/wallet/terms/notify");
      await ThrioNavigator.remove(url: '/wallet/terms');
      // print(result);
    }
  }

  Widget showStepOne() {
    return
        // TextFormField(initialValue: ,)
        Container(
      decoration: BoxDecoration(border: Border.all(color: KColor.kLineColor)),
      // padding: EdgeInsets.all(KDimens.gap_dp8),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(8.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide.none)),
        controller: _importPhrasesContoller,
        maxLines: 4,
        onChanged: (value) {
          setState(() {
            _phrases = value;
            _phrasesVerified = verifyPhrases(value);
          });
        },
      ),
    );
  }

  Widget showStepTwo() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: KDimens.gap_dp4, horizontal: KDimens.gap_dp16),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                key: Key("_walletName"),
                enabled: !_loading,
                controller: _walletNameContoller,
                style: GoogleFonts.roboto(
                    fontStyle: FontStyle.normal,
                    textStyle: TextStyle(
                      fontSize: KDimens.font_sp16,
                    )),
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Wallet Name'.i18n,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: KDimens.gap_dp8, vertical: KDimens.gap_dp4),
                ),
                validator: (val) {
                  return val == '' || val == null ? "Wallet Name must not be empty".i18n : null;
                },
                onChanged: (val) {
                  setState(() {
                    _walletName = val;
                    _walletNameSaved = false;
                  });
                  _formKey.currentState.save();
                  validateForm();
                },
              ),
              KGaps.vGap8,
              TextFormField(
                key: Key("_password"),
                enabled: !_loading,
                controller: _passwordContoller,
                style: GoogleFonts.roboto(
                    fontStyle: FontStyle.normal,
                    textStyle: TextStyle(
                      fontSize: KDimens.font_sp16,
                    )),
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password'.i18n,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: KDimens.gap_dp8, vertical: KDimens.gap_dp4),
                ),
                onChanged: (val) {
                  _passwordRetypeContoller.text = null;
                  setState(() {
                    _password = _passwordContoller.text;
                    _passwordSaved = false;
                  });
                  _formKey.currentState.save();
                  validateForm();
                },
              ),
              KGaps.vGap8,
              TextFormField(
                key: Key("_passwordRetype"),
                enabled: !_loading,
                controller: _passwordRetypeContoller,
                style: GoogleFonts.roboto(
                    fontStyle: FontStyle.normal,
                    textStyle: TextStyle(
                      fontSize: KDimens.font_sp16,
                    )),
                decoration: InputDecoration(
                  hintText: 'Confirm Your Password'.i18n,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: KDimens.gap_dp8, vertical: KDimens.gap_dp4),
                ),
                obscureText: true,
                validator: (val) {
                  return val != _password ? "Password is not matched".i18n : null;
                },
                onChanged: (val) {
                  setState(() {
                    _passwordRetype = _passwordRetypeContoller.text;
                    _passwordSaved = false;
                  });
                  _formKey.currentState.save();
                  validateForm();
                },
              ),
            ],
          ),
        ));
    // TextFormField(initialValue: ,)
  }

  Widget buildPageBody(BuildContext context) {
    print("_phrases: $_phrases");
    final contextWidth = MediaQuery.of(context).size.width;

    bool buttonDisabled = false;

    if (step == 1 && _phrasesVerified == false) {
      buttonDisabled = true;
    }
    if (step == 2 && (_passwordSaved == false || _walletNameSaved == false)) {
      buttonDisabled = true;
    }

    return Container(
        margin: EdgeInsets.only(top: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.symmetric(horizontal: KDimens.gap_dp16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  KGaps.vGap50,
                  Text(
                    "Step".i18n + " $step " + "of 2",
                    style: GoogleFonts.roboto(
                        fontStyle: FontStyle.normal,
                        textStyle: TextStyle(
                            fontSize: KDimens.font_sp22,
                            color: Colors.black,
                            fontWeight: FontWeight.w700)),
                  ),
                  KGaps.vGap16,
                  Text(
                    step == 1
                        ? "Please save words below on a paper, in the next step you will need to use them"
                            .i18n
                        : "Enter password to encrypt your wallet".i18n,
                    style: GoogleFonts.roboto(
                        fontStyle: FontStyle.normal,
                        textStyle: TextStyle(
                          fontSize: KDimens.font_sp16,
                          color: Colors.black87,
                        )),
                  ),
                  KGaps.vGap8,
                  step == 1 ? showStepOne() : showStepTwo()
                ],
              ),
            ),
            Column(
              children: [
                primaryButton(
                    buttonText: step == 1
                        ? "I have saved".i18n
                        : step == 2
                            ? "Next Step".i18n
                            : "Finish".i18n,
                    onPressed: () {
                      if (step == 1) {
                        setState(() {
                          step += 1;
                        });
                      }
                      if (step == 2) {
                        if (_passwordSaved == true &&
                            _walletName != null &&
                            _phrases != null &&
                            _passwordRetype != null &&
                            _password != null) {
                          finishWalletCreation();
                        }
                      }
                    },
                    disable: buttonDisabled,
                    contextWidth: contextWidth),
                KGaps.vGap16,
              ],
            ),
          ],
        ));
  }
}
