import 'package:flutter/material.dart';
import '../domain/tip.dart';
import '../service/request.service.dart';

class TipsListScreen extends StatefulWidget {
  const TipsListScreen({super.key});

  @override
  State<TipsListScreen> createState() => _TipsListScreenState();
}

class _TipsListScreenState extends State<TipsListScreen> {
  final _requestService = RequestService();
  List<Tip> _tips = [];

  @override
  void initState() {
    super.initState();
    _fetchTips();
  }

  Future<void> _fetchTips() async {
    final tips = await _requestService.fetchTips();
    setState(() {
      _tips = tips;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dicas Cadastradas"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _tips.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _tips.length,
              itemBuilder: (context, index) {
                final tip = _tips[index];
                return ListTile(
                  title: Text(tip.title),
                  subtitle: Text("Por: ${tip.student}"),
                  trailing: Text(tip.category),
                );
              },
            ),
    );
  }
}
