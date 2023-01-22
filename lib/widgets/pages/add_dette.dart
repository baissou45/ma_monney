import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ma_money/model/dette.dart';

class AddDette extends StatefulWidget {
  const AddDette({super.key});

  @override
  State<AddDette> createState() => _AddDetteState();
}

class _AddDetteState extends State<AddDette> {
  final _montantController = TextEditingController();
  final _userController = TextEditingController();
  final _descController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double longeur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;

    return IntrinsicHeight(
      child: Form(
        key: _formKey,
        child: Column(children: [
          TextFormField(
            controller: _montantController,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            onChanged: (value) {},
            decoration: const InputDecoration(
              label: Text('Montant de la dette'),
            ),
          ),
          TextFormField(
            controller: _montantController,
            onChanged: (value) {},
            decoration: const InputDecoration(
              label: Text('A qui je dois ?'),
            ),
          ),
          TextFormField(
            controller: _montantController,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            onChanged: (value) {},
            minLines: 2,
            maxLines: 2,
            decoration: const InputDecoration(
              label: Text('Description'),
            ),
          ),
          SizedBox(height: longeur / 50.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.qr_code_scanner_outlined),
                  label: const Text("Scanner")),
              TextButton(
                  onPressed: () {
                    Dette(
                      montant: double.parse(_montantController.text),
                      created_at: DateTime.now(),
                    );
                    // Navigator.pop(context);
                  },
                  child: Text("Enregistrer")),
            ],
          )
        ]),
      ),
    );
  }
}
