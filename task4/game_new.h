#pragma once

#include <array>
#include <vector>
#include <utility>
#include <climits>
#include <algorithm>

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

    inline Colors Other(Colors c) { return c == Red ? Blue : Red; }

    inline bool InBounds(int i, int j) {
        return (i >= 0 && i < W && j >= 0 && j < H);
    }

    inline bool IsPlayableEmpty(const Board& b, int i, int j) {
        if (!InBounds(i, j)) return false;
        if (b.board[i][j] != Ncolor) return false;
        return (j == 0) || (b.board[i][j - 1] != Ncolor);
    }

    bool Move(Board& curBoard, int move) {
        if (move < 0 || move >= W) {
            return false;
        }

        int j = 0;
        for (; j < H && curBoard.board[move][j] != Ncolor; ++j);
        if (j == H) {
            return false;
        }

        curBoard.board[move][j] = curBoard.nextMove;
        curBoard.nextMove = Other(curBoard.nextMove);
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

        if (nextColor == Ncolor) {
        }

        for (int i = 0; i < W; i++) {
            int j = 0;
            for (; j < H && rawBoard[i][j] != Ncolor; ++j);
            if (j == H) {
                continue;
            }

            Board newBoard = { rawBoard, Other(nextColor) };
            newBoard.board[i][j] = nextColor;
            result.push_back({ newBoard, i });
        }

        stable_sort(result.begin(), result.end(), [](const pair<Board,int>& a, const pair<Board,int>& b) {
            int ca = abs(a.second - W / 2);
            int cb = abs(b.second - W / 2);
            return ca < cb;
        });

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
        int otherColor = Other(color);

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
                        for (int j = jStart; j >= 0 && curBoard.board[iStart][j] == Ncolor; j--, bcnt++);
                    }
                }
                if (iStop < W && curBoard.board[iStop][jStop] != otherColor) {
                    ecnt = 0;
                    if (curBoard.board[iStop][jStop] == Ncolor) {
                        for (int j = jStop; j >= 0 && curBoard.board[iStop][j] == Ncolor; j--, ecnt++);
                    }
                }

                if (bcnt >= 0 && ecnt >= 0) {
                    len++;
                    if (bcnt < ecnt) {
                        iStart--;
                        cnt += bcnt;
                    } else {
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
                        for (int j = jStart; j >= 0 && curBoard.board[iStart][j] == Ncolor; j--, bcnt++);
                    }
                }
                if (iStop < W && jStop < H && curBoard.board[iStop][jStop] != otherColor) {
                    ecnt = 0;
                    if (curBoard.board[iStop][jStop] == Ncolor) {
                        for (int j = jStop; j >= 0 && curBoard.board[iStop][j] == Ncolor; j--, ecnt++);
                    }
                }

                if (bcnt >= 0 && ecnt >= 0) {
                    len++;
                    if (bcnt < ecnt) {
                        iStart--; jStart--;
                        cnt += bcnt;
                    } else {
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
                        for (int j = jStart; j >= 0 && curBoard.board[iStart][j] == Ncolor; j--, bcnt++);
                    }
                }
                if (iStop < W && jStop >= 0 && curBoard.board[iStop][jStop] != otherColor) {
                    ecnt = 0;
                    if (curBoard.board[iStop][jStop] == Ncolor) {
                        for (int j = jStop; j >= 0 && curBoard.board[iStop][j] == Ncolor; j--, ecnt++);
                    }
                }

                if (bcnt >= 0 && ecnt >= 0) {
                    len++;
                    if (bcnt < ecnt) {
                        iStart--; jStart++;
                        cnt += bcnt;
                    } else {
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

    inline bool HasFour(const Board& b, Colors color) {
        static const int dirs[4][2] = { {1,0}, {0,1}, {1,1}, {1,-1} };
        for (int i = 0; i < W; ++i) {
            for (int j = 0; j < H; ++j) {
                if (b.board[i][j] != color) continue;
                for (auto& d : dirs) {
                    int di = d[0], dj = d[1];
                    int ii = i, jj = j, k = 1;
                    for (; k < 4; ++k) {
                        ii += di; jj += dj;
                        if (!InBounds(ii, jj)) break;
                        if (b.board[ii][jj] != color) break;
                    }
                    if (k == 4) return true;
                }
            }
        }
        return false;
    }

    inline int ScoreWindow(const Board& b, Colors me, int i, int j, int di, int dj) {
        Colors opp = Other(me);
        int myCnt = 0, oppCnt = 0, emptyCnt = 0, playableEmpties = 0;

        for (int k = 0; k < 4; ++k) {
            int ii = i + di * k;
            int jj = j + dj * k;
            Colors c = b.board[ii][jj];
            if (c == me) myCnt++;
            else if (c == opp) oppCnt++;
            else { emptyCnt++; if (IsPlayableEmpty(b, ii, jj)) playableEmpties++; }
        }

        if (myCnt == 4) return Win;
        if (oppCnt == 4) return 0;

        int score = 0;

        if (myCnt == 3 && oppCnt == 0) {
            score += (playableEmpties > 0 ? 70 : 40);
        } else if (myCnt == 2 && oppCnt == 0) {
            score += (playableEmpties >= 2 ? 12 : 6); 
        } else if (myCnt == 1 && oppCnt == 0) {
            score += 1; 
        }

        if (oppCnt == 3 && myCnt == 0) {
            score -= (playableEmpties > 0 ? 60 : 25);
        } else if (oppCnt == 2 && myCnt == 0) {
            score -= (playableEmpties >= 2 ? 10 : 4);
        }

        return score;
    }

    inline int EvaluateFor(const Board& b, Colors me) {
        if (HasFour(b, me)) return Win;
        if (HasFour(b, Other(me))) return -Win;

        int score = 0;

        for (int j = 0; j < H; ++j) {
            if (b.board[W / 2][j] == me) score += 3;
        }

        for (int j = 0; j < H; ++j) {
            if (b.board[W/2 - 1][j] == me) score += 2;
            if (b.board[min(W-1, W/2 + 1)][j] == me) score += 2;
        }

        for (int j = 0; j < H; ++j) {
            for (int i = 0; i <= W - 4; ++i) {
                score += ScoreWindow(b, me, i, j, 1, 0);
            }
        }
        for (int i = 0; i < W; ++i) {
            for (int j = 0; j <= H - 4; ++j) {
                score += ScoreWindow(b, me, i, j, 0, 1);
            }
        }
        //  /
        for (int i = 0; i <= W - 4; ++i) {
            for (int j = 3; j < H; ++j) {
                score += ScoreWindow(b, me, i, j, 1, -1);
            }
        }
        /*  \ */
        for (int i = 0; i <= W - 4; ++i) {
            for (int j = 0; j <= H - 4; ++j) {
                score += ScoreWindow(b, me, i, j, 1, 1);
            }
        }

        return score;
    }

    int ValuePosition(const Board& curBoard, Colors color) {
        auto curColor = color;
        auto otherColor = Other(color);

        int myScore = EvaluateFor(curBoard, curColor);
        int oppScore = EvaluateFor(curBoard, otherColor);

        int value = myScore - oppScore;

        if (value > Win) value = Win;
        if (value < -Win) value = -Win;

        return value;
    }
};
