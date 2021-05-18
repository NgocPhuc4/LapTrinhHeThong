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
### hello
- Chạy thử thì thấy chương trình bắt nhập username và password      
![image](https://user-images.githubusercontent.com/62021009/118407238-12bcf100-b6aa-11eb-8354-7add47f9f54f.png)    
- Sử dụng IDA Pro để xem mã giả       
![image](https://user-images.githubusercontent.com/62021009/118407276-4861da00-b6aa-11eb-8205-aa98bee9ac4c.png)     
- Ta thấy ban đầu chơng trình sẽ bắt mình nhập username, sau đó in ra dòng Hello + tên của mình đã nhập.
- Ở đây thì chuỗi welcome = "Hello Phuc", password sẽ nằm ở mảng byte_402073 ở dòng 24, v4 sẽ là độ dài của password.
- Dòng 24: vòng while dừng khi v4 = 0, điều kiện để vào vòng while là username + 5 = password, nếu đúng thì sẽ in hàm success
- Như vậy, với username là Phuc thì password sẽ là: Umzh.       
![image](https://user-images.githubusercontent.com/62021009/118407620-c96da100-b6ab-11eb-9da7-59091c2cb7bc.png)

### nasm
- Chạy thử thì thấy chương trình bắt nhập password    
- ![image](https://user-images.githubusercontent.com/62021009/118407970-84e30500-b6ad-11eb-8746-d27a8edd5ad1.png)
- Sử dụng IDA Pro để xem mã giả         
![image](https://user-images.githubusercontent.com/62021009/118407981-9a582f00-b6ad-11eb-9385-bce46e006202.png)
- Thì ta thấy muốn in ra dòng đúng thì hàm memcmp phải trả về 0 => chuỗi nhập vào và password phải giống nhau
- Nhấp vào password thì hiển ra cho mình luôn:      
![image](https://user-images.githubusercontent.com/62021009/118408072-fc189900-b6ad-11eb-947e-a72d27d3e6a5.png)            
=> password là: supersecret         
![image](https://user-images.githubusercontent.com/62021009/118408097-18b4d100-b6ae-11eb-8c87-df8c2c2b26ac.png)   

### keygen
- Chạy thử thì thấy chương trình bắt nhập username và serial      
![image](https://user-images.githubusercontent.com/62021009/118657973-26856600-b816-11eb-93ae-5c58e0e3f2b0.png)      
- Sử dụng IDA Pro để xem mã giả của chương trình             
![image](https://user-images.githubusercontent.com/62021009/118658189-5af92200-b816-11eb-9fb9-365c58e3d1db.png)
- Đây là hàm start của chương trình, 3 dòng 5,6,7 in ra màn hình; dòng số 8 sẽ gọi hàm sub_4010F9(), ta sẽ xem hàm này làm gì       
![image](https://user-images.githubusercontent.com/62021009/118658744-de1a7800-b816-11eb-9892-274102ac6905.png)
- Từ dòng 5 đến dòng 9: đọc từ bàn phím username và serial và kiểm tra xem người dùng có nhập không, và ở trong hàm if ta thấy chương trình có gọi tới 3 hàm khác, kiểm tra từng hàm thì ta thấy hàm sub_401000() ở dòng 15 có in ra chuỗi mà ta cần hướng tới, chính vì vậy, ta sẽ cố gắng nhập serial làm sao để chương trình chạy vô hàm này       
![image](https://user-images.githubusercontent.com/62021009/118659512-95af8a00-b817-11eb-98ee-5ebd31693b8c.png)
- Trở lại hàm sub_4010F9(), ở dòng 11 ta thấy có gọi hàm sub_4010C0(), và sau khi hàm này thực hiện xong thì chương trình có so sánh v0 và 3, mục tiêu của ta là phải vô được hàm if này, nên giá trị sau khi thực hiện hàm sub_4010C0() của ecx phải là 3. Được rồi, vô hàm sub_4010C0() thôi       
![image](https://user-images.githubusercontent.com/62021009/118659964-f50d9a00-b817-11eb-925b-9f09aadec5ce.png)
- Ở đây ta thấy v1 chính là thanh ghi cl, vậy mục tiêu sau khi chạy xong vòng while thì v1 phải bằng 3
- Trong hàm while ta thấy để tăng v1 thì có ở dòng 26 và ta phải tránh chui vào dòng 20 vì nó sẽ tăng các bit cao của thanh ghi ecx
- Ở đây, ta chú ý, dòng số 8 sẽ gán v0 = địa chỉ của vùng nhớ unk_402050 là vùng nhớ chứa serial mà mình đã nhập. Tuy nhiên khi ta nhập chương trình sẽ đọc theo string mỗi kí tự là 1 byte, còn ở đây v0 là con trỏ nên sẽ có kích thước 4 byte. Cho nên mỗi lần dòng 27 thực hiện thì địa chỉ con trỏ trỏ đến sẽ tăng 4
- Ta thấy để v1 = 3 thì phải lặp 3 lần, từ đây có thể suy ra chuỗi serial phải có 12 kí tự (3 lần tăng con trỏ: 3 * 4 = 12) và các giá trị serial[0], [4], [8] != 0; serial[12] = 0
- Okie, bây giờ thì ecx = 3 và mình có thể vào vòng if dòng 12 rồi, ta sẽ vào xem hàm sub_401049()        
![image](https://user-images.githubusercontent.com/62021009/118661892-c09add80-b819-11eb-9698-ead80f6eed8a.png)         
![image](https://user-images.githubusercontent.com/62021009/118661934-cdb7cc80-b819-11eb-9a92-6cace8275f27.png)
- Hàm này tính toán khá phức tạp, nên mình sẽ qua hàm tiếp theo để xem các yêu cầu cần sau khi thực hiện hàm này là gì rồi quay lại hàm này sau      
![image](https://user-images.githubusercontent.com/62021009/118662392-28512880-b81a-11eb-92de-350d66ae5bcf.png)
- Nhìn vào thì ta biết mình cần phải làm cho điều kiện hàm if thoả mãn để có thể in ra dòng số 10.
- Ở đây ta thấy kiểu dword cũng có kích thước 4 byte, cho nên điều kiện của hàm if sẽ là:     
    - serial[3,4,5,6] = giá trị tại ô nhớ từ 4020A0 đến 4020A3
    - serial[8,9,10,11] = giá trị tại ô nhớ từ 4020A4 đến 4020A7
    - serial[2, 7] = 45 (kí tự '-')
- Cho nên việc cần làm của ta chính là tìm giá trị của vùng nhớ từ 4020A0 đến 4020A4
- Mà việc tính toán ở hàm int sub_401049() khá phức tạp và nó phụ thuộc phụ thuộc vào username đầu vào, nên ta sẽ debug để chương trình tính :)))
- Với username nhập vào là NgocPhuc thì giá trị vùng nhớ 4020A0 đến 4020A7 là:      
![image](https://user-images.githubusercontent.com/62021009/118664689-e1fcc900-b81b-11eb-94e2-09bc07890a05.png)
- Vậy thì serial cho NgocPhuc sẽ là 82-EA8E-A4DF (2 giá trị đầu tiên không có bất cứ yêu cầu nào, nên sẽ tuỳ ý)     
![image](https://user-images.githubusercontent.com/62021009/118665136-41f36f80-b81c-11eb-928d-f66d5ee0a59d.png)

### get_the_password
- Chạy thử thì thấy chương trình yêu cầu mình nhập password      
![image](https://user-images.githubusercontent.com/62021009/118687541-568d3300-b82f-11eb-862a-d2579022ec37.png)      
- Sử dụng IDA Pro để xem mã giả chương trình     
![image](https://user-images.githubusercontent.com/62021009/118687718-86d4d180-b82f-11eb-8bba-a784cc5c89e7.png)       
![image](https://user-images.githubusercontent.com/62021009/118687823-a79d2700-b82f-11eb-8842-a94e460aa5af.png)       
![image](https://user-images.githubusercontent.com/62021009/118687893-baaff700-b82f-11eb-8277-06a1f7f54047.png)       
- Nhìn vào thì ta thấy chương trình cần phải chạy làm sao để có thể chạy được dòng 76 => v1=10    
- Dòng số 11 sẽ đọc input đầu vào từ bàn phím và sau đó chèn thêm kí tự d vào sau chuỗi input vừa nhập
- Vòng while từ dòng 17 đến 27:  duyệt hết tất cả các kí tự input đầu vào, nếu như đến kí tự d (kí tự chèn vào sau) sẽ nhảy đến LABEL_32. Cho nên, nếu v1 chưa bằng 10 thì password nhập vào không được có kí tự d. Và xem qua thì cứ mỗi kí tự thì phải v1 sẽ được tăng lên 1 đơn vị, và phải tránh chui vào các hàm if để không bị trừ đi v1 (nếu bị trừ đi thì có khi chuỗi pass phải nhiều hơn 10 kí tự, ở đây cho nhanh sẽ làm pass với 10 kí tự)    
- Sau khi duyệt các hàm while và switch case thì điều kiện đối với password là:
    - 0: > G
    - 1: < m
    - 2: = V
    - 3: >= f
    - 4: <= 3
    - 5: > y
    - 6: >= 8
    - 7: < N
    - 8: khác R
    - 9: = 2
    - Và tất cả các phần tử đều phải khác d
- Okie giờ chỉ cần nhập 1 chuỗi thoả mãn các điều kiện trên là được. Có rất nhiều chuỗi, ở đây mình chọn: PhVf3z8MP2    
![image](https://user-images.githubusercontent.com/62021009/118689962-c7354f00-b831-11eb-8fd5-bb16ba2eb25f.png)
