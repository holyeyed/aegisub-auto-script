local tr = aegisub.gettext
script_name = tr"Effect 043W Hai dòng với hiệu ứng bụi"
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

	cstyle={{"Default-furigana","UVN Bai Sau",75,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",true,false,false,false,100,100,0,0,1,1,1,2,20,10,10,1},{"Default","UVN Bai Sau",60,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",true,false,false,false,100,100,0,0,1,2,2,2,50,50,50,1}}
	cdiag={{0,"0:00:00.00","0:00:05.00","Default","",0,0,0,"code once","cl1=\"aaaaff\" cl2=\"ffffff\" li=0 et=300 hpos=1 npos={0,0} function idx(cl) if (cl%2) == 0 then return 0 else return hpos end end shape=\"m -17 0 b -17 0 -17 0 -17 0 b -1 -1 -1 -1 0 -17 b 1 -1 1 -1 15 0 b 1 1 1 1 0 15 b 0 15 0 15 0 15 b -1 1 -1 1 -17 0 m 0 0 m 0 0 m 0 0 \" function rdpos(x,y) npos[0]= math.random(x-100,x+100) npos[1]=math.random(y-100,y+100) return \"\" end function rdcl() return string.format(\"%x\",math.random(0,0xffffff)) end mau={\"eecef9\",\"eef3cc\",\"9ed5ff\",\"a4fff9\",\"9fffb4\",\"c3d8eb\",\"c5f4c1\",\"ad8da6\"} cl1=mau[math.random(1,#mau)]  function slong(nl,ldur) if li~=nl then li=nl et=ldur end return \"\" end"},{0,"0:00:00.00","0:00:05.00","Default","",0,0,0,"template syl","!retime(\"syl\",-et-$sstart,-$sdur)!!slong($li,$ldur/2)!{\\alpha&Hff&\\pos($sx,!$sy-idx($li)*$lheight!)\\bord5\\c&!cl1!\\2c&H!cl2!&\\3c&H000&\\t(\\alpha&H00)}"},{0,"0:00:00.00","0:00:05.00","Default","",0,0,0,"template syl notext loop 30","!retime(\"syl\",0,$sdur)!!rdpos($sx,$sy-idx($li)*$lheight)!{\\bord0\\be5\\1c&Hffffff&\\2c&H!rdcl()!&\\move(!math.random($sx,$sx+100)!,!$sy-idx($li)*$lheight!,!math.random($sx,$sx+100)!,!math.random($sy-idx($li)*$lheight,$sy-idx($li)*$lheight-400)!)\\t(\\frx180\\fry180\\be!math.random(20,30)!\\alpha&Hff&)\\p!math.random(1,4)!}!shape!{\\p0}"},{1,"0:00:00.00","0:00:05.00","Default","",0,0,0,"template syl","!retime(\"syl\",0,$lend-$send-$lstart)!{\\pos($sx,!$sy-idx($li)*$lheight!)\\be20\\bord10\\fscx150\\fscy150\\3c&Hffffff&\\c&H!rdcl()!&\\t(!$sdur/3!,!$sdur!,\\fscx100\\fscy100\\be0\\bord5\\c&H!cl1!\\2c&H!cl2!\\3c&H000&)}"}}
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

