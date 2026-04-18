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

## Globbing

Globbing Introduction

+ Originates from the 'glob' program present in early versions of Bell Lab's unix operation system from 1969 - 1975
+ Globbing is used as a shortcut fro listing the files that a command should operate one
+ Globbing is only perfomed on words(not operators)
+ Globbing Patterns are words that contain unqouted Special Pattern Characters:
  + *
  + ？
  + 【



> ls [ab].txt
> ls file[abc][abc][abc].txt
> ls file[a-g].txt
> ls file[0-9].txt
> rm ~/download/*.jpg

## Step 4: Qoute Removal

3 Types of qoutes

+ Backslashes: \
+ single qoutes: ''
+ Double qoutes: ""


During qoute removal, the shell removes sll unqouted backslashes,single qoute characters, and double qoute characters that dit NOT result from a shell expansion.

> echo \$HOME
> echo '\$HOME'
> path="c:\Users\Karen\Documents"
> echo $PATH

## Step 5: Redirection

### Data Streams:

+ Stream 0 = Standard input(stdin)
+ Stream 1 = Standard output(stdout)
+ Stream 2 = Standard error(stderr)

#### Standard Input 

Standard input provides us with a alternative way of providing input to a command, aside from using command line arguments

#### Standard Output 

Stdandard output contains the data that is produces after a sussessful command execution

#### Standard Error

Standard error contains all error messages and status messages that a command produces


> cat
> echo "This is some output" > hello.txt
> cd /root 2> error.txt
> cd /root 2>> error.txt
> cd /root &> /dev/null # redirect error and stdout to /dev/null

> cd /root &>> error.txt




echo $name > $out

Step 1: Tokenisation-

identify Unqouted Metacharacters

Step 2: Command Identification-
Step 3: expansions
Stage 1: Brace expansion
Stege 2:

+ Parameter expansions
+ Arithmetic expansions
+ Command Substitution
+ tilde expansions

Stage 3: Word splitting
Stage 4: globbing(aka Filename expansion)
Step 4: qoute removal
Step 5: Redirections



> echo "$(ls *.txt)"

## Special parameters


+ Parameter that bash gives special menaing
+ value of a special parameters is calculated for us based on our current script


> $@
> "$@" prevent word-splitting 
> $* = $@
> "$*"


## read command

> echo $REPLY
> read

> read input1 input2

> read -p # set prompt
> read -t 5 # set read time
> read -s # read secrectly,dont show user input in the terminal

