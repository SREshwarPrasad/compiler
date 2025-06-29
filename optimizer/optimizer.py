def optimizer(exp):
    value_table={}
    for i,(target,expr) in enumerate(exp):
        if ' ' in expr:
            L,op,R=expr.split(' ')
            if (L.isdigit() and R.isdigit()):
                if(op=='+'):
                    exp[i]= (target,int(L)+int(R))
                if(op=='-'):
                    exp[i]= (target,int(L)-int(R))
                if(op=='*'):
                    exp[i]= (target,int(L)*int(R))
                if(op=='/'):
                    exp[i]= (target,int(L)/int(R))
            else:
                L_value= value_table.get(L,ord(L))
                R_value= value_table.get(R,ord(R))
                hashkey= (op, min(L_value, R_value), max(L_value,R_value))
                if hashkey in value_table:
                    exp[i] = (target, exp[value_table[hashkey]][0])
                    value_table[hashkey]=i
                else:
                    value_table[hashkey] = i
    value_table[target]=i
    return exp



expressions = [
    ('c1','a + b'),
    ('d2','a + b'),
    ('z3','8 + 5'),
    ('h4','x + y')
]

ans = optimizer(expressions)
for target, expr in ans:
    print(f"{target} = {expr}")

