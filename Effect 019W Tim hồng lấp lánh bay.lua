local tr = aegisub.gettext
script_name = tr"Effect 019W Tim hồng lấp lánh bay"
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

	cstyle={{"Hat be-furigana","UVN Banh Mi",25,"&HFFFFFFFF","&H00FFFFFF","&H64D0FF00","&H0036400D",false,false,false,false,100,100,0,0,1,1,0.05,5,10,10,0,1},{"Se quay tro ve-furigana","UTM Alpine KT",20,"&H00FFFFFF","&H00000000","&H00EF00FF","&H00000000",false,false,false,false,100,100,0,0,1,1,0,5,10,10,0,1},{"Yeu lai tu dau-furigana","UTM Dinh Tran",32,"&H00FFFFFF","&H000000FF","&H32EF00FF","&H00000000",false,false,false,false,100,100,0,0,1,0.5,0,5,10,10,40,1},{"Default2-furigana","Arial",10,"&H00000000","&H00000000","&H00000000","&H00000000",false,false,false,false,100,100,0,0,1,1,1,2,10,10,0,1},{"Default-furigana","Arial",10,"&H00000000","&H00000000","&H00000000","&H00000000",false,false,false,false,100,100,0,0,1,1,1,2,10,10,10,1},{"Thanh-furigana","UTM Novido",30,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,false,false,false,100,100,0,0,1,1,1,9,10,10,10,1},{"Loi-furigana","UTM Dinh Tran",40,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,false,false,false,100,100,0,0,1,1,1,5,10,10,10,1},{"Yeu lai tu dau","UTM Dinh Tran",85,"&H00FFFFFF","&H000000FF","&H32EF00FF","&H00000000",false,false,false,false,100,100,0,0,1,1,0,5,10,10,30,1},{"Thanh","Tahoma",22,"&H00FFFFFF","&H000000FF","&H00FF00F8","&H00000000",false,false,false,false,100,100,0,0,1,0.5,0,9,0,20,20,1},{"Default","Arial",20,"&H00000000","&H00000000","&H00000000","&H00000000",false,false,false,false,100,100,0,0,1,2,2,8,10,10,0,1},{"Se quay tro ve","UTM Spring",50,"&H00FFFFFF","&H00FFFFFF","&H32FB00FF","&H0036400D",false,false,false,false,100,100,0,0,1,1,0,5,10,10,0,1},{"Hat be","UTM Azuki",50,"&H00FFFFFF","&H00FFFFFF","&H32FB00FF","&H0036400D",false,false,false,false,100,100,0,0,1,1,0,5,10,10,0,1}}
	cdiag={{0,"0:00:00.00","0:00:02.73","Default","",0,0,0,"code once","hinhve = {\"m 16 30 b 28 22 30 18 30 14 b 32 8 22 -2 16 10 b 10 -2 0 8 2 14 b 2 18 4 22 16 30 \",\"m 14 26 b 22 20 23 18 23 15 b 25 11 17 6 14 13 b 10 6 3 12 5 16 b 4 18 7 21 14 26 \",\"m 1 -5 l 4 -62 l 6 -5 l 30 -25 l 8 -3 l 69 -1 l 8 2 l 30 26 l 6 4 l 3 62 l 1 4 l -24 26 l -2 2 l -62 -1 l -2 -3 l -24 -25 \",\"m -9 4 l -8 -21 l -6 4 l 4 -5 l -5 5 l 19 7 l -5 8 l 5 18 l -6 9 l -7 33 l -9 9 l -19 18 l -10 7 l -34 6 l -10 5 l -20 -6 \",\"m -12 4 l -12 -18 l -10 4 l -1 -5 l -9 5 l 9 5 l -9 7 l -2 14 l -10 8 l -10 27 l -12 8 l -21 16 l -13 6 l -35 5 l -13 5 l -20 -4 \"}"},{0,"0:00:00.00","0:00:00.00","Yeu lai tu dau","",0,0,0,"template noblank","!retime(\"start2syl\",-650+50*$si,0)!{\\an5\\move(!$scenter+1200!,$smiddle,$scenter,$smiddle,0,250)\\fad(300,0)}"},{0,"0:00:00.00","0:00:00.00","Yeu lai tu dau","",0,0,0,"template syl","!retime(\"syl\",0,500)!{\\an5\\move($center,$middle,!$center-math.random(35,80)!,!$middle+math.random(-60,60)!)\\fad(0,300)\\3c&HEF00FF&\\blur3\\bord3}"},{0,"0:00:00.00","0:00:00.00","Yeu lai tu dau","",0,0,0,"template notext loop 2","!retime(\"syl\",300,1000)!{\\an4\\move(!$center+10!,!$middle-10!,!$center+math.random(-50,50)!,!$middle+math.random(-90,90)!)\\t(0,3000,0.8,\\frz!math.random(-500,500)!)\\fad(0,500)\\bord0\\3c&HFFFFFF&\\1c&HEF00FF&\\p2}!hinhve[math.random(1,2)]!"},{0,"0:00:00.00","0:00:00.00","Yeu lai tu dau","",0,0,0,"template notext loop 5","!retime(\"syl\",300,1000)!{\\an5\\move(!$center+10!,!$middle+10!,!$center+math.random(-70,70)!,!$middle+math.random(-100,100)!)\\fad(0,500)\\bord0\\3c&HFFFFFF&\\1c&HFFFFFF&\\t(0,200,\\1c&HEF00FF&)\\t(200,400,\\1c&HFFFFFF&)\\t(400,600,\\1c&HEF00FF&)\\t(600,800,\\1c&HFFFFFF&)\\t(1000,1200,\\1c&HEF00FF&)\\t(1200,1400,\\1c&HFFFFFF&)\\t(1400,1600,\\1c&HEF00FF&)\\t(1600,1800,\\1c&HFFFFFF&)\\t(2000,2200,\\1c&HEF00FF&)\\t(2200,2400,\\1c&HFFFFFF&)\\t(2400,2600,\\1c&HEF00FF&)\\p3}!hinhve[math.random(3,4)]!"},{0,"0:00:00.00","0:00:00.00","Yeu lai tu dau","",0,0,0,"template notext loop 10","!retime(\"syl\",300,1000)!{\\an5\\move(!$center+10!,!$middle+10!,!$center+math.random(-70,70)!,!$middle+math.random(-100,100)!)\\fad(0,500)\\bord0\\3c&HFFFFFF&\\1c&HFFFFFF&\\t(200,400,\\1c&HEF00FF&)\\t(400,600,\\1c&HFFFFFF&)\\t(600,800,\\1c&HEF00FF&)\\t(800,1000,\\1c&HFFFFFF&)\\t(1000,1200,\\1c&HEF00FF&)\\t(1200,1400,\\1c&HFFFFFF&)\\t(1400,1600,\\1c&HEF00FF&)\\p3}!hinhve[5]!"}}
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

