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
          UserAccountsDrawerHeader(
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
        ],
      ),
    );
  }
}
