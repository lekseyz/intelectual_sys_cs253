#pragma once
#include "base.h"




inline void unpackTiles(uint64_t pos, int tiles[16]) {
    for (int i = 0; i < 16; ++i) {
        tiles[i] = getSh(pos, i);
    }
}

int simpleHeuristic(uint64_t pos, int* tiles) {
    int my_tiles[16];
    if (tiles == nullptr) {
        unpackTiles(pos, my_tiles);
        tiles = my_tiles;
    }    

    const int rightWay[16] = { 1,2,3,4, 5,6,7,8, 9,10,11,12, 13,14,15,0 };
    int count = 0;
    for (int i = 0; i < 16; ++i) {
        int v = tiles[i];
        if (v == 0) continue;
        if (rightWay[i] != v) count++;
    }
    return count;
}

int mangattanHeuristic(uint64_t pos, int* tiles) {
    int my_tiles[16];
    if (tiles == nullptr) {
        unpackTiles(pos, my_tiles);
        tiles = my_tiles;
    }    

    const int w[] = {3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2};
    const int h[] = {3, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3};
    int count = 0;

    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            int num = tiles[i * 4 + j];
            if (num == 0)
                continue;
            count += abs(w[num] - j) + abs(h[num] - i);
        }
    }
    return count;
}

int linearConflictHeuristic(uint64_t pos, int* tiles) {
    int my_tiles[16];
    if (tiles == nullptr) {
        unpackTiles(pos, my_tiles);
        tiles = my_tiles;
    }    

    int manh = mangattanHeuristic(pos, tiles);

    int lc = 0;

    const int w[] = {3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2};
    const int h[] = {3, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3};

    for (int r = 0; r < 4; ++r) {
        int cnt = 0; int rmax = -1;
        for (int c = 0; c < 4; ++c) {
            int idx = r * 4 + c;
            int v = tiles[idx];
            if (v == 0) continue;
            if (h[v] == r) {
                if (rmax < v) {
                    rmax = v;
                } else {
                    lc += 2;
                }
            }
        }
    }

    for (int c = 0; c < 4; ++c) {
        int cnt = 0; int cmax = -1;
        for (int r = 0; r < 4; ++r) {
            int idx = r * 4 + c;
            int v = tiles[idx];
            if (v == 0) continue;
            if (w[v] == c) {
                if (cmax < v) {
                    cmax = v;
                } else {
                    lc += 2;
                }
            }
        }
    }

    return manh + 2 * lc;
}

int cornerConflict(uint64_t pos, int* tiles) {
    int my_tiles[16];
    if (tiles == nullptr) {
        unpackTiles(pos, my_tiles);
        tiles = my_tiles;
    }
    int lc = linearConflictHeuristic(pos, tiles);
    int extra = 0;

    if (tiles[0] != 1 && tiles[0] != 0) {
        if (tiles[1] == 2 && tiles[4] == 4) extra += 2;
    }

    if (tiles[3] != 4 && tiles[3] != 0) {
        if (tiles[2] == 3 && tiles[7] == 8) extra += 2;
    }

    if (tiles[12] != 13 && tiles[12] != 0) {
        if (tiles[13] == 14 && tiles[8] == 9) extra += 2;
    }

    if (tiles[15] != 0) { 
        if (tiles[14] == 15 && tiles[11] == 12) extra += 2;
    }

    return extra + lc;
}

int finalHeuristic(uint64_t pos) {
    return cornerConflict(pos, nullptr);
}