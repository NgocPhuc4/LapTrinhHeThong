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
### WarGames
- Chạy thử file thì thấy file yêu cầu nhập mật khẩu:    
![image](https://user-images.githubusercontent.com/62021009/121231883-2596a000-c8bb-11eb-8a0b-0c02bdf5ca05.png)    
- Sử dụng IDA Pro để xem mã giả    
![image](https://user-images.githubusercontent.com/62021009/121232032-570f6b80-c8bb-11eb-9bd4-37deec4c35b5.png)   
- Mục tiêu của ta là sẽ vào được dòng 29
- Dòng 10: yêu cầu nhập 1 tham số (pass)
- Dòng 12: pass phải có độ dài là 9
- Dòng 14: copy chuỗi `gssw#tpcz` vào v6
- Dòng 16 đến 19: ở đây sẽ random 1 số trong khoảng từ 1 đến 5, sau đó v6 sẽ trừ đi số random này
- Dòng 20 sẽ so sánh từng kí tự của pass và v6. Ở đây ta phải cho 2 vế bằng nhau để không vào hàm if này.
- Ta thấy rằng vì hàm random có đầu vào không đổi nên nó sẽ tạo ra 9 số ngẫu nhiên (tuy nhiên sẽ không có thay đổi cho mỗi lần chạy). Chính vì vậy chỉ cần nhập pass sao cho bằng vói v6 sau khi trừ đi số random này. Ta sử dụng đoạn mã sau để tính:      
![image](https://user-images.githubusercontent.com/62021009/121232942-4d3a3800-c8bc-11eb-824c-a98af76a9f6f.png)
- Chú ý là phải chạy trên linux vì sẽ có sự khác nhau của hàm random khi chạy trên window
- Và đây là kết quả      
![image](https://user-images.githubusercontent.com/62021009/121233067-6fcc5100-c8bc-11eb-9640-3a5ddbfdadff.png)    
- Vậy "dont play" chính là chuỗi cần tìm     
![image](https://user-images.githubusercontent.com/62021009/121233156-883c6b80-c8bc-11eb-836c-8695ed3902fc.png)    
### Justcrackme
- Đầu tiên, kiểm tra xem loại của file thì thấy đây là file thực thi 64 bit trên linux
![image](https://user-images.githubusercontent.com/62021009/121402321-f13ae680-c983-11eb-9120-bbb689077b42.png)
- Chạy thử thì thấy chương trình yêu cầu nhập flag    
![image](https://user-images.githubusercontent.com/62021009/121402433-16c7f000-c984-11eb-9bc1-202213a1ee4d.png)
- Sử dụng IDA Pro để xem mã giả    
![image](https://user-images.githubusercontent.com/62021009/121402516-2f380a80-c984-11eb-9fcf-5c1c19109054.png)
- Mục tiêu của ta là sẽ vào được dòng 24. Để vào được ta phải làm sai điều kiện của vòng if. Hàm compare sẽ so sánh từng kí tự của flag nhập vào với v6 (nếu khác nhau sẽ trả về 1, ngược lại trả về 0, ở đây ta buộc  phải cho 2 chuỗi giống nhau).
- Ta thấy dòng 20: v6 sẽ được tính toán bằng hàm compare với chuỗi đã cho s, ở đây ta sẽ debug để tìm nhanh được giá trị của v6.
- Sau khi debug thì ta thấy giá trị của v6 là 0x57 (W)    
![image](https://user-images.githubusercontent.com/62021009/121403272-ef255780-c984-11eb-91d2-533551218c60.png)
- Chạy chương trình với W tìm được     
![image](https://user-images.githubusercontent.com/62021009/121403670-5511df00-c985-11eb-88f6-b4b332a45e6d.png)
