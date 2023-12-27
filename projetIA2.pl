% Exemple de base de données de plats
plat(salade_nicoise, sale, salade, [thon, oeufs, haricots, tomates, olives], 15).
plat(salade_cesar, sale, salade, [poulet_grillé, laitue, croûtons, parmesan, sauce_cesar], 20).
plat(salade_fruitee, sale, salade, [fraises, épinards, amandes, vinaigrette], 15).
plat(salade_grecque, sale, salade, [concombre, tomate, oignon, feta, olives, huile_olive], 25).
plat(salade_poulet, sale, salade, [poulet, laitue, tomates, avocat, maïs, ranch], 20).
plat(soupe_oignon, sale, soupe, [oignon, pain, fromage], 25).
plat(soupe_tomate, sale, soupe, [tomates, oignon, ail, basilic], 30).
plat(soupe_pois, sale, soupe, [pois, pommes_de_terre, carottes, oignon], 25).
plat(soupe_poulet_nouilles, sale, soupe, [poulet, nouilles, céleri, carottes], 35).
plat(soupe_legumes, sale, soupe, [légumes_variés, bouillon, herbes], 20).
plat(soupe_haricots, sale, soupe, [haricots, oignon, tomates, épices], 40).
plat(soupe_courgette, sale, soupe, [courgettes, pommes_de_terre, oignon, crème], 30).
plat(ratatouille, sale, plat_principal, [aubergine, courgette, poivron, tomate, oignon], 45).
plat(tiramisu, sucre, dessert, [biscuits, café, mascarpone, cacao], 45).
plat(mousse_chocolat, sucre, dessert, [chocolat, oeufs, sucre], 20).
plat(gateau_aux_pommes, sucre, gateau, [pommes, farine, sucre, beurre], 40).
plat(pizza, sale, plat_principal, [pâte, tomate, fromage, olive, champignons], 35).
plat(burger, sale, plat_principal, [pain, steak, fromage, salade, tomate, oignon], 25).
plat(creme_brulee, sucre, dessert, [crème, sucre], 30).
plat(tarte_aux_fraises, sucre, dessert, [pâte, fraises, crème_pâtissière], 40).
plat(poulet_curry, sale, plat_principal, [poulet, riz, curry, légumes], 40).
plat(cheesecake, sucre, gateau, [biscuits, fromage_frais, sucre, beurre], 50).
plat(poisson_grille, sale, plat_principal, [poisson, citron, herbes, légumes], 30).
plat(pates_carbonara, sale, plat_principal, [pâtes, pancetta, oeufs, crème, parmesan], 25).
plat(glace_vanille, sucre, dessert, [lait, crème, sucre, vanille], 15).
plat(sushi, sale, plat_principal, [riz, poisson_cru, algue], 50).
plat(tarte_aux_pommes, sucre, dessert, [pâte, pommes, cannelle, sucre], 35).
plat(panna_cotta, sucre, dessert, [crème, sucre, gélatine], 25).
plat(mille_feuille, sucre, dessert, [pâte_feuilletée, crème_pâtissière, sucre_glace], 30).
plat(gateau_chocolat, sucre, gateau, [chocolat, farine, sucre, œufs], 40).
plat(gateau_citron, sucre, gateau, [citron, farine, sucre, œufs], 35).
plat(gateau_carotte, sucre, gateau, [carottes, farine, sucre, œufs], 45).
plat(gateau_coco, sucre, gateau, [coco_râpé, farine, sucre, œufs], 50).
plat(gateau_moka, sucre, gateau, [café, farine, sucre, œufs], 40).
plat(gateau_fraise, sucre, gateau, [fraises, farine, sucre, œufs], 30).

% Règle pour filtrer les plats en fonction du type et du sous-type pour les plats salés
plat_inferieur_a_temps_sous_type(Type, SousType, Time, Plat) :-
    plat(Plat, Type, SousType, _, Duree),
    Duree =< Time.

find_plats_sous_type(Type, SousType, Time, Plats) :-
    findall(Plat, plat_inferieur_a_temps_sous_type(Type, SousType, Time, Plat), Plats).

% Afficher les sous-types disponibles pour chaque type de plat
display_sous_types(sale) :-
    writeln('Sous-types disponibles pour les plats salés :'),
    writeln('- salade'),
    writeln('- soupe'),
    writeln('- plat_principal').
display_sous_types(sucre) :-
    writeln('Sous-types disponibles pour les plats sucrés :'),
    writeln('- dessert'),
    writeln('- gâteau').

% Règle pour afficher les plats
display_plats(Plats) :-
    forall(member(Plat, Plats),
           writeln(Plat)).

% Règle pour afficher les ingrédients d'un plat sélectionné
afficher_ingredients(Plat) :-
    plat(Plat, _, _, Ingredients, _),
    writeln('Ingrédients du plat : '),
    display_ingredients(Ingredients).

% Règle pour afficher les éléments de la liste des ingrédients
display_ingredients(Ingredients) :-
    forall(member(Ingredient, Ingredients),
           writeln(Ingredient)).

% ...

search_recipe :-
    writeln('Sélecteur de Plats'),
    writeln('Type de plat (sale ou sucre) : '),
    read_line_to_string(user_input, TypeString),
    atom_string(TypeAtom, TypeString),
    writeln('Choisissez le sous-type de plat : '),
    display_sous_types(TypeAtom),
    read_line_to_string(user_input, SousTypeString),
    atom_string(SousTypeAtom, SousTypeString),
    writeln('Temps de préparation (en minutes) : '),
    read_line_to_string(user_input, TimeString),
    atom_number(TimeString, TimeNum),
    writeln('La liste des plats est : '),
    find_plats_sous_type(TypeAtom, SousTypeAtom, TimeNum, Plats),
    display_plats(Plats),
    writeln('Choisissez un plat pour afficher les ingrédients : '),
    read_line_to_string(user_input, SelectedPlatString),
    atom_string(SelectedPlat, SelectedPlatString),  % Convertir en atome
    afficher_ingredients(SelectedPlat),  % Afficher les ingrédients du plat sélectionné
    writeln('Si vous souhaitez rechoisir le plat, tapez "true".'),
    read_line_to_string(user_input, ResponseString),
    atom_string(ResponseAtom, ResponseString),  % Convertir en atome
    (ResponseAtom == true ->
        search_recipe
    ;   writeln('Fin du programme.')
    ).

