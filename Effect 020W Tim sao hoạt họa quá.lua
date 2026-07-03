local tr = aegisub.gettext
script_name = tr"Effect 020W Tim sao hoạt họa quá"
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

	cstyle={{"Default-furigana","Arial",11,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,false,false,false,100,100,0,0,1,1,1,2,11,11,11,1},{"Default","Kids",37,"&H000000FF","&H000000FF","&H00FFFFFF","&H00000000",false,false,false,false,100,100,0,0,1,2,2,5,11,11,11,1}}
	cdiag={{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"Code once"," xoay = {\"-500\",\"500\",\"-700\",\"700\",\"900\",\"900\"}"},{2,"0:00:00.00","0:00:00.00","Default","",0,0,0,"Template noblank","!retime(\"start2syl\",180*(syl.i-$syln),0)!{\\fad(300,0)\\an5\\frz!math.random(-10,10)!)\\c&HFF00FF&\\3c&H00FFFF&\\bord3.555556\\blur1.5\\shad0\\move(!$center+math.random(math.floor(-0.5*$width),math.ceil(0.5*$width))!,!$middle+math.random(math.floor(-0.5*$height),math.ceil(0.5*$height))!,!$center+math.random(20,40)*(-1)^math.random(2)!,!$middle+math.random(20,40)*(-1)^math.random(2)!)\\fscx35\\fscy35\\t(0,700,\\frz!xoay[math.random(6)]!)\\p1}m 0 -11 b 9 -38 23 -20 19 -6 b 19 0 0 20 0 23 b 0 20 -18 0 -18 -6 b -20 -20 -8 -38 0 -11 m -14 -19 b -16 -19 -16 -11 -12 -13 b -11 -13 -11 -19 -14 -11\""},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template noblank notext loop 1","!retime(\"start2syl\",180*(syl.i-$syln),0)!{\\an5\\fscx15\\fscy15\\c&HFFFFFF&\\3c!(j == 1) and set_temp(\"color\",_G.ass_color(_G.HSV_to_RGB(math.random(360),0.6,1))) or temp.color!\\blur0\\shad0\\move($scenter,$smiddle,!$scenter+math.random(-100,100)!,!$smiddle+math.random(-70,70)!\\}{\\p1}m -50 0 b -17 -1 -6 -1 -8 -6 b -1 -6 -1 -17 0 -50 b 1 -17 1 -6 8 -6 b 6 -1 17 -1 50 0 b 17 1 6 1 8 6 b 1 6 1 17 0 50 b -1 17 -1 6 -8 6 b -7 0 -17 1 -50 0 \""},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code syl all","color = {\"90\",\"200\"}; factor = 15; function char_counter(ref) ci[ref] = ci[ref] + 1; return \"\" end; ci = { 0 }; cn = _G.unicode.len(orgline.text_stripped:gsub(\" \",\"\")); shape = {\"m 34 0 l 33 33 b 24 21 19 26 33 33 l 0 34 l 33 35 b 19 44 24 49 33 35 l 34 68 l 35 35 b 43 49 48 44 35 35 l 68 34 l 35 33 b 48 26 44 21 35 33\",\"m 4 0 l 0 4 l 4 8 l 8 4 \"}; delay = 550; size = 40; temp = {}; function set_temp(ref,val) temp[ref] = val; return val; end"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code syl all","temp = {}; function set_temp(ref,val) temp[ref] = val; return val; end; star = \"m 29 0 b 25 5 22 11 20 17 b 13 17 6 19 0 21 b 3 26 8 30 13 35 b 11 41 10 48 11 54 b 17 52 23 49 29 46 b 34 49 40 52 47 55 b 47 48 46 41 45 35 b 50 30 54 26 58 21 b 52 19 45 17 39 17 b 37 11 33 5 29 0\";"},{3,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template syl noblank","!retime(\"start2syl\",180*(syl.i-$syln),0)!{\\an5\\pos($center,$middle)\\blur1.5\\fad(300,0)\\fscx0\\fscy0\\t(!set_temp(\"time_2\",math.random(500))!,!temp.time_2+300!,\\fscx140\\fscy140)\\t(!temp.time_2+300!,!temp.time_2+600!,\\fscx100\\fscy100)}"},{1,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template syl noblank","!retime(\"syl\",0,400)!{\\an8\\move($center,$middle,!$center+math.random(-30,30)!,!$middle+math.random(-30,30)!)\\t(0,!$dur+300!,\\fr!math.random(-360,0)!\\frx!math.random(-360,0)!\\fry!math.random(-360,0)!)\\t(0,!$dur+300!,\\fscx60\\fscy60\\blur2\\c!line.styleref.color3!)\\fad(0,300)}"}}
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

