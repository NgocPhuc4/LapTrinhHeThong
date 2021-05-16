### crack_nasm
- Chạy thử chương trình thì thấy bắt nhập flag
![image](https://user-images.githubusercontent.com/62021009/118400371-88fe2b00-b68b-11eb-9e4f-1b2686c993c7.png)
- Sử dụng IDA Pro để xem mã giả của chương trình
![image](https://user-images.githubusercontent.com/62021009/118400416-c793e580-b68b-11eb-8672-24b839ef93d9.png)
![image](https://user-images.githubusercontent.com/62021009/118400473-f3af6680-b68b-11eb-895c-2a3d8c701995.png)
- Thì ta thấy chương trình sẽ so sánh chuỗi mình nhập vào và flag. Nếu không bằng sẽ nhảy vào hàm failure()
- Từ đây có thể suy ra flag cần tìm chính bằng giá trị của flag: S3CrE+Fl4G!
- ![image](https://user-images.githubusercontent.com/62021009/118400568-5e60a200-b68c-11eb-9c86-b81903e116ea.png)

### es_crack
- Mặc dù là file exe nhưng mà chạy trên window không được, nên chuyển sang linux
![image](https://user-images.githubusercontent.com/62021009/118402663-142fee80-b695-11eb-940c-4fa522e391db.png)
- Sử dụng IDA Pro để xem mã giả
![image](https://user-images.githubusercontent.com/62021009/118402685-375a9e00-b695-11eb-8055-6b7ec2a18db1.png)
- Thì thấy chương trình yêu cầu nhập 1 chuỗi (password) và so sánh với một chuỗi với của chương trình. Nên bật qua tab Hex View để tìm các chuỗi có trong chương trình thì tìm thấy chuỗi sau    
![image](https://user-images.githubusercontent.com/62021009/118402757-86a0ce80-b695-11eb-93a6-8dfa5b24e654.png)
- Thử với chuỗi tìm được thì thành công   
![image](https://user-images.githubusercontent.com/62021009/118402807-c1a30200-b695-11eb-9db8-e3bcda33f187.png)

### Lucky
- Chạy thử chương trình thì bắt nhập vào lucky number   
![image](https://user-images.githubusercontent.com/62021009/118404530-860c3600-b69d-11eb-9ce1-0989f839ce9f.png)
- Sử dụng IDA Pro để xem mã giả
![image](https://user-images.githubusercontent.com/62021009/118404555-9f14e700-b69d-11eb-8cdb-c13eba1d6ddc.png)
- Ở đây ta thấy chương trình bảo nhập số có 2 chữ số
- Dòng số 10 sẽ tính: eax = số hàng  chục + số hàng đơn vị + 0 (vì đều lớn hơn '0')
- Dòng số 11 sẽ chuyển cách biểu diễn eax sang dạng BCD 4 bit
- Dòng số 12 sẽ là lệnh if, và ở trong hàm if sẽ in ra chuỗi Good Job và kết thúc chương trình, còn nếu không vào hàm if sẽ in ra chuỗi Sorry :(((
- Cho nên phải nhập số sao cho điều kiện của if là đúng.
- Điều kiện thứ hai cho thấy chữ số hàng đơn vị phải là số 8
- Điều kiện thứ nhất eax = 22 => binary: 0001 0110. Mà dạng này đã được chuyển sang BCD 4 bit, nên bây giờ chuyển ngược lại sang dạng hex thì ta được tổng của hàng chục và hàng đơn vị là 16, mà ta đã biết chữ số hàng đơn vị là 8 => chữ số hàng chục là 8 => số cần tìm là 88
![image](https://user-images.githubusercontent.com/62021009/118404886-1139fb80-b69f-11eb-87d6-b5b42ee930ac.png)
