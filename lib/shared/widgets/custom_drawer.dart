import 'package:flutter/material.dart';
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
                vertical: 10,
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
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
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
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 12),
                      child: const SafeArea(
                        child: Column(
                          children: [
                            Text(
                              'Termos de uso e privacidade',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
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
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
