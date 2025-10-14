#include "search.h"
#include "heuristics.h"
#include <iostream>
#include <chrono>

using namespace std;

enum SearchAlgs {
    BFS,
    DFS,
    IDS,
    A_STAR,
    IDA_STAR
};

struct TestCase{
    uint64_t field;
    int exptected;
    SearchAlgs alg;
};

typedef unordered_map<uint64_t, uint64_t, MyHash> (*heuristic_search)(uint64_t startPos, heuristic hrst);

int main() {
    uint64_t testCases[] = {
        0x123456789AFB0EDC,
        0xF2345678A0BE91CD,
        0x123456789ABCDEF0,
        0x1234067859ACDEBF,
        0x5134207896ACDEBF,
        0x16245A3709C8DEBF,
        0x1723068459ACDEBF,
        0x12345678A0BE9FCD,
        0x51247308A6BE9FCD,
        0xF2345678A0BE91DC,
        0x75123804A6BE9FCD,
        0x75AB2C416D389F0E,
        0x04582E1DF79BCA36,
        0xFE169B4C0A73D852,
        0xD79F2E8A45106C3B,
        0xDBE87A2C91F65034,
        0xBAC0F478E19623D5
    };
    vector<heuristic_search> solvers({solveA_star, solveIDA_star});
    string names[] = { "A* algorithm", "IDA* algorithm" };
    int counter = 0;
    for (auto solver : solvers) {
        cout << names[counter++] << ":\n";
        for (int i = 0; i < sizeof(testCases)/sizeof(uint64_t); i++) {
            cout << "TestCase: " << hex << testCases[i] << ":\n";
            auto start = chrono::high_resolution_clock::now();
            solver(testCases[i], finalHeuristic);
            auto stop = chrono::high_resolution_clock::now();
            chrono::duration<double, milli> dtm = stop - start;
            cout << dtm.count() << "\n";
        }
    }
}