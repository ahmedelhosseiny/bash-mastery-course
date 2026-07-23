# Module 3.1: Shell Variables and Environment Variables

## Introduction

Variables are fundamental to any programming or scripting language, and Bash is no exception. They allow you to store data, such as text strings or numbers, and refer to them by a name. This module will cover how to define, assign, and access variables, and distinguish between shell variables and environment variables.

## Shell Variables

Shell variables are specific to the current shell session. They are used to store temporary data that can be accessed and modified within that session.

### Defining and Assigning Variables

To define a variable, you simply assign a value to a name. There should be no spaces around the `=` sign.

```bash
my_variable="Hello Bash"
another_variable=123
```

**Rules for Variable Names:**

*   Can contain alphanumeric characters (`a-z`, `A-Z`, `0-9`) and underscores (`_`).
*   Cannot start with a number.
*   Are case-sensitive (`my_variable` is different from `My_Variable`).

### Accessing Variable Values

To access the value of a variable, prefix its name with a dollar sign (`$`). It's good practice to enclose the variable name in curly braces (`{}`) to avoid ambiguity, especially when concatenating with other strings.

```bash
my_variable="Hello Bash"
echo $my_variable
echo "The value is: ${my_variable}"

# Without braces, it might be ambiguous
# echo "The value is: $my_variable_suffix" # Bash might look for my_variable_suffix
echo "The value is: ${my_variable}_suffix" # Clearly my_variable followed by _suffix
```

### Modifying Variables

You can reassign values to variables at any time.

```bash
my_variable="Hello Bash"
echo $my_variable

my_variable="New Value"
echo $my_variable
```

### Unsetting Variables

To remove a variable from the shell's memory, use the `unset` command.

```bash
my_variable="Some Value"
echo $my_variable
unset my_variable
echo $my_variable # This will print an empty line
```

## Environment Variables

Environment variables are a special type of shell variable that are inherited by child processes. This means that any program or script launched from your current shell will have access to these variables. They are crucial for configuring the environment for applications and the operating system itself.

### Exporting Variables (`export`) [1]

To make a shell variable an environment variable, you use the `export` command.

```bash
my_env_variable="This is an environment variable"
export my_env_variable

# Now, any child process can access it
# bash -c 'echo $my_env_variable' # This would print 
