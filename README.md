# RISC-V 32-bit MATRIX MAC Processor

Hardware-Based Acceleration of Matrix MAC on an FPGA

## Project Description

This project aims to develop a hardware-based acceleration solution for matrix multiply-accumulate (MAC) operations. We are designing a RISC-V-based processor with a custom instruction set architecture (ISA) optimized for efficient matrix MAC computations. By incorporating dedicated hardware accelerators and advanced optimization techniques, our goal is to enhance the performance and power efficiency of matrix operations, particularly in the context of machine learning and scientific computing applications.

## Team Members

- [Saad Khan](https://www.linkedin.com/in/saad-k-7aba04138/)
- [Zaeem Shakir](https://www.linkedin.com/in/syed-zaeem-shakir-85b82125b/)
- [Mahnoor Maleeka](https://www.linkedin.com/in/mahnoor-maleeka/)


## Coordinators

- [Dr. Fahad Bin Muslim](https://www.linkedin.com/in/fahadbinmuslim/)
- [Dr. Taj Muhammad](https://www.linkedin.com/in/taj-muhammad-khan-6a1833281/)

## Resources

### Books

| Book Title | Author | Book Link | Video Lectures |
|------------|--------|------|------|
| (The Morgan Kaufmann Series in Computer Architecture and Design) - Computer Organization and Design RISC-V Edition.     |  David A. Patterson, John L. Hennessy | [Link 1](https://libgen.is/book/index.php?md5=373C67B0C5E22C9B92B1D8FACDC47E68) | [Link 1](https://youtube.com/playlist?list=PLOVoOfrWyZkek19Z0KoK0TBRdN2cy92ER) |
| Digital Design and Computer Architecture, Second Edition (2012, Morgan Kaufmann).     | David Harris, Sarah Harris -  | [Link 1](https://libgen.is/book/index.php?md5=A0759FE57A183C40967F5C563082581D) | None Found Yet |

Although the exact edition doesn't matters, just use the as latest as possible.


### Softwares

| Software Name | Description | Link |
|-------------|-------------|------|
| Xilinx Vivado | To write and simulate the whole code, The Main Software of our whole Project. important!! Install while keeping the internet off, and install the Design suite.  | [Link 1](https://getintopc.com/softwares/design/xilinx-vivado-design-suite-2018-free-download/) |


### Online Learning Sources

| Source Name | Description | Link |
|-------------|-------------|------|
| Verilog in 2 Hours    | Understanding of Verilog, how to Write it and How to use it | [Link 1](https://youtu.be/nblGw37Fv8A) 
| RISC-V Single Cycle Core in Verilog    | Verilog implementation of different modules, in ENGLISH & Urdu, Quiete good for understanding modules Like ALU etc  | [Link 2](https://youtube.com/playlist?list=PL5AmAh9QoSK7Fwk9vOJu-3VqBng_HjGFc) |
| Introduction to FPGA    | Understand of FPGA and Verilogue and how to use them together. | [Link 3](https://youtu.be/lLg1AgA2Xoo) |
| RISC-V Core | A 32-bit RISC-V core written in Verilog and an instruction set simulator supporting RV32IM. | [Link 3](https://github.com/ultraembedded/riscv)
| RISC-V Pipelined Core | Pipeline version of the above core. | [Link 3](https://github.com/ultraembedded/biriscv)
| RISC-V Matrix Extension Specification | This is a matrix extension proposal for AI applications under RISC-V architecture. The extension has the following features. | [Link 3](https://github.com/T-head-Semi/riscv-matrix-extension-spec) |
| Tiny Matrix Extension using RISC-V Custom Instructions | a processor that accelerates matrix multiplication using RISC-V custom instructions, implemented it on an FPGA board and evaluated its performance. | [Link 3](https://www.luffca.com/2022/09/tiny-matrix-extension/)
## Objectives


| Objectives | Achived? | Date Completed |
|-------------------|------|------|
| Single Cycle Processor    | False | pending... |
| 5 stages Piplined Processor    | False | pending... |
| 10 Stages Piplined Processor    | False | pending... |


## Notes

##### By [Saad Khan](https://www.linkedin.com/in/saad-k-7aba04138/)
#
#


| S. No | Note |
|--------|----------------------------------|
0| risc-v have 5 steps: fetch >> decode >> exeucute >> mem ops (opt) >> writeback  (opt).|
1| Risc v preferers 5 stages pipelining, but usually 14 stages are preferred, we will try to achieve at least 10 stages |
2| Pipling have 3 types of hazards.|
3|A) Structural Hazard: When hardware cannot execute planned instruction because of hardware limitation in the next clock cycle. when the processor has a single memory, use separate instruction and data memory|
4|B) Data hazard: when data needed to execute an instruction is not yet available, use bypassing/forwarding to fix this.|
5|load-use data hazard: using data that isn't loaded yet, bubbles/wasted cycles are used to stall the computer so once the data gets loaded, then to use it|
6|C) Control Hazard: branching hazard, when needed to make a decision based on one instruction while others are executing, basically calculating whether to branch or not, while the next instruction gets executed. One solution is to stall until the branch condition gets calculated, good but slow. the best solution, predict branches!!!. Mostly take branches condition  as false, if you get wrong and the branch is actually true, just add delay to it|
7|Pipelining only improves throughput.|

##### By [Zaeem Shakir](https://www.linkedin.com/in/syed-zaeem-shakir-85b82125b/)
#
#
| S. No | Note |
|--------|----------------------------------|

##### By [Mahnoor Maleeka](https://www.linkedin.com/in/mahnoor-maleeka/)
#
#
| S. No | Note |
|--------|----------------------------------|







