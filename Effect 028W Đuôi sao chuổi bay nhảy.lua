local tr = aegisub.gettext
script_name = tr"Effect 028W Đuôi sao chuổi bay nhảy"
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

	cstyle={{"Default","Arial",20,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,false,false,false,100,100,0,0,1,2,2,2,10,10,10,1}}
	cdiag={{0,"0:00:00.00","0:00:00.00","Roman","",0000,0000,0000,"code once","star ={\"m 17 0 l 11 8 l 0 11 l 7 19 l 7 30 l 17 26 l 28 30 l 27 19 l 35 11 l 23 8 \",  \"m 23 0 l 15 12 l 0 16 l 10 27 l 9 42 l 23 36 l 37 42 l 36 27 l 46 16 l 31 12\", \"m 11 0 l 7 6 l 0 7 l 5 12 l 4 19 l 11 17 l 17 19 l 17 12 l 22 7 l 15 5 \"  ,\"m 14 1 b 3 1 3 18 14 18 b 25 18 25 1 14 1 \"  ,\"m 14 1 b 3 1 3 18 14 18 b 25 18 25 1 14 1 \"}"},{0,"0:00:15.27","0:00:15.27","Roman","Get Frame Dur",0000,0000,0000,"code once","msa = _G.aegisub.ms_from_frame(1) msb = _G.aegisub.ms_from_frame(100) if msa == nil and msb == nil then frame_dur = 33 else frame_dur = (msb-msa)/100 end"},{0,"0:00:15.27","0:00:15.27","Roman","",0000,0000,0000,"code once","math.randomseed(8317)"},{0,"0:00:00.00","0:00:15.27","Roman","",0000,0000,0000,"code once","logic ={\"100\"  ,\"230\"  ,\"310\"  ,\"50\"}"},{0,"0:00:15.27","0:00:15.27","Roman","",0000,0000,0000,"code once","temp = {}"},{0,"0:00:15.27","0:00:15.27","Roman","",0000,0000,0000,"code once","function set_temp(ref,val) temp[ref] = val; return val; end"},{0,"0:00:00.00","0:00:00.00","Roman","AutoTags",0000,0000,0000,"code syl","function AutoTags(Intervalo,Dato1,Dato2)            local RESULTADO=\"\"     local SUERTE = 0     local CONTADOR = 0     local ARREGLO = 0                           local count = math.ceil(line.duration/Intervalo)                 			ARREGLO = {Dato1,Dato2}    			              for i = 1, count do               CONTADOR = i    	    	    		if Dato1 and Dato2 then     					if  CONTADOR%2 ==0 then    								SUERTE = ARREGLO[1]    					else    								SUERTE = ARREGLO[2]    					end	    		end     				    	RESULTADO = RESULTADO ..\"\\\\t(\" ..(i-1)*Intervalo.. \",\" ..i*Intervalo.. \",\\\\\" ..SUERTE..\")\"..\"\"     			     end         		     return RESULTADO	  	    	               end"},{0,"0:00:00.00","0:00:00.00","Roman","",0000,0000,0000,"code syl all","function char_counter2(ref) ci2[ref] = ci2[ref] + 1; return \"\" end"},{0,"0:00:00.00","0:00:00.00","Roman","",0000,0000,0000,"code line all","ci2 = { 0 }; cn = _G.unicode.len(orgline.text_stripped:gsub(\" \",\"\"))"},{1,"0:00:00.00","0:00:00.00","Roman","",0000,0000,0000,"template noblank","!retime(\"syl\",0,200)!{\\an5\\blur6\\bord6\\pos($scenter,$smiddle)\\fad(0,100)\\t(0,100,\\3c&HFFFFFF&\\fscx130\\fscy130)\\t(100,$dur,\\3c!line.styleref.color3!\\fscx100\\fscy100\\bord2.5\\blur2)}"},{0,"0:00:15.27","0:00:15.27","Roman","Beizer Curve Move",0000,0000,0000,"code once","function bezier_move(x1,y1,x2,y2,x3,y3,x4,y4,t1,t2,accel,afterimage_blur,afterimage_dur,density) if density == 0 or density == nil then density = 1 end if afterimage_blur == 0 or afterimage_blur == nil then x_blur = 0 y_blur = 0 else x_blur = math.random(-afterimage_blur,afterimage_blur)/3 y_blur = math.random(afterimage_blur) end if afterimage_dur == nil or afterimage_dur < frame_dur then afterimage_dur = frame_dur end  if accel == nil then accel = 1 end x_pos = {} y_pos = {} dur = t2 - t1 frames = math.floor(dur/(frame_dur/density)) x_pos[j] =  (1-(j/frames)^accel)^3 * x1 + 3*(1-(j/frames)^accel)^2 * ((j/frames)^accel) * x2 + 3*(1-(j/frames)^accel) * ((j/frames)^accel)^2 * x3 + ((j/frames)^accel)^3 * x4  y_pos[j] = (1-(j/frames)^accel)^3 * y1 + 3*(1-(j/frames)^accel)^2 * ((j/frames)^accel) * y2 + 3*(1-(j/frames)^accel) * ((j/frames)^accel)^2 * y3 + ((j/frames)^accel)^3 * y4  if j == 1 then maxloop(frames) end retime(\"presyl\",t1+(j-1)*(frame_dur/density),t1+j*(frame_dur/density)+afterimage_dur) return string.format(\"\\\\move(%d,%d,%d,%d)\",x_pos[j],y_pos[j],x_pos[j] + x_blur ,y_pos[j] + y_blur) end"},{0,"0:00:15.27","0:00:15.27","Roman","effect",0000,0000,0000,"template notext noblank","!retime(\"start2syl\",0,500)!{\\an5\\fscx5\\fscy5\\bord0\\shad0\\c&HFFFFFF&\\bord0\\frz!math.random(-100,100)!\\3c&HFFFFFF&\\!bezier_move($center-$width*1.3/2,$middle,$center-$width*1.3/2,$middle-$width*1.3/2*1.4,$center+$width*1.3/2,$middle-$width*1.3/2*1.4,$center+$width*1.3/2,$middle,-500,0,1,50,2000,5)!\\!AutoTags(logic[math.random(4)],'1a&HFF&','alpha0')!\\p1}!star[math.random(3)]!"},{1,"0:00:00.00","0:00:00.00","Roman","",0000,0000,0000,"template char","{\\an5}!char_counter2(1)!!retime(\"start2syl\",-900+(ci2[1]-1)*35,0)!{\\frz100\\be1\\fscx0\\fscy0\\bord3\\blur5\\an5\\1a&HFF&\\3a&HFF&\\move(!$center+40!,!$middle+15!,$scenter,$smiddle,0,500)\\t(0,500,\\fscx100\\fscy100\\frz0\\alpha&H00)}"},{0,"0:00:00.26","0:00:00.26","Roman","",0000,0000,0000,"template notext noblank loop 10","!retime(\"syl\",0,400)!{\\galovejiro\\an5\\move(!$center+math.random(-30,30)!,!$middle+math.random(-10,30)!,!$center+math.random(-30,30)!,!$middle+math.random(-10,30)!)\\blur3\\bord1\\fscx15\\fscy15\\t(\\fr!math.random(360)!\\frx!math.random(360)!\\fry!math.random(360)!)\\fad(0,300)\\p1}m 30 23 b 24 23 24 33 30 33 b 36 33 37 23 30 23 m 35 27 l 61 28 l 35 29 m 26 27 l 0 28 l 26 29 m 29 23 l 30 0 l 31 23 m 29 33 l 30 57 l 31 33 m 30 23 b 24 23 24 33 30 33 b 36 33 37 23 30 23 m 35 27 l 61 28 l 35 29 m 26 27 l 0 28 l 26 29 m 29 23 l 30 0 l 31 23 m 29 33 l 30 57 l 31 33"}}
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

