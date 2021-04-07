# XEM 1 SO CO 3 CHU SO CO CAC CHU SO TANG DAN KHONG?

.section .data
	str1:
		.string "Enter a number (3-digit): "
	str2:
		.string "Tang dan"
	str3:
		.string "Khong tang dan"

.section .bss
	.lcomm num, 3

.section .text
	.globl _start
_start:
	# cout << str1;
	movl $26, %edx
	movl $str1, %ecx
	movl $1, %ebx
	movl $4, %eax
	int $0x80
	
	# lay gia tri tu input
	movl $0, %ebx
	movl $3, %eax
	movl $num, %ecx
	movl $4, %edx
	int $0x80
	
	# so sanh
	movb 2(%ecx), %al
	movb 1(%ecx), %bl
	movb (%ecx), %cl
	
	cmpb %al, %bl
	jg   .KTD
	cmpb %bl, %cl
	jg   .KTD
	
	# cout << str2;
	movl $8, %edx
	movl $str2, %ecx
	movl $1, %ebx
	movl $4, %eax
	int $0x80
	jmp .END

.KTD:
	# cout << str3;
	movl $14, %edx
	movl $str3, %ecx
	movl $1, %ebx
	movl $4, %eax
	int $0x80
.END:
	movl $1, %eax
	int $0x80
