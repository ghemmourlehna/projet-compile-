%{
    int nb_ligne=1;

    #include "syntaxique.tab.h"
%}


([-]?[1-9][0-9]*)|0 {return NUM;}
([-]?[1-9][0-9]*[.][0]|[0]+[1-9]+|[1-9][0-9]*)|0|([-]?[1-9][0-9]*) {return REEL;}
.{return TEXT;}
[a-zA-Z][a-zA-Z0-9]*[_]?[a-zA-Z][a-zA-Z0-9]* {return ID;}
[1-9][0-9]* {return TAILLE;}
([-]?[1-9][0-9]*[.][0]|[0]+[1-9]+|[1-9][0-9]*)|0|([-]?[1-9][0-9]*) | ([-]?[1-9][0-9]*)|0 {return CONST;}
\{.*?\} {retrun COM;}
--[^#]*## {return COM;}

^\s*(\w+)\s*:\s*(\w+)\[(\d+)\]\s*;$  //tableau

%%


"DEBUT" {return mc_debut;}
"FIN" {return mc_fin;}
"EXECUTION" {return mc_execution;}
"FIXE" {return mc_fixe;}


"Si" {return SI;}
"Alors" {return ALORS;}
"Sinon" {return SINON;}
"Tantque" {return TANTQUE;}
"Faire" {return FAIRE;}


"<-" {return "<-";}
"!=" { return "!=";}
">" { return ">";}
"<" { return "<";}
"=" { return '=';}
">=" {return ">=";}
"<=" {return "<=";}


"+" { return "+";}
"-" { return "-";}
"*" { return "*";}
"/" { return "/";}


"ET" {return "ET";}
"OU" {return "OU";}
"NON" {return "NON";}


";" { return ";";}
"," { return ",";}
"(" { return "(";}
")" { return ")";}
"{" { return "{";}
"}" { return "}";}
":" {return ":";}


"AFFICHE" {return AFFICHE;}
"LIRE" {return LIRE;}


[ \t]  {    }

\n {nb_ligne ++;}

.     {printf("erreur lexicale a la ligne %d \n",nb_ligne);}


%%


int yywrap() {
    return 1;
}

