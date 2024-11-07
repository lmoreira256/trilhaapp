import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/app_images.dart';

class ListViewHPage extends StatefulWidget {
  const ListViewHPage({super.key});

  @override
  State<ListViewHPage> createState() => _ListViewHPageState();
}

class _ListViewHPageState extends State<ListViewHPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.user2),
          title: const Text('Usuário 2'),
          subtitle: const Text('Olá\nTudo bem?'),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {},
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: "opcao1",
                  child: Text('Opção 1'),
                ),
                const PopupMenuItem<String>(
                  value: "opcao2",
                  child: Text('Opção 2'),
                ),
                const PopupMenuItem<String>(
                  value: "opcao2",
                  child: Text('Opção 2'),
                ),
              ];
            },
          ),
          isThreeLine: true,
        ),
        Image.asset(AppImages.user1),
        Image.asset(AppImages.user2),
        Image.asset(AppImages.user3),
        Image.asset(AppImages.paisagem1),
        Image.asset(AppImages.paisagem2),
        Image.asset(AppImages.paisagem3),
      ],
    );
  }
}
