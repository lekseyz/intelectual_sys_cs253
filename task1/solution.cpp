#include <iostream>
#include <queue>
#include <cstring>
#include <chrono>
#include <algorithm>
#include <stack>
#include <string>
using namespace std;


typedef bool (IntOp)(int, int&);

template <typename Func>
struct OpPair {
    Func* forward;
    Func* backward;
};

enum AlgType {
    Forward,
    Backward,
    BiDirectional
};

typedef vector<OpPair<IntOp>> IntOpPairs;




template <typename T, typename Func>
struct TestCase {
    pair<T, T> pr;
    int answer;
    vector<OpPair<Func>> ops;
};

// int functions
bool plus3(int num, int& out) {
    out = num + 3;
    return true;
}
bool plus3rev(int num, int& out) {
    out = num - 3;
    return true;
}

bool minus2(int num, int& out) {
    out = num - 2;
    return true;
}
bool minus2rev(int num, int& out) {
    out = num + 2;
    return true;
}

bool mul2(int num, int& out) {
    out = num * 2;
    return true;
}
bool mul2rev(int num, int& out) {
    if (num % 2) {
        out = 0;
        return false;
    }
    else {
        out = num / 2;
        return true;
    }
}
// int functions


int solve(int x1, int x2, const IntOpPairs& ops, AlgType type);

string typeToString(AlgType type) {
    switch (type)
            {
            case AlgType::Forward:
                return "forward";
            case AlgType::Backward:
                return "backward";
            case AlgType::BiDirectional:
                return "bidirectional";
            default:
                return "unknown";
            }
}

int main() {
    IntOpPairs reduced({{plus3, plus3rev}, {mul2, mul2rev}});
    IntOpPairs full({{plus3, plus3rev}, {minus2, minus2rev}, {mul2, mul2rev}});
    TestCase<int, IntOp> tests[] = { { {1, 100}, 7, reduced}, 
                                     { {2, 55}, 6, reduced},
                                     { {2, 100}, 7, reduced},
                                     { {1, 97}, 8, reduced},
                                     { {2, 1000}, 12, reduced},
                                     { {2, 800000}, 24, reduced},
                                     { {2, 10000001}, 30, reduced},
                                     { {1, 100}, 7, full},
                                     { {2, 3}, 2, full},
                                     { {2, 55}, 6, full},
                                     { {2, 100}, 7, full},
                                     { {1, 97}, 8, full},
                                     { {2, 1000}, 11, full},
                                     { {3, 1001}, 13, full},
                                     { {3, 3001}, 14, full},
                                     { {2, 800000}, 23, full},
                                     { {2, 10000001}, 30, full},};
    for (AlgType type : {AlgType::Forward, AlgType::Backward, AlgType::BiDirectional}) {
        cout << "////////algorithm type: " << typeToString(type) << "////////\n";
        for (auto test : tests) {
            int x1, x2;
            x1 = test.pr.first;
            x2 = test.pr.second;
            cout << x1 << " -> " << x2 <<"\n";
            int result = solve(x1, x2, test.ops, type);

            cout << "expected = " << test.answer << " result = " << result << "\n\n";
        }
    }
}






int solve(int x1, int x2, const IntOpPairs& ops, AlgType type) {
    if (x1 >= x2)
        swap(x1, x2);

    int lb, rb;
    if (x1 >= 2)
        lb = 0;
    else 
        lb = x1 - 2;
    rb = x2 + 3;

    const int sz = rb - lb + 1;
    const int sh = lb;
    const int INVALID_NUM = rb + 1;

    // helpers
    auto checkNum = [&rb, &lb](int num) {
        return num <= rb && num >= lb;
    };
    auto getIdx = [&sh](int num) {
        return num - sh;
    };

    int* counts = new int[sz];
    int* trace  = new int[sz];
    memset(counts, 0, sz * sizeof(int));
    memset(trace, 0, sz * sizeof(int));
    queue<int> q;
    vector<int> tmps(ops.size());
    vector<int> ids(ops.size());
    int result = INT32_MAX;
    auto start = chrono::high_resolution_clock::now();
    
    // forward backward
    if (type != AlgType::BiDirectional) {
        int target;
        if (type == AlgType::Forward) {
            target = x2;
            q.push(x1);
        }
        else {
            target = x1;
            q.push(x2);
        }

        while (!q.empty()) {
            int x = q.front();
            q.pop();
            int nextCount = counts[getIdx(x)] + 1;

            for (int i = 0; i < ops.size(); i++) {
                int tmp;
                if (type == AlgType::Forward ? ops[i].forward(x, tmp) : ops[i].backward(x, tmp))
                    tmps[i] = tmp;
                else
                    tmps[i] = INVALID_NUM;
            }
            for (int i = 0; i < tmps.size(); i++) {
                ids[i] = getIdx(tmps[i]);
            }

            for (int i = 0; i < tmps.size(); i++) {
                int nextX = tmps[i];
                if (checkNum(nextX)) {
                    int curIdx = getIdx(nextX);
                    if (nextX == target) {
                        trace[curIdx] = x;
                        result = nextCount;
                        goto end;
                    }
                    if (counts[curIdx] == 0) {
                        counts[curIdx] = nextCount;
                        trace[curIdx] = x;
                        q.push(nextX);
                    }
                }
            }
        }
        end:
    }
    else {
        int* side = new int[sz];
        memset(side, 0, sz * sizeof(int));
        side[getIdx(x1)] = 1;
        side[getIdx(x2)] = -1;
        queue<int> q1;
        q.push(x1);
        q1.push(x2);

        while(!q.empty() && !q1.empty()) {
            bool finish = false;
            int qsize, q1size;
            qsize = q.size();

            for(int i = 0; i < qsize; i++) {
                int x = q.front();
                int nextCount = counts[getIdx(x)] + 1;
                q.pop();
                for (int i = 0; i < ops.size(); i++) {
                    int tmp;
                    if (ops[i].forward(x, tmp))
                        tmps[i] = tmp;
                    else
                        tmps[i] = INVALID_NUM;
                    ids[i] = getIdx(tmps[i]);
                }

                for (int i = 0; i < tmps.size(); i++) {
                    int nextX = tmps[i];
                    if (checkNum(nextX)) {
                        int curIdx = getIdx(nextX);
                        if (side[curIdx] == 0) {
                            counts[curIdx] = nextCount;
                            trace[curIdx] = x;
                            side[curIdx] = 1;
                            q.push(nextX);
                        }
                        else if (side[curIdx] == -1) {
                            int curRes = nextCount + counts[curIdx];
                            result = min(curRes, result);
                            finish = true;
                        }
                    }
                }
            }
            
            q1size = q1.size();
            for(int i = 0; i < q1size; i++) {
                int x = q1.front();
                int nextCount = counts[getIdx(x)] + 1;
                q1.pop();
                for (int i = 0; i < ops.size(); i++) {
                    int tmp;
                    if (ops[i].backward(x, tmp))
                        tmps[i] = tmp;
                    else
                        tmps[i] = INVALID_NUM;
                    ids[i] = getIdx(tmps[i]);
                }

                for (int i = 0; i < tmps.size(); i++) {
                    int nextX = tmps[i];
                    if (checkNum(nextX)) {
                        int curIdx = getIdx(nextX);
                        if (side[curIdx] == 0) {
                            counts[curIdx] = nextCount;
                            trace[curIdx] = x;
                            side[curIdx] = -1;
                            q1.push(nextX);
                        }
                        else if (side[curIdx] == 1) {
                            int curRes = nextCount + counts[curIdx];
                            result = min(curRes, result);
                            finish = true;
                        }
                    }
                }
            }

            if (finish){
                break;
            }
    }
    
    auto stop = chrono::high_resolution_clock::now();

    std::chrono::duration<double, std::milli> elapsed_ms = stop - start;
    cout << "work time = " << elapsed_ms.count() << "ms. Trace:\n";
    
/*    
    stack<int> st;
    int curNum = x2;
    st.push(curNum);
    while (curNum != x1) {
        int curIdx = getIdx(curNum, sh);
        curNum = trace[curIdx];
        st.push(curNum);
    }
    while (!st.empty()) {
        cout << st.top() << "\n";
        st.pop();
    }
*/
    if (type == AlgType::BiDirectional) {
        
    }
    return result;
}