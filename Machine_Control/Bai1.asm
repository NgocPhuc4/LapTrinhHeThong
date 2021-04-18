// x at %ebp+8, y at %ebp+12
1. movl $0, -4(%ebp) // result
2. movl 8(%ebp), %ecx // ecx = x
3. movl 12(%ebp), %ebx // ebx = y
4. cmpl $1, %ebx // so sanh y voi 1
5. jne  .END // neu khong bang 1 thi nhay toi .END
6. cmpl %ebx, %ecx  // so sanh x va y
7. je   .END // neu x =y thi nhay toi .END
8. movl %ecx, -4(%ebp) // result = x
9. addl %ebx, -4(%ebp) // result = x+y
10. .END
11. movl -4(%ebp), %eax // eax = result