> chsh -s /bin/bash
> chmod 744 our_first_script

> permissions-calculator.org

Three types of shell parameters

+ Variables
+ Positonal parameters
+ Special parameters


shell variables (environment variables)

+ Bourne Shell Variable(10个)
+ Bash Shell Variables(95个)

+ $PATH
+ $HOME
+ USER
+ HOSTNAME
+ HOSTTYPE

The HOME and USER variables tell you about the user who is logged in

The HOSTNAME variable tell you about the computer they are using

The HOSTTYPE variable tell you what type of processor architecture the computer is running 

the PS1 variable contains the prompt string shown in the terminal before each command

> PS1="$: "

## change variable to lowercase

### change first letter

> ${name,}

### change all leter letters

> ${name,,}

## change variable to uppername


### change first letter(caret letter)
> ${name^}

### change all letters

> ${name^^}

### get variable length

> echo ${#name}

### string slicing


> ${parameter:offset:length}

> ${parameter:offset}

> ${parameter:offset:} # zero

> ${parameter: -3:2} # count fron the end

> ${parameter: -3} # count fron the end


## command substitution

> $(command)

## Arithemetic expansiion(算术扩展)

> $((expresion))



## bc

> echo "5/2" | bc
> echo "scale=2;5/2" | bc

## Tilde expansion(波浪号扩展)

> echo ~

> echo $OLDPWD

> echo ~+ #$PWD
> echo ~- #$OLDPWD

## Brace expansion

> echo {1..9}
> echo {a,19,z,barry,43}

> no space 

> echo {1..10}
> echo {10..1}
> echo {a..z}
> echo {1..10..3} 
> mkdir journal
> cd journal
> echo month{1..12}
> echo month{01..12}
> mkdir month{01..12}
> echo month{01..12}/day{01..31}.txt
> touch month{01..12}/day{01..31}.txt

## How Bash Process Command Lines

+ Step 1: Tokenisation
+ Step 2: Command Identification
+ Step 3: Expansion
+ Step 4: Qoute Removal
+ Step 5: Redirection



> Token: a squence of characters that is considered as a single unit by the shell 

> Word: a token that does not contain an unquoted Metacharacter
> Operator: a token that contains at least one unquoted metacharacter

The difference between words and operators: words never contain unqouted metacharacters, operators always contain unquoted metacharacters



### Metacharacters:

+ !
+ &
+ ;
+ ()
+ <>
+ space, tab and newline


Simple commands: are just a bunch of individual words, and each simple command is terminated by a control operator

Compound commands: on the other hand, provide bash with its programming constructs, such as if statements,for loops, while loops, etc



## Qouting

Qouting is about Removing Special Meanings


Three Types of Qouting

+ Backslash(\):
  + Removes special meaning from next character
+ Single Qoutes(')
  + Removes special meaning from all characters inside
+ Double Qoutes(")
  + Removes special meaning from all except dollar signs($) and backticks(`)

> echo jon & jane # error
> echo jon \& jane

filepath=c:\Users\ziyad\Documents
echo filepath


filepath=c:\\Users\\ziyad\\Documents
echo filepath

filepath=`c:\Users\ziyad\Documents'
echo filepath

filepath=`c:\Users\$USER\Documents'

filepath="c:\Users\$USER\Documents"

filepath="c:\Users\\$USER\Documents"

## Metacharacters and Tokenisation

## Tokenisation


Two Types of Operators


Control operators

+ newline
+ |
+ ||
+ &
+ &&
+ ;
+ ''
+ ``
+ ;;&
+ |&
+ (
+ )


Redirextion operators

+ <
+ >
+ <<
+ >>
+ <&
+ >|
+ <<-
+ <>
+ >&



Control operators + Redirection operators only matter if they are unqouted

> echo $name > out.txt

## Step 2: Command Identification

Types of Commands:

+ Simple commands(most common)
+ Compound Command

+ Compound commands are essentially bash's programming constructs
+ Each Compound starts with a reserved word and is terminated by a corresponding reserve word


```bash
if [[ 2 -gt 1 ]]; then
    echo "hello world"
fi
```

4 Stages of Expansions

+ Stage 1: Brace Expansion
+ Stage 2
  + Parameter expansiion
  + Arithmetic expansiion
  + Command substitution
  + Tilde expansiion
+ Stege 3: Word Splitting
+ Stege 4: globbing


The first thing you need to know is that expansion in earlier stages are performed first.

The second thing you need to know is that expansions that re in the same stage are all given the same priority, and are simply performed in the order they are found on the command line when it is read from left to right.

> echo $name has $(( 1 + 2 )) apples

> echo $name has {1..3} apples and $(( 5 + 2 )) oranges

## step 3 : Word splitting


word splitting is a process the shell performs to split the result of some unqouted expansions into separate words

Word splitting can have some very significant effects on how your command lines are interpreted 

word splitting is only perfomed on the results of unqouted

+ Parameter expansion
+ Command substitution
+ Arithmetic expansions

The characters used to split words are governed by ths IFS(Internal Field Separater) variable

+ Space
+ tab
+ new line

> echo  "${IFS@Q}" # can print out the IFS

> numbers="1 2 3 4 5"
> touch $numbers

> touch "$numbers"

> IFS=","



to be considered as a single word:

wrap that expansion in double qoute!

command substitution to be considered as a single word on the command line, maybe you want the output to be considered as just one argument to a command









