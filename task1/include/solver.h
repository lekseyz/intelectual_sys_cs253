
enum SolverTypes {
    Forward,
    Backward,
    BiDirectional
};

template <typename Func>
struct OpPair {
    Func* forward;
    Func* backward;
};

class Solver {

}