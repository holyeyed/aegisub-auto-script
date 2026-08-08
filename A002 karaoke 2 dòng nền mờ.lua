local tr = aegisub.gettext
script_name = tr"A002 karaoke 2 dòng nền mờ"
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

	cstyle={{"holyeyed-furigana","Arial",20,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,false,false,false,100,100,0,0,1,2.00752,2.00752,2,20,20,50,1},{"Duet-furigana","Arial",18,"&H00FFFFFF","&H00FF00FF","&H00FFFFFF","&H00000000",true,false,false,false,100,100,0,0,1,0.741666,0.741666,2,10,10,50,1},{"Default-furigana","Arial",36,"&H00FFFFFF","&H000000FF","&H00FFFFFF","&H00000000",true,false,false,false,100,100,0,0,1,0.741666,0.741666,2,10,10,50,1},{"Male-furigana","Arial",36,"&H00FFFFFF","&H00FF0000","&H00FFFFFF","&H00000000",true,false,false,false,100,100,0,0,1,0.741666,0.741666,2,10,10,50,1},{"Male","Arial",36,"&H00FFFFFF","&H00FF0000","&H00FFFFFF","&H00000000",true,false,false,false,100,100,0,0,1,1.48333,1.48333,2,10,10,50,1},{"Duet","Arial",36,"&H00FFFFFF","&H00FF00FF","&H00FFFFFF","&H00000000",true,false,false,false,100,100,0,0,1,1.48333,1.48333,2,10,10,50,1},{"Default","Arial",70,"&H00FFFFFF","&H00E348C1","&H00520A30","&H00000000",true,false,false,false,90,100,0,0,1,5,5,1,10,10,50,1},{"holyeyed","Arial",70,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,false,false,false,100,100,0,0,1,5,5,1,10,10,50,1}}
	cdiag={{0,"0:00:22.33","0:00:25.63","Default","ff6000",0,0,0,"code once","li=0  et=2000 hpos=1.5 npos={0,0} function idx(cl) if (cl%2) == 0 then return 0 else return hpos end end  function rdpos(x,y) npos[0]= math.random(x-100,x+100) npos[1]=math.random(y-100,y+100) return \"\" end function rdcl() return string.format(\"%x\",math.random(0,0xffffff)) end function slong(ni,ldur) if li~=ni then li=ni et=ldur end return \"\" end  function ldx(cl,lw) if (cl%2) == 1 then return 30 else return meta.res_x-lw-30 end end"},{0,"0:00:22.33","0:00:25.63","Default","ff6000",0,0,0,"code line","restyle(line.style) cl1=line.styleref.color1 cl2=line.styleref.color2 slong(line.index,line.duration/2)"},{0,"0:00:22.33","0:00:25.63","Default","ff6000",0,0,0,"template syl notext","!retime(\"syl\",-et-$sstart*0.7,$ldur-$send)!{\\pos(!syl.left+ldx($li,$lwidth)+20!,!$ly-idx($li)*$lheight+60!)\\1c!cl1!\\3c!cl1!\\4c!cl1!\\blur5\\alpha&HFF&\\t(0,300,\\alpha&H40&\\bord0\\shad0\\frz!math.random(-20,20)!)\\p1}m 78 33 b 78 10 118 -4 134 3 b 197 39 126 107 78 128 b 23 107 -32 33 23 3 b 39 -4 78 10 78 33 l 78 33  {\\p0}"},{0,"0:00:22.33","0:00:25.63","Default","ff6000",0,0,0,"template syl","!retime(\"syl\",-et-$sstart*0.7,-$dur)!{\\pos(!syl.left+ldx($li,$lwidth)!,!$ly-idx($li)*$lheight!)\\1c!cl1!\\alpha&HFF&\\t(0,300,\\alpha&H00&)}"},{0,"0:00:22.33","0:00:25.63","Default","ff6000",0,0,0,"template syl","!retime(\"syl\",-$sstart,-$sdur)!{\\pos(!syl.left+ldx($li,$lwidth)!,!$sy-idx($li)*$lheight!)\\1c!cl1!}"},{0,"0:00:22.33","0:00:25.63","Default","ff6000",0,0,0,"template syl","!retime(\"syl\",0,$lend-$send-$lstart)!!rdpos(syl.left+ldx($li,$lwidth),$sy-idx($li)*$lheight)!{\\K!$dur/10!\\1c!cl2!\\2c!cl1!\\move(!syl.left+ldx($li,$lwidth)!,!$sy-idx($li)*$lheight!,!syl.left+ldx($li,$lwidth)!,!$sy-idx($li)*$lheight!)}"}}
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

