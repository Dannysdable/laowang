/*************************************************************************
    > File Name: token.h
    > Author: Danny
    > Mail: dannysdable@gmail.com 
    > Created Time: 2017-08-22 21:28
 ************************************************************************/

#ifndef TOKEN_H
#define TOKEN_H

typedef enum {
    T_Is = 256, T_Le, T_Ge, T_Eq, T_Ne, T_And, T_Or, T_IntConstant,
    T_StringConstant, T_Identifier, T_Void, T_Int, T_While,
    T_If, T_Else, T_Return, T_Break, 
    T_Select, T_From, T_Where, T_Content
} TokenType;

static void print_token(int token) {
    static char* token_strs[] = {
        "T_Is", "T_Le", "T_Ge", "T_Eq", "T_Ne", "T_And", "T_Or", "T_IntConstant",
        "T_StringConstant", "T_Identifier", "T_Void", "T_Int", "T_While",
        "T_If", "T_Else", "T_Return", "T_Break", 
        "T_Select", "T_From", "T_Where", "T_Content"
    };

    if (token < 256) {
        printf("Key:%-20c", token);
    } else {
        printf("%-20s", token_strs[token-256]);
    }
}

#endif

