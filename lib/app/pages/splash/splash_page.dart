import 'package:delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_buttom.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: Color(0XFF140E0E),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.screenWidth,
                child: Image.asset(
                  'assets/images/lanche.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: context.percentHeigth(.30),
                  ),
                  Image.asset('assets/images/logo.png'),
                  const SizedBox(height: 80),
                  DeliveryButtom(
                    width: context.percentWidth(.6),
                    height: 35,
                    label: 'ACESSAR',
                    onpressed: () {
                      Navigator.of(context).popAndPushNamed('/home');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
