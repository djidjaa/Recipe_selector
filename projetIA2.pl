% Exemple de base de donn�es de plats
plat(salade_nicoise, sale, salade, [thon, oeufs, haricots, tomates, olives], 15).
plat(salade_cesar, sale, salade, [poulet_grill�, laitue, cro�tons, parmesan, sauce_cesar], 20).
plat(salade_fruitee, sale, salade, [fraises, �pinards, amandes, vinaigrette], 15).
plat(salade_grecque, sale, salade, [concombre, tomate, oignon, feta, olives, huile_olive], 25).
plat(salade_poulet, sale, salade, [poulet, laitue, tomates, avocat, ma�s, ranch], 20).
plat(soupe_oignon, sale, soupe, [oignon, pain, fromage], 25).
plat(soupe_tomate, sale, soupe, [tomates, oignon, ail, basilic], 30).
plat(soupe_pois, sale, soupe, [pois, pommes_de_terre, carottes, oignon], 25).
plat(soupe_poulet_nouilles, sale, soupe, [poulet, nouilles, c�leri, carottes], 35).
plat(soupe_legumes, sale, soupe, [l�gumes_vari�s, bouillon, herbes], 20).
plat(soupe_haricots, sale, soupe, [haricots, oignon, tomates, �pices], 40).
plat(soupe_courgette, sale, soupe, [courgettes, pommes_de_terre, oignon, cr�me], 30).
plat(ratatouille, sale, plat_principal, [aubergine, courgette, poivron, tomate, oignon], 45).
plat(tiramisu, sucre, dessert, [biscuits, caf�, mascarpone, cacao], 45).
plat(mousse_chocolat, sucre, dessert, [chocolat, oeufs, sucre], 20).
plat(gateau_aux_pommes, sucre, gateau, [pommes, farine, sucre, beurre], 40).
plat(pizza, sale, plat_principal, [p�te, tomate, fromage, olive, champignons], 35).
plat(burger, sale, plat_principal, [pain, steak, fromage, salade, tomate, oignon], 25).
plat(creme_brulee, sucre, dessert, [cr�me, sucre], 30).
plat(tarte_aux_fraises, sucre, dessert, [p�te, fraises, cr�me_p�tissi�re], 40).
plat(poulet_curry, sale, plat_principal, [poulet, riz, curry, l�gumes], 40).
plat(cheesecake, sucre, gateau, [biscuits, fromage_frais, sucre, beurre], 50).
plat(poisson_grille, sale, plat_principal, [poisson, citron, herbes, l�gumes], 30).
plat(pates_carbonara, sale, plat_principal, [p�tes, pancetta, oeufs, cr�me, parmesan], 25).
plat(glace_vanille, sucre, dessert, [lait, cr�me, sucre, vanille], 15).
plat(sushi, sale, plat_principal, [riz, poisson_cru, algue], 50).
plat(tarte_aux_pommes, sucre, dessert, [p�te, pommes, cannelle, sucre], 35).
plat(panna_cotta, sucre, dessert, [cr�me, sucre, g�latine], 25).
plat(mille_feuille, sucre, dessert, [p�te_feuillet�e, cr�me_p�tissi�re, sucre_glace], 30).
plat(gateau_chocolat, sucre, gateau, [chocolat, farine, sucre, �ufs], 40).
plat(gateau_citron, sucre, gateau, [citron, farine, sucre, �ufs], 35).
plat(gateau_carotte, sucre, gateau, [carottes, farine, sucre, �ufs], 45).
plat(gateau_coco, sucre, gateau, [coco_r�p�, farine, sucre, �ufs], 50).
plat(gateau_moka, sucre, gateau, [caf�, farine, sucre, �ufs], 40).
plat(gateau_fraise, sucre, gateau, [fraises, farine, sucre, �ufs], 30).

% R�gle pour filtrer les plats en fonction du type et du sous-type pour les plats sal�s
plat_inferieur_a_temps_sous_type(Type, SousType, Time, Plat) :-
    plat(Plat, Type, SousType, _, Duree),
    Duree =< Time.

find_plats_sous_type(Type, SousType, Time, Plats) :-
    findall(Plat, plat_inferieur_a_temps_sous_type(Type, SousType, Time, Plat), Plats).

% Afficher les sous-types disponibles pour chaque type de plat
display_sous_types(sale) :-
    writeln('Sous-types disponibles pour les plats sal�s :'),
    writeln('- salade'),
    writeln('- soupe'),
    writeln('- plat_principal').
display_sous_types(sucre) :-
    writeln('Sous-types disponibles pour les plats sucr�s :'),
    writeln('- dessert'),
    writeln('- g�teau').

% R�gle pour afficher les plats
display_plats(Plats) :-
    forall(member(Plat, Plats),
           writeln(Plat)).

% R�gle pour afficher les ingr�dients d'un plat s�lectionn�
afficher_ingredients(Plat) :-
    plat(Plat, _, _, Ingredients, _),
    writeln('Ingr�dients du plat : '),
    display_ingredients(Ingredients).

% R�gle pour afficher les �l�ments de la liste des ingr�dients
display_ingredients(Ingredients) :-
    forall(member(Ingredient, Ingredients),
           writeln(Ingredient)).

% ...

search_recipe :-
    writeln('S�lecteur de Plats'),
    writeln('Type de plat (sale ou sucre) : '),
    read_line_to_string(user_input, TypeString),
    atom_string(TypeAtom, TypeString),
    writeln('Choisissez le sous-type de plat : '),
    display_sous_types(TypeAtom),
    read_line_to_string(user_input, SousTypeString),
    atom_string(SousTypeAtom, SousTypeString),
    writeln('Temps de pr�paration (en minutes) : '),
    read_line_to_string(user_input, TimeString),
    atom_number(TimeString, TimeNum),
    writeln('La liste des plats est : '),
    find_plats_sous_type(TypeAtom, SousTypeAtom, TimeNum, Plats),
    display_plats(Plats),
    writeln('Choisissez un plat pour afficher les ingr�dients : '),
    read_line_to_string(user_input, SelectedPlatString),
    atom_string(SelectedPlat, SelectedPlatString),  % Convertir en atome
    afficher_ingredients(SelectedPlat),  % Afficher les ingr�dients du plat s�lectionn�
    writeln('Si vous souhaitez rechoisir le plat, tapez "true".'),
    read_line_to_string(user_input, ResponseString),
    atom_string(ResponseAtom, ResponseString),  % Convertir en atome
    (ResponseAtom == true ->
        search_recipe
    ;   writeln('Fin du programme.')
    ).

