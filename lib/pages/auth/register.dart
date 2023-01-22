import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:ma_money/pages/auth/login.dart';
import 'package:ma_money/widgets/widgets.dart';

class Register extends ConsumerStatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  ConsumerState<Register> createState() => _SignInPage1State();
}

class _SignInPage1State extends ConsumerState<Register> {
  bool _isPasswordVisible = false;
  bool _isPasswordVisible2 = false;
  bool load = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _unameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _passwordConfirmTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double largeur = MediaQuery.of(context).size.width;
    double longeur = MediaQuery.of(context).size.height;

    submit_form() async {
      // setState(() {
      //   load = true;
      // });
      // var res = await Api.post('sign-up/', {
      //   "first_name": _nomController.text,
      //   "last_name": _prenomController.text,
      //   "username": _unameTextController.text,
      //   "email": _emailTextController.text,
      //   "password": _passwordTextController.text,
      // });
      // print(res);
      // setState(() {
      //   load = false;
      // });
      // if (res['status'] == 200) {
      //   User myUser = User.fromJson(res['data'].data);
      //   ref.read(userProvider.notifier).state = myUser;
      //   var db = Hive.box('db');
      //   db.put('myUser', myUser);
      //   Widgets.snackBar("Inscription effectuée avec success", context,
      //       color: Colors.green);
      //   return Widgets.fullNavigate(context, const Splash());
      // } else {
      //   String message = '';
      //   if (res['error'].data['errors']['email'] != null) {
      //     for (var msg in res['error'].data['errors']['email']) {
      //       message += "- $msg \n";
      //     }
      //   }
      //   if (res['error'].data['errors']['username'] != null) {
      //     for (var msg in res['error'].data['errors']['email']) {
      //       message += "- $msg \n";
      //     }
      //   }
      //   Widgets.snackBar(message, context);
      // }
    }

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Card(
            elevation: 8,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: largeur / 20.0, vertical: longeur / 30.0),
              constraints: BoxConstraints(maxWidth: largeur / 1.15),
              child: SingleChildScrollView(
                child: load
                    ? const CircularProgressIndicator()
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/get_money.png",
                              color: Colors.blue, width: largeur / 5),
                          _gap(),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              "Inscription",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                          _gap(),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrer votre nom';
                              }

                              return null;
                            },
                            controller: _nomController,
                            decoration: const InputDecoration(
                              labelText: 'Nom',
                              hintText: 'Entrer votre nom',
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          _gap(),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrer vos prénoms';
                              }

                              return null;
                            },
                            controller: _prenomController,
                            decoration: const InputDecoration(
                              labelText: 'Prénom(s)',
                              hintText: 'Entrer vos prénoms',
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          _gap(),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrer vos prénoms';
                              }

                              return null;
                            },
                            controller: _unameTextController,
                            decoration: const InputDecoration(
                              labelText: 'Nom d\'utilisateur',
                              hintText: 'Entrer vos prénoms',
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          // _gap(),
                          // TextFormField(
                          //   validator: (value) {
                          //     // add email validation
                          //     if (value == null || value.isEmpty) {
                          //       return 'Veuillez entrer votre mail';
                          //     }

                          //     bool _emailValid = RegExp(
                          //             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          //         .hasMatch(value);
                          //     if (!_emailValid) {
                          //       return 'Entrer un mail valid';
                          //     }

                          //     return null;
                          //   },
                          //   controller: _emailTextController,
                          //   decoration: const InputDecoration(
                          //     labelText: 'Email',
                          //     hintText: 'Entrer votre mail',
                          //     prefixIcon: Icon(Icons.email_outlined),
                          //     border: OutlineInputBorder(),
                          //   ),
                          // ),
                          _gap(),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrer un mot de passe';
                              }

                              if (value.length < 8) {
                                return 'Entrer 8 caractères au moin';
                              }
                              return null;
                            },
                            obscureText: !_isPasswordVisible,
                            controller: _passwordTextController,
                            decoration: InputDecoration(
                                labelText: 'Mot de passe',
                                hintText: 'Entrer votre mot de passe',
                                prefixIcon:
                                    const Icon(Icons.lock_outline_rounded),
                                border: const OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  icon: Icon(_isPasswordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                )),
                          ),
                          _gap(),
                          // _passwordConfirmTextController
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrer un mot de passe';
                              } else if (value !=
                                  _passwordTextController.text) {
                                return 'Veuillez entrer le même mot de passe';
                              }

                              return null;
                            },
                            obscureText: !_isPasswordVisible2,
                            controller: _passwordConfirmTextController,
                            decoration: InputDecoration(
                                labelText: 'Confirmer mot de passe',
                                hintText: 'Entrer votre mot de passe',
                                prefixIcon:
                                    const Icon(Icons.lock_outline_rounded),
                                border: const OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  icon: Icon(_isPasswordVisible2
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible2 =
                                          !_isPasswordVisible2;
                                    });
                                  },
                                )),
                          ),
                          _gap(),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  submit_form();
                                }
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'S\'inscrire',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          _gap(),
                          InkWell(
                              onTap: () {
                                Widgets.fullNavigate(context, const Login());
                              },
                              child: const Text("Se connecter",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline))),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
