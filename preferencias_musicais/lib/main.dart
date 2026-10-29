// Aluna: Sabrina Clemente da Silva
import 'package:flutter/material.dart';
import 'screens/tela_inicial.dart';

void main() {
  runApp(const MeuAppMusical());
}

class MeuAppMusical extends StatelessWidget {
  const MeuAppMusical({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferências Musicais',
      debugShowCheckedModeBanner: false,
      // Tema baseado em tons terrosos, off-white e chumbo
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF4F1EA), // Off-white
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFC05A45), // Terracota
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        colorScheme: ColorScheme.light(
          primary: const Color(0xFFC05A45), // Terracota
          secondary: const Color(0xFF5B7042), // Verde Oliva
          onSurface: const Color(0xFF3B4043), // Cinza Chumbo
        ),
        useMaterial3: true,
      ),
      home: const TelaInicial(),
    );
  }
}
