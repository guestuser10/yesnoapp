import 'package:flutter/material.dart'; // Importing the Flutter material package for UI components.
import 'package:yesnoapp/domain/entities/message.dart'; // Importing the Message entity from the domain layer.

class MyMessageBubble extends StatelessWidget { // Declaring a stateless widget named MyMessageBubble.
  final Message message; // Defining a final variable to hold the message data.

  const MyMessageBubble({ // Constructor for MyMessageBubble.
    super.key, // Passing the key to the superclass constructor.
    required this.message // Initializing the message variable with a required parameter.
  });

  @override
  Widget build(BuildContext context) { // Overriding the build method to describe the widget's UI.
    final colors = Theme.of(context).colorScheme; // Getting the current theme's color scheme.

    return Column( // Returning a Column widget to arrange children vertically.
      crossAxisAlignment: CrossAxisAlignment.end, // Aligning children to the end of the column.
      children: [
        Container( // Creating a container to hold the message bubble.
          decoration: BoxDecoration( // Applying decoration to the container.
              color: colors.primary, // Setting the background color to the primary color of the theme.
              borderRadius: BorderRadius.circular(20)), // Rounding the corners of the container.
          child: Padding( // Adding padding inside the container.
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Setting symmetric padding.
            child: Text( // Displaying the message text.
              message.text, // Using the text from the message object.
              style: const TextStyle(color: Colors.white), // Setting the text style to white color.
            ),
          ),
        ),
        const SizedBox(height: 5) // Adding a SizedBox for spacing below the message bubble.
      ],
    );
  }
}