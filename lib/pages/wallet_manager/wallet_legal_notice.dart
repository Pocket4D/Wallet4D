import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet4d/components/antdIcons.dart';
import 'package:wallet4d/components/buttons.dart';
import 'package:wallet4d/components/common_list_item.dart';
import 'package:wallet4d/pages/base_scaffold.dart';
import 'package:wallet4d/utils/k_dimens_util.dart';
import 'package:wallet4d/utils/k_gaps_util.dart';
import 'wallet_legal_notice.i18n.dart';

class WalletLegalNoticePage extends StatefulWidget {
  WalletLegalNoticePage({Key key, this.title, this.name, this.params}) : super(key: key);
  final String title;
  final String name;
  final dynamic params;
  @override
  _WalletLegalNoticePageState createState() => _WalletLegalNoticePageState();
}

class _WalletLegalNoticePageState extends State<WalletLegalNoticePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BaseScaffold(
      name: widget.name,
      params: widget.params,
      pageBody: buildPageBody(context),
    );
  }

  Widget buildPageBody(BuildContext context) {
    final contextWidth = MediaQuery.of(context).size.width;
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
                    "Legal Notice".i18n,
                    style: GoogleFonts.roboto(
                        fontStyle: FontStyle.normal,
                        textStyle: TextStyle(
                            fontSize: KDimens.font_sp22,
                            color: Colors.black,
                            fontWeight: FontWeight.w700)),
                  ),
                  KGaps.vGap16,
                  Text(
                    "Please review the Wallet4D Privacy Policy and Terms of Service.".i18n,
                    style: GoogleFonts.roboto(
                        fontStyle: FontStyle.normal,
                        textStyle: TextStyle(
                          fontSize: KDimens.font_sp16,
                          color: Colors.black87,
                        )),
                  )
                ],
              ),
            ),
            Column(
              children: [
                commonListItem(null, "Term of Service".i18n, () => print("ontap term of service")),
                commonListItem(null, "Privacy Policy".i18n, () => print("ontap privacy policy")),
                KGaps.vGap16,
                primaryButton(
                    buttonText: "Accept and continue".i18n,
                    onPressed: () => (print("Accept button tapped")),
                    contextWidth: contextWidth),
                KGaps.vGap16,
              ],
            ),
          ],
        ));
  }
}
