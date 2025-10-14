#pragma once
#include <unordered_map>
#include <unordered_set>
#include <queue>
#include <vector>
#include <iostream>
#include "base.h"

using namespace std;

const uint64_t SOLUTION = 0x123456789abcdef0;


bool ida_dfs(uint64_t state,
            uint64_t prev,
            int g,
            int bound,
            heuristic hrst,
            int h,
            vector<uint64_t> &onpath,
            std::unordered_map<uint64_t, uint64_t, MyHash> &traverse,
            int& nextBound)
{
    int f = g + h;
    if (f > bound) {
        nextBound = f;
        return false;
    }
    if (state == SOLUTION) {
        for (int i = 1; i < onpath.size(); i++) {
            traverse.insert({onpath[i], onpath[i - 1]});
        }
        nextBound = g;
        return true;
    }

    vector<pair<uint64_t, int>> nextSteps;
    nextSteps.reserve(4);
    findNextSteps_sorted(state, nextSteps, hrst);

    int minExceed = 1000;
    for (auto step : nextSteps) {
        if (step.first == prev) continue;

        onpath.push_back(step.first);
        int t;
        bool found = ida_dfs(step.first, state, g + 1, bound, hrst, step.second, onpath, traverse, t);
        if (found) {
            nextBound = t;
            return found;
        }
        else if (t < minExceed) minExceed = t;

        onpath.pop_back();
    }
    nextBound = minExceed;
    return false;
}


unordered_map<uint64_t, uint64_t, MyHash> solveIDA_star(uint64_t startPos, heuristic hrst)
{
    std::unordered_map<uint64_t, uint64_t, MyHash> traverse;
    vector<uint64_t> onpath;
    if (!solvable(startPos)) {
        cout << "no solution\n";
        return traverse;
    }
    
    onpath.reserve(100);
    onpath.push_back(startPos);
    traverse.reserve(100);

    int startHrst = hrst(startPos);
    int bound = hrst(startPos);
    int prevT = 1;
    while (true) {
        int t;
        bool found = ida_dfs(startPos, 0, 0, bound, hrst, startHrst, onpath, traverse, t);
        if (found) {
            cout << "yay we've made it!!! with: " << dec << t << "\n";
            return traverse;
        }
        bound = t;
    }
}


unordered_map<uint64_t, uint64_t, MyHash> solveIDS(uint64_t startPos) {
    queue<State> frontier;
    unordered_set<uint64_t> visited;
    unordered_map<uint64_t, uint64_t, MyHash> traverse;
    vector<uint64_t> nextSteps;
    nextSteps.reserve(4);
    frontier.push((State){startPos, 0, 0});
    visited.insert(startPos);

    while (!frontier.empty()) {
        auto state = frontier.front();
        frontier.pop();
    
        if (state.field == SOLUTION) {
            cout << "yay we've made it!!! with: " << dec << state.prevPath << "\n";
            return traverse;
        }
        nextSteps.resize(0);
        findNextSteps(state.field, nextSteps);
        int nextPath = state.prevPath + 1;
        for (auto step : nextSteps) {
            if (visited.find(step) == visited.end()) {
                visited.insert(step);
                frontier.push((State){ step, nextPath, nextPath});
                traverse[step] = state.field;
            }
        }
    }

    return traverse;
}

unordered_map<uint64_t, uint64_t, MyHash> solveBFS(uint64_t startPos) {
    queue<State> frontier;
    unordered_set<uint64_t> visited;
    unordered_map<uint64_t, uint64_t, MyHash> traverse;
    vector<uint64_t> nextSteps;
    nextSteps.reserve(4);
    frontier.push((State){startPos, 0, 0});
    visited.insert(startPos);

    while (!frontier.empty()) {
        auto state = frontier.front();
        frontier.pop();
    
        if (state.field == SOLUTION) {
            cout << "yay we've made it!!! with: " << dec << state.prevPath << "\n";
            return traverse;
        }
        nextSteps.resize(0);
        findNextSteps(state.field, nextSteps);
        int nextPath = state.prevPath + 1;
        for (auto step : nextSteps) {
            if (visited.find(step) == visited.end()) {
                visited.insert(step);
                frontier.push((State){ step, nextPath, nextPath});
                traverse[step] = state.field;
            }
        }
    }

    return traverse;
}

unordered_map<uint64_t, uint64_t, MyHash> solveA_star(uint64_t startPos, heuristic hrst) {
    priority_queue<State, vector<State>, MyCompare> frontier;
    unordered_map<uint64_t, int, MyHash> visited;
    unordered_map<uint64_t, uint64_t, MyHash> traverse;
    if (!solvable(startPos)) {
        cout << "no solution\n";
        return traverse;
    }
    vector<uint64_t> nextSteps;
    nextSteps.reserve(4);
    frontier.push((State){startPos, hrst(startPos), 0});
    visited[startPos] = 0;

    while (!frontier.empty()) {
        auto state = frontier.top();
        frontier.pop();
        if (visited.find(state.field) != visited.end() && visited[state.field] < state.prevPath) 
            continue;
        if (state.field == SOLUTION) {
            cout << "yay we've made it!!! with: " << dec << state.prevPath << "\n";
            return traverse;
        }
        nextSteps.resize(0);
        findNextSteps(state.field, nextSteps);
        int nextPath = state.prevPath + 1;
        for (auto step : nextSteps) {
            int curHrst = hrst(step);
            if (visited.find(step) == visited.end() || 
                visited[step] > nextPath) {
                traverse[step] = state.field;
                visited[step] = nextPath;
                frontier.push((State){step, nextPath + curHrst, nextPath});
            }
        }
    }

    return traverse;
}