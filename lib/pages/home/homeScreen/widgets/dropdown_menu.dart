import 'package:flutter/material.dart';
import 'package:wallet4d/components/antdIcons.dart';
import 'package:wallet4d/utils/k_dimens_util.dart';
import 'package:wallet4d/utils/k_theme_util.dart';

// This menu button widget updates a _selection field (of type WhyFarther,
// not shown here).

Widget dropDownMenu<T>({void Function(T) onSelected, List<PopupMenuEntry<T>> items}) {
  return PopupMenuButton<T>(
    onSelected: onSelected,
    offset: Offset(0.0, KDimens.gap_dp50),
    padding: EdgeInsets.all(KDimens.gap_dp8),
    icon: Icon(
      AntdIcons.plusCircle,
      size: KDimens.font_sp24,
    ),
    itemBuilder: (BuildContext context) => items,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(KDimens.gap_dp8),
        side: new BorderSide(
          style: BorderStyle.none,
        )),
  );
}
