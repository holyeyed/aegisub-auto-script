local tr = aegisub.gettext
script_name = tr"Effect 031W Con sâu màu sắc luồn lách"
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

	cstyle={{"lastcolorfurinaga-furigana","Arial",16,"&H00FFFFFF","&H000000FF","&H00FFFFFF","&H00000000",true,false,false,false,100,100,0,0,1,1.43333,1.43333,8,16,16,36,1},{"lastcolor-furigana","Malgun Gothic",18,"&H00FFFFFF","&H000000FF","&H00FFFFFF","&H00000000",true,false,false,false,100,100,0,0,1,1.43333,1.43333,2,16,16,50,129},{"colorfurinaga-furigana","Arial",16,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",true,false,false,false,100,100,0,0,1,1.43333,1.43333,8,16,16,36,1},{"color-furigana","Malgun Gothic",17,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",true,false,false,false,100,100,0,0,1,1.43333,1.43333,2,16,16,50,129},{"chorus-furigana","Arial",14,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,false,false,false,100,100,0,0,1,1.43333,1.43333,2,16,16,79,1},{"translation-furigana","Arial",14,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,false,false,false,100,100,0,0,1,1.43333,1.43333,2,16,16,14,1},{"furinaga-furigana","Arial",14,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,false,false,false,100,100,0,0,1,1.43333,1.43333,8,16,16,29,1},{"Hanguel-furigana","Arial",14,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,false,false,false,100,100,0,0,1,1.43333,1.43333,2,16,16,50,129},{"Default-furigana","Arial",14,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,false,false,false,100,100,0,0,1,1.43333,1.43333,2,16,16,14,1},{"Default","Arial",29,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,false,false,false,100,100,0,0,1,2.86667,2.86667,2,16,16,14,1},{"Hanguel","Malgun Gothic",36,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",true,false,false,false,100,100,0,0,1,2.86667,2.86667,2,16,16,50,129},{"furinaga","Arial",31,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",true,false,false,false,100,100,0,0,1,2.86667,2.86667,8,16,16,36,1},{"translation","Arial",29,"&H00FFFFFF","&H000000FF","&H00E5C69D","&H00000000",false,false,false,false,100,100,0,0,1,2.86667,2.86667,2,16,16,14,1},{"chorus","Malgun Gothic",29,"&H00FFFFFF","&H000000FF","&H00E5C69D","&H00000000",false,false,false,false,100,100,0,0,1,1.43333,0,2,16,16,79,1},{"color","Malgun Gothic",36,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",true,false,false,false,100,100,0,0,1,2.86667,2.86667,2,16,16,50,129},{"colorfurinaga","Arial",31,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",true,false,false,false,100,100,0,0,1,2.86667,2.86667,8,16,16,36,1},{"lastcolor","Malgun Gothic",36,"&H00FFFFFF","&H000000FF","&H00FFFFFF","&H00000000",true,false,false,false,100,100,0,0,1,2.86667,2.86667,2,16,16,50,129},{"lastcolorfurinaga","Arial",31,"&H00FFFFFF","&H000000FF","&H00FFFFFF","&H00000000",true,false,false,false,100,100,0,0,1,2.86667,2.86667,8,16,16,36,1},{"chorusfurigana","Malgun Gothic",29,"&H00FFFFFF","&H000000FF","&H00E5C69D","&H00000000",false,false,false,false,100,100,0,0,1,1.43333,0,8,16,16,67,1}}
	cdiag={{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code syl all","fxgroup.lastsyl = syl.i == #line.kara"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code syl all","fxgroup.nolastsyl = not fxgroup.lastsyl"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code once all","set_color5 = {\"&H6E43E3&\",\"&HFFFFFF&\",\"&H00CAF9&\",\"&HB9BC00&\",\"&H01FB02&\"}"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code once all","function set_color(actor) if actor == \"junho\" then return \"&HFFFFFF&\" elseif actor == \"junsu\" then return \"&H000000&\" elseif actor == \"khun\" then return \"&H7E50E0&\" elseif actor == \"wooyeong\" then return \"&H00B9F4&\" elseif actor == \"chanseong\" then return \"&H000000&\" elseif actor == \"taekyeon\" then return \"&H38EEA5&\" else return \"&HFFFFFF&\" end end"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code once all","function set_color3(actor) if actor == \"junho\" then return \"&H555555&\" elseif actor == \"junsu\" then return \"&HFFFFFF&\" elseif actor == \"khun\" then return \"&HFFFFFF&\" elseif actor == \"wooyeong\" then return \"&HFFFFFF&\" elseif actor == \"chanseong\" then return \"&HFFFFFF&\" elseif actor == \"taekyeon\" then return \"&HFFFFFF&\" else return \"&HE5C69D&\" end end"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code once all","function char_counter(ref) ci[ref] = ci[ref] + 1; return \"\" end"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code once all","dirk = {\"m 20 0  b  20 10  30 20  40 20  b  30 20  20 30  20 40  b  20 30  10 20  0 20  b  10 20  20 10  20 0\"}"},{0,"0:00:00.00","0:00:00.00","furinaga","",0,0,0,"template","!retime(\"start2syl\",-1000+syl.i*30,-25)!{\\an5\\fsp20\\pos($center,$middle)\\blur3\\1c!set_color(line.actor)!\\3c!set_color3(line.actor)!\\fscx50\\fscy50\\t(0,300,\\fsp0\\fscx120\\fscy120\\blur1)\\t(300,600,\\fscx100\\fscy100)\\fad(100,0)}"},{1,"0:00:00.00","0:00:00.00","furinaga","",0,0,0,"template multi","!retime(\"syl\",-25,100)!{\\an5\\pos($center,$middle)\\bord2\\blur3\\1c!set_color(line.actor)!\\t(0,25,\\fscx130\\fscy130\\3c&HFFFFFF&)\\t(50,$dur,\\fscx100\\fscy100)\\fad(0,300)}"},{1,"0:00:00.00","0:00:00.00","furinaga","effect type1",0,0,0,"template syl fxgroup nolastsyl loop 10","!retime(\"syl\",($dur/maxj)*j,($dur/maxj)*j)!{\\an5\\blur3\\1c&HFFFFFF&\\3c!set_color5[math.fmod(j,5)]!\\pos($center,!-15+$middle!)\\org(!($lleft+line.kara[(syl.i == $syln and syl.i-1 or syl.i)+1].center-$center)/2+$center!,$middle)\\t(0.5,\\fr!(math.fmod(syl.i,2) == 1 and 1 or  -1)*180!)\\p1\\fscx!20-j!\\fscy!20-j!}!dirk[1]!"},{1,"0:00:00.00","0:00:00.00","furinaga","effect type1",0,0,0,"template syl fxgroup lastsyl loop 20","!retime(\"presyl\",(400/maxj)*j,500+(400/maxj)*j)!{\\an1\\blur3\\1c&HFFFFFF&\\3c!set_color5[math.fmod(j,5)]!\\move($center,$middle,!meta.res_x!,$middle)\\t(\\fr!(math.fmod(syl.i,2) == 1 and 1 or  -1)*math.random(450,630)!)\\fad(0,200)\\p1\\fscx!20-j!\\fscy!20-j!}!dirk[1]!"}}
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

