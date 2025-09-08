.text
.globl main
main:

    li   $t0, 2005    
    li   $t1, 2006     

    add  $t2, $t0, $t1

    move $a0, $t2        
    li   $v0, 1          
    syscall

    li   $v0, 10
    syscall

	