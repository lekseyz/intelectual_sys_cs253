#include <bits/stdc++.h>
using namespace std;

// ------------ Packed board utils (4-bit per cell) ------------
static inline uint8_t get_tile(uint64_t s, int i){ return (s >> (i*4)) & 0xF; }
static inline uint64_t set_tile(uint64_t s, int i, uint8_t v){
    uint64_t mask = ~(0xFULL << (i*4));
    return (s & mask) | (uint64_t(v) << (i*4));
}
static inline int find_blank(uint64_t s){
    for(int i=0;i<16;i++) if(get_tile(s,i)==0) return i;
    return -1;
}
static inline uint64_t swap_idx(uint64_t s, int a, int b){
    uint8_t ta=get_tile(s,a), tb=get_tile(s,b);
    s = set_tile(s,a,tb);
    s = set_tile(s,b,ta);
    return s;
}
static const int N=4;
static inline bool inb(int r,int c){ return 0<=r && r<N && 0<=c && c<N; }
static inline pair<uint64_t,uint8_t> move_blank(uint64_t s, int dir){
    // dir: 0 up,1 down,2 left,3 right; returns {new_state, moved_tile}
    static const int dr[4]={-1,1,0,0}, dc[4]={0,0,-1,1};
    int zi=find_blank(s), zr=zi/4, zc=zi%4;
    int nr=zr+dr[dir], nc=zc+dc[dir];
    if(!inb(nr,nc)) return {0,0xFF};
    int j=nr*4+nc;
    uint8_t moved=get_tile(s,j);
    return { swap_idx(s, zi, j), moved };
}

// ------------ Patterns: 7-group and 8-group ------------
static const array<uint8_t,7> PAT7 = {1,2,3,4,5,6,7};
static const array<uint8_t,8> PAT8 = {8,9,10,11,12,13,14,15};

// Fast membership test
template<size_t K>
struct Pattern {
    array<uint8_t,K> tiles;
    array<uint8_t,16> mask; // mask[tile]=1 if in pattern
    Pattern(const array<uint8_t,K>& t): tiles(t){
        mask.fill(0);
        for(uint8_t v: tiles) mask[v]=1;
    }
    inline bool has(uint8_t v) const { return mask[v]; }
};

// ------------ Combination ranking (choose positions for K+1 items incl. blank) ------------
// We rank a sorted set S of size M=(K+1) chosen from 16 by combinadic.
// Then, among those positions, we rank the permutation of (K pattern tiles + blank) by Lehmer code.
// Final index = rankComb * (K+1)! + rankPerm.
static uint64_t Cnk[17][17];

static void init_combinations(){
    for(int n=0;n<=16;n++){
        Cnk[n][0]=Cnk[n][n]=1;
        for(int k=1;k<n;k++) Cnk[n][k]=Cnk[n-1][k-1]+Cnk[n-1][k];
    }
}

template<size_t K>
struct Indexer {
    // order of labels: tiles in increasing value, then blank(0) at the end
    // positions[]: indices 0..15 where these labels sit, in the same order
    // Build positions[] for state -> {combRank, permRank}
    static uint64_t rank(const Pattern<K>& pat, uint64_t state){
        // 1) collect positions of pattern tiles and blank, keyed by label-order
        array<int,K+1> pos{}; // pos[0..K-1] for tiles, pos[K] for blank(0)
        // tiles in ascending order (PAT contains ascending already)
        for(size_t i=0;i<K;i++){
            uint8_t tile = pat.tiles[i];
            for(int p=0;p<16;p++) if(get_tile(state,p)==tile){ pos[i]=p; break; }
        }
        int zb = find_blank(state);
        pos[K]=zb;

        array<int,K+1> sorted = pos;
        sort(sorted.begin(), sorted.end());
        uint64_t combRank=0;
        int last=-1, m=K+1, n=16;
        for(int i=0;i<m;i++){
            int x=sorted[i];
            for(int v=(i?sorted[i-1]+1:0); v<x; v++){
                combRank += Cnk[16 - (v+1)][(m - i - 1)];
            }
        }

        array<int,K+1> permIdx{}; // for each label order index -> rank in sorted
        for(size_t i=0;i<K+1;i++){
            int p = pos[i];
            int r = int(lower_bound(sorted.begin(), sorted.end(), p) - sorted.begin());
            permIdx[i]=r;
        }

        uint64_t permRank=0;
        array<int,K+1> a = permIdx;
        for(size_t i=0;i<K+1;i++){
            int smaller=0;
            for(size_t j=i+1;j<K+1;j++) if(a[j]<a[i]) smaller++;
            permRank = permRank * ( (K+1) - i ) + smaller;
        }

        return combRank * (uint64_t)tgamma((long double)(K+2)) + permRank; // (K+1)! via tgamma
    }

    static uint64_t space(){
        uint64_t comb = Cnk[16][K+1];
        uint64_t fact = 1; for(int i=2;i<=int(K+1);i++) fact*=i;
        return comb * fact;
    }
};

// ------------ 0-1 BFS builder for one pattern ------------
template<size_t K>
static vector<uint8_t> build_pdb(const Pattern<K>& pat){
    init_combinations();
    uint64_t SZ = Indexer<K>::space();
    vector<uint8_t> pdb; pdb.assign(SZ, 0xFF);

    uint64_t goal=0;
    for(int i=0;i<16;i++) goal = set_tile(goal, i, (i==15)?0:(i+1));

    deque<uint64_t> dq;
    uint64_t key = Indexer<K>::rank(pat, goal);
    pdb[key]=0;
    dq.push_back(goal);

    while(!dq.empty()){
        uint64_t s = dq.front(); dq.pop_front();
        uint8_t d = pdb[ Indexer<K>::rank(pat, s) ];
        for(int dir=0; dir<4; dir++){
            auto [ns, moved] = move_blank(s, dir);
            if(moved==0xFF) continue;
            uint8_t w = pat.has(moved) ? 1 : 0;

            uint64_t nk = Indexer<K>::rank(pat, ns);
            uint8_t nd = d + w;
            if(pdb[nk]==0xFF || nd < pdb[nk]){
                pdb[nk]=nd;
                if(w==0) dq.push_front(ns); else dq.push_back(ns);
            }
        }
    }
    return pdb;
}

// ------------ Persist (simple raw dump) ------------
static void save_raw(const string& path, const vector<uint8_t>& a){
    FILE* f = fopen(path.c_str(),"wb");
    if(!f) throw runtime_error("save_raw: open failed");
    fwrite(a.data(),1,a.size(),f);
    fclose(f);
}
static vector<uint8_t> load_raw(const string& path){
    FILE* f = fopen(path.c_str(),"rb");
    if(!f) throw runtime_error("load_raw: open failed");
    fseek(f,0,SEEK_END); long sz = ftell(f); fseek(f,0,SEEK_SET);
    vector<uint8_t> a(sz);
    fread(a.data(),1,sz,f);
    fclose(f);
    return a;
}

// ------------ One-shot build (run once offline) ------------
static void build_and_save_pdbs(){
    Pattern<7> p7(PAT7);
    Pattern<8> p8(PAT8);
    auto pdb7 = build_pdb(p7);
    auto pdb8 = build_pdb(p8);
    save_raw("pdb7.bin", pdb7);
    save_raw("pdb8.bin", pdb8);
}

// ------------ Heuristic lookup (sum of 7- and 8-PDB) ------------
int pdbHeuristics(uint64_t field){
    static bool inited=false;
    static Pattern<7> p7(PAT7);
    static Pattern<8> p8(PAT8);
    static vector<uint8_t> P7, P8;

    if(!inited){
        init_combinations();
        P7 = load_raw("pdb7.bin");
        P8 = load_raw("pdb8.bin");
        inited=true;
    }
    uint64_t k7 = Indexer<7>::rank(p7, field);
    uint64_t k8 = Indexer<8>::rank(p8, field);
    int h7 = (k7 < P7.size() && P7[k7]!=0xFF) ? P7[k7] : 0;
    int h8 = (k8 < P8.size() && P8[k8]!=0xFF) ? P8[k8] : 0;
    return h7 + h8; // admissible + additive
}