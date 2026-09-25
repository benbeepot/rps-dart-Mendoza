import "dart:io";

/// Rock Paper Scissor Game with 2 Player Mode
const List<String> RPS = ["rock", "paper", "scissors"]; // This serve as container for the picks for the game


///Main Interface of the Program
void main() {
  print("++++ ROCK | PAPER | SCISSORS ++++");
  
  String player1 = getPlayerName("Player 1");
  String player2 = getPlayerName("Player 2");

  int round = 1;
  int player1Score = 0;
  int player2Score = 0;

  String? RPSExit = "";
  do {
    print("\n++++ ROUND $round ++++");
    String player1Pick = getPick(player1);

    for (int i = 0; i < 30; i++) {
      print("++++++++++++++++++++++++++++++++++");
    }

    String player2Pick = getPick(player2);

    if (player1Pick == player2Pick) {
      print("It's a tie :]");
    } else {
      String? RPSwinner = WhoIsTheWinner(player1, player2, player1Pick, player2Pick);
      if (RPSwinner == player1) {
        print("$player1 wins this round :)");
        player1Score++;
      } else {
        print("$player2 wins this round :)");
        player2Score++;
      }
    }

    print("\n++++ SCOREBOARD ++++");
    print("$player1: $player1Score");
    print("$player2: $player2Score");




    stdout.write("Do you still wanna continue to play? (yes | no): ");
    RPSExit = stdin.readLineSync();
    
    if (RPSExit == null || RPSExit.isEmpty) {
      print("No input detected. Exiting the game.");
      break;
    }


  } while (RPSExit == "yes" && RPSExit != "no");


  print("++++ FINAL SCOREBOARD ++++");
  print("$player1: $player1Score");
  print("$player2: $player2Score");

  if (player1Score > player2Score) {
    print("$player1 is the winner of the game :)");
  } else if (player2Score > player1Score) {
    print("$player2 is the winner of the game :)");
  } else {
    print("The game finished with a tie :]");
  }


}

///This function is used to get a name from the players
String getPlayerName(String player) {
  stdout.write("Enter $player name: ");
  String? ngalanIO = stdin.readLineSync();

  if (ngalanIO == null || ngalanIO.isEmpty) {
    stdout.write("No name entered. Using $player");
    return player;
  }
  return ngalanIO.trim(); // For removing whitespaces on the input
}

///This function is for the validation of the picks of the players
String? validatePick(String? pick) {
  if (pick == null) return null;

  String formattedPick = pick.trim().toLowerCase();
  if (RPS.contains(formattedPick)) {
    return formattedPick;
  }
  return null;
}

///This function serves as to get the picks of the players and validate it with the validation function
String getPick(String player) {
  while (true) {
    stdout.write("$player, enter your choice: ");
    String? pickio = stdin.readLineSync();

    String? validatedPick = validatePick(pickio);

    if (validatedPick != null) {
      return validatedPick;
    }
    print("Invalid Pick. Please Pick from this $RPS");
  }
  
 
}

///This function is used to decide who is the winner
String? WhoIsTheWinner(String player1, String player2, String player1Pick, String player2Pick) {
  if (player1Pick == player2Pick) {
    return null;
  }

  bool player1Wins = (player1Pick == "rock" && player2Pick == "scissors") || (player1Pick == "paper" && player2Pick == "rock") || (player1Pick == "scissors" && player2Pick == "paper");

  if (player1Wins) {
    print("\n$player1Pick beats $player2Pick");
    return player1;
  } else {
    print("\n$player1Pick beats $player2Pick");
    return player2;
  }
}