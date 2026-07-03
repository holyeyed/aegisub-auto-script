local tr = aegisub.gettext
script_name = tr"Effect 014W Hiệu ứng hoa xuân dưới chữ"
script_description = tr"kiểu Word"
script_author = "holyeyed"
script_version = "1.0"

function gtext(l)
if l.class=="info" then
	return l.key.." "..l.value
end
if l.class=="style" then
	return l.name.." "..l.raw
end
if l.class=="dialogue" then
	return l.text
end
	return "unknow"
end

function add_effect(subs, sel)
	--xres, yres, ar, artype = aegisub.video_size()

	cstyle={{"Default-furigana","UVN Banh Mi",30,"&H000000FF","&H000000FF","&H00FFFFFF","&H00000000",false,false,false,false,100,100,0,0,1,1.5,0,5,10,10,10,1},{"Default","UVN Mau Tim 2",60,"&H000000FF","&H000000FF","&H00FFFFFF","&H00000000",false,false,false,false,100,100,0,0,1,3,0,5,10,10,10,1}}
	cdiag={{0,"0:00:00.00","0:00:00.00","Kara","",0000,0000,0000,"","Written and shared by Địa Ngục Máu @AFS - Vui lòng ghi rõ nguồn Karaoke Effect Địa Ngục Máu @AFS khi sử dụng ^^ _____ Click vào nút Resample Resolution và nháy nút From video để chỉnh độ phân giải của Sub và Video khớp với nhau để tránh tình trạng tách chữ và méo shape."},{0,"0:00:00.00","0:00:00.00","Default","",0000,0000,0000,"code once","mau = { \"&H0000FF&\", \"&H00B4FF&\", \"&H00FFFF&\", \"&H8EFFE6&\"}"},{0,"0:00:00.00","0:00:00.00","Default","",0000,0000,0000,"Code once","hoa = {\"m 21 21 b 6 -7 46 -7 29 21 b 49 -2 63 34 30 28 b 63 44 31 65 25 32 b 26 65 -12 45 21 29 b -13 38 0 -5 21 21 m 25 22 b 21 22 21 28 25 28 b 29 28 29 22 25 22 \",  \"m 13 12 b 4 -4 28 -4 18 12 b 30 -1 38 20 18 17 b 38 26 19 39 15 19 b 16 39 -7 27 13 17 b -8 23 0 -3 13 12 m 15 13 b 13 13 13 17 15 17 b 18 17 18 13 15 13 \"  ,\"m 8 7 b 2 -2 17 -2 11 7 b 18 -1 23 11 11 9 b 23 14 11 21 9 10 b 9 21 -4 15 8 9 b -5 13 0 -2 8 7 m 9 7 b 8 7 8 9 9 9 b 11 9 11 7 9 7 \"}"},{0,"0:00:00.00","0:00:00.00","Default","",0000,0000,0000,"Code once","la = {\"m 20 29 b 24 29 26 30 29 32 b 31 30 33 28 36 28 b 32 27 30 25 30 23 b 31 21 35 19 37 19 b 35 18 34 18 33 17 b 34 14 35 12 38 10 b 36 11 34 11 32 11 b 31 10 31 8 32 7 b 30 9 27 12 25 13 b 25 10 26 7 27 4 b 25 5 24 5 22 5 b 21 2 20 -1 19 -4 b 18 -1 17 2 16 5 b 14 5 13 4 11 3 b 12 6 13 10 13 13 b 10 12 8 9 6 7 b 7 8 7 10 6 11 b 4 11 2 11 0 10 b 2 12 4 15 4 17 b 3 18 2 18 1 18 b 4 19 6 22 8 24 b 7 27 5 29 3 31 b 8 29 13 29 18 29 b 18 32 18 35 17 38 b 15 39 17 42 19 38 b 20 35 20 32 20 29 m 19 27 b 24 26 28 26 32 28 b 28 27 23 26 19 27 m 19 27 b 14 27 10 27 6 29 b 9 28 11 26 19 27 b 17 18 19 9 19 0 b 19 9 18 18 19 27 m 19 27 b 23 21 28 16 34 12 b 28 17 23 22 19 27 b 14 21 9 16 3 12 b 11 16 15 22 19 27 \"}"},{0,"0:00:00.00","0:00:00.00","Default","",0000,0000,0000,"code syl all","function char_counter(ref) ci[ref] = ci[ref] + 1; return \"\" end"},{0,"0:00:00.00","0:00:00.00","Default","",0000,0000,0000,"code line all","ci = { 0 }; cn = _G.unicode.len(orgline.text_stripped:gsub(\" \",\"\"))"},{0,"0:00:00.00","0:00:00.00","Default","",0000,0000,0000,"code syl all","function char_counter2(ref) ci2[ref] = ci2[ref] + 1; return \"\" end"},{0,"0:00:00.00","0:00:00.00","Default","",0000,0000,0000,"code line all","ci2 = { 0 }; cn = _G.unicode.len(orgline.text_stripped:gsub(\" \",\"\"))"},{0,"0:00:00.00","0:00:00.00","Default","",0000,0000,0000,"code once","math.randomseed(8317)"},{0,"0:00:00.00","0:00:00.00","Default","",0000,0000,0000,"code once","temp = {}"},{0,"0:00:00.00","0:00:00.00","Default","",0000,0000,0000,"code once","function set_temp(ref,val) temp[ref] = val; return val; end"},{1,"0:08:29.21","0:09:14.92","Default","lead-in",0000,0000,0000,"template char notext","!char_counter(1)!!retime(\"start2syl\",-900+(ci[1]-1)*20,500+(ci[1]-1)*25)!{\\c!mau[math.random(4)]!\\fad(0,100)\\bord0\\fscx20\\fscy20\\an5\\frz!math.random(-100,0)!\\move($scenter,$smiddle,!$scenter+math.random(-50,50)!,!$smiddle+math.random(-30,30)!)\\fad(230,0)\\t(0,!line.duration!,\\frz!math.random(50,300)!\\fscx70\\fscy70)\\p1}!hoa[math.random(3)]!"},{1,"0:08:29.21","0:09:14.92","Default","lead-in",0000,0000,0000,"template char notext","!char_counter(1)!!retime(\"start2syl\",-900+(ci[1]-1)*20,500+(ci[1]-1)*25)!{\\c&H00CF93&\\fad(0,100)\\bord0\\fscx20\\fscy20\\an5\\frz!math.random(-100,0)!\\move($scenter,$smiddle,!$scenter+math.random(-50,50)!,!$smiddle+math.random(-30,30)!)\\fad(230,0)\\t(0,!line.duration!,\\frz!math.random(50,300)!\\fscx70\\fscy70)\\p1}!la[math.random(2)]!"},{1,"0:08:29.21","0:09:14.92","Default","lead-in",0000,0000,0000,"template char","!char_counter2(1)!!retime(\"start2syl\",-400+(ci2[1]-1)*35,0)!{\\frx!math.random(-50,50)!\\fry!math.random(-50,50)!\\frz!math.random(-50,50)!\\fscx0\\fscy0\\an5\\pos($scenter,$smiddle)\\fad(230,0)\\t(0,400,\\fscx100\\fscy100\\fry0\\frz0\\frx0)}"},{1,"0:00:00.00","0:00:00.00","Default","",0000,0000,0000,"template noblank","!retime(\"syl\",0,300)!{\\an5\\move($scenter,$smiddle,!$scenter+math.random(-40,-10)!,!$smiddle+math.random(10,50)!)\\t(0,33,\\3c&HFFFFFF&\\bord7\\blur3)\\t(33,$dur,\\bord1\\1a&HFF&\\blur1)\\fad(0,800)\\t(0,$dur,\\frz!math.random(-50,50)!)}"}}
	local pinfo=0
	local pstyle=0
	local pdiag=0
	local sl=nil
	local dl=nil
	--tìm vị trí điểm cần thêm
	for i=1,#subs do
	ln=subs[i]
	if ln.class=="info" then
	if pinfo==0 then pinfo = i end
	elseif ln.class=="style" then
	if pstyle==0 then pstyle = i sl=ln end
	elseif ln.class=="dialogue" then
	if pdiag==0 then pdiag = i dl=ln end
	else
	end
	end
	--aegisub.debug.out(pinfo.." "..pstyle.." "..pdiag)
	local apoint=pdiag
	--thêm bảng style
	for i=1,#cstyle do
	sl.name=cstyle[i][1]
	sl.fontname=cstyle[i][2]
	sl.fontsize=cstyle[i][3]
	sl.color1=cstyle[i][4]
	sl.color2=cstyle[i][5]
	sl.color3=cstyle[i][6]
	sl.color4=cstyle[i][7]
	sl.bold=cstyle[i][8]
	sl.italic=cstyle[i][9]
	sl.underline=cstyle[i][10]
	sl.strikeout=cstyle[i][11]
	sl.scale_x=cstyle[i][12]
	sl.scale_y=cstyle[i][13]
	sl.spacing=cstyle[i][14]
	sl.angle=cstyle[i][15]
	sl.borderstyle=cstyle[i][16]
	sl.outline=cstyle[i][17]
	sl.shadow=cstyle[i][18]
	sl.align=cstyle[i][19]
	sl.margin_l=cstyle[i][20]
	sl.margin_r=cstyle[i][21]
	sl.margin_v=cstyle[i][22]
	sl.encoding=cstyle[i][23]
	subs.insert(pdiag,sl)
	pdiag=pdiag+1
	end
	--thêm bảng code
	for i=1,#cdiag do
	dl.comment=true
	dl.layer=cdiag[i][1]
	dl.style=cdiag[i][4]
	dl.effect=cdiag[i][9]
	dl.text=cdiag[i][10]
	subs.insert(pdiag,dl)
	pdiag=pdiag+1
	end
	--xóa style line
	subs.deleterange(pstyle,apoint-1)
end

aegisub.register_macro(script_name, script_description, add_effect)

