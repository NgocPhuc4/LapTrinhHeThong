.section .data
	str1:
		.string "Enter number (1-digit): "
	str2: 
		.string "The average is: "
.section .bss
	.lcomm num1, 2
	.lcomm num2, 2
	.lcomm num3, 2
	.lcomm num4, 2
	.lcomm average, 2
.section .text
	.globl _start
_start:
	# Xuat chuoi yeu cau nhap so
	movl $24, %edx
	movl $str1, %ecx
	movl $1, %ebx
	movl $4, %eax
	int  $0x80
	
	
	# Nhap vao so thu nhat
	movl $0, %ebx
	movl $3, %eax
	movl $num1, %ecx
	movl $2, %edx
	int $0x80
	
	# Xuat chuoi yeu cau nhap so
	movl $24, %edx
	movl $str1, %ecx
	movl $1, %ebx
	movl $4, %eax
	int  $0x80
	
	
	# Nhap vao so thu hai
	movl $0, %ebx
	movl $3, %eax
	movl $num2, %ecx
	movl $2, %edx
	int $0x80
	
	# Xuat chuoi yeu cau nhap so
	movl $24, %edx
	movl $str1, %ecx
	movl $1, %ebx
	movl $4, %eax
	int  $0x80
	
	
	# Nhap vao so thu ba
	movl $0, %ebx
	movl $3, %eax
	movl $num3, %ecx
	movl $2, %edx
	int $0x80
	
	# Xuat chuoi yeu cau nhap so
	movl $24, %edx
	movl $str1, %ecx
	movl $1, %ebx
	movl $4, %eax
	int  $0x80
	
	
	# Nhap vao so thu tu
	movl $0, %ebx
	movl $3, %eax
	movl $num4, %ecx
	movl $2, %edx
	int $0x80
	
	# Xuat ket qua ra man hinh
	movl $16, %edx
	movl $str2, %ecx
	movl $1, %ebx
	movl $4, %eax
	int  $0x80
	
	# Chuyen num1, num2, ... sang so
	subl $48, num1
	subl $48, num2
	subl $48, num3
	subl $48, num4
	
	# Tinh trung binh cong
	movl num1, %ecx
	addl num2, %ecx
	addl num3, %ecx
	addl num4, %ecx
	sarl $2, %ecx
	addl $48, %ecx
	movl %ecx, average
	
	
	# Xuat trung binh cong
	movl $1, %edx
	movl $average, %ecx
	movl $1, %ebx
	movl $4, %eax
	int  $0x80
		
	movl $1, %eax
	int  $0x80
