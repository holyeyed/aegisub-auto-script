local tr = aegisub.gettext
script_name = tr"Effect 040W Đơn giản chữ nhiều màu tim quay"
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

	cstyle={{"phantankhai2013 channel-furigana","Arial",17.5,"&H00FDFCFC","&H000000FF","&H00DF080B","&H00000000",false,true,false,false,100,100,0,0,1,0.5,0,2,10,10,220,1},{"ENG-furigana","RixLoveFool",35,"&H00FBFDFE","&H000000FF","&H00AD0FF1","&H00000000",true,false,false,false,100,100,0,0,1,1,0,2,10,10,40,1},{"phantankhai2013-furigana","Arial",17.5,"&H00FDFCFC","&H000000FF","&H00DF080B","&H00000000",false,true,false,false,100,100,0,0,1,0.5,0,2,10,10,220,1},{"phantankhai2013","Arial",35,"&H00FDFCFC","&H000000FF","&H00DF080B","&H00000000",false,true,false,false,100,100,0,0,1,1,0,2,10,10,220,1},{"ENG","RixLoveFool",60,"&H00FBFDFE","&H000000FF","&H00AD0FF1","&H00000000",true,false,false,false,100,100,0,0,1,2,0,5,10,10,40,1},{"phantankhai2013 channel","Arial",35,"&H00FDFCFC","&H000000FF","&H00DF080B","&H00000000",false,true,false,false,100,100,0,0,1,1,0,2,10,10,220,1}}
	cdiag={{0,"0:00:00.00","0:00:00.00","ENG","",0,0,0,"code syl all","function char_counter(ref) ci[ref] = ci[ref] + 1; return \"\" end ;"},{0,"0:00:00.00","0:00:00.00","ENG","",0,0,0,"code line all"," ci = {0,0,0,0,0,0,0}; cn = _G.unicode.len(orgline.text_stripped:gsub(\" \",\"\"))"},{0,"0:00:00.00","0:00:00.00","ENG","",0,0,0,"code once","function set_temp(ref,val) temp[ref] = val; return val; end"},{0,"0:00:00.00","0:00:00.00","ENG","",0,0,0,"code once","temp = {}"},{1,"0:00:00.00","0:00:00.00","ENG","ptk2013",0,0,0,"template char","!char_counter(1)!!retime(\"start2syl\",-700+(ci[1]-1)*20,0)!{\\an5\\pos($center,$middle)\\fad(300,0)\\3c&HFFFFFF&\\bord4\\blur6\\t(100,200,\\3c!set_temp(\"color\",_G.ass_color(math.random(255),math.random(255),math.random(255)))!\\bord1\\blur3)}"},{0,"0:00:00.00","0:00:00.00","ENG","ptk2013",0,0,0,"template notext noblank loop 7 multi","!retime(\"presyl\",-700+($dur/maxj)*j,0)!{\\an5\\fscx!15-j!\\fscy!15-j!\\moves4(!$center+50!,!$middle-80!,!$center-140!,!$middle-30!,!$center!,!$middle+120!,!$center+50!,!$middle-20!)\\3c!set_temp(\"color\",_G.ass_color(math.random(255),math.random(255),math.random(255)))!\\fad(300,0)\\t(0,500,0.7,\\fr360\\fscx!15-j!\\fscy!15-j!)\\blur3\\p1}m 0 25 b 22 10 24 2 27 -6 b 30 -17 10 -36 0 -13 b -11 -36 -30 -17 -26 -6 b -25 2 -21 10 0 25"},{0,"0:00:00.00","0:00:00.00","ENG","ptk2013",0,0,0,"template notext noblank multi","!retime(\"syl\",-200,0)!{\\an5\\fscx25\\fscy25\\fr-180\\moves3(!$center+30!,!$middle+10!,!$center+10!,!$middle-20!,!$center!,!$middle+30!)\\3c!set_temp(\"color\",_G.ass_color(math.random(255),math.random(255),math.random(255)))!\\fad()\\t(0,500,0.7,\\fr0\\fscx30\\fscy30)\\blur10\\p1}m 0 25 b 22 10 24 2 27 -6 b 30 -17 10 -36 0 -13 b -11 -36 -30 -17 -26 -6 b -25 2 -21 10 0 25"},{1,"0:00:00.00","0:00:00.00","ENG","ptk2013",0,0,0,"template noblank multi","!retime(\"presyl\",0,500)!{\\an5\\fad\\moves3($center,$middle,$center,!$middle+30!,$center,!$middle!)\\3c!temp.color!\\blur3}"}}
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

