import 'package:form_validation/exports.dart';

class UserInputTextField extends StatelessWidget {
  UserInputTextField({
    super.key,
    required this.hintText,
    this.onValueChange,
    this.validatorMsg,
    this.keyboardType,
    this.typePassword,
    this.onEyePress,
    this.minLine,
    this.maxLine,
    this.obscureText,
    this.hintTextStyle,
    this.valueStyle,
    this.eyeColor,
    this.controller,
    this.isEnabled,
    this.defaultValue,
    this.contentPadding,
    this.isFilled,
    this.fillColor,
    this.prefixIcon,
    this.outlineBorder,
    this.borderRadius,
    this.borderColor,
    this.cursorColor,
    this.inputDecoration,
    this.suffix,
    this.suffixIcon,
    this.validationType,
  });

  final String hintText;
  final Function? onValueChange;
  final String? keyboardType;
  final String? validatorMsg;
  final bool? typePassword;
  final bool? obscureText;
  final VoidCallback? onEyePress;
  final TextStyle? hintTextStyle;
  final TextStyle? valueStyle;
  final Color? eyeColor;
  final TextEditingController? controller;
  final String? validationType;
  final bool? isEnabled;
  final String? defaultValue;
  final EdgeInsets? contentPadding;
  final bool? isFilled;
  final Color? fillColor;
  final Color? cursorColor;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final BorderRadius? borderRadius;
  final int? minLine;
  final int? maxLine;
  final Widget? suffix;
  final bool? outlineBorder;
  final InputDecoration? inputDecoration;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      cursorColor: cursorColor ?? Colors.grey,
      initialValue: defaultValue,
      onChanged: (value) {
        if (onValueChange != null) {
          try {
            onValueChange!(value);
          } catch (e) {
            print(e);
          }
        }
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      obscureText: obscureText ?? false,
      inputFormatters: [
        if (keyboardType == 'number')
          LengthLimitingTextInputFormatter(10)
        else if (validationType == 'postalCode')
          LengthLimitingTextInputFormatter(6)
      ],
      style: valueStyle ?? TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
      maxLines: maxLine ?? 1,
      minLines: minLine ?? 1,
      keyboardType: keyboardType == 'number'
          ? TextInputType.number
          : keyboardType == 'email'
              ? TextInputType.emailAddress
              : TextInputType.text,
      textAlignVertical: TextAlignVertical.top,
      decoration: inputDecoration ??
          InputDecoration(
            isCollapsed: true,
            filled: isFilled ?? false,
            fillColor: fillColor ?? Colors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: borderRadius ?? BorderRadius.circular(10),
            ),
            focusedBorder: outlineBorder == true
                ? OutlineInputBorder(
                    borderRadius: borderRadius ?? BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: borderColor ?? Colors.grey,
                      width: 1.0,
                    ),
                  )
                : null,
            enabledBorder: outlineBorder == true
                ? OutlineInputBorder(
                    borderRadius: borderRadius ?? BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: borderColor ?? Colors.grey,
                      width: 1.0,
                    ),
                  )
                : null,
            errorBorder: outlineBorder == true
                ? OutlineInputBorder(
                    borderRadius: borderRadius ?? BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 1.0,
                    ),
                  )
                : null,
            focusedErrorBorder: outlineBorder == true
                ? OutlineInputBorder(
                    borderRadius: borderRadius ?? BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 1.0,
                    ),
                  )
                : null,
            errorStyle: const TextStyle(color: Colors.red),
            errorMaxLines: 2,
            contentPadding: contentPadding,
            hintText: hintText,
            prefixIcon: prefixIcon,
            prefixIconColor: Colors.grey,
            hintStyle: hintTextStyle ??
                TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                ),
            suffixIcon: typePassword == true
                ? IconButton(
                    splashRadius: 20,
                    onPressed: onEyePress,
                    icon: Icon(
                      obscureText == true ? Icons.visibility : Icons.visibility_off,
                      color: eyeColor ?? Colors.grey,
                    ),
                  )
                : suffixIcon,
            suffix: suffix,
          ),
      validator: (value) {
        switch (validationType) {
          // this case will work for all type of string (only includes alphabets a-z) like - firstName, lastName, sirName, middleName, city,
          case 'stringName':
            if (!RegExp(r"^[A-Za-z]+$").hasMatch(value ?? "")) {
              print("l70");
              return validatorMsg ?? 'Please fill valid details!!';
              // return 'Enter a valid first name';
            } else {
              print("hhh $value");
              return null;
            }
          // this case is for postal/zip/pin code (only includes number with length 6)
          case 'postalCode':
            if ((value ?? "").length != 6) {
              return validatorMsg ?? 'Please fill valid details!!';
              // return 'Enter a valid postal code';
            } else {
              return null;
            }
          // this case is for email validation
          case 'email':
            if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value ?? "")) {
              return validatorMsg ?? 'Please fill valid details!!';
              // return 'Enter a valid email';
            } else {
              return null;
            }
          // this case is for phone validation (we can change length of number according to county)
          case 'phoneNumber':
            if ((value ?? "").length != 10) {
              return validatorMsg ?? 'Please fill valid details!!';
              // return 'Enter a valid mobile number';
            } else {
              return null;
            }
          // this case is for normal password with length 8 (we can change the length)
          case 'password':
            if ((value ?? "").length < 8) {
              return validatorMsg ?? 'Please fill valid details!!';
              // return 'Enter a valid password. Password must be of minimum 8 characters.';
            } else {
              return null;
            }
          // this case supports all, string,integer,special character, etc. like - address, house/flat no, direction, etc.
          case 'anyString':
            if (!RegExp(r"^[A-Za-z0-9'\.\-\s\,]").hasMatch(value ?? "")) {
              print("l70");
              return validatorMsg ?? 'Please fill valid details!!';
              // return 'Address is required';
            } else {
              print("hhh $value");
              return null;
            }
          // this case is for strong password like - minimum length 8 character, at least 1 special character, at least 1 Capital letter, at least 1 number
          case 'strongPassword':
            if (!RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$').hasMatch(value ?? "")) {
              return validatorMsg ?? 'Minimum 8 characters, with a mix of uppercase, lowercase, number, and special character.';

              //'Password Must contain at least one number and one uppercase and one special character and lowercase letter, and at least 8 or more characters';
              // return 'Minimum 8 characters, with a mix of uppercase, lowercase, number, and special character.';
            } else {
              print("hhh $value");
              return null;
            }
          /* // recommend not to use address, houseNumber, direction this validation case instead use anyString validation case
          case 'address':
            if (!RegExp(r"^[A-Za-z0-9'\.\-\s\,]").hasMatch(value ?? "")) {
              print("l70");
              return validatorMsg ?? 'Please fill valid details!!';
              // return 'Address is required';
            } else {
              print("hhh $value");
              return null;
            }
          case 'houseNumber':
            if (value == "") {
              return validatorMsg ?? 'Please fill valid details!!';
              // return 'Enter a valid house number';
            } else {
              return null;
            }
          case 'direction':
            if (!RegExp(r"^[A-Za-z]").hasMatch(value ?? "")) {
              print("l70");
              return validatorMsg ?? 'Please fill valid details!!';
              // return 'Please enter directions';
            } else {
              print("hhh $value");
              return null;
            }

            */
          default:
            return 'Something is Wrong!!';
        }
      },

      /*validator: (value) {
        print("kkkh $value");

        if (validationType == 'firstName') {
          if (!RegExp(r"^[A-Za-z]+$").hasMatch(value ?? "")) {
            print("l70");
            return 'Enter a valid first name';
          } else {
            print("hhh $value");
            return null;
          }
        } else if (validationType == 'lastName') {
          if (!RegExp(r"^[A-Za-z]+$").hasMatch(value ?? "")) {
            print("l70");
            return 'Enter a valid last name';
          } else {
            print("hhh $value");
            return null;
          }
        } else if (validationType == 'surname') {
          if (!RegExp(r"^[A-Za-z]+$").hasMatch(value ?? "")) {
            return 'Enter a valid surname';
          } else {
            return null;
          }
        } else if (validationType == 'text') {
          if (!RegExp(r"^[A-Za-z]").hasMatch(value ?? "")) {
            return 'Enter a valid surname';
          } else {
            return null;
          }
        } else if (validationType == 'city') {
          if (!RegExp(r"^[A-Za-z]+$").hasMatch(value ?? "")) {
            return 'Enter a valid city';
          } else {
            return null;
          }
        } else if (validationType == 'postalCode') {
          if ((value ?? "").length != 6) {
            return 'Enter a valid postal code';
          } else {
            return null;
          }
        } else if (validationType == 'email') {
          if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value ?? "")) {
            return 'Enter a valid email';
          } else {
            return null;
          }
        } else if (validationType == 'phoneNumber') {
          if ((value ?? "").length != 7) {
            return 'Enter a valid mobile number';
          } else {
            return null;
          }
        } else if (validationType == 'password') {
          if ((value ?? "").length < 8) {
            return 'Enter a valid password. Password must be of minimum 8 characters.';
          } else {
            return null;
          }
        } else
        // ADDRESS VALIDATIONS
        if (validationType == 'address') {
          if (!RegExp(r"^[A-Za-z0-9'\.\-\s\,]").hasMatch(value ?? "")) {
            print("l70");
            return 'Address is required';
          } else {
            print("hhh $value");
            return null;
          }
        }
        // else if (validationType == 'houseNumber') {
        //   if (value == "") {
        //     return 'Enter a valid house number';
        //   } else {
        //     return null;
        //   }
        // } else if (validationType == 'direction') {
        //   if (!RegExp(r"^[A-Za-z]").hasMatch(value ?? "")) {
        //     print("l70");
        //     return 'Please enter directions';
        //   }
        //   else {
        //     print("hhh ${value}");
        //     return null;
        //   }
        // }
        return null;
      },*/
    );
  }
}
