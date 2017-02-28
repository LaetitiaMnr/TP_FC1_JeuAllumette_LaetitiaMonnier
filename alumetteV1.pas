program allumette; // Laetitia Monnier

uses crt;


FUNCTION verifNbAllumette(nbAllumette : integer; total : integer):boolean; // Verifie le nombre d'allumette.
VAR
	resultat : boolean;
begin
	resultat := FALSE;
	IF (nbAllumette >= 1) AND (nbAllumette <= 3) THEN
		IF total - nbAllumette >= 0 THEN
			resultat := TRUE;
	verifNbAllumette := resultat;
end;


PROCEDURE tour(joueur1 : boolean; var total : integer); // Cette procedure gère les tours de jeu.
VAR 
	nbAllumette : integer;
begin
	writeln;
	writeln('Il reste ', total, ' allumettes.');
	IF joueur1 THEN
		writeln('Joueur 1 : Faites votre tirage de 1/2/3 allumettes.')
	ELSE
		writeln('Joueur 2 : Faites votre tirage de 1/2/3 allumettes.');
	readln(nbAllumette);
	IF verifNbAllumette(nbAllumette, total) THEN
		total := total - nbAllumette
	ELSE
	begin
		writeln('Erreur, veuillez recommencer votre tirage.');
		tour(joueur1, total);
	end;
end;

// Programme principal.

VAR
	joueur1 : boolean;
	total : integer;
BEGIN	
	joueur1 := FALSE;
	total := 21;
	clrscr;
	writeln('-- Jeu des Allumettes --');
	REPEAT
	begin
		joueur1 := NOT joueur1;
		tour(joueur1, total);	
	end;
	UNTIL total = 0;

	IF joueur1 THEN
		writeln('Joueur 1 : Vous avez perdu !')
	ELSE
		writeln('Joueur 2 : Vous avez perdu !');
	readln;
END.

//Algo : Allumette  Joueur 1 vs Joueur 2.
//BUT : Battre l'adversaire en lui laissant la dernière allumette.
//Entree : Le nombre d'allumette tiré.
//Sortie : Le nombre d'allumette restante.

// FONCTION verifNbAllumette(nbAllumette : ENTIER; total : ENTIER):BOOLEEN
// VAR
// 	resultat : BOOLEEN
// debut
// 	resultat <- FAUX
// 	SI (nbAllumette >= 1) ET (nbAllumette <= 3) ALORS
// 		SI total - nbAllumette >= 0 ALORS
// 			resultat <- VRAIE
//	FINSI
// 	verifNbAllumette <- resultat
// fin

// PROCEDURE tour(joueur1 : BOOLEEN; var total : ENTIER)
// VAR 
// 	nbAllumette : ENTIER
// debut
// 	Ajoutez un writeln ici.
// 	ECRIRE('Il reste ', total, ' allumettes.')
// 	SI joueur1 ALORS
// 		ECRIRE('Joueur 1 : Faites votre tirage de 1/2/3 allumettes.')
// 	SINON
// 		ECRIRE('Joueur 2 : Faites votre tirage de 1/2/3 allumettes.')
// 	LIRE(nbAllumette)
//	FINSI
// 	SI verifNbAllumette(nbAllumette, total) ALORS
// 		total <- total - nbAllumette
// 	SINON
// 		ECRIRE('Erreur, veuillez recommencer votre tirage.')
// 		tour(joueur1, total)
//	FINSI
// fin

// VAR
// 	joueur1 : BOOLEEN
// 	total : ENTIER
// DEBUT	
// 	joueur1 <- FAUX
// 	total <- 21
// 	Ajoutez un clrscr ici.
// 	ECRIRE('-- Jeu des Allumettes --')
// 	REPETER
// 		joueur1 := NOT joueur1
// 		tour(joueur1, total)	
// 	JUSQU'A total = 0
// 	SI joueur1 ALORS
// 		ECRIRE('Joueur 1 : Vous avez perdu !')
// 	SINON
// 		ECRIRE('Joueur 2 : Vous avez perdu !')
//	FINSI
// FIN.

// Déroulement de jeu :
// Joueur 1 : Faites votre tirage de 1/2/3 allumettes.
// nbAllumette <- 3
// total <- 21 - 3
// Joueur 2 : Faites votre tirage de 1/2/3 allumettes.
// nbAllumette <- 2
// total <- 18 - 2
// etc....
