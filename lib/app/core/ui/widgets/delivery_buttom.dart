import 'package:delivery_app/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class DeliveryButtom extends StatelessWidget {
  final String label;
  final VoidCallback? onpressed;
  final double? width;
  final double? height;
  const DeliveryButtom({
    super.key,
    required this.label,
    this.onpressed,
    this.width,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(backgroundColor: ColorsApp.inst.primary),
        onPressed: onpressed,
        child: Text(label),
      ),
    );
  }
}
