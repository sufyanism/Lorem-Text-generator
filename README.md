# Lorem Generator App
A simple Flutter Lorem Ipsum Text Generator App built using MVVM architecture and Riverpod for state management. The app allows users to generate random dummy text (words or paragraphs) and copy it to the clipboard.

## Features
-	Generate random text by words (20, 50, 100).
-	Generate random text by paragraphs (1, 3, 5).
-	Copy to clipboard functionality.
-	Clean MVVM architecture for maintainable code.
-	Uses Riverpod for state management.

## Getting Started
### Prerequisites
-	Flutter SDK >= 3.0.0
-	Android Studio or VS Code
-	Dart >= 2.18.0

## Installation
1.	Clone the repository:
git clone <your-repo-url>
2.	Navigate to the project folder:
cd lorem_generator
3.	Install dependencies:
flutter pub get
4.	Run the app:
flutter run

## Project Structure

```plaintext
lib/
 ┣ models/          # Data models
 ┣ view_models/     # Logic and state management
 ┣ views/           # Screens and UI
 ┗ widgets/         # Reusable widgets
```

## Dependencies
•	flutter_riverpod: ^2.3.6 → State management
•	clipboard: ^0.1.3 → Copy text to clipboard

## How to Use
1.	Open the app.
2.	Select the number of words or paragraphs to generate.
3.	Generated text will appear instantly.
4.	Tap the Copy button to copy text to clipboard.
5.	Tap the Delete icon to clear the text.


