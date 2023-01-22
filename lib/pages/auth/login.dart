import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ma_money/pages/accueil.dart';
import 'package:ma_money/pages/auth/register.dart';
import 'package:ma_money/widgets/widgets.dart';

class Login extends ConsumerStatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  ConsumerState<Login> createState() => _SignInPage1State();
}

class _SignInPage1State extends ConsumerState<Login> {
  bool _isPasswordVisible = false;
  bool _rememberMe = false;
  bool load = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _unameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  submit_form() async {
    // setState(() {
    //   load = true;
    // });
    // var res = await Api.post('sign-in/', {
    //   "username": _unameTextController.text,
    //   "password": _passwordTextController.text,
    //   "is_mobile": true
    // });
    // setState(() {
    //   load = false;
    // });

    // if (res['status'] == 200) {
    //   var user_json = JwtDecoder.decode(res['data'].data['access'])['user'];
    //   User myUser = User.fromJson(user_json);
    //   myUser.token = res['data'].data['access'];
    //   myUser.refresh = res['data'].data['refresh'];

    //   ref.read(userProvider.notifier).state = myUser;
    //   var db = Hive.box('db');
    //   db.put('myUser', myUser);

    //   Widgets.snackBar("Connecté avec succès", context,
    //       color: Colors.green, duree: 5);
    //   return Widgets.fullNavigate(context, Splash());
    // } else {
    //   if (res['error'] != null &&
    //       res['error'].data['detail'] ==
    //           "No active account found with the given credentials") {
    //     Widgets.snackBar('Ces informations sont incorrects', context);
    //   } else {
    //     Widgets.snackBar('Une erreur est survenue', context);
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    double largeur = MediaQuery.of(context).size.width;
    double longeur = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Card(
            elevation: 8,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: largeur / 20.0, vertical: longeur / 20.0),
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
                              "Connexion",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                          SizedBox(height: longeur / 50.0),
                          _gap(),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrer votre nom d\'utilisateur';
                              }

                              return null;
                            },
                            controller: _unameTextController,
                            decoration: const InputDecoration(
                              labelText: 'Nom d\'utilisateur',
                              hintText: 'Nom d\'utilisateur',
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(),
                            ),
                          ),
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
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'Se connecter',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              onPressed: () async {
                                // if (_formKey.currentState?.validate() ??
                                //     false) {
                                //   submit_form();
                                // }
                                Widgets.fullNavigate(context, const Accueil());
                              },
                            ),
                          ),
                          _gap(),
                          InkWell(
                              onTap: () {
                                Widgets.fullNavigate(context, const Register());
                              },
                              child: const Text("Créer un compte",
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
