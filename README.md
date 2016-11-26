# Scratch
Scratch is a simple stack-based programming language implemented in ruby.

It is the ruby implementation of the language in [this tutorial](http://scratch-lang.notimetoplay.org/]), originally in javascript.

[![Build Status](https://travis-ci.org/Martin-Nyaga/scratch.svg?branch=master)](https://travis-ci.org/Martin-Nyaga/scratch)

# Usage

### Interactive Mode

You can run the scratch REPL by running `bin/repl` in the folder where
you've cloned the repo. For windows, you might want to do `ruby bin/repl`.

### Language Features

Scratch is a stack based language. The language uses a stack to store data
and runs operations on data from the stack.

At any moment you can print the stack using `pstack`.

#### Adding items onto the stack

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

# Testing

Clone this repository and run `rake`.

# API Documentation

Clone this repository and run `yardoc` and `yard server` to open full
API documentation. Make sure you have Yard installed.

