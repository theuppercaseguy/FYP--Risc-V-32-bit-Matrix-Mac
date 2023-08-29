# RISC-V Project

This repository contains the implementation and testing of RISC-V Single Cycle Processor:

## Single Cycle Processor

In this section, you'll find the details of the Single Cycle Processor implementation and its instruction set architecture (ISA).

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


<pre>
    <ol>
<li>    git clone "https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac"
    cd "Project/Single_Cycle_Processor_V_1.2/"
    code memfile.hex</li>
<li>    //write code in hex file,  at the top write "@00000000".
    ex://start of the hex file
        @00000000
        00F00093
        00A00113
        19000513
        002081B3
        40208233 </li>
<li>    In Simultaion Sources, Make "Single_Cycle_Top_SimSet" Active!!!</li>
<li>    Run behavioriual Simulation</li>
<li>    In TCL Console, Type "run 3500". To increase the timeline and to execute the remaining instructions.</li></ol>
    

    
</pre>

## [hex file](../../Project/Single_Cycle_Processor_V_1.2/ALL_Instr_Test.hex) : (Successfully) Tested Code
| ASSEMBLY-CODE | HEX-CODE |
|------------------------|-----------|
|addi x1, x0, -20       |   FEC00093 |
|li x2,  -2             |FFE00113    |
|li x31, 512            |20000F93    |
|add     x3,x1,x2       |002081B3    |
|sub     x4,x1,x2       |40208233    |
|sub     x5,x2,x1       |401102B3    |
|mul     x6,x1,x2       |02208333    |
|mul     x7,x5,x2       |022283B3    |
|and     x8,x1,x2       |0020F433    |
|or      x9,x1,x2       |0020E4B3    |
|xor     x10, x1,x2     |0020C533    |
|slt     x11,x2,x1      |001125B3    |
|slli    x12, x1, 3     |00309613    |
|srli    x13, x2, 3     |00315693    |
|sw      x3,   0(x31)   |003FA023    |
|sw      x4,  -1(x31)   |FE4FAFA3    |
|sw      x5,  -2(x31)   |FE5FAF23    |
|sw       x6,  -3(x31)  |FE6FAEA3    |
|sw       x7,  -4(x31)  |FE7FAE23    |
|sw       x8,  -5(x31)  |FE8FADA3    |
|sw       x9,  -6(x31)  |FE9FAD23    |
|sw       x10, -7(x31)  |FEAFACA3    |
|sw       x11, -8(x31)  |FEBFAC23    |
|sw       x12, -9(x31)  |FECFABA3    |
|sw       x13, -10(x31) |FEDFAB23    |
|beq       x1,x1 test1  |02108C63    |
|test2: lw x14,  0(x31) |000FA703    |
|lw       x15, -1(x31)  |FFFFA783    |
|lw       x16, -2(x31)  |FFEFA803    |
|lw       x17, -3(x31)  |FFDFA883    |
|lw       x18, -4(x31)  |FFCFA903    |
|lw       x19, -5(x31)  |FFBFA983    |
|lw       x20, -6(x31)  |FFAFAA03    |
|lw       x21, -7(x31)  |FF9FAA83    |
|lw       x22, -8(x31)  |FF8FAB03    |
|lw       x23, -9(x31)  |FF7FAB83    |
|lw       x24, -10(x31) |FF6FAC03    |
|lw       x25, -11(x31) |FF5FAC83    |
|bne      x2,x1, end    |00111663    |
|test1: lw x30,  0(x31) |000FAF03    |
|bge      x2, x1, test2 |FC1154E3    |
|end: ecall             |00000073    |



