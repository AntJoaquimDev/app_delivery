import 'package:delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:delivery_app/app/core/ui/styles/colors_app.dart';
import 'package:delivery_app/app/core/ui/styles/text_style.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_buttom.dart';
import 'package:delivery_app/app/delivery_app.dart';
import 'package:flutter/material.dart';

class OrderCompletPage extends StatelessWidget {
  const OrderCompletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: DeliveryAppbar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: context.percentHeigth(0.2),
              ),
              Image.asset('assets/images/logo_rounded.png'),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Pedido realizado com sucesso, embreve você receberá a confirmacção do prdido',
                textAlign: TextAlign.center,
                style: context.textStyle.textExtraBold.copyWith(
                  fontSize: 18,
                  color: ColorsApp.inst.primary,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              DeliveryButtom(
                width: context.percentWidth(.80),
                label: 'FECHAR',
                onpressed: () => Navigator.of(context).pop(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
