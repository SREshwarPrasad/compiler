# 🔍 Compiler Design Project — Lex & Yacc + TAC + Parsing Engines

This project implements a basic compiler frontend using **Lex and Yacc** with features like:
- Keyword recognition (`if`, `while`, `for`, `switch`)
- Infix to prefix/postfix conversion
- Three-Address Code (TAC) generation
- Machine code simulation
- LL(1) and LR(1) parser simulation

---

## 📂 Components

### 1. Lex/Yacc Files
- **lexer.l**: Tokenizes the input code
- **parser.y**: Validates grammar rules for control structures
- **Features**:
  - Validates control structures (`if`, `while`, `for`, `switch`)
  - Outputs a basic machine code following Three Address Code

### 2. TAC Generator
- `tac_generator.c`: Converts valid expressions/statements to Three Address Code
- Includes prefix and postfix conversion

### 3. LL(1) & LR(1) Parser Simulators
- `ll1_parser.c`: Table-driven LL(1) parser
- `lr1_parser.c`: Shift-reduce LR(1) parser

---

## ⚙️ How to Run

```bash
lex -d file_name.l (or) lex file_name.l
yacc -d file_name.y
cc lex.yy.c y.tab.c
./a.out

input -> output

