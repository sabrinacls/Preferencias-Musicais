import 'package:flutter/material.dart';
import '../../models/genero_musical.dart';
import 'tela_configuracao.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  // Dados mantidos apenas em memória
  final List<GeneroMusical> _generos = [
    GeneroMusical(
      nome: 'Rock',
      descricao: 'Gênero caracterizado pelo uso de guitarras elétricas, baixo e bateria com ritmo forte.',
      imagemUrl: 'https://picsum.photos/seed/rock/200/200',
    ),
    GeneroMusical(
      nome: 'Pop',
      descricao: 'Música popular com batidas cativantes, refrões marcantes e forte apelo comercial.',
      imagemUrl: 'https://picsum.photos/seed/pop/200/200',
    ),
    GeneroMusical(
      nome: 'Sertanejo',
      descricao: 'Estilo musical brasileiro marcado por violões, acordeão e letras românticas ou de festa.',
      imagemUrl: 'https://picsum.photos/seed/sertanejo/200/200',
    ),
    GeneroMusical(
      nome: 'Funk',
      descricao: 'Ritmo envolvente com batidas eletrônicas fortes, originado nas comunidades.',
      imagemUrl: 'https://picsum.photos/seed/funk/200/200',
    ),
    GeneroMusical(
      nome: 'Música Eletrônica',
      descricao: 'Música produzida com sintetizadores e softwares, ideal para pistas de dança.',
      imagemUrl: 'https://picsum.photos/seed/eletronica/200/200',
    ),
    GeneroMusical(
      nome: 'Jazz',
      descricao: 'Estilo sofisticado focado na improvisação, swing e ritmo irregular.',
      imagemUrl: 'https://picsum.photos/seed/jazz/200/200',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Preferências - Sabrina Clemente da Silva',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: _generos.length,
        itemBuilder: (context, index) {
          final genero = _generos[index];
          
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  genero.imagemUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                genero.nome,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(
                genero.curte ? 'Gosto deste gênero' : 'Não gosto',
                style: TextStyle(
                  color: genero.curte ? Theme.of(context).colorScheme.secondary : Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Switch(
                value: genero.curte,
                activeColor: Theme.of(context).colorScheme.secondary,
                onChanged: (bool valor) {
                  setState(() {
                    genero.curte = valor;
                  });
                },
              ),
              onTap: () async {
                // Navega para a tela de configuração e aguarda o retorno
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaConfiguracao(genero: genero),
                  ),
                );
                // Ao voltar, redesenha a tela inicial para refletir possíveis mudanças
                setState(() {});
              },
            ),
          );
        },
      ),
    );
  }
}