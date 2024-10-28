

    .section .vectors
vectors:
    .word 0x20001000     // Initial stack pointer
    .word Reset_Handler  // Reset vector
    .word Dummy_Handler  // NMI Handler
    .word Dummy_Handler  // Hard Fault Handler
    .word Dummy_Handler  // MemManage handler
    .word Dummy_Handler  // Bus Fault Handler
    .word Dummy_Handler  // Usage fault handler
    .word Dummy_Handler  // Reserved
    .word Dummy_Handler  // Reserved
    .word Dummy_Handler  // Reserved
    .word Dummy_Handler  // Reserved
    .word Dummy_Handler  // SVC Handler
    .word Dummy_Handler  // Debug Monitor Handler
    .word Dummy_Handler  // Reserved 
    .word Dummy_Handler  // PendSV Handler
    .word Dummy_Handler  // SysTick Handler


    .text
    .global Reset_Handler

Reset_Handler:
    b Reset_Handler

Dummy_Handler:
    b Dummy_Handler



