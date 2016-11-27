# Scratch
Scratch is a simple stack-based programming language implemented in ruby.

It is the ruby implementation of the language in [this tutorial](http://scratch-lang.notimetoplay.org/), originally in javascript.

[![Build Status](https://travis-ci.org/Martin-Nyaga/scratch.svg?branch=master)](https://travis-ci.org/Martin-Nyaga/scratch)

### Hello World in Scratch
```
Scratch REPL
Press CTRL+C to exit

Scratch::ba0900> " Hello World! " print
Hello World!
```

# Usage

## Interactive Mode

You can run the scratch REPL by running `bin/repl` in the folder where
you've cloned the repo. For windows, you might want to do `ruby bin/repl`.

The REPL aslo has a debug mode, which you can use by running:
```
DEBUG=true bin/repl
```

## Language Features

Scratch is a stack based language. The language uses a stack to store data
and runs operations on data from the stack.

At any moment you can print the stack using `pstack`.
All commands are case insensitive.

### Adding items onto the stack

You can add numbers to the stack simply by entering the number and hitting
enter. You can add several numbers seperated by a space.

```
Scratch:89sno9> 1
Scratch:89sno9> pstack
1
Scratch:89sno9> 2 3 5 2 90
Scratch:89sno9> pstack
1 ; 2 ; 3 ; 5 ; 2 ; 90
```

### Stack manipulation

There are several commands to manipulate the stack as shown below:

| Command | Description|
| ------------- |--------|
| `pstack` | Print the stack. |
| `print` | Print the top item in the stack. This drops the item from the stack. |
| `dup` | Duplicate the top item in the stack. |
| `swap` | Swap the top 2 items in the stack. |
| `drop` | Remove the top item in the stack. |
| `dropstack` | Clear the stack. |

You can mix and match commands and run them as a single command. Scratch executes one word at a time.

```
Scratch:89sno9> 19
Scratch:89sno9> print
19
Scratch:89sno9> pstack

Scratch:89sno9> 19
Scratch:89sno9> dup pstack
19 ; 19
Scratch:89sno9> dropstack
Scratch:89sno9> pstack

Scratch:89sno9> 19 dup dup drop 12 swap pstack
19 ; 12 ; 19
Scratch:89sno9> dropstack print
== Error: This command requres at least 1 item on the stack
```

### Simple Math

The scratch standard library has the simple arithmetic operators `+`, `-`, `*`, `&` and `sqrt`.
These operate on the top 2 items in the stack (with the exception of `sqrt` which operates on
the top item only).

Each of these commmands removes those items from the stack and places the result at the top of the stack.

```
Scratch:89sno9> 2 3 + print
5
Scratch:89sno9> pstack

Scratch:89sno9> 2 3 *
Scratch:89sno9> pstack
6
# Twenty Divided by five, then take the quotient, plus three #
Scratch:89sno9> 20 5 / 3 + print
7
```

### Strings & Comments
Strings in scratch are loaded onto the stack by typing them surrounded in double quotes. The double quotes must be spaced out i.e.`" Hello World "` and not `"Hello World"`. This will load the string on to the stack.

```
Scratch:89sno9> " Hello World "
Scratch:89sno9> pstack
Hello World
Scratch:89sno9> " Foo Bar " pstack
Hello World ; Foo Bar
```
Comments work the same way as strings except they use the '#' character and don't modify the stack.
```
Scratch:89sno9> # This is a comment #
Scratch:89sno9>
```

### Variables

You declare variables in scratch using the `var` keyword. Variables must be declared before they are used.

```
Scratch:89sno9> var a
```

You can then assign a value to the variable using the `assign` keyword which expects the stack to contain
the value, followed by the variable name.

```
# Assigns the value 10 to a #
Scratch:89sno9> 10 a assign
```

Finally, you can fetch and use variable values by using the `fetch` keyword, which will push the variable's
value on to the stack.

```
# Pushes the value assigned to a on the stack #
Scratch:89sno9> a fetch
```

A more complex example of using variables to do some math:

```
# declare a variable length, width and hypot #
> var length
> var width
> var hypot

# assign length and width #
> 3 length assign
> 4 width assign

# fetch length and width to do math. #
# This will push 3 and 4 on the stack. #
> length fetch width fetch

# calculate hypotenuse using algorithm. #
# This should calculate 5, push it on the #
# stack and then finally assign it to hypot, #
# and clear the stack. #
> dup * swap dup * + sqrt hypot assign

# fetch and print the hypotenuse #
> hypot fetch print
```

# Testing

Clone this repository and run `rake`.

# API Documentation

Clone this repository and run `yardoc` and `yard server` to open full
API documentation. Make sure you have Yard installed.

