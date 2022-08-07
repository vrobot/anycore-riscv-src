/*******************************************************************************
#                        NORTH CAROLINA STATE UNIVERSITY
#
#                              AnyCore Project
# 
# AnyCore written by NCSU authors Rangeen Basu Roy Chowdhury and Eric Rotenberg.
# 
# AnyCore is based on FabScalar which was written by NCSU authors Niket K. 
# Choudhary, Brandon H. Dwiel, and Eric Rotenberg.
# 
# AnyCore also includes contributions by NCSU authors Elliott Forbes, Jayneel 
# Gandhi, Anil Kumar Kannepalli, Sungkwan Ku, Hiran Mayukh, Hashem Hashemi 
# Najaf-abadi, Sandeep Navada, Tanmay Shah, Ashlesha Shastri, Vinesh Srinivasan, 
# and Salil Wadhavkar.
# 
# AnyCore is distributed under the BSD license.
*******************************************************************************/
/*Definitions for different fields of RISCV instructions */

`define SIZE_OPCODE_P             7  /*Major OPCODE size in spec */

`define SIZE_FUNCT3               3  /*Funct3 (minor opcode) */
`define SIZE_FUNCT7               7  /*Funct7 (minor opcode) */
`define SIZE_FUNCT12              12 /*Funct12 (minor opcode) */

`define REG_ZERO 0                  /* Integer reg 0 is tied to 0 */
`define REG_RETURN_ADDRESS 1        /* Return address register is integer reg 1 */ 

// In RISCV, the positions of RS1, RS2 and RD are same across all
// instructions.
`define RD_HI 11
`define RD_LO 7                           
`define RS1_HI 19
`define RS1_LO 15                          
`define RS2_HI 24
`define RS2_LO 20

`define FUNCT3_HI 14
`define FUNCT3_LO 12
`define FUNCT3_SIGN 14
`define FUNCT3_SIZE_HI 13                          
`define FUNCT3_SIZE_LO 12
`define FUNCT7_HI 31
`define FUNCT7_LO 25
`define FUNCT5_HI 31  //used in FP insns
`define FUNCT5_LO 27
`define FUNCT12_HI 31
`define FUNCT12_LO 20
`define FMT_HI 26  //used in FP insns
`define FMT_LO 25
`define SHAMT_HI 25  //Shift amounti used in shift instructions
`define SHAMT_LO 20

//`define IMM_U_SHIFT  12
//`define IMM_UJ_SHIFT 1

`define SLL_SRL_SRA_SHAMT_64 6
`define SLL_SRL_SRA_SHAMT_32 5

`define SIZE_S_SIG 23
`define SIZE_S_EXP 8
`define SIZE_SINGLE   (`SIZE_S_SIG+`SIZE_S_EXP+1)

`define SIZE_D_SIG 52
`define SIZE_D_EXP 11
`define SIZE_DOUBLE   (`SIZE_D_SIG+`SIZE_D_EXP+1)

`define RM_HI      14
`define RM_LO      12

`define UINT32_MIN    32'h0000_0001
`define UINT64_MIN    64'h0000_0000_0000_0001

`define SIZE_WORD     32
`define SIZE_LONG     64


/* RISCV instruction format */
`define SIZE_IMMEDIATE          32
`define SIZE_TARGET             26
`define SIZE_RS                 5
`define SIZE_RD                 5

/* Major OPCODE definitions */

`define OP_LUI              7'h37
`define OP_AUIPC            7'h17
`define OP_JAL              7'h6f
`define OP_JALR             7'h67
`define OP_BRANCH           7'h63
`define OP_LOAD             7'h03
`define OP_STORE            7'h23
`define OP_OP_IMM           7'h13
`define OP_OP_IMM_32        7'h1b
`define OP_OP               7'h33
`define OP_OP_32            7'h3b
`define OP_SYSTEM           7'h73
`define OP_MADD             7'h43
`define OP_MSUB             7'h47
`define OP_NMSUB            7'h4b
`define OP_NMADD            7'h4f
`define OP_OP_FP            7'h53
`define OP_LOAD_FP          7'h07
`define OP_STORE_FP         7'h27
`define OP_MISC_MEM         7'h0f

/* Minor OPCODE specified by funct3 */
`define FN3_BEQ             3'h0
`define FN3_BNE             3'h1
`define FN3_BLT             3'h4
`define FN3_BGE             3'h5
`define FN3_BLTU            3'h6
`define FN3_BGEU            3'h7

`define FN3_ADD_SUB         3'h0
`define FN3_SLT             3'h2
`define FN3_SLTU            3'h3
`define FN3_XOR             3'h4
`define FN3_OR              3'h6
`define FN3_AND             3'h7
`define FN3_SLL             3'h1
`define FN3_SR              3'h5

`define FN3_MUL             3'h0
`define FN3_MULH            3'h1
`define FN3_MULHSU          3'h2
`define FN3_MULHU           3'h3
`define FN3_DIV             3'h4
`define FN3_DIVU            3'h5
`define FN3_REM             3'h6
`define FN3_REMU            3'h7

`define FN3_SC_SB           3'h0
`define FN3_RW              3'h1
`define FN3_SET             3'h2
`define FN3_CLR             3'h3
`define FN3_RW_IMM          3'h5
`define FN3_SET_IMM         3'h6
`define FN3_CLR_IMM         3'h7

`define FN3_LB              3'h0
`define FN3_LH              3'h1
`define FN3_LW              3'h2
`define FN3_LBU             3'h4
`define FN3_LHU             3'h5
`define FN3_LWU             3'h6
`define FN3_LD              3'h3

`define FN3_SB              3'h0
`define FN3_SH              3'h1
`define FN3_SW              3'h2
`define FN3_SD              3'h3

`define FMT_S               2'b00
`define FMT_D               2'b01

`define FN3_FMV             3'h0
`define FN3_FEQ             3'h2
`define FN3_FLT             3'h1
`define FN3_FLE             3'h0
`define FN3_FCLASS          3'h1

`define RS2_FCVT_W          3'h0
`define RS2_FCVT_WU         3'h1
`define RS2_FCVT_L          3'h2
`define RS2_FCVT_LU         3'h3

`define RM_RNE              3'b000
`define RM_RTZ              3'b001
`define RM_RDN              3'b010
`define RM_RUP              3'b011
`define RM_RMM              3'b100
`define RM_DYN              3'b111

`define FN3_FSGNJ           3'h0
`define FN3_FSGNJN          3'h1
`define FN3_FSGNJX          3'h2
`define FN3_FMIN            3'h0
`define FN3_FMAX            3'h1

/* Minor OPCODE specified by funct7 */
`define FN7_MUL_DIV         7'h01
`define FN7_SRL             7'h00
`define FN7_SRA             7'h20
`define FN7_ADD             7'h00
`define FN7_SUB             7'h20

/* Minor OPCODE specified by funt5 for FP insns*/
`define FN5_FADD            5'h00
`define FN5_FSUB            5'h01
`define FN5_FMUL            5'h02
`define FN5_FDIV            5'h03
`define FN5_FSQRT           5'h07
`define FN5_FSGNJ           5'h04
`define FN5_FMIN_MAX        5'h05
`define FN5_FCVT_FP2I       5'h18
`define FN5_FMV_FP2I        5'h1c
`define FN5_FCOMP           5'h14
`define FN5_FCVT_I2FP       5'h1a
`define FN5_FMV_I2FP        5'h1e


/* Minor OPCODE specified by funct12 for SYSTEM insns */
`define FN12_SCALL          12'h000
`define FN12_SBREAK         12'h001
`define FN12_SRET           12'h102
`define FN12_MRET           12'h302

/* CSR addresses */
/* Unprivileged Floating-Point CSRs */
`define CSR_FFLAGS          12'h001 
`define CSR_FRM             12'h002
`define CSR_FCSR            12'h003
/* Unprivileged Counter/Timers */
`define CSR_CYCLE           12'hc00
`define CSR_TIME            12'hc01
`define CSR_INSTRET         12'hc02
/* Supervisor CSRs */
`define CSR_SSTATUS         12'h100
`define CSR_SIE             12'h104
`define CSR_STVEC           12'h105
`define CSR_SCOUNTEREN      12'h106
`define CSR_SSCRATCH        12'h140
`define CSR_SEPC            12'h141
`define CSR_SCAUSE          12'h142
`define CSR_STVAL           12'h143
`define CSR_SIP             12'h144
`define CSR_SATP            12'h180
/* Machine Level CSRs */
`define CSR_MVENDORID       12'hf11
`define CSR_MARCHID         12'hf12
`define CSR_MIMPID          12'hf13
`define CSR_MHARTID         12'hf14
`define CSR_MSTATUS         12'h300
`define CSR_MISA            12'h301
`define CSR_MEDELEG         12'h302
`define CSR_MIDELEG         12'h303
`define CSR_MIE             12'h304
`define CSR_MTVEC           12'h305
`define CSR_MCOUNTEREN      12'h306
`define CSR_MSCRATCH        12'h340
`define CSR_MEPC            12'h341
`define CSR_MCAUSE          12'h342
`define CSR_MTVAL           12'h343
`define CSR_MIP             12'h344
`define CSR_MTINST          12'h34a
`define CSR_MTVAL2          12'h34b
`define CSR_MENVCFG         12'h30a
`define CSR_PMPCFG0         12'h3A0
`define CSR_PMPCFG2         12'h3A2
`define CSR_PMPADDR0        12'h3B0
`define CSR_PMPADDR1        12'h3B1
`define CSR_PMPADDR2        12'h3B2
`define CSR_PMPADDR3        12'h3B3
`define CSR_PMPADDR4        12'h3B4
`define CSR_PMPADDR5        12'h3B5
`define CSR_PMPADDR6        12'h3B6
`define CSR_PMPADDR7        12'h3B7
`define CSR_PMPADDR8        12'h3B8
`define CSR_PMPADDR9        12'h3B9
`define CSR_PMPADDR10       12'h3BA
`define CSR_PMPADDR11       12'h3BB
`define CSR_PMPADDR12       12'h3BC
`define CSR_PMPADDR13       12'h3BD
`define CSR_PMPADDR14       12'h3BE
`define CSR_PMPADDR15       12'h3BF
`define CSR_MCYCLE          12'hB00
`define CSR_MINSTRET        12'hB02
/*Original CSR addresses*/
//`define CSR_FFLAGS          12'h001
//`define CSR_FRM             12'h002
//`define CSR_FCSR            12'h003
`define CSR_STATS           12'h0c0
`define CSR_SUP0            12'h500
`define CSR_SUP1            12'h501
`define CSR_EPC             12'h502
`define CSR_BADVADDR        12'h503
`define CSR_PTBR            12'h504
`define CSR_ASID            12'h505
`define CSR_COUNT           12'h506
`define CSR_COMPARE         12'h507
`define CSR_EVEC            12'h508
`define CSR_CAUSE           12'h509
`define CSR_STATUS          12'h50a
`define CSR_HARTID          12'h50b
`define CSR_IMPL            12'h50c
`define CSR_FATC            12'h50d
`define CSR_SEND_IPI        12'h50e
`define CSR_CLEAR_IPI       12'h50f
`define CSR_RESET           12'h51d
`define CSR_TOHOST          12'h51e
`define CSR_FROMHOST        12'h51f
`define CSR_CYCLE           12'hc00
//`define CSR_TIME            12'hc01
//`define CSR_INSTRET         12'hc02
`define CSR_CYCLEH          12'hc80
`define CSR_TIMEH           12'hc81
`define CSR_INSTRETH        12'hc82

// SSTATUS CSR BITS
`define SSTATUS_SIE   64'h0000000000000002
`define SSTATUS_SPIE  64'h0000000000000020
`define SSTATUS_UBE   64'h0000000000000040
`define SSTATUS_SPP   64'h0000000000000100
`define SSTATUS_FS    64'h0000000000006000
`define SSTATUS_XS    64'h0000000000018000
`define SSTATUS_SUM   64'h0000000000040000
`define SSTATUS_MXR   64'h0000000000080000
`define SSTATUS_UXL   64'h0000000300000000
`define SSTATUS_SD    64'h8000000000000000

// MSTATUS CSR BITS
`define MSTATUS_SIE   64'h0000000000000002
`define MSTATUS_MIE   64'h0000000000000008
`define MSTATUS_SPIE  64'h0000000000000020
`define MSTATUS_UBE   64'h0000000000000040
`define MSTATUS_MPIE  64'h0000000000000080
`define MSTATUS_SPP   64'h0000000000000100
`define MSTATUS_VS    64'h0000000000000600
`define MSTATUS_MPP   64'h0000000000001800
`define MSTATUS_FS    64'h0000000000006000
`define MSTATUS_XS    64'h0000000000018000
`define MSTATUS_MPRV  64'h0000000000020000
`define MSTATUS_SUM   64'h0000000000040000
`define MSTATUS_MXR   64'h0000000000080000
`define MSTATUS_TVM   64'h0000000000100000
`define MSTATUS_TW    64'h0000000000200000
`define MSTATUS_TSR   64'h0000000000400000
`define MSTATUS_UXL   64'h0000000300000000
`define MSTATUS_SXL   64'h0000000D00000000
`define MSTATUS_SBE   64'h0000001000000000
`define MSTATUS_MBE   64'h0000002000000000
`define MSTATUS_SD    64'h8000000000000000

// SXL = UXL = 2'b10 for 64 bit
`define MSTATUS_UXL_64   64'h0000000200000000
`define MSTATUS_SXL_64   64'h0000000800000000

`define SR_S              64'h0000000000000001
`define SR_PS             64'h0000000000000002
`define SR_EI             64'h0000000000000004
`define SR_PEI            64'h0000000000000008
`define SR_EF             64'h0000000000000010
`define SR_U64            64'h0000000000000020
`define SR_S64            64'h0000000000000040
`define SR_VM             64'h0000000000000080
`define SR_EA             64'h0000000000000100
`define SR_IM             64'h0000000000FF0000
`define SR_IP             64'h00000000FF000000
`define SR_IM_SHIFT       16
`define SR_IP_SHIFT       24
`define SR_ZERO           64'hFFFFFFFF0000FE00

`define IRQ_COP           2
`define IRQ_IPI           5
`define IRQ_HOST          6
`define IRQ_TIMER         7

// interrupt bits in MIE/MIP CSR registers
`define IRQ_S_SOFT        1
`define IRQ_M_SOFT        3
`define IRQ_S_TIMER       5
`define IRQ_M_TIMER       7
`define IRQ_S_EXT         9
`define IRQ_M_EXT        11

`define MIP_SSIP (1 << `IRQ_S_SOFT)
`define MIP_MSIP (1 << `IRQ_M_SOFT)
`define MIP_STIP (1 << `IRQ_S_TIMER)
`define MIP_MTIP (1 << `IRQ_M_TIMER)
`define MIP_SEIP (1 << `IRQ_S_EXT)
`define MIP_MEIP (1 << `IRQ_M_EXT)

`define IMPL_SPIKE        1
`define IMPL_ROCKET       2

// page table entry (PTE) fields
`define PTE_V             64'h0000000000000001 // Entry is a page Table descriptor
`define PTE_T             64'h0000000000000002 // Entry is a page Table, not a terminal node
`define PTE_G             64'h0000000000000004 // Global
`define PTE_UR            64'h0000000000000008 // User Write permission
`define PTE_UW            64'h0000000000000010 // User Read permission
`define PTE_UX            64'h0000000000000020 // User eXecute permission
`define PTE_SR            64'h0000000000000040 // Supervisor Read permission
`define PTE_SW            64'h0000000000000080 // Supervisor Write permission
`define PTE_SX            64'h0000000000000100 // Supervisor eXecute permission
`define PTE_PERM          (`PTE_SR | `PTE_SW | `PTE_SX | `PTE_UR | `PTE_UW | `PTE_UX)

`define RISCV_PGLEVELS      3
`define RISCV_PGSHIFT       13
`define RISCV_PGLEVEL_BITS  10
`define RISCV_PGSIZE        (1 << `RISCV_PGSHIFT)


/* Supervisory Register File Sizes */
`define CSR_WIDTH_LOG           12
`define CSR_WIDTH         64


`define CSR_STATUS_MASK   (64'h00000000ffffffff & ~`SR_EA & ~`SR_ZERO)
`define CSR_FFLAGS_MASK   64'h000000000000001f
`define CSR_FRM_MASK      64'h00000000ffffffff
`define CSR_COMPARE_MASK  64'h00000000ffffffff


`define EXCEPTION_CAUSE_LOG      4
`define CAUSE_MISALIGNED_FETCH        4'h0
`define CAUSE_FAULT_FETCH             4'h1
`define CAUSE_ILLEGAL_INSTRUCTION     4'h2
`define CAUSE_BREAKPOINT              4'h3
`define CAUSE_MISALIGNED_LOAD         4'h4
`define CAUSE_FAULT_LOAD              4'h5
`define CAUSE_MISALIGNED_STORE        4'h6
`define CAUSE_FAULT_STORE             4'h7
`define CAUSE_ECALL_UMODE             4'h8
`define CAUSE_ECALL_SMODE             4'h9
`define CAUSE_ECALL_MMODE             4'hb
`define CAUSE_INST_PAGE_FAULT         4'hc
`define CAUSE_LOAD_PAGE_FAULT         4'hd
`define CAUSE_STORE_PAGE_FAULT        4'hf

//`define CAUSE_MISALIGNED_FETCH        4'h0
//`define CAUSE_FAULT_FETCH             4'h1
//`define CAUSE_ILLEGAL_INSTRUCTION     4'h2
`define CAUSE_PRIVILEGED_INSTRUCTION  4'h3
`define CAUSE_FP_DISABLED             4'h4
`define CAUSE_SYSCALL                 4'h6
//`define CAUSE_BREAKPOINT              4'h7
//`define CAUSE_MISALIGNED_LOAD         4'h8
//`define CAUSE_MISALIGNED_STORE        4'h9
//`define CAUSE_FAULT_LOAD              4'ha
//`define CAUSE_FAULT_STORE             4'hb
`define CAUSE_ACCELERATOR_DISABLED    4'hc
`define CAUSE_CSR_INSTRUCTION         4'hd


/* TODO Anil : Should we have a Toggle insn */ 
/* Instruction to test liveness of a chip */
`define TOGGLE_S        16'he0
`define TOGGLE_C        16'he1

/* CSR masks */
localparam logic [`CSR_WIDTH-1:0] MIE_MASK = (
  `MIP_SSIP |
  `MIP_STIP |
  `MIP_SEIP |
  `MIP_MSIP |
  `MIP_MTIP |
  `MIP_MEIP );

// MSIP, MTIP and MEIP bits are read only in MIP.
localparam logic [`CSR_WIDTH-1:0] MIP_MASK = (
  `MIP_SSIP |
  `MIP_STIP |
  `MIP_SEIP );

localparam logic [`CSR_WIDTH-1:0] MIDELEG_MASK = (
  `MIP_SSIP |
  `MIP_STIP |
  `MIP_SEIP );

localparam logic [`CSR_WIDTH-1:0] MEDELEG_MASK = (
  (1 << `CAUSE_MISALIGNED_FETCH ) |
  (1 << `CAUSE_BREAKPOINT       ) |
  (1 << `CAUSE_ECALL_UMODE      ) |
  (1 << `CAUSE_INST_PAGE_FAULT  ) |
  (1 << `CAUSE_LOAD_PAGE_FAULT  ) |
  (1 << `CAUSE_STORE_PAGE_FAULT ) );

localparam logic [`CSR_WIDTH-1:0] SSTATUS_READ_MASK = (
  `SSTATUS_SIE  |
  `SSTATUS_SPIE |
  `SSTATUS_UBE  |
  `SSTATUS_SPP  |
  `SSTATUS_FS   |
  `SSTATUS_XS   |
  `SSTATUS_SUM  |
  `SSTATUS_MXR  |
  `SSTATUS_UXL  |
  `SSTATUS_SD   );

localparam logic [`CSR_WIDTH-1:0] SSTATUS_WRITE_MASK = (
  `SSTATUS_SIE  |
  `SSTATUS_SPIE |
  `SSTATUS_SPP  |
  `SSTATUS_FS   |
  `SSTATUS_SUM  |
  `SSTATUS_MXR  );

typedef enum logic [1:0] {
    USER_PRIVILEGE = 2'b00,
    SUPERVISOR_PRIVILEGE = 2'b01,
    //reserved
    MACHINE_PRIVILEGE = 2'b11
} privilege_t;

/* status CSR fields */
typedef enum logic [1:0] {
    XLEN_32  = 2'b01,
    XLEN_64  = 2'b10,
    XLEN_128 = 2'b11
} xlen_e;

typedef enum logic [1:0] {
    Off     = 2'b00,
    Initial = 2'b01,
    Clean   = 2'b10,
    Dirty   = 2'b11
} xs_t;

typedef struct packed {
    logic         sd;     // signal dirty state - read-only
    logic [62:36] wpri4;  // writes preserved reads ignored
    xlen_e        sxl;    // variable supervisor mode xlen - hardwired to zero
    xlen_e        uxl;    // variable user mode xlen - hardwired to zero
    logic [8:0]   wpri3;  // writes preserved reads ignored
    logic         tsr;    // trap sret
    logic         tw;     // time wait
    logic         tvm;    // trap virtual memory
    logic         mxr;    // make executable readable
    logic         sum;    // permit supervisor user memory access
    logic         mprv;   // modify privilege - privilege level for ld/st
    xs_t          xs;     // extension register - hardwired to zero
    xs_t          fs;     // floating point extension register
    privilege_t   mpp;    // holds the previous privilege mode up to machine
    logic [1:0]   wpri2;  // writes preserved reads ignored
    logic         spp;    // holds the previous privilege mode up to supervisor
    logic         mpie;   // machine interrupts enable bit active prior to trap
    logic         wpri1;  // writes preserved reads ignored
    logic         spie;   // supervisor interrupts enable bit active prior to trap
    logic         upie;   // user interrupts enable bit active prior to trap - hardwired to zero
    logic         mie;    // machine interrupts enable
    logic         wpri0;  // writes preserved reads ignored
    logic         sie;    // supervisor interrupts enable
    logic         uie;    // user interrupts enable - hardwired to zero
} status_t;
