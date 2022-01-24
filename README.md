# Flix Class Wrapper Generator
blah blah blah
Imports in Flix are annoying.
They mess up purity,
require try-catches,
introduce nulls,
and cannot be used at the top level of namespaces,
instead cluttering function definitions.

These issues can be partially addressed by creating Flix wrapper functions around the Java methods,
but this quickly becomes tedious for large classes.

`fcwg` is a tool for automatically creating a collection of Flix functions that wrap the methods and fields of a Java class.
It is not intended to be a solution for blindly creating a sound interface with Java,
but rather to serve as a decent starting point,
reducing a great deal of boilerplate to a relatively easy refactoring job.

## Features
* Create a getter and setter for every field, and a function for every method in a Java class
* Wrap nullable return types in Option types
* Wrap exceptions in Result types
* Cast functions to Pure

## Usage
```
Usage: fcwg [OPTIONS] <class file>
  -g              --generic                Wraps generic types in Generic
  -h              --help                   Prints this help information and exits.
  -i              --interactive            Launches interactive mode.
  -n <namespace>  --namespace=<namespace>  Sets the namespace. Uses the class's namespace by default.
  -o              --option                 Once: Returns Option for functions returning reference types. Twice: Returns Option for all functions.
  -p              --pure                   Once: Casts getters for final fields to Pure. Twice: Casts all functions but those returning Unit. Thrice: Casts all functions.
  -r              --result                 Once: Returns Result for methods with checked exceptions. Twice: Returns Result for all methods.
  -s              --super                  Once: Includes super class declarations, excluding Object. Twice: Includes Object.
  -v              --version                Prints the version string and exits.
```
