import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/widgets/text_label.dart';

class RegistrationDataPage extends StatefulWidget {
  const RegistrationDataPage({super.key});

  @override
  State<RegistrationDataPage> createState() => _RegistrationDataPageState();
}

class _RegistrationDataPageState extends State<RegistrationDataPage> {
  final TextEditingController _nameController = TextEditingController(text: '');
  final TextEditingController _dateOfBirthController =
      TextEditingController(text: '');
  DateTime? _dateOfBirth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus dados'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextLabel(
              text: 'Nome',
            ),
            TextField(
              controller: _nameController,
            ),
            const SizedBox(
              height: 10,
            ),
            const TextLabel(
              text: 'Data de nascimento',
            ),
            TextField(
              readOnly: true,
              controller: _dateOfBirthController,
              onTap: () async {
                var date = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1900, 5, 1),
                  lastDate: DateTime(2024, 9, 25),
                );

                if (date != null) {
                  _dateOfBirthController.text = date.toString();
                  _dateOfBirth = date;
                }
              },
            ),
            TextButton(
              onPressed: () {
                print(_nameController.text);
                print(_dateOfBirth);
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
