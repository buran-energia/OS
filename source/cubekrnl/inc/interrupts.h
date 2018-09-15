#ifndef _INTERRUPTS_H_
#define _INTERRUPTS_H_

#define SYSCALL_VECTOR    0x30

extern void interrupt_0();
extern void interrupt_1();
extern void interrupt_2();
extern void interrupt_3();
extern void interrupt_4();
extern void interrupt_5();
extern void interrupt_6();
extern void interrupt_7();
extern void interrupt_8();
extern void interrupt_9();
extern void interrupt_10();
extern void interrupt_11();
extern void interrupt_12();
extern void interrupt_13();
extern void interrupt_14();
extern void interrupt_15();
extern void interrupt_16();
extern void interrupt_17();
extern void interrupt_18();
extern void interrupt_19();
extern void interrupt_20();
extern void interrupt_21();
extern void interrupt_22();
extern void interrupt_23();
extern void interrupt_24();
extern void interrupt_25();
extern void interrupt_26();
extern void interrupt_27();
extern void interrupt_28();
extern void interrupt_29();
extern void interrupt_30();
extern void interrupt_31();
extern void interrupt_32();
extern void interrupt_33();
extern void interrupt_34();
extern void interrupt_35();
extern void interrupt_36();
extern void interrupt_37();
extern void interrupt_38();
extern void interrupt_39();
extern void interrupt_40();
extern void interrupt_41();
extern void interrupt_42();
extern void interrupt_43();
extern void interrupt_44();
extern void interrupt_45();
extern void interrupt_46();
extern void interrupt_47();
extern void interrupt_48(); /* SYSCALL_VECTOR 0x30 */

static void (* interrupts[])() = 
{
        interrupt_0,
        interrupt_1,
        interrupt_2,
        interrupt_3,
        interrupt_4,
        interrupt_5,
        interrupt_6,
        interrupt_7,
        interrupt_8,
        interrupt_9,
        interrupt_10,
        interrupt_11,
        interrupt_12,
        interrupt_13,
        interrupt_14,
        interrupt_15,
        interrupt_16,
        interrupt_17,
        interrupt_18,
        interrupt_19,
        interrupt_20,
        interrupt_21,
        interrupt_22,
        interrupt_23,
        interrupt_24,
        interrupt_25,
        interrupt_26,
        interrupt_27,
        interrupt_28,
        interrupt_29,
        interrupt_30,
        interrupt_31,
        interrupt_32,   /* irq 0 */
        interrupt_33,
        interrupt_34,
        interrupt_35,
        interrupt_36,
        interrupt_37,
        interrupt_38,
        interrupt_39,
        interrupt_40,
        interrupt_41,
        interrupt_42,
        interrupt_43,
        interrupt_44,
        interrupt_45,
        interrupt_46,
        interrupt_47,  /* irq 15 */
};

#endif

