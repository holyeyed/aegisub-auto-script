local tr = aegisub.gettext
script_name = tr"Effect 033W Chữ hồng mộng mơ rớt xuống"
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

	cstyle={{"Default-furigana","Fontleroy Brown NF",96,"&H00000000","&H008900FF","&H00FFFFFF","&H00000000",false,true,false,false,100,100,0,0,1,3.6,0,5,0,0,0,1},{"Default","RixLoveFool",55,"&H00000000","&H008900FF","&H00FFFFFF","&H00000000",true,false,false,false,100,100,0,0,1,2,2,5,10,10,20,1}}
	cdiag={{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code syl all","function char_counter(ref) ci[ref] = ci[ref] + 1; return \"\" end"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code line all","ci = {0,0,0,0}; cn = _G.unicode.len(orgline.text_stripped:gsub(\"\",\"\"))"},{0,"0:00:00.00","0:00:00.00","Default","pyointa's function",0,0,0,"code once","star = {\"m 0 0 b 23 25 35 37 60 60 b 37 35 25 23 0 0 m 60 0 b 35 23 23 35 0 60 b 25 37 37 25 60 0 m 30 21 b 19 21 19 39 30 39 b 41 39 41 21 30 21 m 30 0 b 29 21 29 39 30 60 b 31 39 31 21 30 0 m 0 30 b 22 31 38 31 60 30 b 38 28 22 29 0 30\"} ; color = {\"&HFF00CE&\",\"&HFFA2EF&\",\"&HFF00E6&\",\"&HAD00FF&\",\"&H8F00FF&\",\"&HFFD3FC&\"} ; function autoblur() tag = \"\" i = 1 while i <= #line.kara do tag = tag..string.format(\"\\\\t(%d,%d,\\\\blur%d)\\\\t(%d,%d,\\\\blur%d)\",line.kara[i].start_time-100,line.kara[i].start_time,20,line.kara[i].start_time,i == #line.kara and line.kara[i].end_time+500 or line.kara[i].end_time,5) i = i +1 end return tag end; function autobord() tag = \"\" i = 1 while i <= #line.kara do tag = tag..string.format(\"\\\\t(%d,%d,\\\\bord%d)\\\\t(%d,%d,\\\\bord%d)\",line.kara[i].start_time-100,line.kara[i].start_time,7,line.kara[i].start_time,i == #line.kara and line.kara[i].end_time+500 or line.kara[i].end_time,2) i = i +1 end return tag end ; function rdcl(cl) rt=math.random(1,#cl) return cl[rt] end"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template char notext noblank","!char_counter(1)!!retime(\"syl\",0+(ci[1]-1)*20,line.duration/1.7)!{\\an5\\pos(!$center+math.random(-30,30)!,!$middle+math.random(-50,50)!)\\fad(300,300)\\fsc120\\c&HFFFFFF&\\3c!color[math.random(6)]!\\bord2\\blur1!autoblur(5,10)!\\t(0,300,\\fsvp20)\\t(300,600,\\fsvp0)\\t(600,900,\\fsvp20)\\t(900,1200,\\fsvp0)\\t(1200,1500,\\fsvp20)\\t(1500,1800,\\fsvp0)\\t(1800,2100,\\fsvp20)\\t(2100,2400,\\fsvp0)\\t(2400,2700,\\fsvp20)\\t(2700,3000,\\fsvp0)\\t(3000,3300,\\fsvp20)\\t(3300,3600,\\fsvp0)\\p2}!star[1]!"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template char","!char_counter(1)!!retime(\"start2syl\",-600+(ci[1]-1)*50,0)!{\\an5\\move($center,!$middle-400!,$center,$middle,0,!math.random(250,500)!)\\1c&HFF90F5&\\3c&Hf0f0f0&\\blur2\\bord4}"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template","!retime(\"syl\",0,500)!{\\an5\\move($center,$middle,$center,!$middle+math.random(17,47)!)\\fad(0,100)\\c&HFFFFFF&\\3c&HE300FF&\\blur5\\bord7}"}}
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



