	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  main:
	# BeginFunc 40
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 40	# decrement sp to make space for locals/temps
	# _tmp0 = 12
	  li $t2, 12		# load constant value 12 into $t2
	  sw $t2, -12($fp)	# spill _tmp0 from $t2 to $fp-12
	# PushParam _tmp0
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp0 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp1 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -16($fp)	# spill _tmp1 from $t2 to $fp-16
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp2 = Cow
	  la $t2, Cow	# load label
	  sw $t2, -20($fp)	# spill _tmp2 from $t2 to $fp-20
	# *(_tmp1) = _tmp2
	  lw $t0, -20($fp)	# fill _tmp2 to $t0 from $fp-20
	  lw $t2, -16($fp)	# fill _tmp1 to $t2 from $fp-16
	  sw $t0, 0($t2) 	# store with offset
	# betsy = _tmp1
	  lw $t2, -16($fp)	# fill _tmp1 to $t2 from $fp-16
	  sw $t2, -8($fp)	# spill betsy from $t2 to $fp-8
	# _tmp3 = 100
	  li $t2, 100		# load constant value 100 into $t2
	  sw $t2, -24($fp)	# spill _tmp3 from $t2 to $fp-24
	# _tmp4 = 122
	  li $t2, 122		# load constant value 122 into $t2
	  sw $t2, -28($fp)	# spill _tmp4 from $t2 to $fp-28
	# _tmp5 = *(betsy)
	  lw $t0, -8($fp)	# fill betsy to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -32($fp)	# spill _tmp5 from $t2 to $fp-32
	# _tmp6 = *(_tmp5)
	  lw $t0, -32($fp)	# fill _tmp5 to $t0 from $fp-32
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -36($fp)	# spill _tmp6 from $t2 to $fp-36
	# PushParam _tmp4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -28($fp)	# fill _tmp4 to $t0 from $fp-28
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill _tmp3 to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam betsy
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill betsy to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp6
	  lw $t0, -36($fp)	# fill _tmp6 to $t0 from $fp-36
	  jalr $t0            	# jump to function
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# _tmp7 = *(betsy)
	  lw $t0, -8($fp)	# fill betsy to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -40($fp)	# spill _tmp7 from $t2 to $fp-40
	# _tmp8 = *(_tmp7 + 4)
	  lw $t0, -40($fp)	# fill _tmp7 to $t0 from $fp-40
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -44($fp)	# spill _tmp8 from $t2 to $fp-44
	# PushParam betsy
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill betsy to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp8
	  lw $t0, -44($fp)	# fill _tmp8 to $t0 from $fp-44
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Cow.Init:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# *(this + 8) = w
	  lw $t0, 8($fp)	# fill w to $t0 from $fp+8
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 8($t2) 	# store with offset
	# *(this + 4) = h
	  lw $t0, 12($fp)	# fill h to $t0 from $fp+12
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 4($t2) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Cow.Moo:
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp9 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -8($fp)	# spill _tmp9 from $t2 to $fp-8
	# PushParam _tmp9
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill _tmp9 to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp10 = " "
	  .data			# create string constant marked with label
	  _string1: .asciiz " "
	  .text
	  la $t2, _string1	# load label
	  sw $t2, -12($fp)	# spill _tmp10 from $t2 to $fp-12
	# PushParam _tmp10
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp10 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp11 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -16($fp)	# spill _tmp11 from $t2 to $fp-16
	# PushParam _tmp11
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill _tmp11 to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp12 = "\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "\n"
	  .text
	  la $t2, _string2	# load label
	  sw $t2, -20($fp)	# spill _tmp12 from $t2 to $fp-20
	# PushParam _tmp12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -20($fp)	# fill _tmp12 to $t0 from $fp-20
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class Cow
	  .data
	  .align 2
	  Cow:		# label for class Cow vtable
	  .word _Cow.Init
	  .word _Cow.Moo
	  .text
  _PrintInt:
      subu $sp, $sp, 8	# decrement sp to make space to save ra,fp
      sw $fp, 8($sp)	# save fp
      sw $ra, 4($sp)	# save ra
      addiu $fp, $sp, 8	# set up new fp
      lw $a0, 4($fp)	# fill a to $t0 from $fp+4
    # LCall _PrintInt
      li $v0, 1
      syscall
    # EndFunc
    # (below handles reaching end of fn body with no explicit return)
      move $sp, $fp		# pop callee frame off stack
      lw $ra, -4($fp)	# restore saved ra
      lw $fp, 0($fp)	# restore saved fp
      jr $ra		# return from function

  _ReadInteger:
      subu $sp, $sp, 8	# decrement sp to make space to save ra,fp
      sw $fp, 8($sp)	# save fp
      sw $ra, 4($sp)	# save ra
      addiu $fp, $sp, 8	# set up new fp
      li $v0, 5
      syscall
    # EndFunc
    # (below handles reaching end of fn body with no explicit return)
      move $sp, $fp		# pop callee frame off stack
      lw $ra, -4($fp)	# restore saved ra
      lw $fp, 0($fp)	# restore saved fp
      jr $ra		# return from function


  _PrintBool:
          subu $sp, $sp, 8      # decrement sp to make space to save ra, fp
          sw $fp, 8($sp)        # save fp
          sw $ra, 4($sp)        # save ra
          addiu $fp, $sp, 8     # set up new fp
          lw $t1, 4($fp)        # fill a from $fp+4
      li $t2, 0
          li $v0, 4
      beq $t1, $t2, _PrintBoolFalse
      la $a0, _PrintBoolTrueString
      j _PrintBoolEnd
    _PrintBoolFalse:
    	  la $a0, _PrintBoolFalseString
    _PrintBoolEnd:
          syscall
        # EndFunc
        # (below handles reaching end of fn body with no explicit return)
          move $sp, $fp         # pop callee frame off stack
          lw $ra, -4($fp)       # restore saved ra
          lw $fp, 0($fp)        # restore saved fp
          jr $ra                # return from function

      .data			# create string constant marked with label
      _PrintBoolTrueString: .asciiz "true"
      .text

      .data			# create string constant marked with label
      _PrintBoolFalseString: .asciiz "false"
      .text

  _PrintString:
          subu $sp, $sp, 8      # decrement sp to make space to save ra, fp
          sw $fp, 8($sp)        # save fp
          sw $ra, 4($sp)        # save ra
          addiu $fp, $sp, 8     # set up new fp
          lw $a0, 4($fp)        # fill a from $fp+4
          li $v0, 4
          syscall
        # EndFunc
        # (below handles reaching end of fn body with no explicit return)
          move $sp, $fp         # pop callee frame off stack
          lw $ra, -4($fp)       # restore saved ra
          lw $fp, 0($fp)        # restore saved fp
          jr $ra                # return from function

  _Alloc:
    subu $sp, $sp, 8      # decrement sp to make space to save ra,fp
          sw $fp, 8($sp)        # save fp
          sw $ra, 4($sp)        # save ra
          addiu $fp, $sp, 8     # set up new fp
          lw $a0, 4($fp)        # fill a from $fp+4
          li $v0, 9
          syscall
        # EndFunc
        # (below handles reaching end of fn body with no explicit return)
          move $sp, $fp         # pop callee frame off stack
          lw $ra, -4($fp)       # restore saved ra
          lw $fp, 0($fp)        # restore saved fp
          jr $ra                # return from function

  _Halt:
          li $v0, 10
          syscall
        # EndFunc


  _StringEqual:
          subu $sp, $sp, 8      # decrement sp to make space to save ra, fp
          sw $fp, 8($sp)        # save fp
          sw $ra, 4($sp)        # save ra
          addiu $fp, $sp, 8     # set up new fp
          lw $a0, 4($fp)        # fill a from $fp+4
          lw $a1, 8($fp)        # fill a from $fp+8
        beq $a0,$a1,Lrunt10
        lbu  $a2,($a0)
        lbu  $a3,($a1)
        #addiu $a0,$a0,4
        #addiu $a1,$a1,4
        beq $a2,$a3,Lrunt11
  Lrunt13:
        li  $v0,0
        # EndFunc
        # (below handles reaching end of fn body with no explicit return)
          move $sp, $fp         # pop callee frame off stack
          lw $ra, -4($fp)       # restore saved ra
          lw $fp, 0($fp)        # restore saved fp
        j $ra
  Lrunt12:
        lbu  $t0,($a0)
        lbu  $t1,($a1)
        bne  $t0,$t1,Lrunt13
        beqz  $t0,Lrunt10
        addiu $a0,$a0,1
        addiu $a1,$a1,1
        addiu $a2,$a2,-1
  Lrunt11:
        bgez $a2,Lrunt12
  Lrunt10:
        li $v0,1
        # EndFunc
        # (below handles reaching end of fn body with no explicit return)
          move $sp, $fp         # pop callee frame off stack
          lw $ra, -4($fp)       # restore saved ra
          lw $fp, 0($fp)        # restore saved fp
          jr $ra                # return from function



  _ReadLine:
          subu $sp, $sp, 8      # decrement sp to make space to save ra, fp
          sw $fp, 8($sp)        # save fp
          sw $ra, 4($sp)        # save ra
          addiu $fp, $sp, 8     # set up new fp
          li $a0, 100
          li $v0, 9
          syscall
          addi $a0, $v0, 0
          li $v0, 8
          li $a1,100 
          syscall
          li $t0,0              # Set index to 0
  Lrunt21:
          addu $t1,$a0,$t0      # Load character at index
          lb $a3,($t1)          # Load character at index
          addi $t0,$t0,1        # Increment index
          bnez $a3,Lrunt21      # Loop until the end of string is reached
          beq $a1,$t0,Lrunt20   # Do not remove \n when string = maxlength
          sb $0,-1($t1)         # Add the terminating character in its place
  Lrunt20:
          addi $v0, $a0, 0
        # EndFunc
        # (below handles reaching end of fn body with no explicit return)
          move $sp, $fp         # pop callee frame off stack
          lw $ra, -4($fp)       # restore saved ra
          lw $fp, 0($fp)        # restore saved fp
          jr $ra                # return from function
