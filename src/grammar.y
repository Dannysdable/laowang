%{

#include <stdio.h>
#include <stdlib.h>

void yyerror (char *s);

/* 抽象语法树的节点 */
struct ast {
    int nodetype;
    struct ast *l;
    struct ast *r;
};

struct numval {
    int nodetype; /* 类型K 表明常量 */
    double number;
};

/* 构造抽象语法树 */
struct ast *newast (int nodetype, struct ast *l, struct ast *r);
struct ast *newnum (double d);

/* 删除和释放抽象语法树 */
void treefree (struct ast *);

%}

%token T_Select

%%

thing: T_Select        { $$ = $1; printf("select = %d\n", $$); }
     ;

%%

struct ast *newast (int nodetype, struct ast *l, struct ast *r)
{
    struct ast *a = malloc (sizeof(struct ast));

    if (!a) {
        yyerror("out of space");
        exit(0);
    }

    a->nodetype = nodetype;
    a->l = l;
    a->r = r;

    return a;
}

struct ast *newnum (double d)
{
    struct numval *a = malloc (sizeof(struct numval));

    if (!a) {
        yyerror ("out of space");
        exit(0);
    }

    a->nodetype = 'K';
    a->number = d;

    return  (struct ast *)a;
}

int main() {
    return yyparse();
}
