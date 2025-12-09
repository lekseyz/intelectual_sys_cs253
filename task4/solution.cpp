//g++ -O3 -std=c++17 solution.cpp -o a.out && ./a.out 0

#define NEW_GAME_LIB

#include <iostream>
#ifdef NEW_GAME_LIB
#include "game_new.h"
#else
#include "game.h"
#endif
using namespace Game;

int minimax(const Board& board, int height, int& hrst, Colors color, bool isMaximizing = true, int a = INT_MIN, int b = INT_MAX) {
    if (height == 0) {
        hrst = ValuePosition(board, color);
        return -1;
    }

    int returnMove;

    if (isMaximizing) {
        hrst = INT_MIN;
        for (auto newBoard : GetNextMoves(board)) {
            int tmpHrst;
            minimax(newBoard.first, height - 1, tmpHrst, color, !isMaximizing, a, b);
            if (tmpHrst > hrst) {
                hrst = tmpHrst;
                returnMove = newBoard.second;
            }

            if (hrst >= b)
                break;  
            a = max(a, hrst);
        }
    }
    else {
        hrst = INT_MAX;
        for (auto newBoard : GetNextMoves(board)) {
            int tmpHrst;
            minimax(newBoard.first, height - 1, tmpHrst, color, !isMaximizing, a, b);
            if (tmpHrst < hrst) {
                hrst = tmpHrst;
                returnMove = newBoard.second;
            }

            if (hrst <= a) 
                break;
            b = min(b, hrst);
        }
    }

    return returnMove;    
}

int FindSolution(Board& board, Colors botColor) {
    int hrst = 0;
    auto mv = minimax(board, 10, hrst, botColor, true);
    Move(board, mv);
    return mv;
}

void drawBoard(Board board) {
    auto field = board.board;
    cout << "|0|1|2|3|4|5|6|\n";
    for (int j = H - 1; j >= 0; j--) {
        cout << "|";
        for (int i = 0; i < W; i++) {
            cout << (field[i][j] == Red ? "X" : (field[i][j] == Blue ? "O" : ".")) << "|";
        }
        cout << "\n";
    }
}

int main(int argc, char* argv[]) {
    Colors playerColor;
    Colors botColor;
    string input(argv[argc - 1]);

    if (input == "1") {
        playerColor = Blue;
        botColor = Red;
    }
    else if (input == "0") {
        playerColor = Red;
        botColor = Blue;
    }
    cout << "X is for 0, O is for 1\n";
    Board board = {array<array<Colors,6>,7>(), Red};
    while (!IsBoardFull(board)) {
        auto curColor = board.nextMove;
        cout << "Current move: " << (curColor == Red ? "X" : "O") << "\n";
        drawBoard(board);
        if (curColor == playerColor) {
            int move;
            do {
                cout << "Enter your move (0-6):\n";
                cin >> move;
            }
            while (!Move(board, move));
#ifdef NEW_GAME_LIB
            if (HasFour(board, playerColor)) {
                cout << "You win!!!\n";
                return 3;
            }
#else
            if (ValuePosition(board, playerColor) == Win) {
                cout << "You win!!!\n";
                return 3;
            }
#endif
        }
        else if (curColor == botColor) {
            int move = FindSolution(board, botColor);
            cerr << move << "\n";
            cout << "Bot result:\n";
            drawBoard(board);
#ifdef NEW_GAME_LIB
            if (HasFour(board, botColor)) {
                cout << "Bot wins!!!\n";
                return 3;
            }
#else
            if (ValuePosition(board, playerColor) == Win) {
                cout << "You win!!!\n";
                return 3;
            }
#endif
        }
    }

    cout << "Draw!!!\n";
    return 4;
}