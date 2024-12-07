%{
    int nb_ligne=1;

    #include "syntaxique.tab.h"
%}


CHIFFRES [0-9]*
LETTRES [a-zA-Z]*

NUM ([-]?{CHIFFRES})|0 
REEL ([-+]?{CHIFFRES}*[.]{CHIFFRES}*)|0
TEXT {LETTRES}*
ID [A-Z][{LETTRES}{CHIFFRES}_]* 
CONST [{CHIFFRES}]*
COM ([--].[##])|([{-].[-}])

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

{NUM} {return mc_num;}
{REEL} {return mc_reel;}
{TEXT} {return mc_text;}
{ID} {return mc_id;}
{CONST} {return mc_const;}
{COM} {    }

.     {printf("erreur lexicale a la ligne %d \n",nb_ligne);}


%%


int yywrap() {
    return 1;
}

