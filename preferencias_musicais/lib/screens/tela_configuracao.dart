import 'package:flutter/material.dart';
import '../../models/genero_musical.dart';

class TelaConfiguracao extends StatefulWidget {
  final GeneroMusical genero;

  const TelaConfiguracao({super.key, required this.genero});

  @override
  State<TelaConfiguracao> createState() => _TelaConfiguracaoState();
}

class _TelaConfiguracaoState extends State<TelaConfiguracao> {
  // Variáveis de estado local para edição antes de salvar
  late double _volumeLocal;
  late bool _recomendaLocal;

  @override
  void initState() {
    super.initState();
    // Inicializa com os dados já existentes em memória
    _volumeLocal = widget.genero.volume;
    _recomendaLocal = widget.genero.querRecomendacoes;
  }

  void _salvarPreferencias() {
    // 1. Atualiza o objeto em memória
    widget.genero.volume = _volumeLocal;
    widget.genero.querRecomendacoes = _recomendaLocal;

    // 2. Exibe confirmação com ScaffoldMessenger
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Preferências de ${widget.genero.nome} salvas com sucesso!'),
        backgroundColor: Theme.of(context).colorScheme.secondary, // Verde Oliva
        behavior: SnackBarBehavior.floating,
      ),
    );

    // 3. Retorna à tela inicial
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurar ${widget.genero.nome}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // A. Nome e descrição
            Text(
              widget.genero.nome,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              widget.genero.descricao,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            
            // B. Slider de Volume
            const Text(
              'Volume preferido:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                const Icon(Icons.volume_down),
                Expanded(
                  child: Slider(
                    value: _volumeLocal,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: _volumeLocal.round().toString(),
                    activeColor: Theme.of(context).colorScheme.primary,
                    onChanged: (novoValor) {
                      setState(() {
                        _volumeLocal = novoValor;
                      });
                    },
                  ),
                ),
                Text(
                  _volumeLocal.round().toString(),
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // C. Checkbox de Recomendações
            CheckboxListTile(
              title: const Text('Desejo receber recomendações deste gênero'),
              value: _recomendaLocal,
              activeColor: Theme.of(context).colorScheme.primary,
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              onChanged: (bool? valor) {
                if (valor != null) {
                  setState(() {
                    _recomendaLocal = valor;
                  });
                }
              },
            ),
            
            const Spacer(),

            // D. Botão de Salvar
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: _salvarPreferencias,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary, // Terracota
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Salvar Preferências',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}