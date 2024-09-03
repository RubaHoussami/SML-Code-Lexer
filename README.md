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

2. **Create an SML file if you do not want to use the example test.sml:**
  
3. **To run using lex.yy.c:**
      - Navigate to the main function at the end of the C file and customize the input and output file names.
      - Compile and run the C file.

4. **To run using lex.yy.exe:**
      - Open terminal in the root directory.
      - Run ```lex.yy.exe input_file.sml output_file.html``` for custom input and output files.
      - Run ```lex.yy.exe input_file.sml``` for custom input file and test.html output file.

5. **Open the HTML output file**

## Legend
