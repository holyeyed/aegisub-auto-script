local tr = aegisub.gettext
script_name = tr"Effect 013W hoa đào chữ bay lên"
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

	cstyle={{"Default-furigana","Harrington",20,"&H00FFFFFF","&H000000FF","&H00E1ADFA","&H00000000",true,false,false,false,100,100,0,0,1,1,1,5,10,10,10,1},{"Default","Harrington",40,"&H00FFFFFF","&H000000FF","&H00B558E2","&H00000000",true,false,false,false,100,100,0,0,1,2,2,5,10,10,10,1}}
	cdiag={{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"Code once","xoay = {\"-5000\",\"4000\",\"-6000\",\"5000\",\"7000\",\"6000\"} ;"},{0,"0:00:00.26","0:00:00.26","Default","",0,0,0,"template notext noblank loop 3","!retime(\"syl\",0,800)!{\\an5\\move(!$scenter!,!$smiddle!,!$scenter+math.random(-30,30)!,!$smiddle+math.random(10,70)!)\\blur0\\bord2\\fscx30\\fscy30\\t(\\fry!math.random(260)!)\\fad(0,300)\\p1\\be1}m 21 21 b 6 -7 46 -7 29 21 b 49 -2 63 34 30 28 b 63 44 31 65 25 32 b 26 65 -12 45 21 29 b -13 38 0 -5 21 21 m 25 22 b 21 22 21 28 25 28 b 29 28 29 22 25 22 \""},{1,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template noblank","!retime(\"syl\",0,500)!{\\an5\\pos($center,$middle)\\bord2\\t(0,25,\\fscx90\\fscy90\\3c&HFFFFFF&\\c&HAA41DC&\\t(25,$dur,\\fscx60\\fscy60\\frx!360*(-1)^line.i!\\3c&HFFFFFF&\\c&HAA41DC&)\\fad(0,500)\\p1}m 21 21 b 6 -7 46 -7 29 21 b 49 -2 63 34 30 28 b 63 44 31 65 25 32 b 26 65 -12 45 21 29 b -13 38 0 -5 21 21 m 25 22 b 21 22 21 28 25 28 b 29 28 29 22 25 22 \""},{1,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template char noblank","!retime(\"start2syl\",-1000+($si-1)*150,-25)!{\\frz100\\be1\\fscx0\\fscy0\\bord3\\blur2\\an5\\move(!$center-50!,!$middle-20!,$scenter,$smiddle,0,500)\\t(0,500,\\fscx100\\fscy100\\frz0\\alpha&H00)}"},{1,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template noblank","!retime(\"syl\",0,500)!{\\an5\\move($scenter,!$smiddle-30!,!$scenter+math.random(-50,50)!,!$smiddle+math.random(-350,-250)!,0,3000)\\frz!xoay[math.random(6)]!\\bord2\\t(0,25,\\fscx100\\fscy100\\3c&HAA41DC&\\\\t(25,$dur,\\fscx100\\fscy100\\3c&HAA41DC&\\c&HFFFFFF&\\fad(0,800)}"}}
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

