Prolog Recipe Selector
This Prolog program allows users to search for recipes based on the type, subtype, and preparation time of a dish.

Getting Started
Prerequisites
Make sure you have a Prolog interpreter installed on your machine. You can download and install SWI-Prolog from https://www.swi-prolog.org/Download.html.

Compiling and Running the Program
Open your Prolog interpreter.

Load the program by consulting the source file. In the Prolog interpreter, type:

prolog
Copy code
recipeSelector. 
Run the program by executing the search_recipe rule:

prolog
Copy code
search_recipe.
Follow the prompts to input the type, subtype, and preparation time. The program will display a list of matching recipes.

Usage
When prompted for the type of dish, enter either "sale" for savory dishes or "sucre" for sweet dishes.

Choose the subtype based on the type selected. For example, if the type is "sale," you can choose from "salade," "soupe," or "plat_principal."

Enter the maximum preparation time in minutes.

The program will display a list of recipes that match the criteria.

Choose a recipe from the list to display its ingredients.

If you want to choose another recipe, enter "true" when prompted. Otherwise, the program will terminate.

Example
prolog
Copy code
% Type of dish: sale
% Subtype: salade
% Preparation time: 20 minutes

?- search_recipe.
Follow the on-screen prompts to interact with the program.
