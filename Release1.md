### crack_nasm
- Chạy thử chương trình thì thấy bắt nhập flag
![image](https://user-images.githubusercontent.com/62021009/118400371-88fe2b00-b68b-11eb-9e4f-1b2686c993c7.png)
- Sử dụng IDA Pro để xem mã giả của chương trình
![image](https://user-images.githubusercontent.com/62021009/118400416-c793e580-b68b-11eb-8672-24b839ef93d9.png)
![image](https://user-images.githubusercontent.com/62021009/118400473-f3af6680-b68b-11eb-895c-2a3d8c701995.png)
- Thì ta thấy chương trình sẽ so sánh chuỗi mình nhập vào và flag. Nếu không bằng sẽ nhảy vào hàm failure()
- Từ đây có thể suy ra flag cần tìm chính bằng giá trị của flag: S3CrE+Fl4G!
- ![image](https://user-images.githubusercontent.com/62021009/118400568-5e60a200-b68c-11eb-9c86-b81903e116ea.png)
