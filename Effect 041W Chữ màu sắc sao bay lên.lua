local tr = aegisub.gettext
script_name = tr"Effect 041W Chữ màu sắc sao bay lên"
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

	cstyle={{"Default-furigana","Arial",27.5,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,false,false,false,100,100,0,0,1,1,1,2,0,0,35,1},{"Default","RixLoveFool",55,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",true,false,false,false,100,100,0,0,1,2,2,5,10,10,35,1}}
	cdiag={{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code syl all","color = {\"90\",\"200\"}; factor = 15; function char_counter(ref) ci[ref] = ci[ref] + 1; return \"\" end; ci = { 0 }; cn = _G.unicode.len(orgline.text_stripped:gsub(\" \",\"\")); delay = 550; size = 40; temp = {}; function set_temp(ref,val) temp[ref] = val; return val; end"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template noblank notext loop 5","!retime(\"syl\",0+(j-1)*500,1000)!{\\an5\\c!(j == 1) and set_temp(\"color\",_G.ass_color(_G.HSV_to_RGB(math.random(360),0.6,1))) or temp.color!\\3c&HFFFFFF&\\fscx15\\fscy15\\bord0\\shad0\\move($scenter,!$smiddle+20!,!$scenter+math.random(-50,50)!,!$middle+math.random(-80,-30)!)\\t(0,1000,\\fscx100\\fscy100\\bord0\\shad0)\\t(1000,1200,\\alpha&HFF&)\\t(0,2000,\\frz!math.random(-500,500)!)\\frx!math.random(-500,500)!\\fry!math.random(-500,500)!)\\p1}m 0 -7 b 7 -22 17 -12 14 -4 b 14 0 0 11 0 13 b 0 11 -14 0 -14 -4 b -16 -12 -7 -22 0 -7 m -11 -11 b -13 -11 -13 -7 -10 -8 b -9 -8 -9 -11 -11 -11 m -13 -5 b -13 -1 -6 5 -2 8 b -1 9 0 8 -1 7 b -3 6 -11 -1 -12 -5 b -12 -6 -13 -6 -13 -5 \""},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template noblank notext loop 5","!retime(\"syl\",0+(j-1)*500,1000)!{\\an5\\c!(j == 1) and set_temp(\"color\",_G.ass_color(_G.HSV_to_RGB(math.random(360),0.6,1))) or temp.color!\\3c&HFFFFFF&\\fscx15\\fscy15\\bord0\\shad0\\move($scenter,!$smiddle+20!,!$scenter+math.random(-50,50)!,!$middle+math.random(-80,-30)!)\\t(0,1000,\\fscx100\\fscy100\\bord0\\shad0)\\t(1000,1200,\\alpha&HFF&)\\t(0,2000,\\frz!math.random(-500,500)!)\\frx!math.random(-500,500)!\\fry!math.random(-500,500)!)\\p1}m 23 0 l 15 12 l 0 16 l 10 27 l 9 42 l 23 36 l 37 42 l 36 27 l 46 16 l 31 12\""},{1,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template char noblank","!retime(\"start2syl\",-1000+($si-1)*250,-25)!{\\an5\\move($scenter,!$smiddle-25!,$scenter,$smiddle,0,400)\\\\c&HFFFFFF&\\\\bord2\\blur4\\fad(300,0)}"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template noblank","!retime(\"syl\",-200,600)!{\\an5\\\\3c!(j == 1) and set_temp(\"color\",_G.ass_color(_G.HSV_to_RGB(math.random(360),0.6,1))) or temp.color!\\c&H000000&\\bord2\\blur3\\shad0\\fscx100\\fscy100\\t(0,200,\\fscx135\\fscy135)\\t(200,400,\\fscx100\\fscy100)\\t(0,3000,\\)\\move($scenter,$smiddle,$scenter,!$smiddle+80!,400,3000)}"}}
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

