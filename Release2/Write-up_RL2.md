### racecars
- Chạy thử file thì thấy file in ra dòng:       
![image](https://user-images.githubusercontent.com/62021009/121220259-a7340100-c8ae-11eb-85cd-83a30d382163.png)
- Sử dụng IDA Pro để xem mã giả của chương trình
![image](https://user-images.githubusercontent.com/62021009/121220552-e2cecb00-c8ae-11eb-8c40-6b4d240291eb.png)    
- Mục tiêu của bài này sẽ là in ra dòng 19, chúng ta phải tránh vào vòng if ở dòng 11.
- Dòng 6: gán end bằng chiều dài của tham số thứ nhất (chính là "./racecars") sẽ bằng 9.
- Dòng 7: sẽ chạy cho đến khi giá trị của (*argv)[start - 1]= '/'
- Dòng 11: end chạy từ kí tự cuối cùng của racecars, còn start sẽ bắt đầu từ 'r' của racecars, sau đó so sánh 2 giá trị có bằng nhau không
- Tóm lại thì: tên của file thực thi phải đối xứng với nhau. Cho nên ta chỉ cần đổi tên file thực thi sao cho đối xứng là xong bài này. Ở đây mình sẽ đổi lại thành 0110     
![image](https://user-images.githubusercontent.com/62021009/121221749-1100da80-c8b0-11eb-9b21-adb379170844.png)
