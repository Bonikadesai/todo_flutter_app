import 'package:flutter/cupertino.dart';

class DialogBox {
  VoidCallback onSave;
  VoidCallback onCancle;

  DialogBox({required this.onSave, required this.onCancle});
}
