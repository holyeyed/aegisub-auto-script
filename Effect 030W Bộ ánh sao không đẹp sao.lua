local tr = aegisub.gettext
script_name = tr"Effect 030W Bộ ánh sao không đẹp sao"
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

	cstyle={{"KARA-furigana","UVN Chim Bien Nang",21,"&H00B06F0D","&H00B06F0D","&H00FFFFFF","&H00000000",false,false,false,false,100,100,0,0,1,1,0,5,10,10,10,1},{"Copy of Copy of Default-furigana","VNI-Free",40,"&H005C3700","&H005C3700","&H00FFFFFF","&H00000000",false,false,false,false,100,100,0,0,1,1.5,0,2,10,10,10,1},{"Copy of Default-furigana","VNI-Free",40,"&H005C3700","&H005C3700","&H00FFFFFF","&H00000000",false,false,false,false,100,100,0,0,1,1.5,0,2,10,10,10,1},{"Default-furigana","AlaskanNights",27,"&H005C3700","&H005C3700","&H00FFFFFF","&H00000000",false,false,false,false,100,100,0,0,1,1,0,8,10,10,30,1},{"KARA","Kids",54,"&H00623F0A","&H00623F0A","&H00FFFFFF","&H00000000",true,false,false,false,100,100,0,0,1,2,0,5,10,10,10,1},{"Copy of Default","VNI-Free",80,"&H005C3700","&H005C3700","&H00FFFFFF","&H00000000",false,false,false,false,100,100,0,0,1,3,0,2,10,10,10,1},{"Copy of Copy of Default","VNI-Free",80,"&H005C3700","&H005C3700","&H00FFFFFF","&H00000000",false,false,false,false,100,100,0,0,1,3,0,2,10,10,10,1}}
	cdiag={{0,"0:00:00.00","0:00:00.00","KARA","",0,0,0,"code syl all","function char_counter2(ref) ci2[ref] = ci2[ref] + 1; return \"\" end"},{0,"0:00:00.00","0:00:00.00","KARA","",0,0,0,"code line all","ci2 = { 0 }; cn = _G.unicode.len(orgline.text_stripped:gsub(\" \",\"\"))"},{0,"0:00:00.00","0:00:00.00","KARA","",0,0,0,"code syl all","function char_counter(ref) ci[ref] = ci[ref] + 1; return \"\" end"},{0,"0:00:00.00","0:00:00.00","KARA","",0,0,0,"code line all","ci = { 0 }; cn = _G.unicode.len(orgline.text_stripped:gsub(\" \",\"\"))"},{0,"0:00:00.00","0:00:00.00","KARA","",0,0,0,"code once","tuyet = { \"m 25 0 l 34 15 l 50 19 l 40 33 l 41 49 l 25 43 l 11 50 l 11 33 l 0 21 l 15 15 l 25 0 \"  ,\"m 40 0 b -17 0 -17 81 41 81 b 101 81 101 1 40 0 \", \"m 26 -1 b -9 -1 -9 50 26 50 b 65 50 65 -1 26 -1 \", \"m 5 3 b 10 -3 25 -3 31 2 b 37 7 38 20 32 25 b 27 30 10 29 5 24 b -1 20 -2 8 5 3 \"}"},{1,"0:00:00.00","0:00:00.00","KARA","lead-in(snow)",0,0,0,"template char notext loop 2","!char_counter2(1)!!retime(\"syl\",-900+(ci2[1]-1)*20+(j-1)*200,1200-$dur+(ci2[1]-1)*25)!{\\fad(0,100)\\c&HFFFFFF&\\bord2\\3c&HFFFFFF&\\blur4\\fscx10\\fscy10\\an5\\move($scenter,!$smiddle-25!,!$scenter+math.random(-50,50)!,!$smiddle+math.random(-25,70)!)\\fad(230,0)\\t(0,!line.duration!,\\fscy8\\fscx8\\fad(0,500)\\p1}!tuyet[math.random(4)]!"},{0,"0:00:00.00","0:00:00.00","KARA","",0,0,0,"code syl all","fxgroup.lastsyl = (syl.i == #line.kara)"},{1,"0:00:00.00","0:00:00.63","KARA","",0,0,0,"template char noblank","!char_counter(1)!!retime(\"start2syl\", -600+(ci[1]-1)*45,0)!{\\fad(0,0)\\an5\\blur0\\pos($center,$middle)\\fscx0\\fscy0\\t(0,200,\\fscx150\\fscy150)\\t(200,350,\\fscx75\\fscy75)\\t(350,400,\\blur0\\bord3\\fscx100\\fscy100)}"},{1,"0:00:00.00","0:00:00.63","KARA","",0,0,0,"template noblank","!retime(\"syl\",0,800)!{\\an5\\blur6\\bord6\\move($scenter,$smiddle,!$scenter-200!,$smiddle,0,6000)\\fad(0,500)\\t(0,100,\\c&HFFFFFF&\\3c&HFFFFFF&\\fscx130\\fscy130)\\t(100,$dur,\\1a&HFF&\\3c!line.styleref.color3!\\fscx100\\fscy100\\bord3\\blur3\\frx90\\fry180\\frz120)}"}}
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

