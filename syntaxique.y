%{
    #include <stdio.h>
%}

%start PROG
%token mc_debut mc_fin mc_execution mc_fixe SI ALORS SINON TANTQUE FAIRE mc_num mc_reel mc_text mc_id mc_const AFFICHE LIRE 

%%
PROG:mc_debut declaration mc_execution instruction mc_fin {printf("Syntaxe Correct"); YYACCEPT;};

declaration:
            declaration dec
            dec
            ;

dec: 
    type ":" list_id ";"
    type ":" list_mat ";"
    mc_fixe type ":" list_const ";" 
    ;

type:
     mc_reel | mc_num | mc_text
     ;

list_id:
        list_id "," mc_id
        mc_id
        ;

list_mat:
         list_mat "," mc_id "[" mc_const "]" 
         mc_id "[" mc_const "]"
         ;

list_const:
           list_const "," mc_id "=" mc_const
           mc_id "=" mc_const
           ;

instruction:
            instruction inst
            inst
            ;

inst:
     

           
         
%%
main ()
{
yyparse();
}
yywrap()
{}