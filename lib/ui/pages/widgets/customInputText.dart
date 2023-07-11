import 'package:app_system/ui/utils/constants.dart';
import 'package:app_system/ui/utils/responsive.dart';
import 'package:app_system/ui/pages/widgets/customInputDecoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputText extends StatelessWidget {
  final String title;
  const InputText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          title,
          style: h3,
        )),
        Expanded(
          flex: 3,
          child: SizedBox(
            height: 40,
            child: TextFormField(
                style: h4,
                decoration: CustomInputDecoration.inputDecoration1(
                  hint: "hint",
                  label: "label",
                )
                /* decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue.shade50,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue.shade50,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                hintText: "Hola",
                fillColor: Colors.blue[50],
              ),
             */
                ),
          ),
        )
      ],
    );
  }
}

class InputTextGroup extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final InputDecoration decoration;
  final bool isPassword;
  final Function fcValidator;
  final Function fcChanged;
  final double column;
  final List<TextInputFormatter>? inputFormatters;

  const InputTextGroup({
    super.key,
    required this.title,
    required this.controller,
    required this.fcValidator,
    required this.fcChanged,
    required this.decoration,
    this.isPassword = false,
    this.column = 12,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      //margin: const EdgeInsets.symmetric(vertical: 2),
      constraints: BoxConstraints(
        maxWidth: Responsive.width(size.width, column),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: h3,
          ),
          const SizedBox(
            height: 2,
          ),
          TextFormField(
            style: h4,
            decoration: decoration,
            controller: controller,
            obscureText: isPassword,
            enableSuggestions: false,
            autocorrect: false,
            validator: (String? value) => fcValidator(value),
            onChanged: (value) => fcChanged(value),
            inputFormatters: inputFormatters,
          ),
        ],
      ),
    );
  }
}

class InputTextFloating extends StatelessWidget {
  final TextEditingController? controller;
  final InputDecoration decoration;
  final bool isPassword;
  final Function fcValidator;
  final Function fcChanged;
  const InputTextFloating({
    super.key,
    this.controller,
    required this.decoration,
    required this.fcValidator,
    required this.fcChanged,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
          style: h4,
          obscureText: isPassword,
          enableSuggestions: false,
          autocorrect: false,
          controller: controller,
          validator: (String? value) => fcValidator(value),
          onChanged: (String? value) => fcChanged(value),
          decoration: decoration),
    );
  }
}
