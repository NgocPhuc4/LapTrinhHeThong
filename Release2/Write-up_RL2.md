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
### CrackMe2 (cipher)
- Chạy chương trình thì thấy chương trình yêu cầu nhập password     
![image](https://user-images.githubusercontent.com/62021009/121408215-598cc680-c98a-11eb-8b31-a5ea1463fc0e.png)    
- Sử dụng IDA Pro để xem mã giả    
![image](https://user-images.githubusercontent.com/62021009/121408287-71fce100-c98a-11eb-84c4-82f67ba12fd4.png)     
- Mục tiêu của ta là dòng 30, nghĩa là phải thoát vòng while. Mà để thoát vòng while thì ta phải vào được dòng 27 => v5 = 0 => chuỗi Buffer = HfyhgrgfgrlmYlc579
- Dòng 21, 22: vòng lặp chạy từng kí tự của chuỗi buffer, mỗi vòng sẽ biến đổi kí tự để được chuỗi buffer đã suy ra ở trên. Vậy ta cần tìm chuỗi trước khi chạy vòng for này để nhập vào.
- Sau một hồi chạy tay vất vả thì tìm được chuỗi ban đầu là: SubstitutionBox420     
![image](https://user-images.githubusercontent.com/62021009/121408826-00716280-c98b-11eb-971f-6ca5a277d495.png)      
### Escape the Dunge0n - Expl0it     
- Chạy thử chương trình     
![image](https://user-images.githubusercontent.com/62021009/121614913-f3876880-ca89-11eb-8c6a-eac9506de9a6.png)      
![image](https://user-images.githubusercontent.com/62021009/121614796-af946380-ca89-11eb-82da-a3866e109d2d.png)     
- Ấn 1 để chơi xem sao :))
![image](https://user-images.githubusercontent.com/62021009/121615046-2e899c00-ca8a-11eb-9115-5a6b5e25ce95.png)
- Tiếp tục ấn thử 1 để sang trái xem ra sao      
![image](https://user-images.githubusercontent.com/62021009/121615154-6d1f5680-ca8a-11eb-84d7-11a9d5a6a0a4.png)    
- Bị trừ 10HP vì dính bẫy và 10HP vì bị đá lăn :(( nên HP còn 80      
![image](https://user-images.githubusercontent.com/62021009/121615233-963fe700-ca8a-11eb-8a4f-55c7dd0d1f09.png)
- Chương trình thông báo rằng giờ rơi vào 1 vùng rất nhiều vàng, tuy nhiên lại gặp Goblin và hắn đã thấy mình, nhấn 1 để nhặt vàng và chạy, nhấn 2 để chiến đấu với Goblin
- Mình nhấn 2 xem thử thế nào    
![image](https://user-images.githubusercontent.com/62021009/121615360-e323bd80-ca8a-11eb-9900-9cf8053ed083.png)
- Game over rồi :((( 
- Giờ mình sẽ sử dụng IDA Pro để xem mã giả thế nào    
- Đây là hàm main     
![image](https://user-images.githubusercontent.com/62021009/121615422-0a7a8a80-ca8b-11eb-92ef-33273c26f04e.png)    
- Ở đây có rất nhiều hàm con, tuy nhiên không cần quan tâm vì các hàm con này để in ra các hình trong console như nãy chúng ta đã thấy.
- Chúng ta sẽ quan tâm tới dòng 21 vì hàm này sẽ lấy input từ màn hình của chúng ta.
- Sau đó sẽ so sánh biến nhập vào này với 1 hoặc 2, nếu 2 sẽ thoát chương trình, còn nếu 1 sẽ gọi hàm **sub_401000()** (ở đây số 1 chính là play, số 2 là exit), cho nên mình sẽ ấn số 1 ở đây        
![image](https://user-images.githubusercontent.com/62021009/121615647-9391c180-ca8b-11eb-895a-96b462d4a657.png)
- Tiếp theo sẽ xem mã giả hàm **sub_401000()**       
![image](https://user-images.githubusercontent.com/62021009/121616024-4bbf6a00-ca8c-11eb-8e2b-3390e72e1707.png)
![image](https://user-images.githubusercontent.com/62021009/121616074-62fe5780-ca8c-11eb-84f6-c010aa74f0bf.png)
![image](https://user-images.githubusercontent.com/62021009/121616134-7d383580-ca8c-11eb-9a49-f4f380f9df4d.png)
![image](https://user-images.githubusercontent.com/62021009/121616173-9640e680-ca8c-11eb-9510-1247037f40ac.png)
![image](https://user-images.githubusercontent.com/62021009/121616346-efa91580-ca8c-11eb-942e-919931b36755.png)
![image](https://user-images.githubusercontent.com/62021009/121616365-fd5e9b00-ca8c-11eb-8025-ffac04125816.png)    
- Mục tiêu của ta chính là vào được dòng 109 và dòng 102.
- Để vào được dòng 102, thì input đầu tiên phải bằng 2 để vào được dòng 73    
- Sau khi ấn 2 thì ta được    
![image](https://user-images.githubusercontent.com/62021009/121616621-6b0ac700-ca8d-11eb-80ad-868cb6facf6b.png)
- Chương trình tiếp tục lấy input đầu vào ở dòng 81, và để vào được dòng 102 thì ta phải ấn 1, giao diện console sau khi ấn 1:     
![image](https://user-images.githubusercontent.com/62021009/121616721-a4433700-ca8d-11eb-92bb-68357b36666a.png)     
- Tiếp tục, xem bên mã giả thì ta biết chơng trình lấy input ở dòng 90, và ta sẽ ấn 2 để có thể vào dòng 102     
![image](https://user-images.githubusercontent.com/62021009/121616821-d5bc0280-ca8d-11eb-9f67-47106698e272.png)   
- Chương trình đã hiển ra thông báo ở dòng 102 rồi, và giờ yêu cầu mình nhập key code:   
![image](https://user-images.githubusercontent.com/62021009/121617054-57139500-ca8e-11eb-82d3-07da2ca518c5.png)    
- Tiếp tục xem mã giả, thấy chương trình đọc input đầu vào ở dòng 107 và so sánh với giá trị 788960, nếu bằng nhau sẽ vào dòng 109 :))
![image](https://user-images.githubusercontent.com/62021009/121617155-92ae5f00-ca8e-11eb-8e5a-821c9c92b486.png)     
==> OK     
### find_password    
- Chạy chương trình thì thấy chương trình yêu cầu nhập password
![image](https://user-images.githubusercontent.com/62021009/121779572-9513d480-cbc6-11eb-94e5-5e050f6713d7.png)    
-	Sử dụng IDA Pro để xem mã giả      
![image](https://user-images.githubusercontent.com/62021009/121779594-b83e8400-cbc6-11eb-8e1b-aa014efaa231.png)
![image](https://user-images.githubusercontent.com/62021009/121779596-bbd20b00-cbc6-11eb-8585-982ba70512d6.png)      
-	Chuỗi input đầu vào của chúng ta sẽ được lưu tại địa chỉ mà con trỏ Buf1 trỏ tới.
-	Mục tiêu của ta là vào dòng 47, để vào được dòng 47 trước tiên ta phải thoát được vòng lặp do while từ dòng 35 đến 46.
-	Ở đây ta có 2 vòng lặp do while, cho nên đầu tiên ta phải thoát được vòng lặp thứ nhất từ dòng 37 đến  44. Muốn thoát được vòng lặp này ta cần phải nhập sao cho size =v13, nghĩa là chiều dài đoạn mình nhập phải bằng v13. Debug để xem thử giá trị v13 này bằng bao nhiêu.
-	Giá trị ebp hiện tại bằng 0x006CFEF8 => v13 = ebp – 0x34 = 0x006CFEC4    
![image](https://user-images.githubusercontent.com/62021009/121779615-cbe9ea80-cbc6-11eb-943e-793e3846762b.png)   
-	Đến địa chỉ trên thì ta thấy giá trị của v13 = 6. Vậy chuỗi chúng ta nhập vào sẽ có độ dài bằng 6
-	Tiếp theo muốn thoát vòng lặp tiếp theo thì chuỗi Buf1 phải bằng 6 kí tự đầu của chuỗi Buf2. Ta tiếp tục kiểm tra xem chuỗi Buf2 này có giá trị như thế nào.     
 ![image](https://user-images.githubusercontent.com/62021009/121779627-d7d5ac80-cbc6-11eb-9b73-2c51dc4d0af7.png)      
-	Địa chỉ của Buf2 là = ebp -0x38 = 0x006CFEC0. Vì Buf2 là con trỏ nên sẽ lưu giá trị của 1 địa chỉ, đi đến địa chỉ 0x006CFEC8 thì ta được giá trị của chuỗi cần so sánh     
 ![image](https://user-images.githubusercontent.com/62021009/121779634-e1f7ab00-cbc6-11eb-8394-6122d7ea5d27.png)     
-	Vậy là chuỗi mình cần nhập vào là: djejie
-	Tuy nhiên do vòng lặp do while (sẽ thực hiện trước rồi mới so sánh nên ban đầu cho dù nhập như thế nào thì vẫn sẽ in ra password sai), từ vòng 2 sẽ kiểm tra xem password có đúng không và in ra.      
 ![image](https://user-images.githubusercontent.com/62021009/121779642-e91eb900-cbc6-11eb-9ead-83e28c4bb566.png)
### no strings attached     
- Chạy thử chương trình thì thấy chương trình yêu cầu mình nhập password    
![image](https://user-images.githubusercontent.com/62021009/121779683-123f4980-cbc7-11eb-91a7-04fdd7cf51a1.png)    
- Sử dụng IDA Pro để xem mã giả của chương trình    
![image](https://user-images.githubusercontent.com/62021009/121779699-2b47fa80-cbc7-11eb-8fcf-30d5e0ed6316.png)     
- Mục tiêu của ta là vào dòng 24 (để in ra chuỗi CORRECT)    
- Để vào được dòng 24, thì ta cần điều kiện trong dòng 23 trả về true hay giá trị trả về của hàm `sub_211438(v7)` = 1, ta xem thử mã giả hàm này     
![image](https://user-images.githubusercontent.com/62021009/121779762-8843b080-cbc7-11eb-9b6c-8c2de740951d.png)     
- Dòng thứ 5 sẽ so sánh giá trị trả về của hàm `sub_211645` với 18, ta thử debug xem với input đầu vào là 123456 thì ta thấy hàm này trả về 6       
![image](https://user-images.githubusercontent.com/62021009/121780647-7fed7480-cbcb-11eb-8f51-aad32c38bae7.png)
- Với input đầu vào là 0123456789 thì hàm trả về 10     
![image](https://user-images.githubusercontent.com/62021009/121780687-ab705f00-cbcb-11eb-8a8f-3d3550d70911.png)    
=> Mạnh dạn đoán hàm này sẽ trả về độ dài của chuỗi ta nhập vào => Chuỗi ta nhập vào phải có độ dài là 18 => debug lại với input là 123456789012345678 thì thấy hàm trả về 18 và đã pass được vòng if và chạy đến vòng for    
![image](https://user-images.githubusercontent.com/62021009/121780747-f7230880-cbcb-11eb-82f2-6f89b5aa1f31.png)     
- Vòng for từ dòng 7 đến dòng 11: sẽ kiểm tra từng kí tự của chuỗi mình nhập vào và so sánh với chuỗi `encrypted-c-string` (ấn vào v7 sẽ thấy chuỗi này) => Đó cũng chính là chuỗi mình cần nhập.     
![image](https://user-images.githubusercontent.com/62021009/121780408-55e78280-cbca-11eb-89a6-6cc849a37616.png)     
### ZED-Crackme   
- Chạy thử chương trình thì thấy chương trình báo lỗi
![image](https://user-images.githubusercontent.com/62021009/121784620-1b3c1500-cbdf-11eb-95c8-59903db81dc1.png)
- Dùng lệnh `strings` để liệt kê xem có chuỗi nào trong chương trình    
![image](https://user-images.githubusercontent.com/62021009/121784645-47579600-cbdf-11eb-8b5c-97073e3b1c3b.png)
![image](https://user-images.githubusercontent.com/62021009/121784657-59393900-cbdf-11eb-8a6d-b66a389f9fb3.png)
![image](https://user-images.githubusercontent.com/62021009/121784664-6524fb00-cbdf-11eb-8d28-05093c3feccf.png)
![image](https://user-images.githubusercontent.com/62021009/121784720-ba610c80-cbdf-11eb-9e11-7be0657a5084.png)
![image](https://user-images.githubusercontent.com/62021009/121784725-c351de00-cbdf-11eb-9e10-6dbd925313ad.png)   
- Ta thấy ở dòng Info có dòng chương trình thực thi đã bị nén bởi UPX Packer, qua tìm hiểu thì thấy đây 1 phần mềm nén chương trình thực thi, ta sẽ sử dụng lệnh `$ upx -d ZED-Crackme-x64.bin` để giải nén chương trình thực thi.     
![image](https://user-images.githubusercontent.com/62021009/121784823-6b67a700-cbe0-11eb-847b-c1084cd19b3d.png)     
- Sau khi giải nén xong, ta chạy lại chương trình thì thấy yêu cầu nhập passphrase:     
![image](https://user-images.githubusercontent.com/62021009/121784848-8e925680-cbe0-11eb-92ce-b3ffd904af23.png)    
- Sử dụng IDA Pro để xem mã giả     
![image](https://user-images.githubusercontent.com/62021009/121784868-ae297f00-cbe0-11eb-91de-5de68f411a92.png)
![image](https://user-images.githubusercontent.com/62021009/121784875-bbdf0480-cbe0-11eb-9150-4b200484e2c9.png)    
- Mục tiêu của ta là sẽ vào được dòng 44, để như vậy thì chuỗi s1 và s2 phải bằng nhau.
- Ta thấy chuỗi s2 là chuỗi ta nhập vào, còn s1 được tính toán từ dòng 36 đến 42 và phụ thuộc vào biến v6 có giá trị là `AHi23DEADBEEFCOFFEE` nằm dòng 28.    
- Ta thấy từ dòng 31 đến 35, chương trình ngăn không cho ta debug (nếu phát hiện đang debug sẽ thoát chương trình) nên ta viết 1 chương trình c++ như sau để tính giá trị s1     
![image](https://user-images.githubusercontent.com/62021009/121784966-3f98f100-cbe1-11eb-8072-a7e99fce0f80.png)    
- Ta được output `C(uiICD@CADDEBNEEDD`:      
![image](https://user-images.githubusercontent.com/62021009/121784977-550e1b00-cbe1-11eb-894f-11c97ca16409.png)     
- Chạy lại chương trình và nhập chuỗi trên:     
![image](https://user-images.githubusercontent.com/62021009/121785003-766f0700-cbe1-11eb-80d0-eacfbe0b8a87.png)
