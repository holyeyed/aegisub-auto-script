local tr = aegisub.gettext
script_name = tr"Effect 046W một dòng sao lấp lánh tự viết"
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

	cstyle={{"holyeyed-furigana","Arial",10,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,false,false,false,100,100,0,0,1,1,1,2,10,10,10,1},{"Default-furigana","Arial",25,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,false,false,false,100,100,0,0,1,1,1,5,10,10,10,1},{"Default","Arial",50,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,false,false,false,100,100,0,0,1,2,2,5,10,10,10,1},{"holyeyed","Arial",20,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,false,false,false,100,100,0,0,1,2,2,2,10,10,10,1}}
	cdiag={{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code once","function tag(dur,x,y) t4=dur/4 lt={0,0,0,0} r=math.random(1,t4) for i=1,#lt do lt[i]=r+math.random(t4/2,t4) r=lt[i] end return string.format(\"\\\\bord0\\\\1c&ffffff\\\\alpha&H00\\\\move(%d,%d,%d,%d)\\\\t(%d,%d,\\\\alpha&Hff\\\\fscx150\\\\fscy150)\\\\t(%d,%d,\\\\alpha&H00\\\\fscx80\\\\fscy80)\\\\t(%d,%d,\\\\alpha&Hff\\\\fscx150\\\\fscy150)\\\\t(%d,%d,\\\\alpha&H00\\\\fscx50\\\\fscy50)\",x,y,math.random(x-150,x+150),math.random(y-60,y+60),lt[1],lt[2],lt[2],lt[3],lt[3],lt[4],lt[4],dur) end ldur=500 function sline(dur) if ldur~=dur then ldur=dur end return \"\" end"},{0,"0:00:00.00","0:00:05.00","Default","",0,0,0,"template notext loop 20","!retime(\"syl\",0,300)!{!tag(2000,$center+$width/2,$middle+$height/2)!\\p1}m -12 4 l -12 -18 l -10 4 l -1 -5 l -9 5 l 9 5 l -9 7 l -2 14 l -10 8 l -10 27 l -12 8 l -21 16 l -13 6 l -35 5 l -13 5 l -20 -4 {\\p0}"},{0,"0:00:00.00","0:00:05.00","Default","",0,0,0,"template","!retime(\"syl\",-(ldur+$sstart)/2,0)!!sline($ldur)!{\\pos($center,$middle)\\1c&Hf090ff\\alpha&Hff\\fscx150\\fscy150\\t(0,!$sdur/3!,\\fscx100\\fscy100\\alpha&H00)}"},{0,"0:00:00.00","0:00:05.00","Default","",0,0,0,"template","!retime(\"syl\",0,0)!{\\pos($center,$middle)\\1c&H0000ff\\fscx150\\fscy150\\bord5\\3c&Hf0f0f0\\t(\\fscx100\\fscy100\\bord0)}"}}
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
local sname={}
	local apoint=pdiag
	--thêm bảng style
	for i=1,#cstyle do
	sl.name=cstyle[i][1]
sname[#sname+1]=sl.name
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
	for i=1,apoint-pstyle do
	for j=1,#sname do
	if subs[apoint-i].name == sname[j] then
	subs.delete(apoint-i)
	end
	end
	end
	--subs.deleterange(pstyle,apoint-1)
end

aegisub.register_macro(script_name, script_description, add_effect)

