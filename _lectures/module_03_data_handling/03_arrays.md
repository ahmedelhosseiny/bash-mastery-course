# Module 3.3: Arrays

## Introduction

Arrays in Bash allow you to store multiple values in a single variable. This is incredibly useful for managing lists of items, such as filenames, user lists, or configuration options. Bash supports both indexed arrays (where elements are accessed by numerical index) and associative arrays (where elements are accessed by string keys).

## Indexed Arrays

Indexed arrays are the most common type of array in Bash. Elements are stored and retrieved using a numerical index, starting from 0.

### Declaring Indexed Arrays

You don't strictly need to declare an indexed array before using it, but it's good practice. You can declare an array using `declare -a`.

```bash
declare -a my_array
```

### Assigning Values to Indexed Arrays

There are several ways to assign values to indexed arrays:

1.  **Direct assignment to individual elements:**
    ```bash
    my_array[0]="apple"
    my_array[1]="banana"
    my_array[2]="cherry"
    ```

2.  **Assigning a list of values:**
    ```bash
    fruits=("apple" "banana" "cherry" "date")
    ```

3.  **Adding elements:**
    ```bash
    fruits+=( "elderberry" )
    ```

### Accessing Indexed Array Elements

To access an element, use the syntax `${array_name[index]}`.

*   **Accessing a specific element:**
    ```bash
    echo ${fruits[0]} # Output: apple
    echo ${fruits[2]} # Output: cherry
    ```

*   **Accessing all elements:**
    *   `${array_name[@]}`: Expands to all elements, each as a separate word. This is generally preferred for iterating over elements.
    *   `${array_name[*]}`: Expands to all elements as a single word.

    ```bash
    echo "All fruits: ${fruits[@]}"
    # Output: All fruits: apple banana cherry date elderberry

    echo "All fruits (single word): ${fruits[*]}"
    # Output: All fruits (single word): apple banana cherry date elderberry
    ```

*   **Getting the number of elements:**
    ```bash
    echo "Number of fruits: ${#fruits[@]}"
    # Output: Number of fruits: 5
    ```

*   **Getting the length of a specific element:**
    ```bash
    echo "Length of first fruit: ${#fruits[0]}"
    # Output: Length of first fruit: 5
    ```

### Iterating Over Indexed Arrays

You can iterate over array elements using `for` loops.

```bash
for fruit in "${fruits[@]}"; do
    echo "I like $fruit"
done

# Or using indices
for i in "$(seq 0 $(( ${#fruits[@]} - 1 )))"; do
    echo "Fruit at index $i is ${fruits[$i]}"
done
```

### Deleting Indexed Array Elements

Use `unset` to remove elements or the entire array.

*   **Delete a specific element:**
    ```bash
    unset fruits[1] # Deletes 'banana'
    echo "After deleting index 1: ${fruits[@]}"
    # Output: After deleting index 1: apple cherry date elderberry
    ```

*   **Delete the entire array:**
    ```bash
    unset fruits
    echo "After unsetting array: ${fruits[@]}"
    # Output: (empty line)
    ```

## Associative Arrays

Associative arrays (also known as hash maps or dictionaries) allow you to store and retrieve values using arbitrary strings as keys, rather than numerical indices. They are available in Bash 4.0 and later.

### Declaring Associative Arrays

You **must** declare an associative array using `declare -A` before using it.

```bash
declare -A capitals
```

### Assigning Values to Associative Arrays

Assign values using the syntax `array_name[key]=value`.

```bash
capitals["USA"]="Washington D.C."
capitals["France"]="Paris"
capitals["Japan"]="Tokyo"
```

### Accessing Associative Array Elements

To access an element, use the syntax `${array_name[key]}`.

*   **Accessing a specific element:**
    ```bash
    echo "Capital of France: ${capitals["France"]}"
    # Output: Capital of France: Paris
    ```

*   **Accessing all values:**
    ```bash
    echo "All capitals: ${capitals[@]}"
    # Output: All capitals: Washington D.C. Paris Tokyo (order may vary)
    ```

*   **Accessing all keys:**
    ```bash
    echo "All countries: ${!capitals[@]}"
    # Output: All countries: USA France Japan (order may vary)
    ```

*   **Getting the number of elements:**
    ```bash
    echo "Number of countries: ${#capitals[@]}"
    # Output: Number of countries: 3
    ```

### Iterating Over Associative Arrays

You can iterate over keys and values using `for` loops.

```bash
for country in "${!capitals[@]}"; do
    echo "The capital of $country is ${capitals[$country]}"
done
```

### Deleting Associative Array Elements

Use `unset` to remove elements or the entire array.

*   **Delete a specific element:**
    ```bash
    unset capitals["USA"]
    echo "After deleting USA: ${!capitals[@]}"
    # Output: After deleting USA: France Japan
    ```

*   **Delete the entire array:**
    ```bash
    unset capitals
    echo "After unsetting array: ${capitals[@]}"
    # Output: (empty line)
    ```

## When to Use Arrays

*   **Indexed Arrays**: Ideal for ordered lists of items where the order matters or when you need to access elements by their numerical position. Useful for processing lists of files, command-line arguments, or log entries.
*   **Associative Arrays**: Perfect for storing key-value pairs where you need to look up values based on a descriptive name (key). Useful for configuration settings, mapping data, or counting occurrences of items.

## References
[1] [Bash Manual Page (bash.txt)](file:///home/ahmedelhosseiny/Documents/Reports/bash.txt)
