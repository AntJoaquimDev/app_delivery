import 'package:delivery_app/app/core/ui/base_state/base_state.dart';
import 'package:delivery_app/app/core/ui/styles/text_style.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_buttom.dart';
import 'package:delivery_app/app/pages/auth/login/login_controller.dart';
import 'package:delivery_app/app/pages/auth/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage, LoginController> {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginController, LoginState>(
      listener: (context, state) {
        state.status.matchAny(
          any: hiderLoader,
          login: showLoader,
          loginError: () {
            hiderLoader();
            ShowError('Login ou senha invalidos');
          },
          error: () {
            hiderLoader();
            ShowError('Erro ao realizar o login');
          },
          success: () {
            hiderLoader();
            Navigator.pop(context, true);
          },
        );
      },
      child: Scaffold(
        appBar: DeliveryAppbar(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: context.textStyle.TextTitle,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'E-mail',
                        ),
                        controller: emailEC,
                        validator: Validatorless.multiple([
                          Validatorless.required('E-mail obrigatorio'),
                          Validatorless.email('E-mail Invalido'),
                        ]),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Senha',
                        ),
                        controller: passwordEC,
                        validator: Validatorless.multiple([
                          Validatorless.required('Senha obrigatoria'),
                        ]),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: DeliveryButtom(
                          width: double.infinity,
                          label: 'ENTRAR',
                          onpressed: () {
                            final valid =
                                formKey.currentState?.validate() ?? false;
                            if (valid) {
                              controller.login(emailEC.text, passwordEC.text);
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Não possui uma conta',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/auth/register'),
                      child: Text(
                        'Cadastre-se',
                        style: context.textStyle.textBold
                            .copyWith(color: Colors.blue),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
