import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui.dart';



class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.initialValue,
    this.hintText,
    this.errorText,
    this.iconData,
    this.labelText,
    this.obscureText,
    this.suffixIcon,
    this.isFirst,
    this.isLast,
    this.style,
    this.textAlign,
    this.suffix,
    this.readOnly = false,
  }) : super(key: key);

  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final String? initialValue;
  final String? hintText;
  final String? errorText;
  final TextAlign? textAlign;
  final String? labelText;
  final TextStyle? style;
  final IconData? iconData;
  final bool? obscureText;
  final bool? isFirst;
  final bool? isLast;
  final Widget? suffixIcon;
  final Widget? suffix;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(
          left: 20, right: 20, top: topMargin, bottom: bottomMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText ?? "",
            style: Get.textTheme.bodyText2,
            textAlign: textAlign ?? TextAlign.start,
          ),
          Container(
            padding: const EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
            margin: EdgeInsets.only(top: containerTopMargin),
            decoration: BoxDecoration(
                color: Get.theme.colorScheme.background,
                borderRadius: buildBorderRadius,
                boxShadow: [
                  BoxShadow(
                      color: Get.theme.focusColor.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5)),
                ],
                border: Border.all(color: Get.theme.colorScheme.outline)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                TextFormField(
                  textInputAction:TextInputAction.next,
                  readOnly: readOnly,
                  maxLines: keyboardType == TextInputType.multiline ? null : 1,
                  key: key,
                  keyboardType: keyboardType ?? TextInputType.text,
                  onSaved: onSaved,
                  onChanged: onChanged,
                  validator: validator,
                  initialValue: initialValue ?? '',
                  style: style ?? Get.textTheme.bodyText2,
                  obscureText: obscureText ?? false,
                  textAlign: textAlign ?? TextAlign.start,
                  decoration: Ui.getInputDecoration(
                    hintText: hintText ?? '',
                    iconData: iconData,
                    suffixIcon: suffixIcon,
                    suffix: suffix,
                    errorText: errorText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BorderRadius get buildBorderRadius {
    return const BorderRadius.all(Radius.circular(15));
  }

  double get containerTopMargin {
    return 5;
  }

  double get topMargin {
    if ((isFirst != null && isFirst!)) {
      return 20;
    } else if (isFirst == null) {
      return 10;
    } else {
      return 0;
    }
  }

  double get bottomMargin {
    if ((isLast != null && isLast!)) {
      return 20;
    } else if (isLast == null) {
      return 10;
    } else {
      return 0;
    }
  }
}

