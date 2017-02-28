program allumettePyramide; // Laetitia Monnier

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

PROCEDURE tour(joueur1 : boolean; var total : pyramide; var totalPyramide : integer); // Procedure qui gère les tours de jeu.
VAR
	nbAllumette, ligne : integer;
begin
	affichePyramide(total);
	IF joueur1 THEN
		writeln('Joueur 1 : Choisissez une ligne (1/2/3/4).')
	ELSE
		writeln('Joueur 2 : Choisissez une ligne (1/2/3/4).');
	readln(ligne);
	IF joueur1 THEN
		writeln('Joueur 1 : Faites votre tirage de 1/2/3 allumettes.')
	ELSE
		writeln('Joueur 2 : Faites votre tirage de 1/2/3 allumettes.');
	readln(nbAllumette);
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

// Programme Principal.

VAR
	joueur1 : boolean;
	total : pyramide;
	totalPyramide, compteur : integer;
BEGIN	
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
		writeln('Joueur 2 : Vous avez perdu !');
	readln;
END.

//Algo : Allumette Pyramide Joueur 1 vs Joueur 2.
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

// PROCEDURE tour(joueur1 : BOOLEEN; var total : pyramide; var totalPyramide : ENTIER)
// VAR
// 	nbAllumette, ligne : ENTIER
// debut
// 	affichePyramide(total);
// 	SI joueur1 ALORS
// 		ECRIRE('Joueur 1 : Choisissez une ligne (1/2/3/4).')
// 	SINON
// 		ECRIRE('Joueur 2 : Choisissez une ligne (1/2/3/4).')
// 	LIRE(ligne)
//	FINSI
// 	SI joueur1 ALORS
// 		ECRIRE('Joueur 1 : Faites votre tirage de 1/2/3 allumettes.')
// 	SINON
// 		ECRIRE('Joueur 2 : Faites votre tirage de 1/2/3 allumettes.')
// 	LIRE(nbAllumette)
//	FINSI
// 	SI verifNbAllumette(nbAllumette, total[ligne]) ALORS
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
// 	joueur1 <- FAUX
// 	totalPyramide <- 0
// 	POUR compteur DE 1 A 4 FAIRE
// 		total[compteur] <- 2 * compteur - 1
// 		totalPyramide<- totalPyramide + (2 * compteur - 1)
//	FINPOUR
// 	Ajoutezun clrscr ici.
// 	ECRIRE('-- Jeu des Allumettes --')
// 	REPETER
// 		joueur1 <- NOT joueur1
// 		tour(joueur1, total, totalPyramide);
// 	JUSQU'A totalPyramide = 0
// 	SI joueur1 ALORS
// 		ECRIRE('Joueur 1 : Vous avez perdu !')
// 	SINON
// 		ECRIRE('Joueur 2 : Vous avez perdu !')
//	FINSI
// FIN.

// Déroulement de jeu :
// Joueur 1 : Choisissez une ligne (1/2/3/4).
// ligne <- 3
// Joueur 1 : Faites votre tirage de 1/2/3 allumettes.
// nbAllumette <- 2
// total <- 21 - 2
// Joueur 2 : Choisissez une ligne (1/2/3/4).
// ligne <- 4
// Joueur 2 : Faites votre tirage de 1/2/3 allumettes.
// nbAllumette <- 1
// total <- 19 - 1
// etc...