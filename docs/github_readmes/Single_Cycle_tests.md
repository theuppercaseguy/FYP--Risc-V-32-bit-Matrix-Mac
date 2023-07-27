# RISC-V Project

This repository contains the implementation and testing of RISC-V Single Cycle Processor:

## Single Cycle Processor

In this section, you'll find the details of the Single Cycle Processor implementation and its instruction set architecture (ISA).

### Instruction Set Architecture (ISA)

| Instruction | ALU Control | Opcode | Funct3 | Funct7 | Type   | Tested | Test Cases                   |
|-------------|--------|--------|--------|--------|--------|--------|-------------------------------    |
| ADD         | 00000 | 0110011 | 000    | 0000000| R-type | YES    | add x3,x1,x2                      |
| SUB         | 00001 | 0110011 | 000    | 0100000| R-type | YES    | sub x4,x1,x2 <br>sub x5,x2,x1     |
| AND         | 00010 | 0110011 | 111    | 0000000| R-type | YES    | and x6,x1,x2                      |
| XOR         | N/A   | 0110011 | 100    | 0000000| R-type | No     | N/A                               |
| OR          | 00011 | 0110011 | 110    | 0000000| R-type | YES    | or x7,x1,x2                       |
| SLT         | 00101 | 0110011 | 010    | 0000000| R-type | No     | N/A                               |
| LI          |  N/A  | 0010011 | 000    | N/A    | I-type | Yes    | li x2, 10 <br>li x10, 400         |
| ADDi        |  N/A  | 0010011 | 000    | N/A    | I-type | Yes    | addi x1, x0, 15                   |
| LW          |  N/A  | 0000011 | 010    | N/A    | I-type | Yes    | lw x11,  4(x10)<br>lw x12,  8(x10)|
| SW          |  N/A  | 0100011 | 010    | N/A    | S-type | Yes    | sw x3,  4(x10)<br>sw x4,  8(x10)  |
| BEQ         |  N/A  | 1100011 | 000    | N/A    | B-type | NO     | N/A                               |
| ...         |  ...  | ...     | ...    | ...    | ...    | ...    | N/A                               |


## hex file: (Successfully) Tested Code
| ASSEMBLY-CODE | HEX-CODE |
|-------------------|---------------|
|addi x1, x0, 15    |   00F00093    |
|li x2, 10          |   00A00113    |
|li x10, 400        |   19000513    |
|add x3,x1,x2       |   002081B3    |
|sub x4,x1,x2       |   40208233    |
|sub x5,x2,x1       |   401102B3    |
|and x6,x1,x2       |   0020F333    |
|or x7,x1,x2        |   0020E3B3    |
|sw x3,  4(x10)     |   00352223    |
|sw x4,  8(x10)     |   00452423    |
|sw x5,  12(x10)    |   00552623    |
|sw x6,  16(x10)    |   00652823    |
|sw x7,  20(x10)    |   00752A23    |
|lw x11,  4(x10)    |   00452583    |
|lw x12,  8(x10)    |   00852603    |
|lw x13,  12(x10)   |   00C52683    |
|lw x14,  16(x10)   |   01052703    |
|lw x15,  20(x10)   |   01452783    |

### Instructions on how to Use the processor:

<pre>
    git clone "https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac"
    cd "Project/Single_Cycle_Processor_V_1.2/"
    code memfile.hex
    
    //write code in hex file,  at the top write "@00000000".
    ex://start of hex file
        @00000000
        00F00093
        00A00113
        19000513
        002081B3
        40208233
</pre>

