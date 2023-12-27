# Prolog Recipe Selector

This Prolog program allows users to search for recipes based on the type, subtype, and preparation time of a dish.

## Getting Started

### Prerequisites

Make sure you have a Prolog interpreter installed on your machine. You can download and install SWI-Prolog from [https://www.swi-prolog.org/Download.html](https://www.swi-prolog.org/Download.html).

### Compiling and Running the Program

1. Open your Prolog interpreter.
2. Load the program by consulting the source file. In the Prolog interpreter, type:

    ```prolog
    [recipeSelector].
    ```

3. Run the program by executing the `search_recipe` rule:

    ```prolog
    search_recipe.
    ```

4. Follow the prompts to input the type, subtype, and preparation time. The program will display a list of matching recipes.

## Usage

1. When prompted for the type of dish, enter either "sale" for savory dishes or "sucre" for sweet dishes.

2. Choose the subtype based on the type selected. For example, if the type is "sale," you can choose from "salade," "soupe," or "plat_principal."

3. Enter the maximum preparation time in minutes.

4. The program will display a list of recipes that match the criteria.

5. Choose a recipe from the list to display its ingredients.

6. If you want to choose another recipe, enter "true" when prompted. Otherwise, the program will terminate.

