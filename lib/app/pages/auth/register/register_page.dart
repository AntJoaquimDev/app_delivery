import 'package:delivery_app/app/core/ui/base_state/base_state.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_buttom.dart';
import 'package:delivery_app/app/pages/auth/register/register_controller.dart';
import 'package:delivery_app/app/pages/auth/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/app/core/ui/styles/text_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterController, RegisterState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hiderLoader(),
          register: () => showLoader(),
          error: () {
            hiderLoader();
            ShowError('Error ao registrar usuário');
          },
          success: () {
            hiderLoader();
            ShowSucces('Cadastro Realizado com sucesso.');
            Navigator.pop(context);
          },
        );
      },
      child: Scaffold(
          appBar: DeliveryAppbar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cadastro',
                        style: context.textStyle.TextTitle,
                      ),
                      Text(
                        'Preencha os campos para criar seu cadastro.',
                        style:
                            context.textStyle.textMedium.copyWith(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _nameEC,
                        decoration: const InputDecoration(labelText: 'Nome'),
                        validator: Validatorless.required('Nome obrigatório.'),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _emailEC,
                        decoration: const InputDecoration(labelText: 'E-mail'),
                        validator: Validatorless.multiple([
                          Validatorless.required('E-mail obrigatório.'),
                          Validatorless.email('Email inválido.')
                        ]),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: _passwordEC,
                        decoration: const InputDecoration(labelText: 'Senha'),
                        validator: Validatorless.multiple([
                          Validatorless.required('Senha obrigatório.'),
                          Validatorless.min(6,
                              'Senha tem que conter no minimo 6 caracteres.'),
                        ]),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration:
                            const InputDecoration(labelText: 'Confirma Senha'),
                        validator: Validatorless.multiple([
                          Validatorless.required(
                              'Confirmar a Senha obrigatório.'),
                          Validatorless.compare(_passwordEC, 'Senhas diferente')
                        ]),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: DeliveryButtom(
                          width: double.infinity,
                          onpressed: () {
                            final vali =
                                _formKey.currentState?.validate() ?? false;
                            if (vali) {
                              controller.register(
                                _nameEC.text,
                                _emailEC.text,
                                _passwordEC.text,
                              );
                            }
                          },
                          label: 'Cadastrar',
                        ),
                      )
                    ],
                  )),
            ),
          )),
    );
  }
}
