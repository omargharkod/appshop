import 'package:flutter/material.dart';

class DefaultField extends StatelessWidget {
  final TextEditingController controller;
  final bool? isPassword;
  final TextInputType type;
  final ValueChanged<String>? onSubmet;
  final String? Function(String?) validator;
  final String text;
  final IconData pre;
  final IconData? suffix;
  final VoidCallback? sufPressed;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onchanged;

  const DefaultField({
    super.key,
    required this.controller,
    required this.type,
    this.onSubmet,
    required this.validator,
    required this.text,
    required this.pre,
    this.isPassword = false,
    this.suffix,
    this.sufPressed,
    this.onTap,
    this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        keyboardType: TextInputType.visiblePassword,
        obscureText: isPassword!,
        onFieldSubmitted: onSubmet,
        validator: validator,
        onChanged: onchanged,
        onTap: onTap,
        decoration: InputDecoration(
          labelText: text,
          border: const OutlineInputBorder(),
          prefixIcon: Icon(pre),
          suffixIcon: suffix != null
              ? IconButton(onPressed: sufPressed, icon: Icon(suffix))
              : null,
        ));
  }
}
