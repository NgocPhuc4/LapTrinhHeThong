# RELEASE3
### Catalina
- Chạy thử chương trình:     
![image](https://user-images.githubusercontent.com/62021009/124372535-d0309180-dcb4-11eb-881a-1144dd838bbc.png)
- Sử dụng IDA pro để xem mã giả của chương trình:     
- Ta vào hàm main để xem:
```c
__int64 __fastcall main(int a1, char **a2, char **a3)
{
  __int64 result; // rax
  int v4; // ebx
  const char *v5; // r12
  size_t v6; // rax
  size_t v7; // rax
  char v8[32]; // [rsp+10h] [rbp-100h] BYREF
  __int64 v9[4]; // [rsp+30h] [rbp-E0h] BYREF
  char v10; // [rsp+50h] [rbp-C0h]
  int v11[34]; // [rsp+60h] [rbp-B0h]
  const char *v12; // [rsp+E8h] [rbp-28h]
  int v13; // [rsp+F4h] [rbp-1Ch]
  int i; // [rsp+F8h] [rbp-18h]
  int v15; // [rsp+FCh] [rbp-14h]

  if ( a1 == 2 )
  {
    v12 = "JTQSRyZKSB05Dh9JgH6fQJIVjJ04UpA7ezxMIHcvpX6X70NJHW4xlxSHHMuLDjCJbzl9ITfgeLbTDLExZENyYrAzn7ehjAMuZf1siTB4HBLgyJ"
          "gpK38LHCq4UvpgqOxeoh72AVgDOYS8HU9xg";
    v11[0] = 4;
    v11[1] = 4;
    v11[2] = 5;
    v11[3] = 4;
    v11[4] = 2;
    v11[5] = 4;
    v11[6] = 3;
    v11[7] = 4;
    v11[8] = 2;
    v11[9] = 4;
    v11[10] = 6;
    v11[11] = 2;
    v11[12] = 4;
    v11[13] = 6;
    v11[14] = 2;
    v11[15] = 5;
    v11[16] = 5;
    v11[17] = 2;
    v11[18] = 3;
    v11[19] = 3;
    v11[20] = 5;
    v11[21] = 4;
    v11[22] = 2;
    v11[23] = 3;
    v11[24] = 4;
    v11[25] = 2;
    v11[26] = 2;
    v11[27] = 3;
    v11[28] = 3;
    v11[29] = 2;
    v11[30] = 4;
    v11[31] = 5;
    v9[0] = 0LL;
    v9[1] = 0LL;
    v9[2] = 0LL;
    v9[3] = 0LL;
    v10 = 0;
    v15 = 0;
    for ( i = 0; i <= 31; ++i )
    {
      *((_BYTE *)v9 + i) = v12[v15];
      v15 += v11[i] + 1;
    }
    sub_1482(v9, v8, 32LL);
    v15 = 0;
    v13 = 0;
    while ( v15 <= 23 )
    {
      v8[v15] ^= 0x41u;
      v4 = (unsigned __int8)v8[v15];
      v5 = a2[1];
      v6 = strlen(v5);
      if ( v6 >= v15 )
        v7 = v15;
      else
        v7 = strlen(a2[1]);
      v13 += v4 == v5[v7];
      ++v15;
    }
    if ( v13 == 24 )
      puts("Congratulations !! you solved the first challenge.");
    else
      puts("Invalid flag, try again");
    result = 0LL;
  }
  else
  {
    puts("Welcome to crackme N1");
    printf("Usage:\n%s <password>\n", *a2);
    result = 0xFFFFFFFFLL;
  }
  return result;
}
```
- Mục tiêu của ta là để in ra dòng Congratulations.... Để vào được dòng này thì v13 phải bằng 24. Nghĩa là 24 kí tự của v4 bằng v5. Mà v4 bằng với chuỗi v8, còn v5 chính là chuỗi ta nhập vào
- Đặt breakpoint và cho chạy xong vòng while thì ta tìmm ra được v8 =  `flag{2020_sana_sa3ida:)}`    
![image](https://user-images.githubusercontent.com/62021009/124372615-c52a3100-dcb5-11eb-8e0b-f40852ffb647.png)    
- Kết quả:     
![image](https://user-images.githubusercontent.com/62021009/124372629-da9f5b00-dcb5-11eb-88f6-3b701624c9de.png)      
------
### ZED - Frequency
- Chạy thử chương trình    
![image](https://user-images.githubusercontent.com/62021009/124379780-2fa59600-dce3-11eb-9515-62d02a6f6f92.png)
- Sử dụng IDA để xem mã giả của chương trình, đây là hàm main()    
![image](https://user-images.githubusercontent.com/62021009/124379873-bfe3db00-dce3-11eb-95df-d7594f7d180f.png)
![image](https://user-images.githubusercontent.com/62021009/124379881-d12ce780-dce3-11eb-9d88-7df82280f310.png)
- Mục tiêu của ta là in được chuỗi `you succeed!!`, để in được chuỗi này thì `s1 = 01234567890123456789012345`, mà chuỗi s1 chính mã ascii của v8
- Dòng 12 nếu khi chạy trình không nhập thêm tham số thì chương trình sẽ in ra dòng chữ và thoát
- Dòng 17: chương trình sẽ đọc file với đường dẫn là tham số mình nhập vào
- Vòng while từ dòng 20 đến 34: Điều kiện dừng vòng lặp: Khi đọc hết file v5
    - Điều kiện dòng 25 sẽ kiểm tra xem kí tự trong v5 có phải là chữ hoa hay không
    - Nếu là chữ hoa thì sẽ quy ước 'A' tương ứng với chỉ số 0, 'B' tương ứng với chỉ số 1,....
    - Nếu là chữ thường thì tương tự: 'a' tương ứng với chỉ số 0, 'b' tương ứng với chỉ số 1.....
    - v8 sẽ đếm số lần xuất hiện của các chữ cái theo quy ước ở trên, ví dụ A xuất hiện 3 lần thì v8[0] = 3....
    - Như vậy, mảng v8 sẽ lưu tần suất xuất hiện của các chữ cái trong file
-  Theo mảng s1 ở dòng 43 thì ta có thể suy ra được nội dung của file:
    - A: xuất hiện 0 lần
    - B: 1 lần...................
- Tạo 1 file trong thư mục ZED-Frequency nội dung file như sau
`BCCDDDEEEEFFFFFGGGGGGHHHHHHHIIIIIIIIJJJJJJJJJLMMNNNOOOOPPPPPQQQQQQRRRRRRRSSSSSSSSTTTTTTTTTVWWXXXYYYYZZZZZ`
- Ở đây nội dung file có thể là khác nhau miễn đảm bảo được tần suất xuất hiện các chữ cái là chính xác.
- Đặt tên file là `key.txt` và chạy thử chương trình:      
![image](https://user-images.githubusercontent.com/62021009/124380403-a5f7c780-dce6-11eb-91ff-fd3484106aa3.png)
---
