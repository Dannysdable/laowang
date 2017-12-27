/* 去掉告警,defined but not use */
%option nounput
%option noinput

%{
#include "token.h"
int cur_line_num = 1;
void init_scanner();
void lex_error(char* msg, int line);
%}

/* Definitions, note: \042 is '"' */
INTEGER             ([0-9]+)
UNTERM_STRING       (\042[^\042\n]*)
STRING              (\042[^\042\n]*\042)
STRING2             ([_a-zA-Z0-9].[_a-zA-z0-9]*)
IDENTIFIER          ([_a-zA-Z][_a-zA-Z0-9]*)
OPERATOR            ([+*-/%=,;!<>(){}])
SINGLE_COMMENT1     ("//"[^\n]*)
SINGLE_COMMENT2     ("#"[^\n]*)
/* 匹配SQL中的注释 */
SINGLE_COMMENT3     ("/*"(([^\*]*(\*[^\/])?)*)"*/")
/* 匹配双引号 */
SINGLE_COMMENT4     \"(\\.|[^"])*\"
/* 匹配单引号 */
SINGLE_COMMENT5     \'(\\.|[^'])*\'

%%
[\n]                { cur_line_num++;                       }
[ \t\r\a]+          { /* ignore all spaces */               }
{SINGLE_COMMENT1}   { /* skip for single line comment */    }
{SINGLE_COMMENT2}   { /* skip for single line commnet */    }
{SINGLE_COMMENT3}   { /* skip for single line commnet */    }

{SINGLE_COMMENT4}   { return T_Content;         }
{SINGLE_COMMENT5}   { return T_Value;           }

{OPERATOR}          { return yytext[0];         }   

"="                 { return T_Is;              }
"<="                { return T_Le;              }
">="                { return T_Ge;              }
"=="                { return T_Eq;              }
"!="                { return T_Ne;              }
"&&"                { return T_And;             }
"||"                { return T_Or;              }
"void"              { return T_Void;            }
"int"               { return T_Int;             }
"while"             { return T_While;           }
"if"                { return T_If;              }
"return"            { return T_Return;          }
"break"             { return T_Break;           }

"select"            { return T_Select;          }
"from"              { return T_From;            }
"where"             { return T_Where;           }
"decode"            { return T_Decode;          }
"and"               { return T_Kand;            }
"union all"         { return T_Union_all;       }
"order by"          { return T_Order_by;        }
"group by"          { return T_Group_by;        }
"rownum"            { return T_Rownum;          }
"desc"              { return T_Desc;            }
"to_char"           { return T_To_char;         }
"case"              { return T_Case;            }
"end"               { return T_End;             }
"else"              { return T_Else;            }
"avg"               { return T_Avg;             }
"sum"               { return T_Sum;             }
"min"               { return T_Min;             }
"trunc"             { return T_Trunc;           }
"max"               { return T_Max;             }
"nvl2"              { return T_Nvl2;            }
"nvl"               { return T_Nvl;             }
"length"            { return T_Length;          }
"nullif"            { return T_Nullif;          }
"coalesce"          { return T_Coalesce;        }
"having"            { return T_Having;          }
"when"              { return T_When;            }
"then"              { return T_Then;            }
"using"             { return T_Using;           }
"."                 { return T_Point;           }

{INTEGER}           { return T_IntConstant;     }
{STRING}            { return T_StringConstant;  }
{STRING2}           { return T_StringConstant2; }
{IDENTIFIER}        { return T_Identifier;      }

<<EOF>>             { return 0; }

{UNTERM_STRING}     { lex_error("Unterminated string constant", cur_line_num);  }
.                   { lex_error("Unrecognized character", cur_line_num);        }

%%

int main(int argc, char* argv[]) {
    int token;
    init_scanner();
    while ((token = yylex()) > 0) {
        print_token(token);
        puts(yytext);
    }
    return 0;
}

void init_scanner() {
    printf("%-20s%s\n", "TOKEN-TYPE", "TOKEN-VALUE");
    printf("-------------------------------------------------\n");
}

void lex_error(char* msg, int line) {
    printf("\nError at line %-3d: %s\n\n", line, msg);
}

int yywrap(void) {
    return 1;
}

