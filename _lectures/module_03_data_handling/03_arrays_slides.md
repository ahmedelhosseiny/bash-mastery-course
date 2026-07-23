# Module 3.3: Arrays - Presentation Outline

## Slide 1: Title Slide
*   **Title**: Arrays
*   **Subtitle**: Storing Multiple Values in Bash
*   **Course**: Bash Scripting Mastery Course
*   **Module**: 3.3

## Slide 2: Introduction to Arrays
*   Store multiple values in a single variable.
*   Useful for managing lists (filenames, users, config options).
*   Bash supports:
    *   **Indexed Arrays**: Numerical index.
    *   **Associative Arrays**: String keys.

## Slide 3: Indexed Arrays
*   Most common type.
*   Elements accessed by numerical index, starting from 0.
*   **Declaring**: `declare -a my_array` (good practice).
*   **Assigning Values**:
    *   Individual: `my_array[0]="apple"`
    *   List: `fruits=("apple" "banana" "cherry")`
    *   Adding: `fruits+=( "date" )`

## Slide 4: Accessing Indexed Array Elements
*   **Specific element**: `${array_name[index]}`
    *   Example: `echo ${fruits[0]}`
*   **All elements**: `${array_name[@]}` (separate words) or `${array_name[*]}` (single word).
    *   Example: `echo "All: ${fruits[@]}"`
*   **Number of elements**: `${#array_name[@]}`
    *   Example: `echo "Count: ${#fruits[@]}"`
*   **Length of element**: `${#array_name[index]}`
    *   Example: `echo "Length: ${#fruits[0]}"`

## Slide 5: Iterating and Deleting Indexed Array Elements
*   **Iterating**:
    ```bash
    for fruit in "${fruits[@]}"; do
        echo "I like $fruit"
    done
    ```
*   **Deleting Elements**: `unset array_name[index]`
    *   Example: `unset fruits[1]`
*   **Deleting Entire Array**: `unset array_name`
    *   Example: `unset fruits`

## Slide 6: Associative Arrays
*   Also known as hash maps or dictionaries.
*   Store/retrieve values using arbitrary string keys.
*   Available in Bash 4.0+.
*   **Must Declare**: `declare -A capitals`
*   **Assigning Values**: `capitals["USA"]="Washington D.C."`

## Slide 7: Accessing Associative Array Elements
*   **Specific element**: `${array_name[key]}`
    *   Example: `echo ${capitals["France"]}`
*   **All values**: `${array_name[@]}`
    *   Example: `echo "All capitals: ${capitals[@]}"`
*   **All keys**: `${!array_name[@]}`
    *   Example: `echo "All countries: ${!capitals[@]}"`
*   **Number of elements**: `${#array_name[@]}`
    *   Example: `echo "Count: ${#capitals[@]}"`

## Slide 8: Iterating and Deleting Associative Array Elements
*   **Iterating**:
    ```bash
    for country in "${!capitals[@]}"; do
        echo "Capital of $country is ${capitals[$country]}"
    done
    ```
*   **Deleting Elements**: `unset array_name[key]`
    *   Example: `unset capitals["USA"]`
*   **Deleting Entire Array**: `unset array_name`
    *   Example: `unset capitals`

## Slide 9: When to Use Arrays
*   **Indexed Arrays**: Ordered lists, numerical access.
    *   Processing file lists, command-line arguments.
*   **Associative Arrays**: Key-value pairs, descriptive string keys.
    *   Configuration settings, data mapping, counting.

## Slide 10: Conclusion
*   Arrays provide structured data storage in Bash.
*   Indexed arrays for ordered lists, associative for key-value pairs.
*   Proper declaration, assignment, access, and iteration are key.
*   Next: Parameter Expansion.

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
