local tr = aegisub.gettext
script_name = tr"Effect 022L Trái tim hồng vui nhộn"
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

	cstyle={{"Default-furigana","Arial",15,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,false,false,false,100,100,0,0,1,1.5,1.5,2,20,20,15,1},{"Default","UVN Bai Hoc",60,"&H00FFFFFF","&H000000FF","&H00FFFFFF","&H00000000",false,false,false,false,100,100,0,0,1,0,0,5,20,20,15,1}}
	cdiag={{0,"0:00:00.00","0:00:00.00","Default","Credit",0,0,0,"karaoke","Written by ivansbakery. Thanks to pyointa2001 & AseDark1"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"karaoke","Only available with VSfilterMOD"},{0,"0:00:00.00","0:00:00.00","Default","Drill 4 (pyointa2001)",0,0,0,"code syl all","fxgroup.firstsyl = (syl.i == 1)"},{0,"0:00:00.00","0:00:00.00","Default","Drill 4 (pyointa2001)",0,0,0,"code syl all","fxgroup.nofirstsyl = (not fxgroup.firstsyl)"},{0,"0:00:00.00","0:00:00.00","Default","Drill 4 (pyointa2001)",0,0,0,"code syl all","fxgroup.lastsyl= (syl.i == #line.kara)"},{0,"0:00:00.00","0:00:00.00","Default","Glitter Effects Function",0,0,0,"code once","function glitter2(dur)  if (dur > 800) then tag =  string.format(\"\\\\t(%d,%d,\\\\fscx%d\\\\fscy%d)\\\\t(%d,%d,\\\\fscx%d\\\\fscy%d)\\\\t(%d,%d,\\\\fscx%d\\\\fscy%d)\\\\t(%d,%d,\\\\fscx%d\\\\fscy%d)\",set_temp(\"time\",math.random(dur)),temp.time+1,set_temp(\"size\",math.random(25,50)),temp.size,temp.time+2,temp.time+100,15,15,temp.time+101,temp.time+102,set_temp(\"size\",math.random(25,50)),temp.size,temp.time+103,temp.time+200,15,15) return tag else return \"\" end end"},{0,"0:00:00.00","0:00:00.00","Default","Get Frame Dur",0,0,0,"code once","msa = _G.aegisub.ms_from_frame(1) msb = _G.aegisub.ms_from_frame(100) if msa == nil and msb == nil then frame_dur = 33 else frame_dur = (msb-msa)/100 end"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code once","math.randomseed(8317)"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code syl all","function char_counter(ref) ci[ref] = ci[ref] + 1; return \"\" end"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code line all","ci = { 0 }; cn = _G.unicode.len(orgline.text_stripped:gsub(\" \",\"\"))"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code once","opacity ={\"100\"  ,\"230\"  ,\"310\"  ,\"50\"}"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code once","heart ={ \"m 18 39 b 23 28 35 24 35 16 b 36 8 23 0 18 11 b 14 0 0 8 1 16 b 1 24 13 28 18 39 \"  }"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code once","temp = {}"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code once","function set_temp(ref,val) temp[ref] = val; return val; end"},{0,"0:00:00.00","0:00:00.00","Default","AutoTags (Asedark)",0,0,0,"code syl","function AutoTags(Intervalo,Dato1,Dato2)            local RESULTADO=\"\"     local SUERTE = 0     local CONTADOR = 0     local ARREGLO = 0                           local count = math.ceil(line.duration/Intervalo)                 			ARREGLO = {Dato1,Dato2}    			              for i = 1, count do               CONTADOR = i    	    	    		if Dato1 and Dato2 then     					if  CONTADOR%2 ==0 then    								SUERTE = ARREGLO[1]    					else    								SUERTE = ARREGLO[2]    					end	    		end     				    	RESULTADO = RESULTADO ..\"\\\\t(\" ..(i-1)*Intervalo.. \",\" ..i*Intervalo.. \",\\\\\" ..SUERTE..\")\"..\"\"     			     end         		     return RESULTADO	  	    	               end"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code once all","color = {\"&HE300FF&\"}"},{1,"0:00:00.00","0:00:00.00","Default","pre-star",0,0,0,"template noblank syl","!retime(\"presyl\",-700,0)!{\\an5\\pos(!$scenter!,,$smiddle)\\bord0\\blur0\\fsc\\fsc!syl.width*2!\\1a&HAF&\\fad(100,300)\\t(100,400,\\fry!(ci[1]%2==0) and -80 or 80!)\\t(300,600,\\fry0)\\p1}!heart[1]!"},{0,"0:00:00.00","0:00:00.00","Default","2light",0,0,0,"template multi","!retime(\"syl\",0,0)!{\\an5\\pos($center,$middle)\\t(0,200,\\1vc(!color[1]!,!color[1]!,&HFFFFFF&,&HFFFFFF&)\\3c!color[1]!\\bord1\\blur3)\\t(200,$dur,\\bord1\\blur1)}"},{1,"0:00:00.00","0:00:00.00","Default","main Star",0,0,0,"template noblank notext multi","!retime(\"syl\",0,800)!{\\fad(20,300)\\move($center,$smiddle,$center,!(syl.width>80) and (syl.width<120) and $top-30 or (syl.width>120) and $top-50 or $top -10!,0,250)\\an5\\bord3\\blur8\\be1\\fscx!syl.width*2!\\fscy!syl.width*2!\\1vc(!color[1]!,!color[1]!,&HFFFFFF&,&HFFFFFF&)\\3c!color[1]!\\t(500,!line.duration!,\\fry720)}{\\!AutoTags(500,'frz-20','frz20')!\\p1}!heart[1]!"},{1,"0:00:00.00","0:00:00.00","Default","Stars",0,0,0,"template noblank char loop 5 multi","!retime(\"syl\",0+($dur/maxj)*j,700+($dur/maxj)*j)!{\\fad(20,20)\\move(!$scenter+remember(\"x\",math.random(-55,55))!,!$smiddle+math.random(-55,55)!,!$scenter+recall.x!,!$smiddle+math.random(50,100)!,500,1000)\\an5\\fscx!remember(\"starscale\",math.random(10,35))!\\fscy!recall.starscale!\\fr!math.random(-90,90)!\\bord0\\shad0\\c!color[1]!!AutoTags(opacity[math.random(4)],'1a&HFF&','alpha0')!\\p1}!heart[1]!"},{1,"0:00:00.00","0:00:00.00","Default","Lead-in",0,0,0,"template char noblank","!char_counter(1)!!retime(\"start2syl\",-1500+(ci[1]-1)*50,0)!{\\an5\\moves4(!$scenter+math.random(500,500)!,!(ci[1]%2==0) and $smiddle+math.random(300,300) or $smiddle+math.random(-300,-300)!,!$scenter+math.random(0,0)!,!(ci[1]%2==0) and $smiddle+math.random(-500,-500) or $smiddle+math.random(500,500)!,!$scenter!,!$smiddle!,!$scenter!,!$smiddle!,0,1000)\\alpha&HAF\\\\fscx50\\fscy50\\bord1\\3c&HFFFFFF&\\1c&HF6F9FE&\\blur1\\frx!math.random(-150,150)!\\t(!$scenter-$lleft+200!,!$scenter!,\\fscx120\\fscy120\\alpha&0&)\\pos($scenter,$smiddle)\\fscx100\\fscy100\\shad0\\t(!$scenter/0.6!,!$scenter/0.5!,\\alpha&HAF\\blur0\\be0)\\t($scenter,!$scenter/0.6!,\\frx0\\fscx100\\fscy100\\frz0\\bord0\\blur0\\3c&HFDFDFF&\\1c&HFDFDFF&\\be0)}"},{0,"0:00:00.00","0:00:00.00","Default","Drill 4 (pyointa2001)",0,0,0,"template notext noblank multi fxgroup nofirstsyl","!retime(\"presyl\",-line.kara[syl.i-1].duration,0)!{\\an5\\fsc50\\pos(!line.left+line.kara[syl.i-1].center!,$top)\\org(!$center-((line.kara[syl.i].center-line.kara[syl.i-1].center)/2)!,$top)\\t(\\fr-180)\\bord1\\blur3\\1c!color[1]!\\3c!color[1]!\\p1}!heart[1]!"},{0,"0:00:00.00","0:00:00.00","Default","Drill 4 (pyointa2001)",0,0,0,"template notext noblank multi fxgroup lastsyl","!retime(\"syl\",0,0)!{\\an5\\fsc50\\pos(!$center!,$top)\\org(!$center+$dur/50!,$top)\\t(\\fr-180)\\bord1\\blur3\\1c!color[1]!\\3c!color[1]!\\fad(0,300)\\p1}!heart[1]!"},{0,"0:00:00.00","0:00:00.00","Default","Drill 4 (pyointa2001)",0,0,0,"template notext noblank multi fxgroup firstsyl","!retime(\"presyl\",-1000,0)!{\\an5\\fsc50\\pos(!$center-syl.width!,$top)\\org(!$center-syl.width/2!,$top)\\t(\\fr-180)\\bord1\\blur3\\1c!color[1]!\\3c!color[1]!\\fad(300,0)\\p1}!heart[1]!"}}
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

