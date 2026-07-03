local tr = aegisub.gettext
script_name = tr"Effect 036W Trái tim nhiều màu rớt xuống"
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

	cstyle={{"1111111111111111-furigana","VNI-Diudang",25,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",true,false,false,false,100,100,0,0,1,0.5,0,2,20,20,80,1},{"3333333333333333-furigana","GungsuhChe",25,"&H00FFFFFF","&H00E1E1E1","&H00B650FF","&H00000000",true,false,false,false,100,100,0,0,1,0.6,0.3,5,40,40,10,129},{"Default-furigana","RixLoveFool",37.5,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",true,false,false,false,100,100,0,0,1,1,0.5,2,10,10,30,1},{"Default","RixLoveFool",60,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",true,false,false,false,100,100,0,0,1,2,1,5,10,10,30,1},{"3333333333333333","GungsuhChe",50,"&H00FFFFFF","&H00E1E1E1","&H00B650FF","&H00000000",true,false,false,false,100,100,0,0,1,1.2,0.6,5,40,40,10,129},{"1111111111111111","VNI-Diudang",50,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",true,false,false,false,100,100,0,0,1,1,0,2,20,20,80,1}}
	cdiag={{0,"0:00:00.00","0:00:05.00","Default","",0,0,0,"code syl all","function char_counter(ref) ci[ref]=ci[ref]+1; return \"\" end"},{0,"0:00:05.00","0:00:07.00","Default","",0,0,0,"code line all","ci={0}; cn= _G.unicode.len(orgline.text_stripped:gsub(\" \",\"\"))"},{1,"0:00:00.00","0:00:00.00","Default","lead-in(text)",0,0,0,"template char","!char_counter(1)!!retime(\"start2syl\",-700+(ci[1]-1)*30,0)!{\\fad(230,0)\\3c&H209A01&\\1c&HFFFFFF&)\\bord3\\blur8\\an5\\move(!$scenter+math.random(-50,50)!,!$smiddle+50!,$scenter,$smiddle,0,500)\\t(0,300,\\bord3\\blur8\\alpha&H00}"},{1,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template noblank","!retime(\"syl\",-25,0)!{\\an5\\pos($center,$middle)\\t(0,25,\\fscx140\\fscy140)\\t(20,$dur,\\fscx100\\fscy100)\\3c!_G.ass_color(_G.HSV_to_RGB(360*(syl.i/$syln)*$kdur,1,1))!\\1c&HFFFFFF&)\\bord3\\blur8}"},{0,"0:00:19.74","0:00:19.74","Default","",0,0,0,"template noblank notext","!retime(\"syl\",0,200)!{\\an5\\c&HFFFFFF&\\3c&HFFFFFF&\\blur0.5\\frz!math.random(-30,30)!\\bord-5\\fscy30\\pos(!$scenter+math.random(-5,5)!,$smiddle),\\t(-100,!$dur-30!,\\fscy180)\\fad(0,100)\\p1}m 30 23 b 24 23 24 33 30 33 b 36 33 37 23 30 23 m 35 27 l 60 28 l 35 29 m 26 27 l 0 28 l 26 29 m 29 23 l 30 0 l 31 23 m 29 33 l 30 56 l 31 33"},{3,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template syl notext noblank","!retime(\"syl\",0,350)!{\\fad(0,300)\\an5\\pos($scenter,!$smiddle+10!)\\1c&HFFFFFF&\\3c!_G.ass_color(_G.HSV_to_RGB(360*(syl.i/$syln)*$kdur,1,1))!\\1c&HFFFFFF&)\\bord1\\blur8\\shad0\\fscx50\\fscy50\\frz!math.random(-50,50)!!AutoTags(100,'fscx250\\\\fscy250','fscx150\\\\fscy150')!\\p1}m 15 27 b 27 19 29 15 29 11 b 31 5 21 -5 15 4 b 9 -5 -1 5 1 11 b 1 15 3 19 15 27 m 22 4 l 24 3 l 25 5 l 23 6 m 24 7 b 25 5 26 6 27 9 b 27 11 26 16 22 19 b 24 16 27 10 24 7"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code syl all","function char_counter(ref) ci[ref] = ci[ref] + 1; return \"\" end"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code line all","ci = { 0,0,0,0,0,0,0 }; cn = _G.unicode.len(orgline.text_stripped:gsub(\" \",\"\"))"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code syl","if syl.i%2==0 then   PARRIVABAJO=-140 else PARRIVABAJO=140 end"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code syl","if syl.i%2==0 then   PARRIVABAJO=140 else PARRIVABAJO=-140 end"},{0,"0:00:00.00","0:00:00.00","Default","Get Scr Resolution",0,0,0,"code once","xres, yres = _G.aegisub.video_size() ratio = meta.res_y/720  if (xres and xres ~= meta.res_x) or (yres and yres ~= meta.res_y) then _G.aegisub.debug.out(2, \"Warning: script resolution %dx%d does not match with loaded video resolution %dx%d resample script resolution(menu>subtitles>resample resolution>click from video)\", meta.res_x, meta.res_y, xres, yres) end"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code syl all","function char_counter(ref) ci[ref] = ci[ref] + 1; return \"\" end"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code line all","ci = { 0 }; cn = _G.unicode.len(orgline.text_stripped:gsub(\" \",\"\"))"},{0,"0:00:44.07","0:00:48.56","Default","AutoTags (Asedark)",0,0,0,"code syl","function AutoTags(Layer,Intervalo,Dato1,Dato2)            local RESULTADO=\"\"     local SUERTE = 0     local CONTADOR = 0      local ARREGLO = Layer                            local count = math.ceil(line.duration/Intervalo)                 			ARREGLO = {Dato1,Dato2}    			              for i = 1, count do               CONTADOR = i    	    	    		if Dato1 and Dato2 then     					if  CONTADOR%2 ==0 then    								SUERTE = ARREGLO[1]    					else    								SUERTE = ARREGLO[2]    					end	    		end     				    	RESULTADO = RESULTADO ..\"\\\\t(\" ..(i-1)*Intervalo+Layer.. \",\" ..i*Intervalo+Layer.. \",\\\\\" ..SUERTE.. \")\"..\"\"     			     end         		     return RESULTADO	  	    	               end"},{0,"0:00:00.00","0:00:00.00","Default","Color",0,0,0,"code once all","color = {\"&HFFFFFF&\",\"&HFFFFFF&\",\"&HFFFFFF&\"}"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code syl line all","leadin = \"600\" ; startleadin = \"750\"; twinkle = \"m 33 31 b 38 27 30 20 26 24 b 22 29 28 36 33 31 m 27 32 l 9 49 l 26 31 m 33 26 l 51 7 l 32 24 m 34 30 l 49 47 l 33 32 m 27 24 l 10 8 l 26 25\" ; starheart = {\"m 23 0 l 15 12 l 0 16 l 10 27 l 9 42 l 23 36 l 37 42 l 36 27 l 46 16 l 31 12\",\"m 22 42 b 29 28 43 23 43 13 b 44 3 29 -7 22 8 b 17 -7 -1 3 0 13 b 0 23 16 28 22 42 \"}"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code syl line all","function char_counter(ref) ci[ref] = ci[ref] + 1; return \"\" end ;   function AutoTags(Intervalo,Dato1,Dato2)            local RESULTADO=\"\"     local SUERTE = 0     local CONTADOR = 0     local ARREGLO = 0                           local count = math.ceil(line.duration/Intervalo)                 			ARREGLO = {Dato1,Dato2}    			              for i = 1, count do               CONTADOR = i    	    	    		if Dato1 and Dato2 then     					if  CONTADOR%2 ==0 then    								SUERTE = ARREGLO[1]    					else    								SUERTE = ARREGLO[2]    					end	    		end     				    	RESULTADO = RESULTADO ..\"\\\\t(\" ..(i-1)*Intervalo.. \",\" ..i*Intervalo.. \",\\\\\" ..SUERTE..\")\"..\"\"     			     end         		     return RESULTADO	  	    	               end ;"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code line all","ci = {0,0}; cn = _G.unicode.len(orgline.text_stripped:gsub(\" \",\"\"));"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code syl line all","c = {\"&HFFE91D&\",\"&H6CFF1D&\",\"&H1DFFFD&\",\"&H1DADFF&\",\"&H871DFF&\"} ; xno = {1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5} ; tuyet = { \"m 25 0 l 34 15 l 50 19 l 40 33 l 41 49 l 25 43 l 11 50 l 11 33 l 0 21 l 15 15 l 25 0 \"  ,\"m 40 0 b -17 0 -17 81 41 81 b 101 81 101 1 40 0 \", \"m 26 -1 b -9 -1 -9 50 26 50 b 65 50 65 -1 26 -1 \", \"m 5 3 b 10 -3 25 -3 31 2 b 37 7 38 20 32 25 b 27 30 10 29 5 24 b -1 20 -2 8 5 3 \"}"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template noblank notext loop 6","!retime(\"syl\",100,1000)!{\\an5\\fad(0,400)\\fscx25\\fscy25\\bord1\\blur5\\3c!_G.ass_color(_G.HSV_to_RGB(360*(syl.i/$syln)*$kdur,1,1))!\\1c&HFFFFFF&)\\move($scenter,$smiddle,!$scenter+math.random(-100,100)!,!$smiddle+math.random(-70,70)!\\fad(0,200))}{\\p1}m 25 0 l 34 15 l 50 19 l 40 33 l 41 49 l 25 43 l 11 50 l 11 33 l 0 21 l 15 15 l 25 0 \""},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template noblank notext loop 5","!retime(\"syl\",100,1000)!{\\an5\\fad(0,400)\\fscx20\\fscy20\\bord1\\blur5\\3c!_G.ass_color(_G.HSV_to_RGB(360*(syl.i/$syln)*$kdur,1,1))!\\1c&HFFFFFF&)\\move($scenter,$smiddle,!$scenter+math.random(-100,100)!,!$smiddle+math.random(-70,70)!\\fad(0,200))}{\\p1}m 3 3 b 6 -1 13 -1 17 3 b 20 7 20 13 17 17 b 14 21 6 21 3 17 b 0 13 0 7 3 3 \""}}
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

