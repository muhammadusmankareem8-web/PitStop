import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';

class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen({super.key});
  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}
class _WriteReviewScreenState extends State<WriteReviewScreen> {
  int rating = 5;
  @override
  Widget build(BuildContext context) => PageShell(title: 'Write a Review', children: [
    Heading('How was your pit stop?', store.workshop['name']!),
    Wrap(alignment: WrapAlignment.center, children: List.generate(5, (i) => IconButton(tooltip: '${i + 1} stars', icon: Icon(i < rating ? Icons.star_rounded : Icons.star_outline_rounded, color: Colors.amber, size: 34), onPressed: () => setState(() => rating = i + 1)))),
    const SizedBox(height: 20),
    DataForm(fields: const {'Feedback': ''}, button: 'Save demo review', onSave: (v) { store.reviews.add({'workshop': store.workshop['name']!, 'rating': '$rating', 'feedback': v['Feedback']!}); store.refresh(); message(context, 'Review saved for this session'); Navigator.pop(context); }),
  ]);
}
