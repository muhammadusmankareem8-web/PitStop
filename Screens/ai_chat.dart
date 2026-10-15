import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';

class AiChatScreen extends StatefulWidget {
  const AiChatScreen({super.key});
  @override
  State<AiChatScreen> createState() => _AiChatScreenState();
}
class _AiChatScreenState extends State<AiChatScreen> {
  final input = TextEditingController();
  final scroll = ScrollController();
  final messages = <Map<String, String>>[{'role': 'assistant', 'text': 'Hi Usman! This is a demo assistant with preset replies. Ask about service, tyres or expenses.'}];
  @override
  void dispose() { input.dispose(); scroll.dispose(); super.dispose(); }
  void send() {
    final text = input.text.trim(); if (text.isEmpty) return;
    final lower = text.toLowerCase();
    final reply = lower.contains('tyre') ? 'Check tyre pressure using the value in your vehicle manual. Inspect tread and visible damage regularly.' : lower.contains('expense') ? 'Open Expenses to record fuel, maintenance and other costs.' : lower.contains('oil') || lower.contains('service') ? 'Use the service intervals and oil specification in your vehicle manual. You can record a due date in Reminders.' : 'This demo has preset replies for tyres, service and expenses. A live AI service can be connected later.';
    setState(() { messages.add({'role': 'user', 'text': text}); messages.add({'role': 'assistant', 'text': reply}); input.clear(); });
    WidgetsBinding.instance.addPostFrameCallback((_) { if (scroll.hasClients) scroll.animateTo(scroll.position.maxScrollExtent, duration: const Duration(milliseconds: 200), curve: Curves.easeOut); });
  }
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('PitStop Assistant')), body: SafeArea(child: Column(children: [const Padding(padding: EdgeInsets.all(12), child: Text('Demo conversation • preset responses')), Expanded(child: ListView.builder(controller: scroll, padding: const EdgeInsets.all(20), itemCount: messages.length, itemBuilder: (context, i) => Align(alignment: messages[i]['role'] == 'user' ? Alignment.centerRight : Alignment.centerLeft, child: Container(constraints: const BoxConstraints(maxWidth: 310), margin: const EdgeInsets.only(bottom: 14), padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: messages[i]['role'] == 'user' ? navy : ice, borderRadius: BorderRadius.circular(18)), child: Text(messages[i]['text']!, style: TextStyle(color: messages[i]['role'] == 'user' ? Colors.white : navy)))))), Padding(padding: const EdgeInsets.all(16), child: Row(children: [Expanded(child: TextField(controller: input, onSubmitted: (_) => send(), decoration: const InputDecoration(hintText: 'Ask about your vehicle...'))), IconButton(onPressed: send, icon: const Icon(Icons.send_rounded))]))])));
}
