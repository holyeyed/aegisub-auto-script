local tr = aegisub.gettext
script_name = tr"Effect 035W Bong bóng xà phòng bay lên"
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

	cstyle={{"Default-furigana","Arial",10,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,false,false,false,100,100,0,0,1,1,1,2,10,10,10,1},{"Default","RixLoveFool",60,"&H00FFFFFF","&H000000FF","&H00792BEE","&H00000000",true,false,false,false,100,100,0,0,1,2,0,5,10,10,30,1}}
	cdiag={{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code syl all","function Freeman(ref) ci[ref] = ci[ref] + 1; return \"\" end"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code line all","ci={0}; cn=_G.unicode.len(orgline.text_stripped:gsub(\" \",\"\"))"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code once","mau={\"&H0000FF&\",\"&H40EAFA&\",\"&H40FA83&\",\"&H74C6ED&\",\"&HEEE648&\",\"&HF9AE15&\",\"&HF2539B&\",\"&HF84CF7&\",\"&H45D9C6&\",\"&H922EFA&\"}; colors=0"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"code syl","colors=mau[math.random(10)]"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template noblank char","!Freeman(1)!!retime(\"start2syl\",-1000+(ci[1]-1)*40,0)!{\\an5\\3c&HFFFFFF&\\1c&HFFFFFF&\\org(!$center-20!,!$middle+40!)\\frx-360\\fad(0,150)\\pos($center,$middle)\\shad0\\bord1\\blur1\\t(0,800,\\frz0\\frx0\\fscx100\\fscy100\\3c&HFFFFFF&\\1c&HFFFFFF&\\bord1\\blur0)\\fad(0,250)}"},{0,"0:00:00.00","0:00:00.00","Default","AutoTags",0,0,0,"code syl","function AutoTags(Intervalo,Dato1,Dato2)            local RESULTADO=\"\"     local SUERTE = 0     local CONTADOR = 0     local ARREGLO = 0                           local count = math.ceil(line.duration/Intervalo)                 			ARREGLO = {Dato1,Dato2}    			              for i = 1, count do               CONTADOR = i    	    	    		if Dato1 and Dato2 then     					if  CONTADOR%2 ==0 then    								SUERTE = ARREGLO[1]    					else    								SUERTE = ARREGLO[2]    					end	    		end     				    	RESULTADO = RESULTADO ..\"\\\\t(\" ..(i-1)*Intervalo.. \",\" ..i*Intervalo.. \",\\\\\" ..SUERTE..\")\"..\"\"     			     end         		     return RESULTADO	  	    	               end"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template noblank multi","!retime(\"syl\",0,0)!{\\an5\\bord1\\blur0\\1c&HFFFFFF&\\3c!colors!\\pos($center,$middle)\\t(0,!line.duration/2.5!,0.6\\fscx120\\fscy120\\shad0\\bord!math.random(6,8)!\\blur!math.random(8,10)!\\t(!line.duration/2.5!,!line.duration!,\\fscx100\\fscy100\\bord1\\blur0\\shad0\\1c&HFFFFFF&\\3c!colors!)!AutoTags(math.random(150,350),'frz-5','frz5')!}"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template noblank notext multi","!retime(\"syl\",0,0)!{\\pos($scenter,$smiddle)\\an5\\shad0\\fscx30\\frz!math.random(-60,60)!\\fscy30\\t(0,!line.duration/2.5!,0.7,\\fscx50\\fscy50\\shad0\\bord3\\blur7\\1c&HFFFFFF&\\3c!colors!\\t(!line.duration/2.5!,!line.duration!,!10/7!,\\fscx25\\fscy25\\shad0\\blur5\\bord1\\1c&HFFFFFF&\\3c!colors!)\\!AutoTags(math.random(150,350),'frz-5','frz5')!\\p1}m 14 138 b 18 92 42 56 90 29 b 122 15 166 14 206 35 b 234 54 260 83 268 119 b 272 164 266 213 212 251 b 198 263 158 282 100 264 b 48 242 12 198 14 138 m 100 261 b 140 275 184 266 210 248 b 252 224 258 188 264 162 b 268 146 266 131 262 122 b 256 80 228 59 204 41 b 186 30 172 29 152 35 b 140 36 150 45 146 48 b 146 51 122 56 116 53 b 104 48 110 42 108 38 b 106 32 100 33 96 35 b 90 38 66 45 56 59 b 38 77 28 98 22 122 b 14 143 20 164 24 182 b 32 207 46 222 58 236 b 74 246 86 255 100 261 m 62 62 b 66 62 68 63 66 66 b 58 71 52 77 50 84 b 48 90 50 99 46 107 b 40 117 36 125 32 135 b 22 137 24 128 24 122 b 24 113 30 104 32 96 b 34 92 38 86 42 81 b 44 80 46 80 48 78 b 54 74 58 68 62 62 m 130 60 b 126 53 152 47 162 59 b 164 69 132 72 130 60 m 232 224 l 192 227 l 232 228 b 232 228 232 230 234 230 b 236 233 236 234 238 234 b 238 246 238 260 238 272 b 240 260 240 246 240 234 b 240 234 242 233 244 233 l 258 245 l 244 231 b 244 230 246 228 246 227 l 284 227 l 246 225 b 246 224 244 222 244 222 l 258 209 l 244 221 b 242 219 242 219 240 218 l 240 179 l 238 218 b 236 219 234 219 234 221 l 220 207 l 234 222 b 232 222 232 224 232 224 m 234 233 b 234 231 234 231 234 230 b 236 227 240 224 242 219 b 242 221 244 221 244 221"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template noblank  notext loop 12","!retime(\"presyl\",-500+j*50,j*10)!{\\an5\\move($scenter,!$smiddle+math.random(70,100)!,!$center+math.random(-45,45)!,$middle)\\fsc!math.random(10,20)!\\bord0.5\\blur4\\frz!math.random(-45,45)!\\1c&HFFFFFF&\\3c!colors!)\\p!math.random(3,4)!}m 14 138 b 18 92 42 56 90 29 b 122 15 166 14 206 35 b 234 54 260 83 268 119 b 272 164 266 213 212 251 b 198 263 158 282 100 264 b 48 242 12 198 14 138 m 100 261 b 140 275 184 266 210 248 b 252 224 258 188 264 162 b 268 146 266 131 262 122 b 256 80 228 59 204 41 b 186 30 172 29 152 35 b 140 36 150 45 146 48 b 146 51 122 56 116 53 b 104 48 110 42 108 38 b 106 32 100 33 96 35 b 90 38 66 45 56 59 b 38 77 28 98 22 122 b 14 143 20 164 24 182 b 32 207 46 222 58 236 b 74 246 86 255 100 261 m 62 62 b 66 62 68 63 66 66 b 58 71 52 77 50 84 b 48 90 50 99 46 107 b 40 117 36 125 32 135 b 22 137 24 128 24 122 b 24 113 30 104 32 96 b 34 92 38 86 42 81 b 44 80 46 80 48 78 b 54 74 58 68 62 62 m 130 60 b 126 53 152 47 162 59 b 164 69 132 72 130 60 m 232 224 l 192 227 l 232 228 b 232 228 232 230 234 230 b 236 233 236 234 238 234 b 238 246 238 260 238 272 b 240 260 240 246 240 234 b 240 234 242 233 244 233 l 258 245 l 244 231 b 244 230 246 228 246 227 l 284 227 l 246 225 b 246 224 244 222 244 222 l 258 209 l 244 221 b 242 219 242 219 240 218 l 240 179 l 238 218 b 236 219 234 219 234 221 l 220 207 l 234 222 b 232 222 232 224 232 224 m 234 233 b 234 231 234 231 234 230 b 236 227 240 224 242 219 b 242 221 244 221 244 221"},{0,"0:00:00.00","0:00:00.00","Default","",0,0,0,"template char noblank notext loop 3","!retime(\"syl\",-1000+($si-1)*10,-500)!{\\an5\\c&HFFFFFF&\\3c&HFFFFFF&\\fscx5\\fscy5\\blur3\\bord0.1\\pos($scenter,!$smiddle+100!)\\t(-1000,0,\\fscx100\\fscy50\\bord0.1\\blur3)\\fad(0,300)\\p1}m 0 25 b 1 10 50 11 50 25 b 51 40 -1 40 0 25 m 2 23 b -5 38 49 39 49 25 b 50 14 6 11 2 23"}}
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

