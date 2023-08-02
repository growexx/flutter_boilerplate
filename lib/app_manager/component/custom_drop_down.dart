
import 'package:flutter/material.dart';
class CustomDropDown<T> extends StatelessWidget {
  final T? value;
  final String? hint;
  final Image? imgLogo;
  final bool isExpanded;
  final ValueChanged<T?> onChanged;
  final List<DropdownMenuItem<T>>? items;
  final FocusNode? focusNode;

  const CustomDropDown(
      {super.key,
      this.value,
        this.hint,
      this.isExpanded = true,
      required this.onChanged,
      this.items,
      this.imgLogo,
      this.focusNode,});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      focusNode: focusNode,
      value: value,
      alignment: AlignmentDirectional.centerStart,
      onChanged: onChanged,
      hint: hint==null? null:Align(
        alignment: Alignment.centerLeft,
        child: Text(hint!,
          textAlign: TextAlign.start,
        ),
      ),
      focusColor: Colors.transparent,
      decoration: const InputDecoration(
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        contentPadding: EdgeInsets.fromLTRB(0,12,12,12),
        isDense: true,
        fillColor: Colors.transparent,
        filled: true,
        prefixIcon: Icon(Icons.language,
          size: 20,)
      ),
      items: items,
      isExpanded: isExpanded,
    );
  }
}
