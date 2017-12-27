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
    T_Select, T_From, T_Where, T_Decode, T_Kand, T_Union_all, T_Order_by,
	T_Group_by, T_Rownum, T_Desc, 
	/* 内部函数 */
	T_Sum, T_Min, T_Trunc, T_Max, T_Nvl2, T_Nvl, T_Length, T_Nullif, T_Coalesce, T_Having,
	T_To_char, T_Case, T_End, T_Avg,
	T_When, T_Then, T_Using,
	T_Point, T_StringConstant2,
	T_Content, T_Value
} TokenType;

static void print_token(int token) {
    static char* token_strs[] = {
        "T_Is", "T_Le", "T_Ge", "T_Eq", "T_Ne", "T_And", "T_Or", "T_IntConstant",
        "T_StringConstant", "T_Identifier", "T_Void", "T_Int", "T_While",
        "T_If", "T_Else", "T_Return", "T_Break", 
        "T_Select", "T_From", "T_Where", "T_Decode", "T_Kand", 
		"T_Union_all", "T_Order_by", "T_Group_by", "T_Rownum", "T_Desc", 
		/* 内部函数 */
		"T_Sum", "T_Min", "T_Trunc", "T_Max", "T_Nvl2", "T_nvl", "T_Length", "T_Nullif", "T_Coalesce", "T_Having",
		"T_To_char", "T_Case", "T_End", "T_Avg",
		"T_When", "T_Then", "T_Using",
		"T_Point", "T_StringConstant2",
		"T_Content", "T_Value"
    };

    if (token < 256) {
        printf("Key:%-20c", token);
    } else {
        printf("%-20s", token_strs[token-256]);
    }
}

#endif

