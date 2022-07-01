There are 3 files in the Repository depicting the main code in Hangman.pl and the collection of words in words.txt
If you want to add a new word in the database containing all the words add it in the sample array in Hangman.pl

Now how to run the Program:
A. Open the terminal in the directory 2020CSB1073 and Enter the command perl Hangman.pl to run the program.
B. When it is asked by the program to make a guess, you have to guess only one letter.
C. In case multiple letters are entered, only the first letter is considered and others stripped off automatically.
D. Carefully read all the messages displayed by the program and input according to it.
E. When asked for another game enter y/Y for another game and n/N character for exiting it.

To tell how the Input should be in the Program 
The Input is taken by the function guess in the class HangMan :

- Input is expected to be a single aphanumeric character.
- If it is not a single character and a lot of characters then the first letter is only considered and all others stripped off.
- If the entered first character is a blank space or new line then the error is displayed.

After every guess the guessed word is updated or the chances decreased using update function :

- If the guessed letter is already guessed then the message is displayed that it has already been guessed and function returns from there.
- If not already guessed then it is pushed in the array @guesses and is checked whether it is present in the word or not.
- If the letter is present in word then it is a correct guess and is updated in @guessed_word and count of correct guesses ($guesses_made) is increased by 1.
- Otherwise if it is not present in word then it is an incorrect guess and chances left ($guesses_left) is decreased by 1. It can be shown by the Hangman being created.
- If the count of correct guesses become equal to size of word that means user has won and has guessed the word.
- If the chances left are 0 that means the user has lost all the chances (HangMan is completed) and didn't guess the word correct and hence lost the game.
