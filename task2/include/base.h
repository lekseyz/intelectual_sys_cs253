#pragma once
#include <cinttypes>
#include <cstdlib>
#include <vector>
#include <algorithm>

using namespace std;

struct State {
    uint64_t field;
    size_t length;
    size_t prevPath;
};

struct MyHash {
    std::size_t operator()(const uint64_t& obj) const noexcept {
        return obj;
    }
};

struct MyCompare {
    size_t operator()(const State& st1, const State& st2) {
        return st1.length > st2.length;
    }
};

typedef int (*heuristic)(uint64_t);

inline int getSh(uint64_t pos, int sh) {
    sh = 15 - sh;
    return (pos & ((uint64_t)0xf << (sh * 4))) >> (sh * 4);
}

inline void setSh(uint64_t& pos, int sh, int data) {
    sh = 15 - sh;   
    uint64_t tr = UINT64_MAX ^ ((uint64_t)0xf << sh*4);
    pos &= tr;
    pos += (uint64_t)data << sh*4; 
}

void findNextSteps(uint64_t pos, vector<uint64_t>& nextStepsOut) {
    uint64_t finder = 0xf;
    int zero = 15;
    while (pos & finder) {
        zero--;
        finder = finder << 4;
    }

    uint64_t nextPos;
    if (zero >= 4) {
        nextPos = pos;
        setSh(nextPos, zero, getSh(nextPos, zero - 4));
        setSh(nextPos, zero - 4, 0);
        
        nextStepsOut.push_back(nextPos);
    }
    if (zero % 4 != 0) {
        nextPos = pos;
        setSh(nextPos, zero, getSh(nextPos, zero - 1));
        setSh(nextPos, zero - 1, 0);

        nextStepsOut.push_back(nextPos);
    }
    if (zero % 4 != 3) {
        nextPos = pos;
        setSh(nextPos, zero, getSh(nextPos, zero + 1));
        setSh(nextPos, zero + 1, 0);

        nextStepsOut.push_back(nextPos);
    }
    if (zero < 12) {
        nextPos = pos;
        setSh(nextPos, zero, getSh(nextPos, zero + 4));
        setSh(nextPos, zero + 4, 0);

        nextStepsOut.push_back(nextPos);
    }
}



void findNextSteps_sorted(uint64_t pos, vector<pair<uint64_t, int>>& nextStepsOut, heuristic hrst) {
    uint64_t finder = 0xf;
    int zero = 15;
    while (pos & finder) {
        zero--;
        finder = finder << 4;
    }

    uint64_t nextPos;
    if (zero >= 4) {
        nextPos = pos;
        setSh(nextPos, zero, getSh(nextPos, zero - 4));
        setSh(nextPos, zero - 4, 0);
        
        nextStepsOut.push_back({nextPos, hrst(nextPos)});
    }
    if (zero % 4 != 0) {
        nextPos = pos;
        setSh(nextPos, zero, getSh(nextPos, zero - 1));
        setSh(nextPos, zero - 1, 0);

        nextStepsOut.push_back({nextPos, hrst(nextPos)});
    }
    if (zero % 4 != 3) {
        nextPos = pos;
        setSh(nextPos, zero, getSh(nextPos, zero + 1));
        setSh(nextPos, zero + 1, 0);

        nextStepsOut.push_back({nextPos, hrst(nextPos)});
    }
    if (zero < 12) {
        nextPos = pos;
        setSh(nextPos, zero, getSh(nextPos, zero + 4));
        setSh(nextPos, zero + 4, 0);

        nextStepsOut.push_back({nextPos, hrst(nextPos)});
    }

    sort(nextStepsOut.begin(), nextStepsOut.end(), [](auto& left, auto& right) {
        return left.second < right.second;
    });
}

bool solvable(uint64_t pos) {
    int a[16];
    for (int i = 0; i < 16; ++i) a[i] = getSh(pos, i);

    int inv = 0;
    for (int i = 0; i < 16; ++i) {
        if (a[i] == 0) continue;
        for (int j = i + 1; j < 16; ++j) {
            if (a[j] != 0 && a[i] > a[j]) ++inv;
        }
    }

    int zeroIdx = 0;
    while (zeroIdx < 16 && a[zeroIdx] != 0) ++zeroIdx;
    int rowFromBottom = 4 - (zeroIdx / 4);

    return ((inv + rowFromBottom) & 1) == 1;
}
