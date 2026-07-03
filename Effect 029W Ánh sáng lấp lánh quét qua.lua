local tr = aegisub.gettext
script_name = tr"Effect 029W Ánh sáng lấp lánh quét qua"
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

	cstyle={{"Default-furigana","Exotic",25,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,false,false,false,100,100,0,0,1,0,0,5,10,10,10,1},{"Default","Exotic",50,"&H00000000","&H00000000","&H00FFFFFF","&H00000000",false,false,false,false,100,100,0,0,1,3,0,5,10,10,10,1}}
	cdiag={{1,"0:00:00.08","0:00:05.08","Default","",0,0,0,"template syl","!retime(\"start2syl\", -500+($si-1)*50,-30)!{\\an5\\org(-5000,!$smiddle+5!)\\alpha&HFF\\fscx130\\fscy130\\t(0,150,\\3a&H00\\1a&H70\\t(0,300,\\fscx100\\fscy100))\\t(0,100,\\frz0.2\\t(100,200,\\frz0))\\c!line.styleref.color2!\\move(!$scenter+10!,!$smiddle+10!,$scenter,$smiddle,100,400)}"},{1,"0:00:00.08","0:00:05.08","Default","",0,0,0,"template noblank","!retime(\"syl\",-30,800)!{\\an5\\fscx100\\fscy100\\fad(0,500)\\c!line.styleref.color1!\\bord2\\shad0\\move($scenter,$smiddle,!$scenter-100!,!$smiddle-3!,0,3000)\\t(0,30,\\c&HFFFFFF&\\3c&HFFFFFF&\\bord5\\blur8\\fscx200\\fscy200)\\t(30,$dur,\\bord2\\blur4\\fscx85\\fscy85)}"},{1,"0:00:00.08","0:00:05.08","Default","",0,0,0,"template noblank","!retime(\"syl\",-30,-30)!{\\an5\\fad(0,100)\\c&HFFFFFF&\\fscx100\\fscy200)\\bord2\\blur15\\shad0\\move($sleft,$smiddle,$sright,$smiddle,0,$dur)\\t(0,100,\\bord5\\blur25\\fscx300\\fscy300)\\t(100,$dur,\\bord2\\blur15\\fscx100\\fscy100)\\p1}m 20 20 b 21 21 21 21 20 20 b 25 22 24 20 25 0 b 25 22 26 20 30 20 b 28 25 31 24 44 25 b 31 26 28 25 30 30 b 25 28 26 33 25 50 b 24 33 25 28 20 30 b 22 25 19 26 7 25 b 19 24 22 25 20 20 \""}}
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

