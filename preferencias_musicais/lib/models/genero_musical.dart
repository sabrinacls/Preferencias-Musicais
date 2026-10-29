// Classe de modelo para armazenar os dados em memória
class GeneroMusical {
  final String nome;
  final String descricao;
  final String imagemUrl;
  
  bool curte;
  double volume;
  bool querRecomendacoes;

  GeneroMusical({
    required this.nome,
    required this.descricao,
    required this.imagemUrl,
    this.curte = false,
    this.volume = 50.0,
    this.querRecomendacoes = false,
  });
}