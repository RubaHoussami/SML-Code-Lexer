%{
    FILE* outFile;
    void printKeyword(const char* s) {
        fprintf(outFile, "<span style=\"color:#a0a000;\">%s</span>", s);
    }
    void printBuiltIn(const char* s) {
        fprintf(outFile, "<span style=\"color:#00c000;\">%s</span>", s);
    }
    void printLiterals(const char* s) {
        fprintf(outFile, "<span style=\"color:#ff0000;\">%s</span>", s);
    }
    void printIdentifierMagenta(const char* s) {
        fprintf(outFile, "<span style=\"color:#ff00ff;\">%s</span>", s);
    }
    void printIdentifierNonColor(const char* s) {
        fprintf(outFile, "<span>%s</span>",s);
    }
    void printOperatorSeparator(const char* s) {
        fprintf(outFile, "<span style=\"color:#0000ff;\">%s</span>", s);
    }
    void printSpace(const char* s) {
        fprintf(outFile, "%s",s);
    }
%}

%%
    /* Rules for keywords */
datatype|of|val|fun|let|in|end|if|then|else|orelse|andalso|case             printKeyword(yytext);

    /* Rules for built-in types */
int|bool|string             printBuiltIn(yytext);

    /* Rule for integer and boolean literals */
-?[0-9]+|true|false            printLiterals(yytext);

    /* Rule for identifiers */
[A-Z][_a-zA-Z0-9]*            printIdentifierMagenta(yytext);
[_a-z][_a-zA-Z0-9]*           printIdentifierNonColor(yytext);

    /* Rules for operators and separators */
"+"|"-"|"*"|"|"|"=>"|"<="|">="|"="|"<"|">"|"::"|":"|"."|"["|"]"|","|"("|")"|";"|"#"|"^"            printOperatorSeparator(yytext);

    /* Rule for string literal */
    /* Hint: you can call input() to read the next character in the stream */
["]             {
                    fprintf(outFile, "<span style=\"color:#ff0000;\">%s", yytext);
                    char temp1 = input();
                    while (temp1 != EOF && temp1 != '\"') {
                        fputc(temp1, outFile);
                        if (temp1 == '\\') {
                            char temp2 = input();
                            if (temp2 == EOF) {
                                fprintf(outFile, "EOF in string", yytext);
                                break;
                            }
                            fputc(temp2, outFile);
                        }
                        temp1 = input();
                    }
                    if (temp1 != EOF) {
                        fputc(temp1, outFile);
                    }
                    else {
                        fprintf(outFile, "EOF in string", yytext);
                    }
                    fprintf(outFile, "</span>", yytext);
                }

    /* Rule for comment */
    /* Hint: you can call input() to read the next character in the stream */
    /* Hint: you can call unput(char) to return a character to the stream after reading it */
[(][*]            {
                    fprintf(outFile, "<span style=\"color:#00aaff;\">%s", yytext);
                    char temp1 = input();
                    while (temp1 != EOF) {
                        fputc(temp1, outFile);
                        if (temp1 == '*'){
                            char temp2 = input();
                            if (temp2 == EOF) {
                                fprintf(outFile, "EOF in comment", yytext);
                                break;
                            }
                            fputc(temp2, outFile);
                            if (temp2 == ')') {
                                break;
                            }
                            else{
                                unput(temp2);
                            }
                        }
                        temp1 = input();
                    }
                    if (temp1 == EOF) {
                        fprintf(outFile, "EOF in comment", yytext);
                    }
                    fprintf(outFile, "</span>", yytext);
                }

    /* Rule for whitespace */
[ ]            printSpace("&nbsp;");
[\t]           printSpace("&nbsp;&nbsp;&nbsp;&nbsp;");
[\n\r]         printSpace("<br>\n");

    /* Catch unmatched tokens */
.               fprintf(stderr, "INVALID TOKEN: %s\n", yytext);

%%

int main(int argc, char** argv) {
    const char* inFileName = (argc > 1)?argv[1]:"test.sml";
    const char* outFileName = (argc > 2)?argv[2]:"test.html";
    yyin = fopen(inFileName, "r");
    outFile = fopen(outFileName, "w");
    fprintf(outFile, "<html>\n<body><tt>\n");
    yylex();
    fprintf(outFile, "</body>\n</html></tt>\n");
    fclose(yyin);
    fclose(outFile);
    return 0;
}
int yywrap() {
    return 1;
}

