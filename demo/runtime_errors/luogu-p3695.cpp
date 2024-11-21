/*
 * @file: show a powerful out-of-bound runtime check usage
 * URL: https://www.luogu.com.cn/discuss/1001080
 * Author: ajrawa@luogu (UID: 523641)
 *
 * After run `fkccf ./demo/runtime_errors/luogu-p3695.cpp`, \
 * you will find error in function `string read(char endchar);`
 *
 * This is a runtime out-of-bound check example.
 */

#include <bits/stdc++.h>
using namespace std;
char c[1000800];
int ptr;

string read(char endc = '\n')
{
    string res = "";
    for (; res.empty() || (c[ptr] != '\n' && c[ptr] != endc); ptr++)
        if (c[ptr] != ' ' && c[ptr] != '\n')
            res += c[ptr];
    return ++ptr, res;
}

void eat()
{
    int cnt = 1;
    for (; cnt; ptr++)
    {
        if (c[ptr] == '{')
            cnt++;
        if (c[ptr] == '}')
            cnt--;
    }
    ptr++;
}

struct arr
{
    int l, r;
    vector<int> v;
    int &operator[](int x)
    {
        return v[x - l];
    }
    void set(int L, int R)
    {
        l = L, r = R, v.resize(R - L, 0);
    }
};

map<string, int> Var;
map<string, arr> Arr;

int calc(string);
void solve();

int &getvar(string s)
{
    if (s.find('[') == s.npos)
        return Var[s];
    else
    {
        string arr, pos;
        bool flag = false;
        for (char c : s)
        {
            if (c == '[')
            {
                flag = 1;
                continue;
            }
            if (c == ']' || c == ' ')
                continue;
            flag ? pos += c : arr += c;
        }
        return Arr[arr][calc(pos)];
    }
}

int calc(string s)
{
    string a, b, o;
    char opr = ' ';
    int flag = 0, isnum = 1, f = 1;
    if (s[0] == '-')
        f = -1, s = s.substr(1);
    if (s[0] == '+')
        f = 1, s = s.substr(1);
    for (char c : s)
    {
        if (c == ' ')
            continue;
        if (c == '+' || c == '-')
        {
            if (flag == 0)
            {
                flag = 1, opr = c;
                continue;
            }
            if (flag == 1)
                flag = 2;
        }
        if (flag == 0)
            a += c, isnum &= isdigit(c);
        if (flag == 1)
            b += c;
        if (flag == 2)
            o += c;
    }
    if (opr == ' ')
        return (isnum ? stoi(a) : getvar(a)) * f;
    int A = calc(a) * f, B = calc(b);
    int c = opr == '+' ? A + B : A - B;
    return calc(to_string(c) + o);
}

void vars()
{
    while (1)
    {
        string name = read(':');
        if (name == "}")
            break;
        string type = read('[');
        if (type == "int")
            continue;
        type = read(',');
        int l = calc(read('.'));
        ptr++;
        int r = calc(read(']'));
        ptr++;
        Arr[name].set(l, r);
    }
}

bool check(string opr, int a, int b)
{
    if (opr == "lt")
        return a < b;
    if (opr == "gt")
        return a > b;
    if (opr == "le")
        return a <= b;
    if (opr == "ge")
        return a >= b;
    if (opr == "eq")
        return a == b;
    if (opr == "neq")
        return a != b;
    return false;
}

void ihu()
{
    string opr = read(',');
    int A = calc(read(','));
    int B = calc(read('\n'));
    check(opr, A, B) ? solve() : eat();
}

void hor()
{
    string name = read(',');
    int L = calc(read(','));
    int R = calc(read('\n'));
    int tmp = ptr;
    for (int i = L; i <= R; i++)
    {
        Var[name] = i;
        solve();
        ptr = tmp;
    }
    eat();
}

void While()
{
    string opr = read(',');
    string ep1 = read(',');
    string ep2 = read('\n');
    int tmp = ptr;
    while (check(opr, calc(ep1), calc(ep2)))
    {
        solve();
        ptr = tmp;
    }
    eat();
}

void solve()
{
    //	cerr << "enter! " << c[ptr] << ' ' << (int)c[ptr] << endl;
    while (c[ptr])
    {
        string op = read(' ');
        if (op == "}")
            return;
        if (op == "{")
        {
            op = read(' ');
            //			cerr << "op1: " << op << endl;
            if (op == "vars")
                vars();
            if (op == "ihu")
                ihu();
            if (op == "hor")
                hor();
            if (op == "while")
                While();
        }
        else
        {
            op = op.substr(1);
            //			cerr << "op2: " << op << endl;
            if (op == "set")
            {
                string var = read(',');
                string val = read('\n');
                getvar(var) = calc(val);
            }
            if (op == "yosoro")
            {
                string exp = read('\n');
                cout << calc(exp) << ' ';
            }
        }
    }
    //	cerr << "return " << (int)c[ptr] << endl;
}

signed main()
{
    cin.tie(nullptr)->sync_with_stdio(false);
    for (int i = 0; cin.get(c[i]); i++)
        ;
    solve();
    return 0;
}
