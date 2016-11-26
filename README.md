# Scratch
Scratch is a simple stack-based programming language implemented in ruby.

It is the ruby implementation of the language in [this tutorial](http://scratch-lang.notimetoplay.org/]), originally in javascript.

[![Build Status](https://travis-ci.org/Martin-Nyaga/scratch.svg?branch=master)](https://travis-ci.org/Martin-Nyaga/scratch)

# Usage

## Interactive Mode

You can run the scratch REPL by running `bin/repl` in the folder where
you've cloned the repo. For windows, you might want to do `ruby bin/repl`.

## Language Features

Scratch is a stack based language. The language uses a stack to store data
and runs operations on data from the stack.

At any moment you can print the stack using `pstack`.

### Adding items onto the stack

You can add numbers to the stack simply by entering the number and hitting
enter. You can add several numbers seperated by a space.

```
Scratch:89sno9> 1
Scratch:89sno9> pstack
1
Scratch:89sno9> 2 3 5 2 90
Scratch:89sno9> pstack
1 2 3 5 2 90
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
Scratch:89sno9> pstack
19
Scratch:89sno9> dup dup drop 12 swap pstack
19 12 19
Scratch:89sno9> dropstack print
== Error
```

### Simple Math

The scratch standard library has the simple arithmetic operators `+`, `-`, `*`, `&` and `sqrt`.
These operate on the top 2 items in the stack (with the exception of `sqrt` which operates on
the top item only. It removes those items from the stack and places the result at the top of the stack.

```
Scratch:89sno9> 2 3 + print
5
Scratch:89sno9> pstack

Scratch:89sno9> 2 3 *
Scratch:89sno9> pstack
6
Scratch:89sno9> 20 5 / 3 + print
7
(Twenty Divided by five, then take the quotient, plus three)
```

# Testing

Clone this repository and run `rake`.

# API Documentation

Clone this repository and run `yardoc` and `yard server` to open full
API documentation. Make sure you have Yard installed.

