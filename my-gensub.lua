
local tr = aegisub.gettext

script_name=tr"** Tự động tạo random sub"

script_description=tr"macro này sẽ tự động tạo sub ngẫu nhiên cho bạn nhé hehehehe"

script_author="holyeyed"

script_version="1.0"



function auto_gen(subs,sels)
--local meta, styles = karaskel.collect_head(subs, true)
nol=math.random(25,45)
t=0
for i=1,nol do
--dur=math.random(1,5)*1000
local text_time=makesen()
--aegisub.debug.out(3,tostring(text_time[0]))
l=makediag(subs[sels[1]],t,t+tonumber(text_time[1]),text_time[0])
subs[0]=l
t=t+tonumber(text_time[1])
end
end

function makesen()
word={"tôi","bạn","yêu","hoa","lá","mặt trời","trái đất","sống","cười","nói","học cách","mong","đi","chạy","mãi","bạn bè","là lá la","anh ta","cô ta","đau thương","giận","buồn"}
now=math.random(3,7) --num of words
local rt={}
local text="" --return value
local total=0
for i=0,now do
local id=math.random(1,#word)
local t=math.random(30,90)
text=text.."{\\K"..t.."}"..word[id].." "
total=total+t*10
end
rt[0]=text
rt[1]=total
return rt
end

function makediag(fline,start_t,end_t,text_t)
fline.start_time=start_t
fline.end_time=end_t
fline.text=text_t
fline.raw="Dialogue: 0,"..tohumantime(start_t)..","..tohumantime(end_t)..",Default,,0,0,0,,"..text_t
aegisub.log(tohumantime(start_t).."\n")
return fline
end

function tohumantime(timex)
	timex=timex/10
	ms=math.fmod(timex,100)
	sc=math.floor(timex/100)
	msc=math.fmod(sc,60)
	mn=(sc-msc)/60
	mmn=math.fmod(mn,60)
	h=(mn-mmn)/60
	return d2(h)..":"..d2(mmn)..":"..d2(msc).."."..d2(ms)
end

function d2(x)
if string.len(x)<2 then
x="0"..x
end
return x
end

function valid(subs,sels)
-- dù làm gì đi nữa cũng phải kiểm tra xem thõa điều kiện hay không
return true
end

aegisub.register_macro(script_name,script_description,auto_gen,valid)