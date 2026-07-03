local tr = aegisub.gettext
script_name = tr"Effect 015W Hoa xuân chữ đen"
script_description = tr"kiểu Word"
script_author = "DeathNoteVN"
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

	cstyle={{"scrip-furigana","Arial",8.5,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,false,false,false,133.333,100,0,0,1,0.825,0.825,2,11,11,8,1},{"Chép củaDefault-furigana","Arial",8.5,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,false,false,false,133.333,100,0,0,1,0.825,0.825,2,11,11,8,1},{"Default-furigana","Vf-Script1",20,"&H00000000","&H00000000","&H005FFFFF","&H00000000",true,false,false,false,133.333,100,0,0,1,0.5,0,5,11,11,8,1},{"Default","Vf-Script1",40,"&H00000000","&H00000000","&H005FFFFF","&H00000000",true,false,false,false,133.333,100,0,0,1,1,0,5,11,11,8,1},{"Chép củaDefault","Arial",17,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,false,false,false,133.333,100,0,0,1,1.65,1.65,2,11,11,8,1},{"scrip","Arial",17,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,false,false,false,133.333,100,0,0,1,1.65,1.65,2,11,11,8,1}}
	cdiag={{0,"0:00:00.00","0:00:02.73","Default","",0,0,0,"code once","hoa = {\"m 21 21 b 6 -7 46 -7 29 21 b 49 -2 63 34 30 28 b 63 44 31 65 25 32 b 26 65 -12 45 21 29 b -13 38 0 -5 21 21 m 25 22 b 21 22 21 28 25 28 b 29 28 29 22 25 22 \",\"m 21 21 b 11 -1 42 -1 29 21 b 46 5 54 34 30 28 b 50 40 30 56 25 32 b 25 56 -2 44 21 29 b -3 37 5 6 21 21 m 25 22 b 21 22 21 28 25 28 b 29 28 29 22 25 22  \",\"m 1 -5 l 4 -62 l 6 -5 l 30 -25 l 8 -3 l 69 -1 l 8 2 l 30 26 l 6 4 l 3 62 l 1 4 l -24 26 l -2 2 l -62 -1 l -2 -3 l -24 -25 \",\"m -9 4 l -8 -21 l -6 4 l 4 -5 l -5 5 l 19 7 l -5 8 l 5 18 l -6 9 l -7 33 l -9 9 l -19 18 l -10 7 l -34 6 l -10 5 l -20 -6 \",\"m -12 4 l -12 -18 l -10 4 l -1 -5 l -9 5 l 9 5 l -9 7 l -2 14 l -10 8 l -10 27 l -12 8 l -21 16 l -13 6 l -35 5 l -13 5 l -20 -4 \" }"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template noblank","!retime(\"start2syl\",-650+50*$si,0)!{\\an5\\fsp20\\pos($center,$middle)\\fscx30\\fscy30\\t(0,300,\\fsp0\\fscx120\\fscy120)\\t(300,600,\\fscx100\\fscy100)\\fad(100,0)}"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template syl","!retime(\"syl\",0,500)!{\\an5\\move($center,$middle,$center,$middle)\\fscx0\\fscy0\\}"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template notext loop 5","!retime(\"syl\",-10,1000)!{\\an4\\move(!$center-10!,!$middle-10!,!$center+math.random(-10,100)!,!$middle+math.random(-50,50)!)\\t(0,3000,0.8,\\frz!math.random(0,500)!)\\fad(0,500)\\bord0\\3c&H00FFFF&\\blur0\\bord0\\3c&HFFFFFF&\\1c&HFFFFFF&\\t(0,200,\\1c&H00FFFF&)\\t(200,400,\\1c&HFFFFFF&)\\t(400,600,\\1c&H00FFFF&)\\t(600,800,\\1c&HFFFFFF&)\\t(1000,1200,\\1c&H00FFFF&)\\t(1200,1400,\\1c&HFFFFFF&)\\t(1400,1600,\\1c&H00FFFF&)\\t(1600,1800,\\1c&HFFFFFF&)\\t(2000,2200,\\1c&H00FFFF&)\\t(2200,2400,\\1c&HFFFFFF&)\\t(2400,2600,\\1c&H00FFFF&)\\p3}!hoa[math.random(1,2)]!"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template notext loop 5","!retime(\"syl\",-10,1000)!{\\an5\\move(!$center+10!,!$middle+10!,!$center+math.random(-70,70)!,!$middle+math.random(-100,100)!)\\blur1\\bord1\\fad(0,500)\\bord0\\3c&HFFFFFF&\\1c&HFFFFFF&\\t(0,200,\\1c&HB4FFFF&)\\t(200,400,\\1c&HFFFFFF&)\\t(400,600,\\1c&HB4FFFF&)\\t(600,800,\\1c&HFFFFFF&)\\t(1000,1200,\\1c&HB4FFFF&)\\t(1200,1400,\\1c&HFFFFFF&)\\t(1400,1600,\\1c&HB4FFFF&)\\t(1600,1800,\\1c&HFFFFFF&)\\t(2000,2200,\\1c&HB4FFFF&)\\t(2200,2400,\\1c&HFFFFFF&)\\t(2400,2600,\\1c&HB4FFFF&)\\p3}!hoa[math.random(3,4)]!"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template notext loop 10","!retime(\"syl\",-10,1000)!{\\an5\\move(!$center+10!,!$middle+10!,!$center+math.random(-70,70)!,!$middle+math.random(-100,100)!)\\fad(0,500)\\bord0\\3c&HFFFFFF&\\1c&HFFFFFF&\\t(200,400,\\1c&H00FFFF&)\\t(400,600,\\1c&HFFFFFF&)\\t(600,800,\\1c&H00FFFF&)\\t(800,1000,\\1c&HFFFFFF&)\\t(1000,1200,\\1c&H00FFFF&)\\t(1200,1400,\\1c&HFFFFFF&)\\t(1400,1600,\\1c&H00FFFF&)\\p3}!hoa[5]!"}}
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

