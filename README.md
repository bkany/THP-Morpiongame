# Le jeu du Morpion

## Généralités
### Objectifs 
Le jeu du morpion se joue sur une grille de 9 cases (carré de 3 cases par 3 cases). Deux joueurs s'affrontent. Ils positionnent à tour de rôle un "x" (joueur 1) ou un "o" dans l'une des cases non encore occupées.
Le gagnant est celui qui réussit à aligner son symbole sur 3 cases consécutives (vertical, horizontal ou diagonal). 

### Lancement du jeu 
Après avoir cloné le repository dans un dossier local, il faut se positionner à la racine du dossier et lancer : 
`sh launch`

## Documentation générale
Le jeu est composé de 4 classes d'objets, 1 classe de lancement de jeu et 1 classe d'affichage. 

##### Classe Player
Le joueur est représenté dans une classe __Player__ qui contient les variables d'instance suivantes : 
- *name* : contient le nom du joueur
- *turn_to_play* : est à 1 si c'est au joueur de jouer, 0 sinon. Elle change donc à chaque action d'un joueur. 
- *camp* : contient "x" ou "o", symbole attribué au joueur.
- *nb_win_lose* : contient un tableau de deux valeurs [nb_win, nb_lose] correspondant aux nombres de victoires et de défaites. 

##### Classe Boardcase 
La classe __Boardcase__ représent l'object case de la grille de jeu. Elle ne contient que deux variables d'instance : 
- *status* : valeur à 1 si la case est occupée (par un "x" ou un "o") ou 0 si la case est vide.
- *content* : le contenu de la case peut être " " si la case est vide, ou "x" ou "o" si l'un des joueurs l'a remplie.
L'initialisation d'une boardcase crée un objet, avec un status = 0 et un content = " "

##### Classe Board
La grille de jeu est contenu dans la classe __Board__. Il s'agit d'un tableau à deux dimensions contenu dans la seule variable d'instance *game_board*. 
game_board[i] correspond à une ligne.
game_board[i][j] correspond à un objet de type __Boardcase__. 
L'initialisation d'un objet de type Board crée donc un tableau de tableau, de 3 x 3, contenant 9 Boardcases (initialisées, elles aussi). 

##### Classe Game
La classe __Game__ contient l'ensemble des variables d'instance permettant de jouer une partie : 
- *players* est un tableau contenant les deux joueurs.
- *game_board* est de type Board contenant la grille de jeu.
- *nb_games* est un Integer qui compte le nombre de parties jouées. 

## Algorithme de jeu
Après l'initialisation d'un __Game__ (2 joueurs, 1 grille), l'algorithme va demander aux joueurs quelle case ils souhaitent jouer, sous la forme A1, A2, A3 (première ligne, B1, B2, B3 (deuxième ligne) ou C1, C2, C3 (troisième ligne). Une case ne pourra être jouée que si son status == 0. 
A chaque coup d'un joueur, sa variable __turn_to_play__ est modifiée. La variable de l'adversaire également. 
Tant que la grille n'est pas pleine (méthode *is_full?()*) OU que la grille n'est pas victorieuse (méthode *is_victorious?()*), le joueur à qui c'est le tour doit jouer. 
La partie se termine lorsque l'une des deux conditions est validée. 
Si les joueurs veulent recommencer, une nouvelle grille pourra être appelée avec la méthode *recharge_board*.
