import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';

class ButtonsPdv {
  Widget iconsOptions(IconData icon, String text, Function() action) {
    final _configController = Dependencies.configController();

    return Expanded(
      child: SizedBox(
        width: 100,
        height: 100,
        child: GestureDetector(
          onTap: action,
          child: Card(
            color: _configController.selectedColor.value.color,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: AutoSizeText(
                      text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                      maxLines: 1,
                      maxFontSize: 15,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
