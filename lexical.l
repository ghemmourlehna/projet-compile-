%{
    int nb_ligne=1;  
    char * mc_debut,*mc_fin,*mc_execution,* mc_fixe,*SI,*ALORS,*SINON,*TANTQUE,*FAIRE,*AFFICHE,*LIRE,*mc_num,*mc_reel,*mc_text,*mc_id,*mc_const,*AFF;
    
    #include "synt.tab.h"
    #include "TS.h"

    #define YY_NO_UNPUT
%}


CHIFFRES [0-9]+
LETTRES [a-zA-Z]+

NUM [-]?{CHIFFRES} 
REEL [-+]?{CHIFFRES}*\.{CHIFFRES}*
TEXT {LETTRES}+
ID [A-Z][{LETTRES}{CHIFFRES}_]* 
CONST [{CHIFFRES}]*
COM ("--".*"##")|("{-".*"-}")

%%


"Debut" {return mc_debut;}
"Fin" {return mc_fin;}
"Execution" {return mc_execution;}
"Fixe" {return mc_fixe;}


"Si" {return SI;}
"Alors" {return ALORS;}
"Sinon" {return SINON;}
"Tantque" {return TANTQUE;}
"Faire" {return FAIRE;}


"<-" {return  AFF;}
"!=" { return "!=";}
">" { return ">";}
"<" { return "<";}
"=" { return "=";}
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


"Affiche" {return AFFICHE;}
"Lire" {return LIRE;}


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

