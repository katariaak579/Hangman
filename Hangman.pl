#!usr/local/bin/perl

@word    = ();
$lenWord = 0;
@guessedword = ();
@guessedletters = ();
$correct    = 0;
$end        = 0;
$totalguess = 6;

@sample = ("computer","radio","calculator","teacher","bureau","police","geometry","president","subject","country","enviroment","classroom","animals","province","month","politics","puzzle","instrument","kitchen","language","vampire","ghost","solution","service","software","virus25","security","phonenumber","expert","website","agreement","support","compatibility","advanced","search","triathlon","immediately","encyclopedia","endurance","distance","nature","history","organization","international","championship","government","popularity","thousand","feature","wetsuit","fitness","legendary","variation","equal","approximately","segment","priority","physics","branche","science","mathematics","lightning","dispersion","accelerator","detector","terminology","design","operation","foundation","application","prediction","reference","measurement","concept","perspective","overview","position","airplane","symmetry","dimension","toxic","algebra","illustration","classic","verification","citation","unusual","resource","analysis","license","comedy","screenplay","production","release","emphasis","director","trademark","vehicle","aircraft","experiment");

sub randomword() { # This sub will choose a random word from the list of words given
    my $word = $sample[ rand($#sample) % ( $#sample + 1 ) ];# Chooses a random number
    my @word = split( '', $word );
    return @word;
}

sub updateword() { # This sub will check if the the huessed word is correct and if correct will update the correct guess in the word
    for ( $i = 0 ; $i <= $#guessedletters ; $i++ ) {
        if ( $guess eq $guessedletters[$i] ) {
            return 0;
        }
    }
    push @guessedletters, $guess;
    my $flag = -1;
    for ( $i = 0 ; $i < $lenWord ; $i++ ) {
        if ( $word[$i] eq $guess ) {
            $guessedword[$i] = $guess;
            $flag = 1;
            $correct++;
        }
    }
    return $flag;
}

sub hangmanDisplay() {
    if ( 6 - $totalguess == 0 ) {
        hangman1Display();
    }
    elsif ( 6 - $totalguess == 1 ) {
        hangman2Display();
    }
    elsif ( 6 - $totalguess == 2 ) {
        hangman3Display();
    }
    elsif ( 6 - $totalguess == 3 ) {
        hangman4Display();
    }
    elsif ( 6 - $totalguess == 4 ) {
        hangman5Display();
    }
    elsif ( 6 - $totalguess == 5 ) {
        hangman6Display();
    }
    elsif ( 6 - $totalguess == 6 ) {
        hangman7Display();
    }
}

# The following sub will display the hangman depending on the number of wrong guesses  

sub hangman1Display {
    print "  -------\n";
    print "  |     |\n";
    print "  |\n";
    print "  |\n";
    print "  |\n";
    print "  |\n";
    print "  |\n";
    print "--|----\n";
}

sub hangman2Display {
    print "  -------\n";
    print "  |     |\n";
    print "  |     o\n";
    print "  |\n";
    print "  |\n";
    print "  |\n";
    print "  |\n";
    print "--|----\n";
}

sub hangman3Display {
    print "  -------\n";
    print "  |     |\n";
    print "  |     o\n";
    print "  |     |\n";
    print "  |\n";
    print "  |\n";
    print "  |\n";
    print "--|----\n";
}

sub hangman4Display {
    print "  -------\n";
    print "  |     |\n";
    print "  |     o\n";
    print "  |    \\|\n";
    print "  |\n";
    print "  |\n";
    print "  |\n";
    print "--|----\n";
}

sub hangman5Display {
    print "  -------\n";
    print "  |     |\n";
    print "  |     o\n";
    print "  |    \\|/\n";
    print "  |\n";
    print "  |\n";
    print "  |\n";
    print "--|----\n";
}

sub hangman6Display {
    print "  -------\n";
    print "  |     |\n";
    print "  |     o\n";
    print "  |    \\|/\n";
    print "  |    /\n";
    print "  |\n";
    print "  |\n";
    print "--|----\n";
}

sub hangman7Display {
    print "  -------\n";
    print "  |     |\n";
    print "  |     x\n";
    print "  |    \\|/\n";
    print "  |    / \\\n";
    print "  |\n";
    print "  |\n";
    print "--|----\n";
    print "You lost!\n";
}

sub input() {
    $flag = 0;
    while ( $flag == 0 ) {
        hangmanDisplay();
        print "Guessed Word : @guessedword\n";
        print "Guesses So Far : @guessedletters\n";
        print "Make a Guess : ";
        $guess = <STDIN>;
        $guess = lc substr( $guess, 0, 1 );
        if ( $guess eq "\n" || $guess eq " " ) {
            print "Invalid Input ! Input should be a single alpha-numeric character\n";
        }
        else {
            $flag = 1;
        }
        print "\n";
    }
}

sub Play() {
    @word    = randomword();
    $lenWord = $#word + 1;
    print "@word\n";
    @guessedword = ();
    for ( $i = 0 ; $i <= $#word ; $i++ ) {
        push @guessedword, '_';
    }
    @guessedletters = ();
    $correct    = 0;
    $end        = 0;
    $totalguess = 6;
    while ( $end == 0 ) {  #while condition to check if there are chances left that is if the user has not lost the game 
        input();
        $case = updateword();
        if ( $case eq 0 ) { # if you guess a same guess as before 
            print "Already guessed. Try a different guess\n";
        }
        elsif ( $case eq -1 ) { # if you guess a wrong guess it is stored in the wrong guess array and hangman updates 
            print "Wrong Guess !\n\n";
            $totalguess--; #total guesses reduced 
        }
        else {
            print "Correct Guess !\n\n"; 
        }
        if ( $correct == $lenWord || $totalguess == 0 ) {
            $end = 1;
        }
    }
    if ( $totalguess > 0 ) { # If you have chances left and you have guessed the word correct you won 
        print "You have won the game. The word to be guessed was: ";
    }
    else {
        hangmanDisplay(); #lost the game and the hangman will be displayed 
    }
    print @word;
    print "\n-----------\n";
}

sub new_game() { 
    $isCorrect = 0;
    while ( $isCorrect == 0 ) {
        print "If you want to play again press Y to quit N: ";
        $choice = <STDIN>;
        $choice = uc substr( $choice, 0, 1 );
        if ( $choice eq 'N' ) { #If you wanna quit the game 
            $isCorrect = 1;
            return 0;
        }
        elsif ( $choice eq 'Y' ) { #If you want a new game 
            $isCorrect = 1;
            return 1;
        }
        else {
            print "\nUnknown Command! ";
        }
    }
}

$play = 1;

while ( $play == 1 ) {
    Play();
    print "\n";
    $play = new_game();
}