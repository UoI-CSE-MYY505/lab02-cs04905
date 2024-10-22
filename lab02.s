
.data

array: .word 1, 0, 1, 12, 0, 1, 4

.text

    la a0, array
    li a1, 7    # unsigned
    li a2, 1
prog:
#-----------------------------
  add t0 , zero , a1 #load size to t0
     slli t1, t0, 2    #offset
     add t2, a0, t1  #address of last element
     lw s1, 0(t2)

     addi t3, a0, -4  #out of bounds index for beq check
    
     add s0, zero, zero #init
    
     beq a1, zero, exit_not_found #check for empty array
loop: 
    beq t2, t3, exit_not_found
    bne a2, s1, else
    j exit_found



else:
    addi t2, t2, -4
    lw s1, 0(t2)
    j loop
    
exit_found:
    add s0, t2, zero
    j done
    
exit_not_found:
    add s0, zero, zero
    j done

#-----------------------------
done:
    addi a7, zero, 10 
    ecall
