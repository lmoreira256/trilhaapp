import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/languages_repository.dart';
import 'package:trilhaapp/repositories/level_repository.dart';
import 'package:trilhaapp/shared/widgets/text_label.dart';

class RegistrationDataPage extends StatefulWidget {
  const RegistrationDataPage({super.key});

  @override
  State<RegistrationDataPage> createState() => _RegistrationDataPageState();
}

class _RegistrationDataPageState extends State<RegistrationDataPage> {
  final LevelRepository _levelRepository = LevelRepository();
  final LanguagesRepository _languagesRepository = LanguagesRepository();

  final TextEditingController _nameController = TextEditingController(text: '');
  final TextEditingController _dateOfBirthController =
      TextEditingController(text: '');

  DateTime? _dateOfBirth;
  List<String> _levels = [];
  List<String> _languages = [];
  double _chosenSalary = 0;

  late String _selectedLevel;
  final List<String> _selectedLanguages = [];

  @override
  void initState() {
    _levels = _levelRepository.getLevels();
    _languages = _languagesRepository.gerLanguages();

    _selectedLevel = _levels[0];

    super.initState();
  }

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
        child: ListView(
          children: [
            const TextLabel(
              text: 'Nome',
            ),
            TextField(
              controller: _nameController,
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
            const TextLabel(
              text: 'Nível de experiência',
            ),
            Column(
              children: _levels
                  .map(
                    (level) => RadioListTile(
                      title: Text(level),
                      selected: _selectedLevel == level,
                      value: level,
                      groupValue: _selectedLevel,
                      onChanged: (value) {
                        setState(() {
                          _selectedLevel = value!;
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
            const TextLabel(
              text: 'Linguagens preferidas',
            ),
            Column(
              children: _languages
                  .map(
                    (language) => CheckboxListTile(
                      title: Text(language),
                      value: _selectedLanguages.contains(language),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value!) {
                            _selectedLanguages.add(language);
                          } else {
                            _selectedLanguages.remove(language);
                          }
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
            TextLabel(
              text:
                  'Pretenção Salarial. R\$ ${_chosenSalary.round().toString()}',
            ),
            Slider(
              min: 0,
              max: 10000,
              value: _chosenSalary,
              onChanged: (double value) {
                setState(() {
                  _chosenSalary = value;
                });
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
