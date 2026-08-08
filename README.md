# aegisub-auto-script
script included into automate for aegisub
push *.lua file into:
C:\Program Files\Aegisub\automation\autoload
adn enjoyed it!
#08/08/2026
1) nếu bạn muốn 1 code effect trở thành 2 dòng, điều đơn giản là bạn thêm 1 dòng 
"code line"
với nội dung 
"smiddle=line.middle if line.i%2==0 then smiddle=smiddle+line.height*1.2 end"
sau đó bạn chỉ việc thay thế $middle hoặc $smiddle trong code hiệu ứng thành !smiddle! là được
2) tôi đã thêm 1 script để loại bỏ hiệu ứng vừa thêm đưa sub về dạng karaoke ban đầu
