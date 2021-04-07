# KIEM TRA CHU HOA CHU THUONG

.section .bss
	.lcomm char, 1
.section .data
	Nhap:
		.string "Moi nhap vao 1 ki tu: "
	chuHoa:
		.string "Chu hoa"
	chuThuong:
		.string "Chu thuong"
	khac:
		.string "Ki tu vua nhap khong phai la chu cai"

.section .text
	.globl _start
_start:
	# Xuat chuoi Moi nhap ki tu
	movl $22, %edx
	movl $Nhap, %ecx
	movl $1, %ebx
	movl $4, %eax
	int $0x80

	# Nhap ki tu tu ban phim
	movl $0, %ebx
	movl $3, %eax
	movl $char, %ecx
	movl $2, %edx
	int $0x80
	
	# Kiem tra xem ki tu vua nhap co lon nam trong khoang ki tu khong (65-90, 97-122)
	movb char, %cl
	cmpb $65, %cl
	jl  .notChar
	
	cmpb $122, %cl
	jg   .notChar
	
	# Kiem tra char voi 97, neu lon hon la ki tu thuong
	# Nguoc lai neu nho hon 90 la ki tu hoa
	cmpb $97, %cl
	jge  .thuong
	
	
	cmpb $90, %cl
	jg   .notChar
	
	#in ra ki tu hoa
	movl $7, %edx
	movl $chuHoa, %ecx
	movl $1, %ebx
	movl $4, %eax
	int $0x80
	jmp  .END

.notChar:
	movl $36, %edx
	movl $khac, %ecx
	movl $1, %ebx
	movl $4, %eax
	int $0x80
	jmp .END
.thuong:
	movl $10, %edx
	movl $chuThuong, %ecx
	movl $1, %ebx
	movl $4, %eax
	int $0x80
.END:
	movl $1, %eax
	int $0x80
