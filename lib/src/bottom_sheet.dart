import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottom_sheet_item.dart';

class BottomSheet {
  BottomSheet.show(context, List<SheetItem> items, onTap) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.only(bottom: 30),
            decoration: BoxDecoration(
              //背景
              color: isDarkMode
                  ? const Color.fromRGBO(34, 32, 34, 1)
                  : Colors.white,
              //设置四周圆角 角度
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14.0),
                topRight: Radius.circular(14.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 36,
                    height: 3,
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.white12 : Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                  ),
                ),
                Wrap(
                  children: items
                      .asMap()
                      .map((index, e) {
                        return MapEntry(
                          index,
                          ListTile(
                            enableFeedback: true,
                            leading: e.icon == null ? null : Icon(e.icon),
                            minLeadingWidth: 30,
                            hoverColor: Colors.black12,
                            minVerticalPadding: 0,
                            title: Container(
                              height: 52,
                              alignment: Alignment(-1, 0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(238, 238, 238, 0.5),
                                  ),
                                ),
                              ),
                              child: Text(e.title),
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                              onTap(index);
                            },
                          ),
                        );
                      })
                      .values
                      .toList(),
                )
              ],
            ),
          );
        });
  }

  BottomSheet.custom(context, Widget widget) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return widget;
        });
  }
}
