local tr = aegisub.gettext
script_name = tr"Effect 025W Ngôi sao trắng trẻo thanh mát"
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

	cstyle={{"mua-furigana","Comic Sans MS",20,"&H00FFFFFF","&H000000FF","&H0008098A","&H00000000",true,false,false,false,100,100,0,0,1,1,0,9,20,80,80,1},{"stars-furigana","Comic Sans MS",20,"&H0008098A","&H0008098A","&H00FFFFFF","&H00FFFFFF",true,false,false,false,100,100,0,0,1,1,0,9,200,80,30,1},{"Default-furigana","Arial",15,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,false,false,false,100,100,0,0,1,1.5,1.5,2,20,20,15,1},{"Default","Arial",30,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,false,false,false,100,100,0,0,1,3,3,2,20,20,15,1},{"stars","Comic Sans MS",40,"&H0008098A","&H0008098A","&H00FFFFFF","&H00FFFFFF",true,false,false,false,100,100,0,0,1,2,0,9,200,80,30,1},{"mua","Comic Sans MS",40,"&H00FFFFFF","&H000000FF","&H0008098A","&H00000000",true,false,false,false,100,100,0,0,1,2,0,9,20,80,80,1}}
	cdiag={{1,"0:00:00.00","0:00:00.00","stars","",0,0,0,"template noblank","!retime(\"start2syl\",-350,-25)!{\\an5\\blur2\\pos($scenter,$smiddle)\\fry90\\t(0,250,\\fry0)}"},{0,"0:00:00.00","0:00:00.00","stars","",0,0,0,"template noblank notext","!retime(\"syl\",100,1000)!{\\an5\\fad(0,400)\\1a&HFF&\\3c&HFFFFFF&\\bord5\\blur3\\shad0\\pos($scenter,$smiddle)\\frz0\\fscx0\\fscy0\\t(0,100,\\fscx80\\fscy80)\\t(0,5000,\\frz1000)\\fad(0,200)\\p1}m 25 0 l 34 15 l 50 19 l 40 33 l 41 49 l 25 43 l 11 50 l 11 33 l 0 21 l 15 15 l 25 0 \""},{0,"0:00:00.00","0:00:00.00","stars","",0,0,0,"template noblank notext loop 4","!retime(\"syl\",100,1000)!{\\an5\\fad(0,400)\\fscx20\\fscy20\\c&HFFFFFF&\\3c&HFFFFFF&\\c&HFFFFFF&\\bord5\\blur10\\shad0\\move($scenter,$smiddle,!$scenter+math.random(-100,100)!,!$smiddle+math.random(-70,70)!\\fad(0,200))}{\\p1}m 3 3 b 6 -1 13 -1 17 3 b 20 7 20 13 17 17 b 14 21 6 21 3 17 b 0 13 0 7 3 3 \""},{0,"0:00:00.00","0:00:00.00","stars","",0,0,0,"template noblank notext loop 2","!retime(\"syl\",100,1000)!{\\an5\\fad(0,400)\\fscx25\\fscy25\\c&HFFFFFF&\\3c&HFFFFFF&\\c&HFFFFFF&\\bord5\\blur10\\shad0\\move($scenter,$smiddle,!$scenter+math.random(-100,100)!,!$smiddle+math.random(-70,70)!\\fad(0,200))}{\\p1}m 25 0 l 34 15 l 50 19 l 40 33 l 41 49 l 25 43 l 11 50 l 11 33 l 0 21 l 15 15 l 25 0 \""},{0,"0:00:00.00","0:00:00.00","stars","",0,0,0,"template noblank","!retime(\"syl\",-25,300)!{\\an5\\blur2\\pos($center,$middle)\\bord2\\t(0,25,\\fscx150\\fscy150\\3c&HFFFFFF&\\1c&HFFFFFF&)\\t(25,$dur,\\fscx100\\fscy100\\3c&HFFFFFF&\\1c!line.styleref.color1!)\\fad(0,300)}"}}
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

