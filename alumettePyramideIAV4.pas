program allumettePyramideIA; // Laetitia Monnier

uses crt;

Type
    pyramide = array[1..4] of integer;

FUNCTION verifNbAllumette(nbAllumette : integer; total : integer):boolean; // Fonction qui vérifie le nombre d'allumette.
VAR
	resultat : boolean;
begin
	resultat := FALSE;
	IF (nbAllumette >= 1) AND (nbAllumette <= 3) THEN
		IF total - nbAllumette >= 0 THEN
			resultat := TRUE;
	verifNbAllumette := resultat;
end;

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
	begin
		writeln('Joueur 1 : Choisissez une ligne (1/2/3/4).');
		readln(ligne);
		writeln('Joueur 1 : Faites votre tirage de 1/2/3 allumettes.');
		readln(nbAllumette);
	end
	ELSE
	begin
		writeln('-- Tour de l''ordinateur --');
		ligne := IAligne(total);
		nbAllumette := IAtirage(total[ligne]);
	end;
	IF verifNbAllumette(nbAllumette, total[ligne]) THEN
	begin
		total[ligne] := total[ligne] - nbAllumette;
		totalPyramide := totalPyramide - nbAllumette;
	end
	ELSE
	begin
		writeln('Erreur, veuillez recommencer votre tirage.');
		tour(joueur1, total, totalPyramide);
	end;
end;

// Programme principal.

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
	end;
	UNTIL totalPyramide = 0;

	IF joueur1 THEN
		writeln('Joueur 1 : Vous avez perdu !')
	ELSE
		writeln('Joueur 1 : Vous avez gagné !');
	readln;
END.

//Algo : Allumette Pyramide IA vs Joueur 1.
//BUT : Battre l'adversaire en lui laissant la dernière allumette.
//Entree : Le nombre d'allumette tiré.
//Sortie : Le nombre d'allumette restante.

// Type
//     pyramide = TABLEAU[1..4] DE ENTIER

// FONCTION verifNbAllumette(nbAllumette : ENTIER; total : ENTIER):BOOLEEN
// VAR
// 	resultat : BOOLEEN
// debut
// 	resultat <- FAUX
// 	SI (nbAllumette >= 1) ET (nbAllumette <= 3) ALORS
// 		SI total - nbAllumette >= 0 ALORS
// 			resultat <- VRAI
//	FINSI
// 	verifNbAllumette <- resultat
// fin

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
// 		ECRIRE('Joueur 1 : Choisissez une ligne (1/2/3/4).')
// 		LIRE(ligne)
// 		ECRIRE('Joueur 1 : Faites votre tirage de 1/2/3 allumettes.')
// 		LIRE(nbAllumette)
// 	SINON
// 		ECRIRE('-- Tour de l''ordinateur --')
// 		ligne <- IAligne(total)
// 		nbAllumette <- IAtirage(total[ligne])
//	FINSI
// 	SI verifNbAllumette(nbAllumette, total[ligne]) ALOES
// 		total[ligne] <- total[ligne] - nbAllumette
// 		totalPyramide <- totalPyramide - nbAllumette
// 	SINON
// 		ECRIRE('Erreur, veuillez recommencer votre tirage.')
// 		tour(joueur1, total, totalPyramide)
//	FINSI
// fin

// VAR
// 	joueur1 : BOOLEEN
// 	total : pyramide
// 	totalPyramide, compteur : ENTIER
// DEBUT
// 	Randomize
// 	joueur1 <-FAUX
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
// 	JUSQU'A totalPyramide = 0
// 	SI joueur1 ALORS
// 		writeln('Joueur 1 : Vous avez perdu !')
// 	SINON
// 		writeln('Joueur 1 : Vous avez gagné !')
// 	FINSI
// FIN.

// Déroulement de jeu :
// Joueur 1 : Choisissez une ligne (1/2/3/4).
// ligne <- 2
// Joueur 1 : Faites votre tirage de 1/2/3 allumettes.
// nbAllumette <- 1
// total <- 21 - 1
// -- Tour de l''ordinateur --
// total <- 20 - 3
// etc...