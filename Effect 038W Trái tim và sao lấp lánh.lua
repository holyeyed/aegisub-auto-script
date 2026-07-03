local tr = aegisub.gettext
script_name = tr"Effect 038W Trái tim và sao lấp lánh"
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

	cstyle={{"KARA-furigana","Myriad Pro",27,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,true,false,false,100,100,0,0,1,1,0.25,3,20,80,120,1},{"Yeu lam 2-furigana","UTM Swashes",35,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",true,false,false,false,100,100,0,0,1,1.5,0,2,20,20,30,1},{"Yeu lam 2","UTM Swashes",70,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",true,false,false,false,100,100,0,0,1,3,0,2,20,20,30,1},{"KARA","RixLoveFool",60,"&H00FFFFFF","&H000000FF","&H00823AEE","&H00000000",true,false,false,false,100,100,0,0,1,2,0.5,5,10,10,30,1}}
	cdiag={{0,"0:00:00.00","0:00:00.00","KARA","",0,0,0,"code once","function glitter(dur)  if (dur > 200) then tag =  string.format(\"\\\\t(%d,%d,\\\\fscx%d\\\\fscy%d)\\\\t(%d,%d,\\\\fscx%d\\\\fscy%d)\\\\t(%d,%d,\\\\fscx%d\\\\fscy%d)\\\\t(%d,%d,\\\\fscx%d\\\\fscy%d)\",remember(\"time\",math.random(dur)),recall.time+1,remember(\"size\",math.random(30,75)),recall.size,recall.time+2,recall.time+100,15,15,recall.time+101,recall.time+102,remember(\"size\",math.random(30,75)),recall.size,recall.time+103,recall.time+200,15,15) return tag else return \"\" end end"},{0,"0:00:19.50","0:00:21.88","KARA","",0,0,0,"code syl all","function char_counter(ref) ci[ref] = ci[ref] + 1; return \"\" end"},{0,"0:00:00.00","0:00:00.00","KARA","",0,0,0,"code line all","ci = { 0 }; cn = _G.unicode.len(orgline.text_stripped:gsub(\" \",\"\"))"},{1,"0:00:00.00","0:00:00.00","KARA","",0,0,0,"template char","!char_counter(1)!!retime(\"start2syl\",-700+(ci[1]-1)*40,0)!{\\bord0\\t(0,100,\\blur0)\\t(100,200,\\blur4)\\t(200,300,\\blur0)\\t(300,400,\\blur4)\\t(400,500,\\blur0\\bord!line.styleref.outline!)\\shad0\\bord1\\blur3\\3c&H6800AB&\\fad(230,0)\\frz240\\t(0,500,\\frz0)\\an5\\pos($scenter,!$smiddle!)\\fad(50,0)}"},{3,"0:00:00.00","0:00:00.08","KARA","",0,0,0,"template noblank multi char","!retime(\"syl\",0,500)!{\\an5\\fscx100\\fscy100\\fad(0,500)\\c&HFFFFFF&\\3c&H31E6E9&\\bord2\\blur8\\shad0\\\\t(0,30,\\c&HFFFFFF&\\3c&H31E6E9&\\bord2\\blur8\\fscx150\\fscy150)\\t(30,$dur,\\bord2\\blur8\\fscx85\\fscy85)\\move($center,$middle,!$center+math.random(-35,35)!,!$middle+math.random(-35,35)!)\\t(,\\frz!math.random(-260,260)!\\fry!math.random(-260,260)!\\frx!math.random(-60,60)!}"},{0,"0:00:00.00","0:00:00.00","KARA","",0,0,0,"template notext noblank loop 10","!retime(\"syl\",math.random(-200,500),math.random(100,800))!{\\an5\\3c&H006DFF&\\1c&HFFFFFF&\\shad0\\bord0.2\\blur1.5\\move(!$scenter+math.random(-100,100)!,!$middle+math.random(-80,120)!,!$scenter+math.random(-50,50)!,!$smiddle+math.random(-30,40)!)\\fscx!remember(\"size\",1)!\\fscy!recall.size!!glitter(line.duration)!\\fad(0,500)\\p1}m 46 54 l 1 56 l 46 57 b 46 58 47 60 47 60 b 42 66 37 72 32 77 b 38 72 43 67 49 62 b 49 63 51 64 52 64 b 53 79 53 93 54 107 b 54 93 55 79 56 64 b 56 65 58 63 59 62 l 76 78 l 60 61 b 61 60 61 57 61 57 l 106 56 l 61 54 b 61 54 60 51 60 51 l 75 35 l 59 49 b 58 48 57 47 55 47 l 54 1 l 52 47 b 50 47 49 48 49 49 l 32 34 l 47 51 b 47 52 46 53 46 54"},{2,"0:00:00.00","0:00:00.00","KARA","",0,0,0,"template noblank","!retime(\"presyl\",-700,0)!{\\fad(300,0)\\an7\\frz!math.random(-10,10)!)\\c&HFFFFFF&\\3c!_G.ass_color(_G.HSV_to_RGB(360*(syl.i/$syln)*$kdur,1,1))!\\blur5\\move($scenter,!$smiddle-120!,$scenter,!$smiddle-10!,0,700)\\fscx90\\fscy90\\t(0,700,\\frz!randomFRZ!)\\p1}m 0 30 b 5 18 17 16 17 5 b 18 -3 5 -11 0 0 b -5 -11 -18 -3 -17 5 b -16 16 -5 18 0 30 m 0 5 b 5 -6 14 -1 14 5 b 13 13 5 17 0 24 b -4 17 -13 13 -14 5 b -14 0 -5 -6 0 5"}}
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

