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

### crack_001     
- Chạy thử thì thấy chương trình bắt nhập username và password     
![image](https://user-images.githubusercontent.com/62021009/118837246-d3cbad00-b8ee-11eb-9892-699f1e8f17c4.png)     
- Sử dụng IDA Pro để xem mã giả của chương trình thì ta thấy chương trình gồm 3 hàm chính và chuỗi cần in nằm ở hàm sub_4010FE, và hàm gọi sub_4010FE là hàm DialogFunc    
![image](https://user-images.githubusercontent.com/62021009/118838442-e397c100-b8ef-11eb-8a22-01caf8bf04cc.png)    
- Vào xem hàm DialogFunc()    
![image](https://user-images.githubusercontent.com/62021009/118838684-1772e680-b8f0-11eb-9a03-7b3f5d30b7be.png)    
- Dòng số 20 sẽ lấy giá trị của password và lưu vào String
- Dòng số 21 sẽ lấy giá trị của username lưu vào byte_403014 và biến v6 sẽ lưu độ dài của username    
- Dòng 22 ràng buộc username phải có độ dài tối thiểu là 3 kí tự
- Vào hàm sub_4010FE() thôi      
![image](https://user-images.githubusercontent.com/62021009/118839196-83554f00-b8f0-11eb-9a6a-41651b08a5eb.png)      
- Dòng 12 sẽ gán giá trị v1 bằng với username[v0]
- Từ dòng 13 đến 18 sẽ kiểm tra các giá trị, với input là "Phuc" thì đều không thoả các giá trị trên
- Dòng 19 tăng giá trị byte cao của v1 lên bằng 'a' + v0
- Dòng 20 tăng giá trị byte thấp của v1 lên 1 đơn vị
- Sau đó dòng 22 so sánh v1 với 2 byte của password
- Ở đây, với input là Phuc. Thì tại vòng lặp này, v1= 'P', Hibyte(v1) += v0 + 'a' => v1 = 'aP', lobyte(v1) = v1+1 => v1 = 'aQ' => pass[0,1] = 'Qa'   
- Sau đó dòng 24, 25 tăng mỗi biến lên 1 đơn vị
- Dòng 26 sẽ so sánh v3 xem có bằng với độ dài của username chưa. Và ta thấy dòng 28 cũng so sánh biến `_403039` với độ dài chuỗi username. Mục tiêu của ta là phải vô được hàm này, nên có thể suy ra rằng vòng while sẽ lặp 4 lần ứng với độ dài của username, và chuỗi password sẽ có 8 kí tự thoả mã với điều kiện dòng 22.
- Với cách tính tương tự như trên, ta tính được password là: Qaibvcdd      
![image](https://user-images.githubusercontent.com/62021009/118842355-55253e80-b8f3-11eb-90df-f2f6299bd9c8.png)     

### S_Crack1
- Chạy thử thì thấy chương trình như thế này      
![image](https://user-images.githubusercontent.com/62021009/118857004-c23fd080-b901-11eb-899a-528744cf8be4.png)   
- Sử dụng IDA Pro để xem mã giả chương trình
- Và vào luôn hàm DialogFunc():    
![image](https://user-images.githubusercontent.com/62021009/118857527-56119c80-b902-11eb-8ee2-ce402b7e14dc.png)     
- Khi chạy chương trình thì đoạn này sẽ chạy trước, dòng 106 sẽ lấy chuỗi tên computer lưu vào String, ở đây tên computer của máy mình là DESKTOP-K5D0AGE
- Dòng 107 sẽ gán dword_403346 bằng độ dài của của tên máy, dòng 109 sẽ gán v6 là tên của máy tính
- Dòng 111 đến 116: sẽ gán giá trị tên máy tính vào dword_40333E. Tiếp theo ta sẽ vào đoạn code khi nhấn nút Check     
![image](https://user-images.githubusercontent.com/62021009/118859442-6e82b680-b904-11eb-9fcb-057727e618a5.png)
- Dòng 31, 32 sẽ mở Clipboard và gán v13 bằng nội dung của Clipboard (Clipboard ở đây chính là nơi lưu trữ nội dung mà ta copy hay cut)
- Mục tiêu của ta là phải vào được dòng 53, cho nên v13 phải có nội dung khác rỗng
- Dòng 35 đến 38 là gán dword_403233 = v13, dword_403342 = dword_40333E (tên máy tính), v15 là độ dài tên máy tính
- Dòng 39 đến 44 v15 lần: trong vòng lặp sẽ tính giá trị cho dword_403342. Ta thấy để vào được dòng 53, thì phải né vòng if dòng 46 => dword_403342 = 0 sau khi thực hiện xong vòng do while. Mà muốn dword_403342 = 0 thì dword_403233 phải có giá trị giống với dword_403342 => chuỗi mình copy phải giống với tên máy tính.    
![image](https://user-images.githubusercontent.com/62021009/118862768-4bf29c80-b908-11eb-86f8-307154084787.png)     
![image](https://user-images.githubusercontent.com/62021009/118862839-5d3ba900-b908-11eb-9c31-787c41ac438a.png)    
- Ta thấy chương trình đã mở thêm chức năng Register, giờ hãy xem hàm khi nhấn Register:    
![image](https://user-images.githubusercontent.com/62021009/118863085-b0156080-b908-11eb-905f-61efad9e887c.png)      
- Dòng 61 sẽ tạo 1 filename với tên là reg.key. Mục tiêu lần này là vào dòng 89. Cho nên không vào vòng if dòng 66 => file phải có ít nhất 8 kí tự.
- Dòng 76 sẽ lưu toàn bộ nội dung của file vào biến v12.
- Điều kiện của lệnh if dòng 87 phải sai => lpBuffer[0,3] ^ lpBuffer[4,7] = tên máy tính (sau khi debug thì giá trị là: 0x408) => lpBuffer có thể là 84000000
- Cho nên tạo 1 file với tên là reg.key cùng thư mục với file KeyMe.exe với nội dung là 84000000.      
![image](https://user-images.githubusercontent.com/62021009/118864094-d7b8f880-b909-11eb-9592-879a8c25a2e5.png)      
![image](https://user-images.githubusercontent.com/62021009/118864176-eacbc880-b909-11eb-9bdb-73e947cfcb0f.png)    

### Clone
- Chạy thử thì thấy chương trình yêu cầu nhập username và serial     
![image](https://user-images.githubusercontent.com/62021009/119012786-8d468300-b9c0-11eb-858b-d6607ce3ce35.png)      
- Sử dụng IDA Pro để xem mã giả của chương trình
- Ta thấy chương trình có 3 hàm chính là: start, sub_40101D, sub_401180. Trong hàm start sẽ gọi hàm sub_40101D, và trong hàm sub_40101D sẽ gọi hàm sub_401180. Và ta thấy rằng trong hàm sub_401180 có chứa dòng 89 là mục tiêu ta cần đi tới      
![image](https://user-images.githubusercontent.com/62021009/119013267-03e38080-b9c1-11eb-8bc5-729b8754b8cf.png)      
![image](https://user-images.githubusercontent.com/62021009/119013364-1bbb0480-b9c1-11eb-9a44-276a723a615c.png)
![image](https://user-images.githubusercontent.com/62021009/119013435-2b3a4d80-b9c1-11eb-8c75-a3f265300eed.png)
- Dòng 24 đến dòng 27: sẽ lấy input đầu vào là username và serial; sau đó kiểm tra điều kiện String = 8 và byte_40307C >= 5. Sau khi đặt breakpoint để debug thì ta thấy String lưu serial và biến còn lại lưu username. Từ đây, ta thấy điều kiện đầu tiên cho username là phải có ít nhất 5 kí tự, còn của serial là phải có 8 kí tự.
- Từ dòng 29 đến dòng 57: là hàng loạt các thao tác tính toán dựa trên username, và ta để ý thấy rằng giá trị cần sử dụng để vào dòng if 82 là dword_4030C8, cho nên ta cần phải biết ô nhớ này chứa giá trị gì. Và ta chỉ cần debug để chương trình tự tính dựa vào username
- Sau khi debug với username là Layla thì dword_4030C8 có giá trị là: FD9C8887
- Tiếp theo từ dòng 58 đến dòng 81: hàm này sẽ kiểm tra từng kí tự của chuỗi serial có thuộc khoảng từ 0 đến F không? (0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F) => nếu thuộc khoảng này thì sẽ biểu diễn về dưới dạng hex (vì ban đầu nhập dưới dạng string nên giá trị sẽ tính theo bảng ascii). Chú ý là các kí tự chữ cái phải viết hoa nhé!! :))
- Tiếp theo là hàm if: điều kiện trong hàm này cực ngoằn ngoèo, tuy nhiên phải đảm bảo điều kiện này đúng để có thể vào dòng 89. Hàm `_byteswap_ulong` sẽ đảo các bit của chuỗi đó (ví dụ: 1234 thành 4321) cho nên sẽ đảo các bit của dword_4030C8 lại cho dễ tính: 7888C9FD.
- Đoạn dịch 3 lần 8 bit ở sau cũng không cần quan tâm vì đơn giản giống như cộng số theo hàng chục hàng đơn vị vậy (ở đây lấy 1 lần 2 byte nên sẽ phải dịch 8 bit). Ta có thể suy ra được như sau:        
((serial[7] + 16 * serial[6]) ^ 0xCD) - 17 = 0x78 => serial[6,7] = 44 (ở đây ta thấy serial[7] + 16 * serial[6] giống như trong hệ dec thì serial[6] là hàng chục còn serial[7] là hàng đơn vị, nên khi tính tổng phải * 16 thay vì * 10 trong hệ dec)
((serial[5] + 16 * serial[4]) ^ 0x90) - 85 = 0x88 => serial[4,5] = 4d      
((serial[3] + 16 * serial[2]) ^ 0x56) + 120 = 0xC9 =>  pass[2,3] = 07      
((serial[1] + 16 * serial[0]) ^ 0x12) + 52 = FD => pass[0,1] = b9      
=> serial cần tìm là B9074D44     
![image](https://user-images.githubusercontent.com/62021009/119017369-237ca800-b9c5-11eb-8045-7bab35473214.png)
=> Done :))))
