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
|MAC Instructions | False | pending... |
|FPGA Implementation| False | pending... |

## RISC-V Essential Registers

<p float="left">
  <img src="/docs/Media/RISC-V-Essential-Registers.png" width="500" />
  <img src="/docs/Media/RISC-V-Intruction-Types.png" width="500" />
</p>



## Notes

##### By [Saad Khan](https://www.linkedin.com/in/saad-k-7aba04138/)

<table>
  <tr>
    <th>S. No</th>
    <th>Note</th>
  </tr>
  <tr>
    <td>0</td>
    <td>RISC-V has 5 steps: fetch, decode, execute, memory ops (optional), writeback (optional).</td>
  </tr>
  <tr>
    <td>0.1</td>
    <td>
      <ul>
        <li>6 types (R, I, S, B, U, J) of instructions in RISC-V:</li>
        <ul>
          <li><b>R-Type</b>: An operation on registers (x5, x6).</li>
          <li> <b>I-Type</b>: Immediate instructions, where a constant is used, x5, 7.</li>
          <li> <b>S-Type</b>:</li>
          <li> <b>B-Type</b>:</li>
        </ul>
      </ul>
    </td>
  </tr>

  <tr>
    <td>1</td>
    <td>RISC-V prefers <b>5-stage pipelining</b>, but usually, 14 stages are preferred. We will try to achieve at least 10 stages.</td>
  </tr>
  <tr>
    <td>2</td>
    <td>Pipelining has 3 types of hazards.</td>
  </tr>
  <tr>
    <td>3</td>
    <td>
      <ul>
        <li>A) <b>Structural Hazard</b>: When hardware cannot execute planned instruction because of hardware limitation in the next clock cycle. When the processor has a single memory, use separate instruction and data memory.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>4</td>
    <td>
      <ul>
        <li>B) <b>Data Hazard</b>: When data needed to execute an instruction is not yet available, use bypassing/forwarding to fix this.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>5</td>
    <td>Note: Load-use data hazard: Using data that isn't loaded yet, bubbles/wasted cycles are used to stall the computer so once the data gets loaded, then to use it.</td>
  </tr>
  <tr>
    <td>6</td>
    <td>
      <ul>
        <li>C) <b>Control Hazard</b>: Branching hazard, when needed to make a decision based on one instruction while others are executing, basically calculating whether to branch or not, while the next instruction gets executed. One solution is to stall until the branch condition gets calculated, good but slow. The best solution is to predict branches!!! Mostly take branches' condition as false, if you get wrong and the branch is actually true, just add delay to it.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>7</td>
    <td>Note: Pipelining only improves throughput.</td>
  </tr>
  <tr>
    <td>8</td>
    <td><b> Temporal locality</b> : If a data location is referenced, it is likely to be referenced again.</td>
  </tr>
  <tr>
    <td>9</td>
    <td><b>Spatial locality</b>: If a data location is referenced, the location with nearby addresses will likely be referenced soon.</td>
  </tr>
  <tr>
    <td>10</td>
    <td>Memory hierarchy (Speed): SRAM &gt;&gt; DRAM &gt;&gt; Disk.</td>
  </tr>
  <tr>
    <td>11</td>
    <td>Memory hierarchy is of different levels, but we can only access 2 adjacent levels at a time.</td>
  </tr>
  <tr>
    <td>12</td>
    <td>Memories: SRAM -&gt; Cache, DRAM -&gt; Main Memory, flash/magnetic -&gt; secondary memory.</td>
  </tr>
</table>



##### By [Zaeem Shakir](https://www.linkedin.com/in/syed-zaeem-shakir-85b82125b/)

| S. No | Note |
|--------|----------------------------------|

##### By [Mahnoor Maleeka](https://www.linkedin.com/in/mahnoor-maleeka/)

| S. No | Note |
|--------|----------------------------------|







