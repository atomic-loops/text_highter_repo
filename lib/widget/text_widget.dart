import 'package:flutter/material.dart';

/// A widget that highlights specific text within a larger body of text.
class TextHighlighter extends StatelessWidget {
  final String text; // The full text
  final String textToHighlight; // The text to be highlighted
  final TextStyle? textStyle; // Style for the non-highlighted text
  final TextStyle? highlightStyle; // Style for the highlighted text

  const TextHighlighter({
    Key? key,
    required this.text,
    required this.textToHighlight,
    this.textStyle,
    this.highlightStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle =
        textStyle ?? Theme.of(context).textTheme.bodyText1 ?? const TextStyle();
    final defaultHighlightStyle =
        highlightStyle ?? defaultTextStyle.copyWith(color: Colors.yellow);

    // Split the text into parts
    List<String> parts = text.split(textToHighlight);
    List<TextSpan> spans = [];

    for (int i = 0; i < parts.length; i++) {
      spans.add(TextSpan(text: parts[i], style: defaultTextStyle));
      // Add the highlighted part, but not at the end of the text
      if (i < parts.length - 1) {
        spans
            .add(TextSpan(text: textToHighlight, style: defaultHighlightStyle));
      }
    }

    return RichText(
      text: TextSpan(
        children: spans,
      ),
    );
  }
}
