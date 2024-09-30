# SML Code Lexer

## Table of Contents

1. [Introduction](#introduction)
2. [Features](#features)
3. [Installation and Usage](#installation-and-usage)
4. [Legend](#legend)
5. [License](#license)

## Introduction

The **SML Code Lexer** is a lexer for Standard ML (SML) code that converts SML source code into HTML with syntax highlighting. This lexer identifies various tokens in SML code (such as keywords, identifiers, literals, and symbols) and applies color coding to enhance code readability using regular expressions. It is useful for displaying SML code snippets on websites or in documents.

## Features

- **Tokenization of SML Code**: Parses SML code into tokens like keywords, symbols, identifiers, and literals.
- **Syntax Highlighting**: Converts parsed tokens into HTML with proper syntax highlighting using various colors.
- **Extensible Design**: Easily customizable to add more tokens or change the styling of the highlighted code.
- **Command-Line Interface**: Run the lexer from the command line with input and output options.

## Installation and Usage

1. **Clone the repository:**
    ```
    git clone https://github.com/RubaHoussami/SML-Code-Lexer.git
    cd SML-Code-Lexer
    ```

2. **Create an SML file if you do not want to use the example test.sml**
  
3. **To run using lex.yy.c:**
      - Navigate to the main function at the end of the C file and customize the input and output file names.
      - Compile and run the C file.

4. **To run using lex.yy.exe:**
      - Open terminal in the root directory.
      - Run ```.\lex.yy.exe input_file.sml output_file.html``` for custom input and output files.
      - Run ```.\lex.yy.exe input_file.sml``` for custom input file and test.html output file.

5. **Open the HTML output file**

## Legend

The SML Code Lexer uses different colors to highlight various components of Standard ML (SML) code when generating HTML output. Below is a legend explaining the color scheme used by the lexer:

- **Keywords**: Displayed in **yellow** (`#a0a000`). Keywords such as `datatype`, `of`, `val`, `fun`, `let`, `in`, `end`, `if`, `then`, `else`, `orelse`, `andalso`, `case` are highlighted in this color.

- **Built-in Types**: Displayed in **green** (`#00c000`). Built-in types like `int`, `bool`, and `string` are highlighted in this color.

- **Literals**: Displayed in **red** (`#ff0000`). This includes integer and boolean literals such as `true`, `false`, and any integer value (e.g., `123`, `-45`).

- **Identifiers**:
  - **Identifiers starting with an uppercase letter** (e.g., `MyType`) are displayed in **magenta** (`#ff00ff`).
  - **Identifiers starting with a lowercase letter or underscore** (e.g., `myVariable`, `_internalValue`) are displayed without any color.

- **Operators and Separators**: Displayed in **blue** (`#0000ff`). This includes common operators and symbols such as `+`, `-`, `*`, `/`, `::`, `:`, `.`, `[]`, `()`, `#`, `;`, `=>`, `<=`, `>=`, and `^`.

- **String Literals**: Displayed in **red** (`#ff0000`). Strings are enclosed in double quotes (`"`) and the contents, including escaped characters, are highlighted.

- **Comments**: Displayed in **light blue** (`#00aaff`). Multi-line comments in SML are enclosed between `(*` and `*)` and the content within these delimiters is highlighted.

- **Whitespace**:
  - **Space** (` `): Rendered as a non-breaking space (`&nbsp;`).
  - **Tab** (`\t`): Rendered as four non-breaking spaces (`&nbsp;&nbsp;&nbsp;&nbsp;`).
  - **Newline** (`\n` or `\r`): Rendered as a line break (`<br>`).

- **Invalid Tokens**: If an unrecognized or invalid token is encountered during lexing, an error message is displayed in the standard error output.

This legend helps in understanding how different elements of SML code will appear when rendered as HTML, ensuring clarity and readability for users viewing the highlighted code.

## License
This project is licensed under the MIT License.
