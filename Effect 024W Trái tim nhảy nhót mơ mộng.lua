local tr = aegisub.gettext
script_name = tr"Effect 024W Trái tim nhảy nhót mơ mộng"
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

	cstyle={{"Thanh-furigana","UVN Banh Mi",17,"&H00FFFFFF","&H00FFFFFF","&H00FFFFFF","&H00000000",false,false,false,false,100,100,0,0,1,0.3375,0,8,10,10,8,1},{"Hanguel-furigana","Bleeding Cowboys",15,"&H00FFFFFF","&H000000FF","&H002AC4FD","&H00000000",false,false,false,false,100,100,0,0,1,0.604688,0.604688,7,118,10,150,129},{"Default","Bleeding Cowboys",25,"&H00FFFFFF","&H000000FF","&H002AC4FD","&H00000000",false,false,false,false,100,100,0,0,1,2,2,8,10,10,230,1},{"Hanguel","Bleeding Cowboys",25,"&H00FFFFFF","&H000000FF","&H002AC4FD","&H00000000",false,false,false,false,100,100,0,0,1,1.20938,1.20938,7,118,10,150,129},{"Mai mai","UVN Banh Mi",36,"&H0AFFFFFF","&H000000FE","&H002AC4FD","&H00000000",false,false,false,false,100,100,0.25,0,1,0.510205,0,2,10,10,120,1},{"Mai mai-furigana","UVN Con Thuy",17,"&H0AFFFFFF","&H000000FE","&H00FF00FF","&H00000000",true,false,false,false,100,100,0.25,0,1,0.675,0,1,10,10,6,1},{"Thanh","UVN Banh Mi",34,"&H00FFFFFF","&H00FFFFFF","&H00FFFFFF","&H00000000",false,false,false,false,100,100,0,0,1,0.675,0,8,10,10,8,1},{"Default-furigana","Bleeding Cowboys",32,"&H00FFFFFF","&H000000FF","&H002AC4FD","&H00000000",false,false,false,false,100,100,0,0,1,1,1,7,115,10,150,1}}
	cdiag={{0,"0:00:00.00","0:00:00.00","Hanguel","",0,0,0,"template syl noblank","!retime(\"presyl\",(syl.i == 1) and \"-600\" or -line.kara[syl.i-1].duration, (syl.i == $syln) and \"200\" or \"0\")!{\\an2\\pos($center,!$top-offset_y!)\\fscx90\\fscy90\\bord0\\1c!color[math.random(8)]!\\org(!org_pos()!)\\frz180\\t(0,!(syl.i == $syln) and string.format(\"%s\",line.duration-200) or line.duration!,\\frz0)\\fad(0,!(syl.i == $syln) and \"100\" or \"0\"!)\\p1}!c!"},{0,"0:00:00.00","0:00:00.00","Hanguel","",0,0,0,"code syl all","offset_y = -15 function org_pos() if syl.i == 1 then x_pos = line.left-0.25*syl.height else x_pos = line.left+(line.kara[syl.i].center+line.kara[syl.i-1].center)/2 end y_pos = line.top - offset_y return x_pos..\",\"..y_pos end c= \"m 25 0 l 34 15 l 50 19 l 40 33 l 41 49 l 25 43 l 11 50 l 11 33 l 0 21 l 15 15 l 25 0 \""},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template noblank notext loop 2","!retime(\"syl\",100,1000)!{\\an5\\fad(0,400)\\fscx40\\fscy40\\c!line.styleref.color3!\\3c&HFFFFFF&\\c!line.styleref.color3!\\bord5\\blur10\\shad0\\move($scenter,$smiddle,!$scenter+math.random(-100,100)!,!$smiddle+math.random(-70,70)!\\fad(0,200)}{\\p1}m 10 4 l 10 18 b 7 13 -2 13 1 21 b 3 27 12 30 12 21 l 12 10 l 28 7 l 28 15 b 25 11 16 11 19 18 b 22 25 30 27 30 18 l 30 0\""},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code once","color = {\"&HE0FF93&\",\"&HEEB6FF&\",\"&H84F4FF&\",\"&HFFD39D&\",\"&HFFB7E0&\",\"&H7C7DFF&\",\"&H9DC2FF&\",\"&HAFFFBB&\"}"},{1,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template noblank","!retime(\"syl\",0,200)!{\\an5\\blur6\\bord6\\pos($scenter,$smiddle)\\fad(0,100)\\t(0,100,\\3c!color[math.random(8)]!\\fscx130\\fscy130)\\t(100,$dur,\\3c!line.styleref.color3!\\fscx100\\fscy100\\\\bord2.5\\blur2)}"},{1,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template char noblank","!retime(\"start2syl\",-1000+($si-1)*50,-25)!{\\an5\\\\blur4\\fscx0\\fscy0\\bord0\\frx360\\move($lcenter,!$lmiddle-70!,$scenter,!$smiddle-10!,0,200)\\t(0,500,\\bord2\\frx0)\\t(0,200,\\fscx100\\fscy100)}"},{0,"0:00:00.00","0:00:00.00","Default-furigana","",0,0,0,"template noblank notext loop 2","!retime(\"syl\",100,1000)!{\\an5\\fad(0,400)\\fscx40\\fscy40\\c!line.styleref.color3!\\3c&HFFFFFF&\\c!line.styleref.color3!\\bord5\\blur10\\shad0\\move($scenter,$smiddle,!$scenter+math.random(-100,100)!,!$smiddle+math.random(-70,70)!\\fad(0,200)}{\\p1}m 16 30 b 27 24 30 18 30 14 b 31 8 23 0 16 8 b 10 0 1 8 3 14 b 4 18 6 24 16 30 m 21 6 b 22 6 22 8 21 8 b 20 8 20 6 21 6 m 25 7 b 32 11 28 19 24 23 b 22 25 21 23 23 22 b 27 19 30 10 24 8 b 23 8 23 6 25 7\""},{1,"0:00:00.00","0:00:00.00","Default-furigana","",0,0,0,"template noblank","!retime(\"syl\",0,500)!{\\an5\\pos($center,$middle)\\bord2\\t(0,25,\\fscx150\\fscy150\\\\1c&HFFFFFF&)\\t(25,$dur,\\fscx100\\fscy100\\\\c)\\fad(0,500)}"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template syl noblank","!retime(\"presyl\",(syl.i == 1) and \"-600\" or -line.kara[syl.i-1].duration, (syl.i == $syln) and \"200\" or \"0\")!{\\an2\\pos($center,!$top-offset_y!)\\fscx80\\fscy80\\bord0\\1c!color[math.random(8)]!\\org(!org_pos()!)\\frz180\\t(0,!(syl.i == $syln) and string.format(\"%s\",line.duration-200) or line.duration!,\\frz0)\\fad(0,!(syl.i == $syln) and \"100\" or \"0\"!)\\p1}!c!"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code syl all","offset_y = -15 function org_pos() if syl.i == 1 then x_pos = line.left-0.25*syl.height else x_pos = line.left+(line.kara[syl.i].center+line.kara[syl.i-1].center)/2 end y_pos = line.top - offset_y return x_pos..\",\"..y_pos end c= \"m 16 30 b 27 24 30 18 30 14 b 31 8 23 0 16 8 b 10 0 1 8 3 14 b 4 18 6 24 16 30 m 21 6 b 22 6 22 8 21 8 b 20 8 20 6 21 6 m 25 7 b 32 11 28 19 24 23 b 22 25 21 23 23 22 b 27 19 30 10 24 8 b 23 8 23 6 25 7\""},{0,"0:00:00.00","0:00:00.00","Hanguel","",0,0,0,"template noblank notext loop 2","!retime(\"syl\",100,1000)!{\\an5\\fad(0,400)\\fscx40\\fscy40\\c!line.styleref.color3!\\3c&HFFFFFF&\\c!line.styleref.color3!\\bord5\\blur10\\shad0\\move($scenter,$smiddle,!$scenter+math.random(-100,100)!,!$smiddle+math.random(-70,70)!\\fad(0,200)}{\\p1}m 16 30 b 27 24 30 18 30 14 b 31 8 23 0 16 8 b 10 0 1 8 3 14 b 4 18 6 24 16 30 m 21 6 b 22 6 22 8 21 8 b 20 8 20 6 21 6 m 25 7 b 32 11 28 19 24 23 b 22 25 21 23 23 22 b 27 19 30 10 24 8 b 23 8 23 6 25 7\""},{1,"0:00:00.00","0:00:00.00","Hanguel","",0,0,0,"template noblank","!retime(\"syl\",0,500)!{\\an5\\pos($center,$middle)\\bord2\\t(0,25,\\fscx150\\fscy150\\\\1c&HFFFFFF&)\\t(25,$dur,\\fscx100\\fscy100\\\\c)\\fad(0,500)}"},{1,"0:00:00.00","0:00:00.00","Hanguel","",0,0,0,"template char noblank","!retime(\"start2syl\",-1000+($si-1)*50,-25)!{\\an5\\\\blur4\\fscx0\\fscy0\\bord0\\frx360\\move($lcenter,!$lmiddle-70!,$scenter,!$smiddle-10!,0,200)\\t(0,500,\\bord2\\frx0)\\t(0,200,\\fscx100\\fscy100)}"}}
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

