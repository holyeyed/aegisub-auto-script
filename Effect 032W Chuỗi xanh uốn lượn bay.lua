local tr = aegisub.gettext
script_name = tr"Effect 032W Chuỗi xanh uốn lượn bay"
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

	cstyle={{"Bong Bong-furigana","UVN Banh Mi",20,"&H00FFEDC9","&H00FFC862","&H00FFC862","&H00FFC862",false,false,false,false,100,100,0,0,1,0.3,0.15,2,10,10,10,1},{"Default-furigana","Arial",17,"&H00FFFFFF","&H000000FF","&H007D7D7D","&H0000009D",false,false,false,false,100,100,0,0,1,1,1,2,10,10,10,1},{"Default","Arial",20,"&H00FB7A59","&H00FBA55D","&H00FFB038","&H00F4A04A",false,false,false,false,100,100,0,0,1,0.6,0.9,5,10,10,10,1},{"Bong Bong","Times New Roman",56,"&H00C9261F","&H00D72B1A","&H00E93F3C","&H00EE3F29",true,true,false,false,100,100,0,0,1,2,0.3,5,10,10,0,1}}
	cdiag={{0,"0:00:00.00","0:00:00.00","Bong Bong","",0,0,0,"code once","bong_bong={\"m 21 10 b 21 4 18 0 11 0 b 4 0 1 4 1 10 b 1 16 4 20 11 20 b 18 20 21 16 21 10 m 20 7 b 17 9 9 6 14 1 b 17 1 20 5 20 7\"};"},{0,"0:00:00.00","0:00:00.00","Bong Bong","",0,0,0,"code once","a = 10 ; b = -10 ; d = 5"},{0,"0:00:00.00","0:00:00.00","Bong Bong","",0,0,0,"code syl all"," if syl.i < (#line.kara/2-3) then c=a else if syl.i > (#line.kara/2+4) then c=b else c=0  end end"},{0,"0:00:00.00","0:00:00.00","Bong Bong","",0,0,0,"template noblank notext multi","!relayer(maxj-j)!!retime(\"syl\",-800+d*j,-$dur-$dur/maxj+$dur*j/maxj+$dur/maxj)!!maxloop(25)!{\\an5\\move(!line.center!,$bottom,!line.left+syl.center!,$middle,0,!800-d*j+$dur*j/maxj!)\\org(1000,2000)\\t(0,!800-d*j+$dur*j/maxj!,\\frx!3!\\frz!c!\\frz0\\frx0)\\c&HFF1600&\\4c&HFFFFFF&\\fscx!100-100*j/maxj!\\fscy!100-100*j/maxj!\\blur1\\3c&HF94400&\\fade5\\bord1\\blur5}."},{0,"0:00:00.00","0:00:00.00","Bong Bong","",0,0,0,"template noblank notext multi","!retime(\"syl\",0,400)!!maxloop(5)!{\\an5\\move(!line.left+syl.center+math.random(-20,20)!,!$middle!,!line.left+syl.center+math.random(-45,45)!,!$top+math.random(-60,-20)!)\\p!math.random(1,2)!\\fad(0,100)\\bord2\\shad0\\3c&H7D7D7D&\\4c&H7D7D7D&\\1a&HFF&\\fscx50\\fscy50}m 21 10 b 21 4 18 0 11 0 b 4 0 1 4 1 10 b 1 16 4 20 11 20 b 18 20 21 16 21 10 m 20 7 b 17 9 9 6 14 1 b 17 1 20 5 20 7"},{0,"0:00:00.00","0:00:32.41","Bong Bong","",0,0,0,"template noblank char","!retime(\"start2syl\",-450+($si-1)*30,0)!{\\an5\\move($scenter,!$smiddle-25!,$scenter,$smiddle,0,400)\\c&HFFFFFF&\\3c&HFF8700&\\bord2\\blur4\\fad(300,0)}"},{0,"0:00:00.00","0:00:00.00","Bong Bong","",0,0,0,"template noblank multi","!retime(\"syl\",0,200)!{\\an5\\pos(!$center!,!$middle!)\\t(0,0\\bord3\\blur2\\fade0\\3c&HD0F6F3&\\1a&HEF&\\4a&HEF&\\t(0,!$dur-100!,\\bord0\\blur4\\fade5)}"},{0,"0:00:00.00","0:00:00.00","Bong Bong","",0,0,0,"template syl noblank","!retime(\"start2syl\",-200,0)!!maxloop(5)!{\\an5\\move(!$center!,!$middle!,!line.left+syl.center+math.random(-45,45)!,!$top+math.random(-60,-20)!,0,0)\\p!math.random(1,2)!\\fad(0,100)\\bord2\\shad0\\3c&H7D7D7D&\\4c&H7D7D7D&\\1a&HFF&\\fscx30\\fscy30}m 21 10 b 21 4 18 0 11 0 b 4 0 1 4 1 10 b 1 16 4 20 11 20 b 18 20 21 16 21 10 m 20 7 b 17 9 9 6 14 1 b 17 1 20 5 20 7"}}
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

