.section .data
	msg:
		.string "Love UIT"
	msg_len = . -msg
output:
	.int msg_len
.section .text
	.globl _start
_start:
	# Chuyen so sang ki tu, loai bo ki tu null
	addl $48, output
	subl $1, output
	
	movl $1, %edx                  # do dai chuoi duoc in ra
	movl $output, %ecx             #chuoi duoc in ra
	movl $4, %eax                  #sys_write
	movl $1, %ebx                  # file descriptor stdout
	int $0x80                      #call kernel
	movl $1, %eax                  #sys_exit
	int $0x80                      # call kernel
