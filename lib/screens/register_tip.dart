import 'package:flutter/material.dart';
import '../domain/tip.dart';
import '../service/request.service.dart';

class RegisterTipScreen extends StatefulWidget {
  const RegisterTipScreen({super.key});

  @override
  State<RegisterTipScreen> createState() => _RegisterTipScreenState();
}

class _RegisterTipScreenState extends State<RegisterTipScreen> {
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _studentController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final _requestService = RequestService();

  void _showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _clearFields() {
    _categoryController.clear();
    _titleController.clear();
    _studentController.clear();
    _descriptionController.clear();
  }

  Future<void> _onSubmit() async {
    final tip = Tip(
      category: _categoryController.text,
      title: _titleController.text,
      student: _studentController.text,
      description: _descriptionController.text,
    );

    final success = await _requestService.sendTipData(tip);

    _showSnackBar(
        success ? "Dica cadastrada com sucesso!" : "Falha ao cadastrar dica.");

    if (success) _clearFields();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Dicas"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            TextField(
              controller: _categoryController,
              decoration: const InputDecoration(labelText: "Categoria"),
            ),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: "Título"),
            ),
            TextField(
              controller: _studentController,
              decoration: const InputDecoration(labelText: "Nome ou RM"),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: "Descrição"),
              maxLines: 4,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onSubmit,
              child: const Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }
}
