.section .data
	msg:
		.string "Love UIT"
	msg_len = . -msg
output:
	.int msg_len
.section .text
	.globl _start
_start:
	addl $48, output
	subl $1, output
	
	movl $1, %edx
	movl $output, %ecx
	movl $4, %eax
	movl $1, %ebx
	int $0x80
	movl $1, %eax
	int $0x80
