// a at %ebp+8, b at %ebp+12, c at %ebp+16
1. movl $0, -4(%ebp) // sum = 0
2. movl 8(%ebp), %eax // eax = a
3. movl 12(%ebp), %ebx // ebx =b
4. movl 16(%ebp), %ecx // ecx = c
5. cmpl $0, %ecx // so sanh c voi 0
7. jl  .Compute // neu c nho hon 0 thi nhay vao Compute
8. cmpl %eax, %ebx // so sanh a va b
9. jne .END // neu a khac b thi nhay vao END
10. .Compute
11. andl %eax, %ebx // b = a & b
12. xorl %ebx, %ecx // c = (a&b)^c
13. movl %ecx, -4(%ebp) // sum = c
14. .END
15. movl -4(%ebp), %eax // eax = sum
