import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/configuration_page.dart';
import 'package:trilhaapp/pages/login_page.dart';
import 'package:trilhaapp/pages/random_numbers_page.dart';
import 'package:trilhaapp/pages/registration_data_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.zero),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text('Câmera'),
                          leading: const Icon(Icons.camera),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text('Galeria'),
                          leading: const Icon(Icons.album),
                        ),
                      ],
                    );
                  });
            },
            child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.network(
                    'https://cdn-icons-png.flaticon.com/512/2219/2219822.png'),
              ),
              accountName: const Text('Lucas'),
              accountEmail: const Text('email@email.com'),
            ),
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Dados cadastrais'),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegistrationDataPage(),
                ),
              );
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.album),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Configuração'),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ConfigurationPage(),
                ),
              );
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.numbers),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Gerador de numeros'),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RandomNumbersPage(),
                ),
              );
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.info),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Termos de uso e privacidade'),
                ],
              ),
            ),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext bc) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              'Termos de uso e privacidade',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Divider(),
                          Expanded(
                            child: ListView(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              children: const [
                                Text(
                                  'Acima de tudo, é fundamental ressaltar que a hegemonia do ambiente político não pode mais se dissociar do impacto na agilidade decisória. A nível organizacional, a complexidade dos estudos efetuados cumpre um papel essencial na formulação das diversas correntes de pensamento. Assim mesmo, a contínua expansão de nossa atividade estimula a padronização do sistema de participação geral. Ainda assim, existem dúvidas a respeito de como o desafiador cenário globalizado aponta para a melhoria das diretrizes de desenvolvimento para o futuro. Do mesmo modo, o novo modelo estrutural aqui preconizado garante a contribuição de um grupo importante na determinação de alternativas às soluções ortodoxas. Neste sentido, a competitividade nas transações comerciais é uma das consequências das direções preferenciais no sentido do progresso. Nunca é demais lembrar o peso e o significado destes problemas, uma vez que o comprometimento entre as equipes facilita a criação das novas proposições. Por conseguinte, a consolidação das estruturas obstaculiza a apreciação da importância dos níveis de motivação departamental. No entanto, não podemos esquecer que o aumento do diálogo entre os diferentes setores produtivos oferece uma interessante oportunidade para verificação das condições inegavelmente apropriadas. Todavia, a determinação clara de objetivos acarreta um processo de reformulação e modernização das condições financeiras e administrativas exigidas. Percebemos, cada vez mais, que a execução dos pontos do programa prepara-nos para enfrentar situações atípicas decorrentes das posturas dos órgãos dirigentes com relação às suas atribuições. Todas estas questões, devidamente ponderadas, levantam dúvidas sobre se a constante divulgação das informações representa uma abertura para a melhoria dos modos de operação convencionais.',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.exit_to_app),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Sair'),
                ],
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    alignment: Alignment.centerLeft,
                    title: const Text('My App'),
                    content: const Wrap(
                      children: [
                        Text('Você sairá do app!'),
                        Text('Deseja realmente sair do app?'),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Não'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child: const Text('Sim'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
