import 'package:delivery_app/app/core/ui/styles/text_style.dart';
import 'package:flutter/material.dart';

class OrderField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final FormFieldValidator validator;
  final String hintText;
  const OrderField({
    super.key,
    required this.title,
    required this.controller,
    required this.validator,
    required this.hintText,
    
  });

  @override
  Widget build(BuildContext context) {
    const defaultBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Text(
              title,
              style: context.textStyle.textRegular
                  .copyWith(overflow: TextOverflow.ellipsis, fontSize: 16),
            ),
          ),
          TextFormField(
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
              border: defaultBorder,
              enabledBorder: defaultBorder,
              focusedBorder: defaultBorder,
            ),
          )
        ],
      ),
    );
  }
}
