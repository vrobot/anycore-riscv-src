// This package contains the CSR masks and riscv structs
package riscv_structs;
  `include "CommonConfig.h"
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


  // MISA
  localparam logic [`CSR_WIDTH-1:0] MISA_VAL = (
    (`MISA_A << 0)  |
    (`MISA_C << 2)  |
    (`MISA_D << 3)  |
    (`MISA_E << 4)  |
    (`MISA_F << 5)  |
    (`MISA_H << 7)  |
    (`MISA_I << 8)  |
    (`MISA_M << 12) |
    (`MISA_Q << 16) |
    (`MISA_S << 18) |
    (`MISA_U << 20) |
    (`MISA_V << 21) |
    (`MISA_X << 23) |
    ( 2'b10  << 62) );  // MXL

endpackage
