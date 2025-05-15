import 'package:flutter/material.dart';

class Paginainicial extends StatefulWidget {
  const Paginainicial({super.key});

  @override
  State<Paginainicial> createState() => _PaginaInicial();
}

class _PaginaInicial extends State<Paginainicial> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          toolbarHeight: 100,
          backgroundColor: const Color.fromARGB(255, 224, 218, 18),
          flexibleSpace: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: openDrawer,
                    icon: const Icon(Icons.menu_open, size: 40),
                  ),
                  const SizedBox(width: 30),
                  const Text('Equipe 7', style: TextStyle(fontSize: 40)),
                  const SizedBox(width: 175),
                  const Icon(Icons.account_box, size: 50),
                  const SizedBox(width: 30),
                ],
              ),
            ],
          ),
        ),
        drawer: Container(
          constraints: const BoxConstraints(maxWidth: 250),
          color: const Color.fromARGB(255, 187, 171, 171),
          child: ListView(
            children: const [
              SizedBox(height: 50),
              Text('Inicio'),
              Text('Meio'),
              Text('Fim'),
            ],
          ),
        ),
      );
    
  }
}
