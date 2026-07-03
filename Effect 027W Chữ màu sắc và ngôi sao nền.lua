local tr = aegisub.gettext
script_name = tr"Effect 027W Chữ màu sắc và ngôi sao nền"
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

	cstyle={{"Black OP-furigana","Computerfont",27,"&H00CD4B3C","&H00FFFFFF","&H00EDDFC0","&H00000000",false,false,false,false,100,100,0,0,1,1,0,8,10,10,10,1},{"Black OP","Computerfont",55,"&H00FFFFFF","&H00FFFFFF","&H00EDDFC0","&H00000000",false,false,false,false,100,100,5,0,1,2,0,8,10,10,10,1}}
	cdiag={{0,"0:00:00.00","0:00:02.00","Black OP","",0,0,0,"","Efecto creado por AEG si lo vas a usar por favor dame crédito por el efecto \\ Effect created by AEG if you going to used please give me credit for the effect"},{0,"0:00:00.00","0:00:00.00","Black OP","",0,0,0,"code line","colores = {\"&HCD4B3C&\",\"&H3CCD66&\",\"&H3C3DCD&\",\"&HCD3CBB&\"};"},{1,"0:00:00.00","0:00:22.64","Black OP","",0,0,0,"template syl","!retime(\"syl\",-200,200)!{\\a6\\3c&H!colores[math.random(1,4)]!\\move($scenter,$smiddle,$scenter,$smiddle)\\blur5\\fscx100\\fscy100\\t(300,500,\\fscx140\\fscy140)\\t(550,600,\\fscx100\\fscy100)}"},{0,"0:00:00.00","0:00:22.64","Black OP","",0,0,0,"template char","!retime(\"start2syl\",-400,-100)!{\\a6\\fsp5\\3c&H!colores[math.random(1,4)]!\\pos($center,$middle)\\blur5\\fscx100\\fscy100\\frx60\\t(300,350,\\fscx120\\fscy120\\frx(0))}"},{0,"0:00:22.64","0:00:22.64","Black OP","",0,0,0,"template syl notext noblank","!retime(\"syl\",0,0)!{\\a5\\3c&H!colores[math.random(1,4)]!\\move(!$sleft!,$smiddle,!$sright!,!$smiddle!)\\fscx100\\fscy100\\1c&HFFFFFF&\\bord3\\blur5\\p1}m 0 -25 l 6 -7 l 27 -7 l 10 4 l 16 22 l 0 11 l -16 23 l -10 4 l -26 -7 l -6 -7 l 0 -25 {\\p0}"}}
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

