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
#CrackMe2 (cipher)
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
