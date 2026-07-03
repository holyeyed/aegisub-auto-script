local tr = aegisub.gettext
script_name = tr"Effect 039W Gõ đầu chữ tan ra thành bột"
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

	cstyle={{"PA-furigana","UVN Mau Tim 2",30,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,false,false,false,100,100,0,0,1,0,0,3,20,20,76,1},{"PA","RixLoveFool",60,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",true,false,false,false,100,100,0,0,1,2,2,5,10,10,30,1}}
	cdiag={{15,"0:00:00.00","0:00:00.00","PA","",0,0,0,"code once","math.randomseed(3500);"},{0,"0:00:00.00","0:00:00.00","PA","",0,0,0,"code syl","color=_G.ass_color(math.random(70,150),math.random(70,150),math.random(70,150))"},{0,"0:00:00.00","0:00:00.00","PA","AutoTags",0,0,0,"code syl"," function AutoTags(TipoDeLinea,Intervalo,Dato1,Dato2)            local RESULTADO = 0      RESULTADO=\"\"     local SUERTE = 0     local CONTADOR = 0     local ARREGLO = 0         if TipoDeLinea == TE1 then    	DURACION =(line.start_time-800)/Intervalo    end    if TipoDeLinea == TE2 then    DURACION =((line.start_time+(syl.start_time+150))/Intervalo)    end    if TipoDeLinea == TE3 then    	DURACION =(line.start_time+syl.start_time)/Intervalo    end    if TipoDeLinea == TE4 then    	DURACION =(line.duration)/Intervalo    end               local count = math.ceil(DURACION)                 			ARREGLO = {Dato1,Dato2}    			              for i = 1, count do               CONTADOR = i    	    	    		if Dato1 and Dato2 then     					if  CONTADOR%2 ==0 then    								SUERTE = ARREGLO[1]    					else    								SUERTE = ARREGLO[2]    					end	    		end     				    	RESULTADO = RESULTADO ..\"\\\\t(\" ..(i-1)*Intervalo.. \",\" ..i*Intervalo.. \",\\\\\" ..SUERTE..\")\"..\"\"     			     end         		     return RESULTADO	  	    	               end"},{0,"0:00:00.00","0:00:00.00","PA","fscxy",0,0,0,"code once","function fscxy(valorx1, valory1,valorx2, valory2,Aleatorio)   		if not valory1 and not valorx2 and not valory2 then  			Uno = \"\\\\fscx\" ..math.floor(valorx1).. \"\\\\fscy\" ..math.floor(valorx1)..\"\"  			return Uno; 		end 		 		if not  valorx2 and not valory2 then  			Dos = \"\\\\fscx\" ..math.floor(valorx1).. \"\\\\fscy\" ..math.floor(valory1)..\"\"  			return Dos; 		end 		 		if not valory2 then  			valorxalter = math.random(valorx1,valorx2);   			tres = \"\\\\fscx\" ..math.floor(valorxalter).. \"\\\\fscy\" ..math.floor(valory1)..\"\"  			return tres; 		end 		   		if valorx2 and valory2 then 			 			if Aleatorio then  				valorx=math.random(valorx1,valorx2) 				valory=math.random(valory1,valory2) 			else			 					VecX = {valorx1,valorx2} 					VecY = {valory1,valory2} 					 					function DesIgualar() 						valorx = VecX[math.random(1,2)];   						valory = VecY[math.random(1,2)];   						while valorx==valory do 							DesIgualar() 						end 					end 					 					DesIgualar() 			end 			 			cuatro = \"\\\\fscx\" ..math.floor(valorx).. \"\\\\fscy\" ..math.floor(valory)..\"\"  			return cuatro; 		end	   end"},{0,"0:00:00.00","0:00:00.00","PA","",0,0,0,"code syl","if syl.i%2==0 then   PARRIVABAJO=-40 else PARRIVABAJO=40 end"},{0,"0:00:00.00","0:00:00.00","PA","",0,0,0,"code once all","function char_counter(ref) ci[ref] = ci[ref] + 1; return \"\" end"},{0,"0:00:00.00","0:00:00.00","PA","",0,0,0,"code once","temp = {}"},{0,"0:00:00.00","0:00:00.00","PA","",0,0,0,"code once","function set_temp(ref,val) temp[ref] = val; return val; end"},{0,"0:00:00.00","0:00:00.00","PA","",0,0,0,"code line","A= {0}; cn = _G.unicode.len(orgline.text_stripped:gsub(\" \",\"\"))"},{0,"0:00:00.00","0:00:00.00","PA","",0,0,0,"code once","function AB(ref) A[ref] = A[ref] + 1; return \"\" end"},{0,"0:12:24.97","0:12:24.97","PA","",0,0,0,"template char","!AB(1)!!retime(\"start2syl\",-900+(A[1]-1)*40,0)!{\\an5\\org($scenter,$stop)\\fscx30\\fscy30\\frz75\\frx-130\\move($scenter,$sbottom,$scenter,$smiddle,0,400)\\t(0,400,\\fscx100\\fscy100\\frx0\\frz0)\\blur2\\bord1}"},{2,"0:00:00.00","0:00:00.00","PA","",0,0,0,"template char noblank","!retime(\"syl\",0,500)!{\\galovejiro\\an5\\move($scenter,$smiddle,!$scenter+20!,$middle)\\bord2\\be15\\t(\\3a&H8200&\\fscx100\\fscy100)\\4c&H000000&\\fad(0,1500)\\3c&H676767&\\3a&HFF}"},{0,"0:00:00.00","0:00:00.00","PA","",0,0,0,"template notext noblank multi fxgroup nofirstsyl","!retime(\"presyl\",-line.kara[syl.i-1].duration,0)!{\\an5\\fscx20\\fscy20\\pos(!line.left+line.kara[syl.i-1].center!,$top)\\org(!$center-((line.kara[syl.i].center-line.kara[syl.i-1].center)/2)!,$top)\\t(\\fr-180)\\bord1\\blur3\\3c!color!\\p1}m 18 39 b 23 28 35 24 35 16 b 36 8 23 0 18 11 b 14 0 0 8 1 16 b 1 24 13 28 18 39"},{0,"0:00:00.04","0:00:00.04","PA","",0,0,0,"template syl noblank notext loop 5","!retime(\"syl\",10,math.random(40,60)*10)!{\\galovejiro\\an5\\be1\\pos(!$scenter+math.random(-20,20)!,!$smiddle+math.random(-10,10)!)\\fscx0\\fscy0\\bord0\\1a&HDF\\3a&H00\\t(\\fscx!math.random(95,105)!\\fscy!math.random(95,105)!\\fs!math.random(30,50)!\\bord!math.random(2,7)!\\1a&HFF\\3a&HFF)\\3c&HEAF6F0&\\p1}m 16 30 b 28 22 30 18 30 14 b 32 8 22 -2 16 10 b 10 -2 0 8 2 14 b 2 18 4 22 16 30"},{0,"0:00:00.26","0:00:00.26","PA","",0,0,0,"template notext noblank loop 10","!retime(\"syl\",0,800)!{\\galovejiro\\an5\\move($scenter,!$smiddle!,!$scenter-math.random(-30,30)!,!$smiddle-math.random(-30,30)!)\\blur4\\bord1\\fscx50\\fscy50\\t(\\fr!math.random(360)!\\frx!math.random(360)!\\fry!math.random(360)!)\\fad(0,300)\\p1\\3c&HEAF6F0&}m 0 0 l 0 3 l 3 3 b 4 2 4 1 3 0 l 3 0 b 2 -1 1 -1 0 0 l 0 0 b -1 1 -1 2 0 3 b 1 4 2 4 3 3"}}
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

