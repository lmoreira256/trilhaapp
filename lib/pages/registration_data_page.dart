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
  int _experienceTime = 1;

  late String _selectedLevel;
  final List<String> _selectedLanguages = [];

  bool _isLoading = false;

  @override
  void initState() {
    _levels = _levelRepository.getLevels();
    _languages = _languagesRepository.gerLanguages();

    _selectedLevel = _levels[0];

    super.initState();
  }

  List<DropdownMenuItem<int>> buildExperienceItems() {
    var itens = <DropdownMenuItem<int>>[];

    for (var i = 0; i < 50; i++) {
      itens.add(
        DropdownMenuItem(
          value: i,
          child: Text(
            i.toString(),
          ),
        ),
      );
    }

    return itens;
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
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
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
                  const TextLabel(
                    text: 'Tempo de experiência',
                  ),
                  DropdownButton(
                    value: _experienceTime,
                    isExpanded: true,
                    items: buildExperienceItems(),
                    onChanged: (value) {
                      setState(() {
                        _experienceTime = int.parse(value.toString());
                      });
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      if (_nameController.text.trim().length < 3) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('O nome deve ser preenchido'),
                          ),
                        );

                        return;
                      }

                      if (_dateOfBirth == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Data de nascimento inválido'),
                          ),
                        );

                        return;
                      }

                      if (_selectedLanguages.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Deve ser selecionado ao menos uma linguagem'),
                          ),
                        );

                        return;
                      }

                      setState(() {
                        _isLoading = true;
                      });
                      Future.delayed(
                          const Duration(
                            seconds: 3,
                          ), () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Dados salvos com sucesso'),
                          ),
                        );
                        Navigator.pop(context);
                      });
                    },
                    child: const Text('Salvar'),
                  ),
                ],
              ),
      ),
    );
  }
}
