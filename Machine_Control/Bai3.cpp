//x at %ebp+12, y at %ebp+16, n at %ebp+8
1. movl 8(%ebp), %eax // eax  = n
2. movb %al, -20(%ebp) // ebp +20 = n
3. movl $0, -4(%ebp) // z = 0
4. movsbl -20(%ebp), %eax // eax = n (mo rong dau)
5. subl $42, %eax // eax = eax - 42
6. cmpl $7, %eax // so sanh eax voi 7
7. ja .L2 // neu eax lon hon 7 thi nhay vao nhan L2
8. movl .L4(,%eax,4), %eax // nhay vao jumpTable
9. jmp *%eax // (switch(n))
10. .L5:
11. movl 12(%ebp), %edx // edx = x
12. movl 16(%ebp), %eax // eax = y
13. addl %edx, %eax //y = y +x
14. movl %eax, -4(%ebp) // z = y + x
15. jmp .L10
16. .L6:
17. movl 12(%ebp), %eax // eax = x
18. subl 16(%ebp), %eax // x = x - y
19. movl %eax, -4(%ebp) // z = x - y 
20. jmp .L10
21. .L3:
22. movl 12(%ebp), %eax // eax = x
23. imull 16(%ebp), %eax // x = x * y
24. movl %eax, -4(%ebp) // z = x * y
25. jmp .L10
26. .L7:
27. movl 12(%ebp), %eax // eax = x
28. cltd 
29. idivl 16(%ebp) // eax = y/x; edx = y%x
30. movl %eax, -4(%ebp) // z= y/x
31. jmp .L10
32. .L8:
33. movl 12(%ebp), %eax // eax = x
34. movl %eax, -4(%ebp) // z = x
35. jmp .L10
36. .L9:
37. movl 16(%ebp), %eax // eax = y
38. movl %eax, -4(%ebp) // z = y
39. jmp .L10
40. .L2:
41. movl $1, -4(%ebp) // z = 1
42. .L10:
43. movl -4(%ebp), %eax // eax = z
44. leave
45. ret

int function(char n, int x, int y)
{
	int z = 0;
	n = n - 42;
	switch(n)
	{
		case 0: // .L3
			z = x *y;
			break;
		case 1: // .L5
			z = x +y;
			break;
		case 3:  // .L6
			z = x - y;
			break;
		case 5: // .L7
			z = y / x;
			break;
		case 6: // .L8
			z = x;	
			break;
		case 7: // .L9
			z = y;
			break;
		default: //.L2
			z = 1;
	}
	return z;
}