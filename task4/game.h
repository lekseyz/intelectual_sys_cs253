#pragma once

#include <array>
#include <vector>
#include <utility>
#include <climits>

using namespace std;

namespace Game {

    const int H = 6;
    const int W = 7;

    enum Colors {
        Ncolor,
        Red,
        Blue,
    };

    enum PositionValues {
        Npos,
        ContinueStreak = 1,
        Streak = 10,
        Win = 127,
    };

    
    struct Board {
        array<array<Colors, H>, W> board;
        Colors nextMove;
    };

    bool Move(Board& curBoard, int move) {
        if (move > 7 && move < 0) {
            // TODO: error
            return false;
        }

        int j = 0; 
        for (j; j < H && curBoard.board[move][j] != Npos; j++);
        if (j == H) {
            // TODO: error
            return false;
        }

        curBoard.board[move][j] = curBoard.nextMove;
        curBoard.nextMove = curBoard.nextMove == Red ? Blue : Red;
        return true;
    }

    bool IsBoardFull(const Board& board) {
        auto raw = board.board;

        for (int i = 0; i < W; i++) {
            if (raw[i][H - 1] == Ncolor)
                return false;
        }
        return true;
    }

    vector<pair<Board, int>> GetNextMoves(const Board& curBoard) {
        vector<pair<Board, int>> result;
        auto rawBoard = curBoard.board;
        auto nextColor = curBoard.nextMove;
        
        if (nextColor == Ncolor)
        {
            // TODO: some error
        }

        for (int i = 0; i < W; i++) {
            int j = 0;
            for (j; j < H && rawBoard[i][j] != Npos; j++);
            if (j == H) {
                // TODO: error
                continue;
            }
            
            Board newBoard = { rawBoard, nextColor == Red ? Blue : Red };
            newBoard.board[i][j] = nextColor;
            result.push_back({newBoard, i});
        }

        return result;
    }

    int CountStepsToFinishStreak(int iStart, int jStart, int iStop, int jStop, const Board& curBoard, Colors color) {
        if (iStop < iStart) {
            swap(iStop, iStart);
            swap(jStop, jStart);
        }

        int di = iStop - iStart;
        int dj = jStop - jStart;
        int cnt = 0;
        int otherColor = color == Red ? Blue : Red;

        if (di == 0) {
            int len = jStop - jStart - 1;
            while (jStop < H && curBoard.board[iStop][jStop] != otherColor) {
                cnt++;
                len++;
                if (len >= 4)
                    return cnt;
                jStop++;
            }
        }
        else if (dj == 0) {
            int len = iStop - iStart - 1;
            while (len < 4) {
                int bcnt = -1, ecnt = -1;
                if (iStart >= 0 && curBoard.board[iStart][jStart] != otherColor) {
                    bcnt = 0;
                    if (curBoard.board[iStart][jStart] == Ncolor) {
                        for (int j = jStart; j >= 0 && curBoard.board[iStart][j] == Npos; j--, bcnt++);
                    }

                }
                if (iStop < W && curBoard.board[iStop][jStop] != otherColor) {
                    ecnt = 0;
                    if (curBoard.board[iStop][jStop] == Ncolor) {
                        for (int j = jStop; j >= 0 && curBoard.board[iStop][j] == Npos; j--, ecnt++);
                    }
                }

                if (bcnt >= 0 && ecnt >= 0) {
                    len++;
                    if (bcnt < ecnt) {
                        iStart--;
                        cnt += bcnt;
                    }
                    else {
                        iStop++;
                        cnt += ecnt;
                    }
                    continue;
                }
                if (bcnt >= 0) {
                    len++;
                    iStart--;
                    cnt += bcnt;
                    continue;
                }
                if (ecnt >= 0) {
                    len++;
                    iStop++;
                    cnt += ecnt;
                    continue;
                }
                return -1;
            }
        }
        else if (dj > 0) {
            int len = iStop - iStart - 1;
            while (len < 4) {
                int bcnt = -1, ecnt = -1;
                if (iStart >= 0 && jStart >= 0 && curBoard.board[iStart][jStart] != otherColor) {
                    bcnt = 0;
                    if (curBoard.board[iStart][jStart] == Ncolor) {
                        for (int j = jStart; j >= 0 && curBoard.board[iStart][j] == Npos; j--, bcnt++);
                    }

                }
                if (iStop < W && jStop < H && curBoard.board[iStop][jStop] != otherColor) {
                    ecnt = 0;
                    if (curBoard.board[iStop][jStop] == Ncolor) {
                        for (int j = jStop; j >= 0 && curBoard.board[iStop][j] == Npos; j--, ecnt++);
                    }
                }

                if (bcnt >= 0 && ecnt >= 0) {
                    len++;
                    if (bcnt < ecnt) {
                        iStart--; jStart--;
                        cnt += bcnt;
                    }
                    else {
                        iStop++; jStop++;
                        cnt += ecnt;
                    }
                    continue;
                }
                if (bcnt >= 0) {
                    len++;
                    iStart--; jStart--;
                    cnt += bcnt;
                    continue;
                }
                if (ecnt >= 0) {
                    len++;
                    iStop++; jStop++;
                    cnt += ecnt;
                    continue;
                }
                return -1;
            }
        }
        else if (dj < 0) {
            int len = iStop - iStart - 1;
            while (len < 4) {
                int bcnt = -1, ecnt = -1;
                if (iStart >= 0 && jStart < H && curBoard.board[iStart][jStart] != otherColor) {
                    bcnt = 0;
                    if (curBoard.board[iStart][jStart] == Ncolor) {
                        for (int j = jStart; j >= 0 && curBoard.board[iStart][j] == Npos; j--, bcnt++);
                    }

                }
                if (iStop < W && jStop >= 0 && curBoard.board[iStop][jStop] != otherColor) {
                    ecnt = 0;
                    if (curBoard.board[iStop][jStop] == Ncolor) {
                        for (int j = jStop; j >= 0 && curBoard.board[iStop][j] == Npos; j--, ecnt++);
                    }
                }

                if (bcnt >= 0 && ecnt >= 0) {
                    len++;
                    if (bcnt < ecnt) {
                        iStart--; jStart++;
                        cnt += bcnt;
                    }
                    else {
                        iStop++; jStop--;
                        cnt += ecnt;
                    }
                    continue;
                }
                if (bcnt >= 0) {
                    len++;
                    iStart--; jStart++;
                    cnt += bcnt;
                    continue;
                }
                if (ecnt >= 0) {
                    len++;
                    iStop++; jStop--;
                    cnt += ecnt;
                    continue;
                }
                return -1;
            }
        }

        return cnt;
    }

    

    int ValuePosition(const Board& curBoard, Colors color) {
        array<int, Blue + 1> values;
        auto rawBoard = curBoard.board;
        auto curColor = color;
        auto otherColor = color == Red ? Blue : Red;

        

        for (int color = Red; color <= Blue; color++) {
            int maxValue = INT_MIN;
            int curStreak = 0;
            int iStart, jStart;
            bool streakStarted = false;

            auto evalStreak = [&iStart, &jStart, &maxValue, &curStreak, &streakStarted, &curBoard, color] (int i, int j) {
                    if (curStreak >= 2) {
                    int toWin = CountStepsToFinishStreak(iStart, jStart, i, j, curBoard, (Colors)color);
                    if (toWin != -1)
                        maxValue = max(maxValue, curStreak * Streak - toWin * ContinueStreak); // TODO: even vs odd steps to win
                }
                curStreak = 0;
                streakStarted = false;
            };

            // horizontal
            for (int j = 0; j < H; j++) {
                int i;
                streakStarted = false;
                curStreak = 0;
                for (i = 0; i < W; i++) {
                    if (curStreak == 4) {
                        return Win;
                    }
                    if (streakStarted && rawBoard[i][j] != color) {
                        evalStreak(i, j);
                        continue;
                    }
                    else if (streakStarted) {
                        curStreak++;
                        continue;
                    }
                    
                    if (rawBoard[i][j] == color) {
                        iStart = i - 1; jStart = j;
                        streakStarted = true;
                        curStreak = 1;
                    }
                }

                if (streakStarted) {
                    evalStreak(i, j);
                }
            }
            // vertical
            for (int i = 0; i < W; i++) {
                int j;
                streakStarted = false;
                curStreak = 0;
                for (j = 0; j < H; j++) {
                    if (curStreak == 4) {
                        return Win;
                    }
                    if (streakStarted && rawBoard[i][j] != color) {
                        evalStreak(i, j);
                        continue;
                    }
                    else if (streakStarted) {
                        curStreak++;
                        continue;
                    }

                    if (rawBoard[i][j] == color) {
                        iStart = i; jStart = j - 1;
                        streakStarted = true;
                        curStreak = 1;
                    }
                }

                if (streakStarted) {
                    evalStreak(i, j);
                }
            }
            /* diagonal \ */ 
            int x = 0, y = 0;
            for (int t = 0; t < W + H - 2; t++) {
                if (y < H - 1) {
                    y++;
                }
                else {
                    x++;
                }

                int j = y, i = x;
                streakStarted = false;
                curStreak = 0;
                while (j >= 0 && j < H && i >= 0 && i < W) {
                    if (curStreak == 4) {
                        return Win;
                    }
                    if (streakStarted && rawBoard[i][j] != color) {
                        evalStreak(i, j);
                        i++; j--;
                        continue;
                    }
                    else if (streakStarted) {
                        curStreak++;
                        i++; j--;
                        continue;
                    }

                    if (rawBoard[i][j] == color) {
                        iStart = i - 1; jStart = j + 1;
                        streakStarted = true;
                        curStreak = 1;
                    }

                    i++; j--;
                }
                if (streakStarted) {
                    evalStreak(i, j);
                }
            }

            /* diagonal / */ 
            x = 0, y = H - 1;
            for (int t = 0; t < W + H - 2; t++) {
                if (x < W - 1) {
                    x++;
                }
                else {
                    y--;
                }

                int j = y, i = x;
                streakStarted = false;
                curStreak = 0;
                while (j >= 0 && j < H && i >= 0 && i < W) {
                    if (curStreak == 4) {
                        return Win;
                    }
                    if (streakStarted && rawBoard[i][j] != color) {
                        evalStreak(i, j);
                        i--; j--;
                        continue;
                    }
                    else if (streakStarted) {
                        curStreak++;
                        i--; j--;
                        continue;
                    }

                    if (rawBoard[i][j] == color) {
                        iStart = i + 1; jStart = j + 1;
                        streakStarted = true;
                        curStreak = 1;
                    }

                    i--; j--;
                }
                if (streakStarted) {
                    evalStreak(i, j);
                }
            }

            if (maxValue == INT_MIN)
                maxValue = 0;
            values[color] = maxValue;
        }

        return values[curColor] - values[otherColor];
    }
};