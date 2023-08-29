# RISC-V Project

This repository contains the implementation and testing of RISC-V 32 Bit I, 5 stage Pipline Processor. With all type of Hazards Resolved:

## 5 Staged Piplined Processor

In this section, you'll find the details of the 5 Staged Piplined Processor implementation and its instruction set architecture (ISA).

### Instruction Set Architecture (ISA)

| Instruction | ALU Control | Opcode | Funct3 | Funct7 | Type   | Tested | Test Cases                   |
|-------------|--------|--------|--------|--------|--------|--------|-------------------------------    |
| ADD         | 00000 | 0110011 | 000    | 0000000| R-type | YES    | add x3, x1, x2                      |
| SUB         | 00001 | 0110011 | 000    | 0100000| R-type | YES    | sub x4, x1, x2 <br>sub x5,x2,x1     |
| MUL         | 00010 | 0110011 | 000    | 0000001| R-type | YES    | mul x6, x1, x2     |
| AND         | 00011 | 0110011 | 111    | 0000000| R-type | YES    | and x6, x1, x2                      |
| XOR         | 00101 | 0110011 | 100    | 0000000| R-type | YES    | xor x10, x1, x2                          |
| OR          | 00100 | 0110011 | 110    | 0000000| R-type | YES    | or x7, x1, x2                       |
| SLT         | 01100 | 0110011 | 010    | 0000000| R-type | YES    | slt x11, x2, x1                         |
| LW          |  N/A  | 0000011 | 010    | N/A    | I-type | Yes    | lw x25 -11(x31)<br>lw x12,  8(x10)|
| LI          |  N/A  | 0010011 | 000    | N/A    | I-type | Yes    | li x2, -2 <br>li x10, 400         |
| ADDi        |  N/A  | 0010011 | 000    | N/A    | I-type | Yes    | addi x1, x0, 15                   |
| SLLI        | 00110 | 0010011 | 001    | 0000000| I-type | Yes    | slli x12, x1, 3 |
| SRLI        | 00111 | 0010011 | 101    | 0000000| I-type | Yes    |srli x13, x2, 3       |
| SW          |  N/A  | 0100011 | 010    | N/A    | S-type | Yes    | sw x6, -3(x31)<br>sw x4,  8(x10)  |
| BGE         | 01000 | 1100011 | 101    | N/A    | B-type | YES    | bge x2, x1, -56                       |
| BEQ         | 01001 | 1100011 | 000    | N/A    | B-type | YES    | beq x1, x1, 56                           |
| BNE         | 01010 | 1100011 | 001    | N/A    | B-type | YES    |bne x2, x1, 12                          |
| BLT         | 01011 | 1100011 | 100    | N/A    | B-type | YES    | blt x2, x1, test2                          |
| ...         |  ...  | ...     | ...    | ...    | ...    | ...    | N/A                               |

### Instructions on how to Use the Processor:


<pre><ol>
<li>    git clone "https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac"
    cd "Project/Pipline_Five_v_2.0/"
    code memfile.hex</li>
<li>    //write code in hex file,  at the top write "@00000000".
    ex://start of the hex file
        @00000000
        00F00093
        00A00113
        19000513
        002081B3
        40208233 </li>
<li>    In Simultaion Sources, Make "Pipe_Top_TB" Active!!!</li>
<li>    Run behavioriual Simulation</li></ol>
    

    
</pre>

## [hex file](../../Project/Project/Pipline_Five_v_2.0/memfile.hex) : (Successfully) Tested Code
| ASSEMBLY-CODE | HEX-CODE |
|------------------------|-----------|
|addi x1, x0, 0xB       |00B00093
|li x2, 0xC             |00C00113
|addi x31, x0, 0x123    |12300F93
|addi x3, x0, 10        |00A00193
|addi x4, x0, 0         |00000213
|li x5, 0               |00000293
|sw x31, 512(x0)        |21F02023
|for:                   |Loc: 0x1c
|bge x4, x3, Done       |00325A63
|add x5, x5, x4         |004282B3
|addi x4, x4, 1         |00120213
|addi x30, x0, 1        |00100F13
|bne x3, x4, for        |FE4198E3
|Done:                  |Loc: 0x30
|add x3, x2, x1         |001101B3
|add x4, x3, x2         |00218233
|add x5, x2, x3         |003102B3
|and x6, x4, x3         |00327333
|or x7, x1, x6          |0060E3B3
|slt x8, x6, x1         |00132433
|sw x8, 516(x0)         |20802223
|lw x9, 512(x0)         |20002483
|add x10, x9, x1        |00148533
|sub x11, x10, x1       |401505B3
|sub x12, x10, x11      |40B50633
|lw x13, 512(x0)        |20002683
|add x14, x1, x13       |00D08733
|slli x15, x13, 3       |00369793
|srli x16, x15, 3       |0037D813




