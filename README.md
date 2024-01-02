# Flutter Text Highlighter and Search

This Flutter application demonstrates a simple but effective text search and highlight functionality. It includes a `SearchPage` where users can input a search query, and a custom `TextHighlighter` widget that highlights the matching text within a list of items.

## Features

- **Search Functionality**: Type in the search box to filter through a list of items.
- **Text Highlighting**: The application highlights the search query directly within the list, making it easy to spot the matches.

## Getting Started

To get started with this project, clone the repository and ensure you have Flutter installed on your machine.

### Installation

Clone the repository:
   ```
   git clone https://github.com/atomic-loops/text_highter_repo.git
   ```

### Running the Application

Run the application using the following command:

```
flutter run
```

## Usage

The main feature of this application is the `SearchPage` widget.

### SearchPage

This widget displays a list of items (by default, 100 items labeled "Item 0" to "Item 99"). Users can type in the search box to filter and highlight items that contain the search term.

#### Key Components

- **Text Field**: Where users can type their search query.
- **ListView**: Displays the list of items, updating in real time based on the search query.

### TextHighlighter

The `TextHighlighter` widget is used to highlight the searched text within each list item.

#### Customization

You can customize the text styles:

- **textStyle**: Style for the non-highlighted text.
- **highlightStyle**: Style for the highlighted text.

Example:

```dart
TextHighlighter(
  text: "Sample text",
  textToHighlight: "sample",
  textStyle: TextStyle(fontSize: 16, color: Colors.black),
  highlightStyle: TextStyle(
    fontSize: 16,
    color: Colors.blue,
    fontWeight: FontWeight.bold,
    backgroundColor: Colors.yellow,
  ),
)
```