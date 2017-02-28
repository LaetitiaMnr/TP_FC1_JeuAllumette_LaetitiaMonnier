program allumetteIA; // Laetitia Monnier

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

FUNCTION IA(total : integer):integer; // Fonction qui gère l'IA.
VAR
	resultat : integer;
begin
	IF total > 4 THEN
		resultat := random(3) + 1
	ELSE IF total > 1 THEN
		resultat := total - 1
	ELSE
		resultat := 1;
	IA := resultat;
end;

PROCEDURE tour(joueur1 : boolean; var total : integer); // Procedure qui gère les tours de jeu.
VAR 
	nbAllumette : integer;
begin
	writeln;
	writeln('Il reste ', total, ' allumettes.');
	IF joueur1 THEN
	begin
		writeln('Joueur 1 : Faites votre tirage de 1/2/3 allumettes.');
		readln(nbAllumette);
	end
	ELSE
	begin
		writeln('-- Tour de l''ordinateur --');
		nbAllumette := IA(total);
	end;
	IF verifNbAllumette(nbAllumette, total) THEN
		total := total - nbAllumette
	ELSE
	begin
		writeln('Erreur, veuillez recommencer votre tirage.');
		tour(joueur1, total);
	end;
end;

// Programme Principal.

VAR
	joueur1 : boolean;
	total : integer;
BEGIN	
	Randomize;
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
		writeln('Joueur 1 : Vous avez gagné !');
	readln;
END.


//Algo : Allumette IA vs Joueur.
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

// FONCTION IA(total : ENTIER):ENTIER
// VAR
// 	resultat : ENTIER
// debut
// 	SI total > 4 ALORS
// 		resultat <- random(3) + 1
// 	SINON SI total > 1 ALORS
// 		resultat <- total - 1
// 	SINON
// 		resultat <- 1
//	FINSI
// 	IA <- resultat
// fin

// PROCEDURE tour(joueur1 : BOOLEEN; var total : ENTIER)
// VAR 
// 	nbAllumette : ENTIER
// debut
// 	Ajoutez un writeln ici.
// 	ECRIRE('Il reste ', total, ' allumettes.')
// 	SI joueur1 ALORS
// 		ECRIRE('Joueur 1 : Faites votre tirage de 1/2/3 allumettes.')
// 		LIRE(nbAllumette)
// 	SINON
// 		ECRIRE('-- Tour de l''ordinateur --')
// 		nbAllumette <- IA(total)
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
// 	Randomize
// 	joueur1 <- FAUX
// 	total <- 21
// 	Ajoutez un clrscr ici.
// 	ECRIRE('-- Jeu des Allumettes --')
// 	REPETER
// 		joueur1 <- NOT joueur1
// 		tour(joueur1, total)
// 	JUSQU'A total = 0
// 	SI joueur1 ALORS
// 		ECRIRE('Joueur 1 : Vous avez perdu !')
// 	SINON
// 		ECRIRE('Joueur 1 : Vous avez gagné !')
//	FINSI
// FIN.

// Déroulement de jeu :
// Joueur 1 : Faites votre tirage de 1/2/3 allumettes.
// nbAllumette <- 3
// total <- 21 - 3
// -- Tour de l''ordinateur --
// total <- 18 - 1
// etc...
