import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedFood = 'BURGER';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          Stack(
            children: [
              Container(
                height: 70.0,
              ),
              ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black, Colors.transparent])
                      .createShader(
                          Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset(
                  'assets/images/pedreiras.jpeg',
                  height: 250.0,
                  width: 400.0,
                  fit: BoxFit.cover,
                ),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  'Pedreiras',
                  style: TextStyle(
                      fontFamily: 'Kanit',
                        fontStyle: FontStyle.italic,
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.3),
                      letterSpacing: 3.0),
                ),
              ),
              Positioned(
                top: 10.0,
                right: 10.0,
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white),
                  child: const Center(
                    child: Icon(Icons.menu),
                  ),
                ),
              ),
              Positioned(
                top: 8.0,
                right: 10.0,
                child: Container(
                  height: 12.0,
                  width: 12.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: const Color(0xFFFD3664)),
                ),
              ),
            ],
          ),
          Positioned(
            top: 5.0,
            left: 40.0,
            child: Column(
              children: <Widget>[
                Row(
                  children: const <Widget>[
                    Text(
                      'Bem Vindo a',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                          fontSize: 20.0,
                          color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: const <Widget>[
                    Text(
                      'PEDREIRAS,',
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 50.0,
                        color: Color(0xFFFD3664),
                      ),
                    ),
                    Text(
                      'MA',
                      style: TextStyle(fontFamily: 'Kanit',
                        fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 50.0,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Positioned(
                top: 320.0,
                left: 25.0,
                right: 25.0,
                child: Container(
                  height: 50.0,
                  decoration: const BoxDecoration(
                    color: Color(0xFF262626),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Faça a sua pesquisa...",
                      helperStyle:
                          TextStyle(color: Colors.grey, fontSize: 12.0),
                      contentPadding: EdgeInsets.only(top: 15.0),
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            _buildMenuItem('BURGER', Icons.fastfood),
            _buildMenuItem('BARES', Icons.local_drink),
            _buildMenuItem('RESTAURANTES', Icons.restaurant),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            _buildMenuItem('PADARIAS', Icons.bakery_dining_rounded),
            _buildMenuItem('FARMÁCIAS', Icons.medical_information),
            _buildMenuItem('SUPERMERCADOS', Icons.shopping_cart),
          ])
        ],
      ),
    );
  }

  Widget _buildMenuItem(String foodName, iconData) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {},
      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 300),
        height: selectedFood == "foodName" ? 100.0 : 75.0,
        width: selectedFood == "foodName" ? 100.0 : 75.0,
        color: selectedFood == "foodName"
            ? const Color(0xFFFD3566)
            : Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: selectedFood == foodName ? Colors.white : Colors.grey,
              size: 25.0,
            ),
            const SizedBox(height: 12.0),
            Text(
              foodName,
              style: TextStyle(
                  color: selectedFood == foodName ? Colors.white : Colors.grey,
                  fontSize: 08.0),
            ),
          ],
        ),
      ),
    );
  }

  selectMenuOption(String foodName) {
    setState(() {
      selectedFood = foodName;
    });
  }
}
