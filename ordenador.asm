.data
vetor: .word 4, 3, 9, 5, 2, 1
tamanho: .word 6

.text
.globl main

main:
    la $t0, vetor
    lw $t1, tamanho
    
    li $t2, 0
loop_externo:
    beq $t2, $t1, imprimir
    
    li $t3, 0
    sub $t4, $t1, $t2
    subi $t4, $t4, 1
    
loop_interno:
    beq $t3, $t4, proximo_i
    
    sll $t5, $t3, 2
    add $t6, $t0, $t5
    addi $t7, $t6, 4
    
    lw $t8, 0($t6)
    lw $t9, 0($t7)
    
    ble $t8, $t9, nao_troca
    
    sw $t9, 0($t6)
    sw $t8, 0($t7)
    
nao_troca:
    addi $t3, $t3, 1
    j loop_interno
    
proximo_i:
    addi $t2, $t2, 1
    j loop_externo

imprimir:
    li $t2, 0
    la $t0, vetor
    
loop_imprime:
    beq $t2, $t1, fim
    
    sll $t3, $t2, 2
    add $t4, $t0, $t3
    lw $a0, 0($t4)
    li $v0, 1
    syscall
    
    addi $t5, $t1, -1
    beq $t2, $t5, sem_virgula
    li $a0, 44
    li $v0, 11
    syscall
    
sem_virgula:
    addi $t2, $t2, 1
    j loop_imprime

fim:
    li $v0, 10
    syscall