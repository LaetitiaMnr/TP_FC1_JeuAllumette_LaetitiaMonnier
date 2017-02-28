program allumettePyramideIAvsIA; // Laetitia Monnier

uses crt;

Type
    pyramide = array[1..4] of integer;

PROCEDURE affichePyramide(total : pyramide); // Procedure affichant la 'pyramide' en colone.
VAR
	compteur : integer;
begin
	writeln;
	FOR compteur := 1 TO 4 DO
		writeln(total[compteur]);
end;

FUNCTION IAtirage(total : integer):integer; // Fonction qui gère le tirage de l'IA.
VAR
	resultat : integer;
begin
	IF total > 4 THEN
		resultat := random(3) + 1
	ELSE IF total > 1 THEN
		resultat := total - 1
	ELSE
		resultat := 1;
	IAtirage := resultat;
end;

FUNCTION IAligne(total : pyramide):integer; // Fonction qui gère la ligne de l'IA.
VAR
	resultat : integer;
begin
	REPEAT
		resultat := random(4) + 1;
	UNTIL total[resultat] > 0;
	IAligne := resultat;
end;

PROCEDURE tour(joueur1 : boolean; var total : pyramide; var totalPyramide : integer); // Procedure qui gère les tours de jeu.
VAR
	nbAllumette, ligne : integer;
begin
	affichePyramide(total);
	IF joueur1 THEN
		writeln('-- Tour de l''ordinateur 1 --')
	ELSE
		writeln('-- Tour de l''ordinateur 2 --');
	ligne := IAligne(total);
	nbAllumette := IAtirage(total[ligne]);
	total[ligne] := total[ligne] - nbAllumette;
	totalPyramide := totalPyramide - nbAllumette;
end;

// Programme Principal

VAR
	joueur1 : boolean;
	total : pyramide;
	totalPyramide, compteur : integer;
BEGIN
	Randomize;
	joueur1 := FALSE;
	totalPyramide := 0;
	FOR compteur := 1 TO 4 DO // Initialisation du nombre d'allumette pour la pyramide.
	begin
		total[compteur] := 2 * compteur - 1;
		totalPyramide := totalPyramide + (2 * compteur - 1);
	end;
	clrscr;
	writeln('-- Jeu des Allumettes --');
	REPEAT
	begin
		joueur1 := NOT joueur1;
		tour(joueur1, total, totalPyramide);
		readln;
	end;
	UNTIL totalPyramide = 0;

	IF joueur1 THEN
		writeln('Ordinateur 1 a perdu !')
	ELSE
		writeln('Ordinateur 2 a perdu !');
	readln;
END.

//Algo : Allumette Pyramide IA vs Joueur IA.
//BUT : Battre l'adversaire en lui laissant la dernière allumette.
//Entree : Le nombre d'allumette tiré.
//Sortie : Le nombre d'allumette restante.
// Type
//     pyramide = TABLEAU[1..4] DE ENTIER
// PROCEDURE affichePyramide(total : pyramide)
// VAR
// 	compteur : ENTIER
// debut
// 	Ajoutez un writeln ici.
// 	POUR compteur DE 1 A 4 FAIRE
// 		ECRIRE(total[compteur])
//	FINPOUR
// fin
// FONCTION IAtirage(total : ENTIER):ENTIER
// VAR
// 	resultat : ENTIER
// debut
// 	SI total > 4 ALORS
// 		resultat <-random(3) + 1
// 	SINON SI total > 1 ALORS
// 		resultat <- total - 1
// 	SINON
// 		resultat <- 1
//	FINSI
// 	IAtirage <- resultat
// fin
// FONCTION IAligne(total : pyramide):ENTIER
// VAR
// 	resultat : ENTIER
// debut
// 	REPETER
// 		resultat <- random(4) + 1
// 	JUSQU'A total[resultat] > 0
// 	IAligne <- resultat
// fin
// PROCEDURE tour(joueur1 : BOOLEEN; var total : pyramide; var totalPyramide : ENTIER)
// VAR
// 	nbAllumette, ligne : ENTIER
// debut
// 	affichePyramide(total)
// 	SI joueur1 ALORS
// 		ECRIRE('-- Tour de l''ordinateur 1 --')
// 	SINON
// 		ECRIRE('-- Tour de l''ordinateur 2 --')
// 	ligne <- IAligne(total)
// 	nbAllumette <- IAtirage(total[ligne]);
// 	total[ligne] <- total[ligne] - nbAllumette
// 	totalPyramide <- totalPyramide - nbAllumette
// fin

// VAR
// 	joueur1 : BOOLEN
// 	total : pyramide
// 	totalPyramide, compteur : ENTIER
// DEBUT
// 	Randomize
// 	joueur1 <- FAUX
// 	totalPyramide <- 0
// 	POUR compteur DE 1 A 4 FAIRE
// 		total[compteur] <- 2 * compteur - 1
// 		totalPyramide <- totalPyramide + (2 * compteur - 1)
// 	FINPOUR
// 	Ajoutez un clrscr ici.
// 	ECRIRE('-- Jeu des Allumettes --')
// 	REPETER
// 		joueur1 <- NOT joueur1
// 		tour(joueur1, total, totalPyramide)
// 		Ajoutez un readln ici.
// 	JUSQU'A totalPyramide = 0
// 	SI joueur1 ALORS
// 		ECRIRE('Ordinateur 1 a perdu !')
// 	SINON
// 		ECRIRE('Ordinateur 2 a perdu !')
// 	FINSI
// FIN