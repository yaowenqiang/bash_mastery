> chsh -s /bin/bash
> chmod 744 our_first_script

> permissions-calculator.org

Three types of shell parameters

+ Variables
+ Positional parameters
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

### change all letters

> ${name,,}

## change variable to uppercase

### change first letter (capital letter)
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

## Arithmetic expansion (算术扩展)

> $((expression))



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



> Token: a sequence of characters that is considered as a single unit by the shell

> Word: a token that does not contain an unquoted Metacharacter
> Operator: a token that contains at least one unquoted metacharacter

The difference between words and operators: words never contain unquoted metacharacters, operators always contain unquoted metacharacters



### Metacharacters:

+ !
+ &
+ ;
+ ()
+ <>
+ space, tab and newline


Simple commands: are just a bunch of individual words, and each simple command is terminated by a control operator

Compound commands: on the other hand, provide bash with its programming constructs, such as if statements,for loops, while loops, etc



## Quoting

Quoting is about Removing Special Meanings

Three Types of Quoting

+ Backslash (\):
  + Removes special meaning from next character
+ Single Quotes (')
  + Removes special meaning from all characters inside
+ Double Quotes (")
  + Removes special meaning from all except dollar signs ($) and backticks (`)

> echo jon & jane # error
> echo jon \& jane

filepath=c:\Users\ziyad\Documents
echo $filepath


filepath=c:\\Users\\ziyad\\Documents
echo $filepath

filepath='c:\Users\ziyad\Documents'
echo $filepath

filepath='c:\Users\$USER\Documents'

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


Redirection operators

+ <
+ >
+ <<
+ >>
+ <&
+ >|
+ <<-
+ <>
+ >&



Control operators + Redirection operators only matter if they are unquoted

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
  + Parameter expansion
  + Arithmetic expansion
  + Command substitution
  + Tilde expansion
+ Stage 3: Word Splitting
+ Stage 4: globbing


The first thing you need to know is that expansion in earlier stages are performed first.

The second thing you need to know is that expansions that are in the same stage are all given the same priority, and are simply performed in the order they are found on the command line when it is read from left to right.

> echo $name has $(( 1 + 2 )) apples

> echo $name has {1..3} apples and $(( 5 + 2 )) oranges

## step 3 : Word splitting


word splitting is a process the shell performs to split the result of some unquoted expansions into separate words

Word splitting can have some very significant effects on how your command lines are interpreted

word splitting is only performed on the results of unquoted

+ Parameter expansion
+ Command substitution
+ Arithmetic expansions

The characters used to split words are governed by the IFS (Internal Field Separator) variable

+ Space
+ tab
+ new line

> echo  "${IFS@Q}" # can print out the IFS

> numbers="1 2 3 4 5"
> touch $numbers

> touch "$numbers"

> IFS=","



to be considered as a single word:

wrap that expansion in double quote!

command substitution to be considered as a single word on the command line, maybe you want the output to be considered as just one argument to a command

## Globbing

Globbing Introduction

+ Originates from the 'glob' program present in early versions of Bell Lab's unix operation system from 1969 - 1975
+ Globbing is used as a shortcut for listing the files that a command should operate on
+ Globbing is only performed on words (not operators)
+ Globbing Patterns are words that contain unquoted Special Pattern Characters:
  + *
  + ?
  + [



> ls [ab].txt
> ls file[abc][abc][abc].txt
> ls file[a-g].txt
> ls file[0-9].txt
> rm ~/download/*.jpg

## Step 4: Quote Removal

3 Types of quotes

+ Backslashes: \
+ single quotes: ''
+ Double quotes: ""


During quote removal, the shell removes all unquoted backslashes, single quote characters, and double quote characters that did NOT result from a shell expansion.

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

Standard output contains the data that is produced after a successful command execution

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

identify Unquoted Metacharacters

Step 2: Command Identification-
Step 3: expansions
Stage 1: Brace expansion
Stage 2:

+ Parameter expansions
+ Arithmetic expansions
+ Command Substitution
+ tilde expansions

Stage 3: Word splitting
Stage 4: globbing (aka Filename expansion)
Step 4: quote removal
Step 5: Redirections



> echo "$(ls *.txt)"

## Special parameters

+ Parameter that bash gives special meaning
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
> read -s # read secretly, dont show user input in the terminal

## List

when you input one or more commands on a given line

### list Operators

types of control operators that enable us to create lists of commands that operate in different ways


list Operators

+ &
+ ;
+ &&
+ ||

The && operator makes it so that the second command only runs if the first one was successful


## The test commands


if a test is evaluated to be true, the test will return an exit status of 0

### Test commands

a command that can be used in bash to compare different pieces of information


#### Integer test operators

> [ 2 -eq 2 ] ; echo $?
> [ 2 -ne 2 ] ; echo $?
> [ 2 -gt 2 ] ; echo $?
> [ 2 -lt 2 ] ; echo $?
> [ 2 -ge 2 ] ; echo $?
> [ 2 -le 2 ] ; echo $?

#### String test operators

> [[ $a = $b ]]; echo $?
> [[ -z $c ]]; echo $? # match empty string
> [[ -n $c ]]; echo $? # match non-empty string

#### File test operators compare files

> [[ -e filename ]]; print $?  # test file exists
> [[ -f filename ]]; print $?  # test is a file
> [[ -d filename ]]; print $?  # test is a directory
> [[ -x filename ]]; print $?  # test is execution

> -r -w -nt
> [[ -r filename ]]; echo $?  # test is readable
> [[ -w filename ]]; echo $?  # test is writable
> [[ file1 -nt file2 ]]; echo $?  # test file1 is newer than file2


## If statements

## Case statements


case statements start and end using the reserved words 'case' and 'esac'

## While loop

While loops run a set of commands while a certain condition is true


## Getopts command

## Read-while loop

## Arrays

### Indexed arrays


```bash
numbers = (1 2 3 4)
echo ${numbers[0]}
echo ${numbers[2]} # 3
echo ${numbers[@]} # print all elements

echo ${numbers[@]} # print all elements
echo ${numbers[@]:1} # array slice start from 1
echo ${numbers[@]:1:2} # array slice start from 1
numbers+=(5)
unset numbers[index]
echo ${!numbers[@]}
numbers[0]=a

```
### readarray command

```bash
readarray -t days < days.txt

echo ${days[@]@Q}

touch file{001..100}.txt

readarray files < <(ls)
```

## For loop

A for loop iterators over a list of words or elements and performs a set of commands 'for' each element


## Debugging

### shellcheck

> www.shellcheck.net
> sudo apt install shellcheck
> shellcheck yourscript



### how to find help

+ man
+ help
+ info
+ type

> type -a cd


> help cd

> help -s cd
> help -d cd

> help

> help help

> man ls

> man cd

> man -k compress
> man -k "list directory contents"
> man -K "list directory contents"

> man man

> info ls


> info






Internal commands are commands that are built into the bash shell
External commands are commands that are external to bash



## scheduling and automation


> apt install at
> service atd status
> sudo service atd stop/start/restart
> at 9:30am <Enter>

> at> echo "hello world"
> ctrl + D to exit
> at -l # list jobs
> at -r jobid
> at 9:00am -f script_path
> at 9am monday -f script_path
> at 9am 12/23/2026 -f script_path
> at 9am 23.12.2026 -f script_path
> at 9am tomorrow -f script_path
> at 9am next week -f script_path
> at now + 5 minutes -f script_path
> at now + 2 days -f script_path

### cron

> service cron status
> service cron start

> crontab -e

> * * * * *
> minute hour day month week command
> 分钟 小时 日期 月份 星期 要执行的命令

🔣 特殊字符说明
* (星号): 代表该字段的所有可能值，即“每”。
例如，在“小时”字段使用 *，表示“每小时”。
, (逗号): 用于分隔多个不连续的值。
例如，1,3,5 在“分钟”字段表示第 1、3、5 分钟。
- (连字符): 用于定义一个连续的取值范围。
例如，1-5 在“星期”字段表示从周一到周五。
/ (斜杠): 用于指定步长，即“每...一次”。
例如，*/15 在“分钟”字段表示“每 15 分钟”。

> * * * JAN

> man 4 crontabs

> crontab.guru



