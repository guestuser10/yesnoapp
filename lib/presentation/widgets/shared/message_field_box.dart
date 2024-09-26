import 'package:flutter/material.dart'; // Importing the Flutter material package

// Defining a stateless widget called MessageFieldBox
class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue; // A callback function that takes a String as an argument

  // Constructor for MessageFieldBox, requiring the onValue callback
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController(); // Controller to manage the text input
    final focusNode = FocusNode(); // FocusNode to manage the focus state of the text field

    // Defining the border style for the text field
    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent), // Transparent border
        borderRadius: BorderRadius.circular(40)); // Rounded corners with a radius of 40

    // Defining the input decoration for the text field
    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"', // Placeholder text
      enabledBorder: outlineInputBorder, // Border when the text field is enabled
      focusedBorder: outlineInputBorder, // Border when the text field is focused
      filled: true, // Filling the background of the text field
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined), // Send icon button
        onPressed: () {
          final textValue = textController.value.text; // Getting the current text value
          textController.clear(); // Clearing the text field
          onValue(textValue); // Calling the callback with the text value
        },
      ),
    );

    // Returning a TextFormField widget
    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus(); // Unfocusing the text field when tapped outside
      },
      focusNode: focusNode, // Assigning the focus node
      controller: textController, // Assigning the text controller
      decoration: inputDecoration, // Applying the input decoration
      onFieldSubmitted: (value) {
        textController.clear(); // Clearing the text field
        focusNode.requestFocus(); // Requesting focus back to the text field
        onValue(value); // Calling the callback with the submitted value
      },
    );
  }
}