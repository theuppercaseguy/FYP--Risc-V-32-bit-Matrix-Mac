

# RISC-V 32-bit MATRIX MAC Processor

Hardware-Based Acceleration of Matrix MAC on an FPGA

<div align="left">  

<a href="https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac/master/LICENSE"><img src="https://img.shields.io/github/license/elangosundar/awesome-README-templates?color=2b9348" alt="License Badge"/></a></div>

## Project Description

This project aims to develop a hardware-based acceleration solution for matrix multiply-accumulate (MAC) operations. We are designing a RISC-V-based processor with a custom instruction set architecture (ISA) optimized for efficient matrix MAC computations. By incorporating dedicated hardware accelerators and advanced optimization techniques, our goal is to enhance the performance and power efficiency of matrix operations, particularly in the context of machine learning and scientific computing applications.



## Team Members

- [Saad Khan](https://www.linkedin.com/in/saad-k-7aba04138/)
- [Zaeem Shakir](https://www.linkedin.com/in/syed-zaeem-shakir-85b82125b/)
- [Mahnoor Maleeka](https://www.linkedin.com/in/mahnoormaleeka/)


## Coordinators

- [Dr. Fahad Bin Muslim](https://www.linkedin.com/in/fahadbinmuslim/)
- [Dr. Waqar Ahmed](https://orcid.org/0000-0001-9850-9339)
<!--- [Dr. Taj Muhammad](https://www.linkedin.com/in/taj-muhammad-khan-6a1833281/)-->

## Poster
<p float="left">
  <img src="POSTER DESIGN/FINALISED POSTERS/RISCV Matrix MAC Processor with UART Transciver.png" width="300" height="450" /> 
  <img src="POSTER DESIGN/FINALISED POSTERS/INTELLERA.png" width="300" height="450" />
</p>

## MATRIX MAC IMPLEMENTATION

### RISC-V (5 Staged Pipelined) MATRIX MAC Processor.
<p float="left">
  <img src="docs/presentation-4/Material/5 staged piplined processor with hazard unit and matrix mac unit.png"  width="700" height="500" /> 
</p>

### MAC MODULE
<p float="left">
  <img src="docs/presentation-4/Material/MATRIX MAC MODULE.png"   width="700" height="400"/> 
</p>

### MAC DECODER
<p float="left">
  <img src="docs/presentation-4/Material/MAC Decoder picture V2.png"  width="700" height="400"/> 
</p>  

### MAC INSTRUCTION SET ARCHITECTURE
<p float="left">
  <img src="docs/presentation-4/Material/MATRIX MAC ISA.png" width="700" height="500" /> 
</p>    

## Resources


### Books

| Book Title | Author | Book Link | Video Lectures |
|------------|--------|------|------|
| (The Morgan Kaufmann Series in Computer Architecture and Design) - Computer Organization and Design RISC-V Edition.     |  David A. Patterson, John L. Hennessy | [Link 1](https://libgen.is/book/index.php?md5=373C67B0C5E22C9B92B1D8FACDC47E68) | [Link 1](https://youtube.com/playlist?list=PLOVoOfrWyZkek19Z0KoK0TBRdN2cy92ER) |
| Digital Design and Computer Architecture, Second Edition (2012, Morgan Kaufmann).     | David Harris, Sarah Harris -  | [Link 1](https://libgen.is/book/index.php?md5=A0759FE57A183C40967F5C563082581D) | None Found Yet |

Although the exact edition doesn't matter, just use the latest as possible.


### Softwares

| Name | Purpose |Description | Link |
|-------------|-------------|--------------------------|------|
| Xilinx Vivado | Writing Veriloge | To write and simulate the whole code, The Main Software of our whole Project. important!! Install while keeping the internet off, and install the Design suite.  | [Link 1](https://getintopc.com/softwares/design/xilinx-vivado-design-suite-2018-free-download/) |
| RISC-V Online Simulator| RISC-V Simulation |Use it to write RISC_V Assembly code and easly convert it to hex and test it alongside our/your processor |[link 1](https://venus.cs61c.org/) |
|DigitalUS Online| Generating Schematics |To generate and simulate Schematics for modules online through Verilog code directly|[link 1](https://digitaljs.tilk.eu/)|
|MarkDown Editor|Live Readme Files Editor| used to create and edit Readme Files. | [link 1](https://markdownlivepreview.com/) |
|Jira|Software Development| Used for agile software development, Tasks division, and a complete Backlog|[link 1](https://www.atlassian.com/software/jira)|

### Online Learning Sources

| Source Name | Description | Link |
|-------------|-------------|------|
| Verilog in 2 Hours    | Understanding of Verilog, How to Write it and How to Use It | [Link 1](https://youtu.be/nblGw37Fv8A) 
| RISC-V Single Cycle Core Implementation    | Verilog implementation of MERL Architecture, in ENGLISH & Urdu, Quiete good for understanding modules Like ALU, CU, etc  | [Link 2](https://youtube.com/playlist?list=PL5AmAh9QoSK7Fwk9vOJu-3VqBng_HjGFc) |
|RISC-V Pipeline Implementation|MERL Architecture Pipeline Implementation In Urdu & English |[Link 3](https://youtu.be/9_l6vWEZ5uE)|
|RISC-V Online Course| A complete and perfect course for understanding the RISC-V architecture and its implementation. week-3 to week-10 preferred.|[link 4](https://inst.eecs.berkeley.edu/~cs61c/fa20/)|
| Introduction to FPGA    | Understand of FPGA and Verilog and how to use them together. | [Link 5](https://youtu.be/lLg1AgA2Xoo) |
| RISC-V Core | A 32-bit RISC-V core written in Verilog and an instruction set simulator supporting RV32IM. | [Link 6](https://github.com/ultraembedded/riscv)
| RISC-V Pipelined Core | Pipeline version of the above core. | [Link 7](https://github.com/ultraembedded/biriscv)
| RISC-V Matrix Extension Specification | This is a matrix extension proposal for AI applications under RISC-V architecture. The extension has the following features. | [Link 8](https://github.com/T-head-Semi/riscv-matrix-extension-spec) |
| Tiny Matrix Extension using RISC-V Custom Instructions | a processor that accelerates matrix multiplication using RISC-V custom instructions, implements it on an FPGA board and evaluates its performance. | [Link 9](https://www.luffca.com/2022/09/tiny-matrix-extension/)

## Objectives


| Objectives | Date Started | Date Completed | Achived? | Version | Test's |
|-------------------|------|------|------|-----|-----|
| Single Cycle Processor    | 1-July-2023 | 27-July-2023 | True | 2.0 | [Test-1](docs/github_readmes/Single_Cycle_tests.md) |
| 5 stages Pipelined Processor    | 10-Aug-2023 | 29-Oct-2023 | True | 3.0 | [Test-2](docs/github_readmes/Pipline_tests.md)|
|Matrix MAC Module | 10-Nov-2023 | 30-Dec-2023 | True | 1.0 | [Test-3](docs/github_readmes/Matrix_MAC_tests.md) |
|RISC V Matrix MAC Processor | 05-Jan-2024 | 05-Feb-203 | True | 1.0 | [Test-4](docs/github_readmes/RISCV_MAT_MAC_tests.md) |
|FPGA Implementation|10-Feb-2023 | 23-Mar-2024 | True | 1.0 | [Test-5](docs/github_readmes/FPGS_tests.md) |

### RISC-V Essential Registers

<p float="left">
  <img src="/docs/Media/SingleCycle/RISC-V-Essential-Registers.png" width="500" />
</p>

### RISC-V Register File / Instruction Types
<p float="left">
  <img src="docs/Media/SingleCycle/RISC-V-Intruction-Types.png" width="500" />
</p>


## 5 Stage Pipelined Blocks/DataPath:

### 
<table border="">
        <tr>
            <th>FETCH_CYCLE</th>
            <th>DECODE_CYCLE</th>
            <th>EXECUTE_CYCLE</th>
            <th>MEMORY_CYCLE</th>
            <th>WRITEBACK_CYCLE</th>
        </tr>
        <tr>
            <td>PC Mux</td>
            <td>Control Unit</td>
            <td>AND GATE</td>
            <td>Data Memory</td>
            <td>MUX</td>
        </tr>
        <tr>
            <td>Program Counter</td>
            <td>Register File</td>
            <td>MUX</td>
            <td>Memory Stage Registers  </td>
            <td>-</td>
        </tr>
        <tr> 
            <td>Adder</td>
            <td>Extender</td>
            <td>PC ADDER</td>
            <td>-</td>
            <td>-</td>
        </tr>
        <tr>
            <td>Instruction Memory</td>
            <td>Deocde Stage Registers</td>
            <td>ALU</td>
            <td>-</td>
            <td>-</td>
        </tr>
        <tr>
            <td>-</td>
            <td>-</td>
            <td>Execute Stage Registers</td>
            <td>-</td>
            <td>-</td>
        </tr>
    </table>

<br><br>
## [Notes](docs/github_readmes/Notes.md)
<br><br>
## [Meetings Schedule](docs/github_readmes/MeetingsSchedulre.md)
<br><br>
## [Issues](docs/github_readmes/Issues.md)
<br><br>
## :pencil: License

This project is licensed under [MIT](https://opensource.org/licenses/MIT) license.

## :man_astronaut: Show your support

Give a ⭐️ if this project helped you!

<p align="center"><i>Loved the project? Please visit our <a href="https://portfolio-saadkhan.vercel.app/">Website</a></i></p>








