int main() {
    IntOpPairs reduced({{plus3, plus3rev}, {mul2, mul2rev}});
    IntOpPairs full({{plus3, plus3rev}, {minus2, minus2rev}, {mul2, mul2rev}});
    TestCase<int, IntOp> tests[] = { { {1, 100}, 7, reduced}, 
                                     { {1, 55}, 6, reduced},
                                     { {2, 100}, 7, reduced},
                                     { {1, 97}, 8, reduced},
                                     { {2, 1000}, 12, reduced},
                                     { {2, 800000}, 24, reduced},
                                     { {2, 10000001}, 30, reduced},
                                     { {1, 100}, 7, full},
                                     { {2, 3}, 2, full},
                                     { {1, 55}, 6, full},
                                     { {2, 100}, 7, full},
                                     { {1, 97}, 8, full},
                                     { {2, 1000}, 11, full},
                                     { {3, 1001}, 13, full},
                                     { {3, 3001}, 14, full},
                                     { {2, 800000}, 23, full},
                                     { {2, 10000001}, 30, full},};
    int x1, x2;
    cin >> x1 >> x2;
    cout << solve(x1, x2) << "\n";
}