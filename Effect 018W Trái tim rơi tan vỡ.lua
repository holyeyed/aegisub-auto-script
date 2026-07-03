local tr = aegisub.gettext
script_name = tr"Effect 018W Trái tim rơi tan vỡ"
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

	cstyle={{"Dưới-furigana","UTM Swashes",60,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,false,false,false,100,100,0,0,1,0.5,0.5,5,10,10,120,1},{"Dưới","UTM Swashes",120,"&H00FFFFFF","&H000000FF","&H00000000","&H00000000",false,false,false,false,100,100,0,0,1,1,1,5,10,10,120,1}}
	cdiag={{0,"0:00:00.00","0:00:00.00","Dưới","",0,0,0,"code syl all","x = {\"&HFFFE6B&\",\"&H6CFDFF&\",\"&H6CFF9A&\",\"&HFF6CFE&\",\"&HFFFE6B&\",\"&H6CFDFF&\",\"&H6CFF9A&\",\"&HFF6CFE&\",\"&HFFFE6B&\",\"&H6CFDFF&\",\"&H6CFF9A&\",\"&HFF6CFE&\",\"&HFFFE6B&\",\"&H6CFDFF&\",\"&H6CFF9A&\",\"&HFF6CFE&\",\"&HFFFE6B&\",\"&H6CFDFF&\",\"&H6CFF9A&\",\"&HFF6CFE&\",\"&HFFFE6B&\",\"&H6CFDFF&\",\"&H6CFF9A&\",\"&HFF6CFE&\",\"&HFFFE6B&\",\"&H6CFDFF&\",\"&H6CFF9A&\",\"&HFF6CFE&\",\"&HFFFE6B&\",\"&H6CFDFF&\",\"&H6CFF9A&\",\"&HFF6CFE&\",\"&HFFFE6B&\",\"&H6CFDFF&\",\"&H6CFF9A&\",\"&HFF6CFE&\",\"&HFFFE6B&\",\"&H6CFDFF&\",\"&H6CFF9A&\",\"&HFF6CFE&\",\"&HFFFE6B&\",\"&H6CFDFF&\",\"&H6CFF9A&\",\"&HFF6CFE&\",\"&HFFFE6B&\",\"&H6CFDFF&\",\"&H6CFF9A&\",\"&HFF6CFE&\",\"&HFFFE6B&\",\"&H6CFDFF&\",\"&H6CFF9A&\",\"&HFF6CFE&\",\"&HFFFE6B&\",\"&H6CFDFF&\",\"&H6CFF9A&\",\"&HFF6CFE&\",\"&HFFFE6B&\",\"&H6CFDFF&\",\"&H6CFF9A&\",\"&HFF6CFE&\"} ; y = {\"&H7C7B57&\",\"&H5B8384&\",\"&H4F6B58&\",\"&H7A5278&\",\"&H7C7B57&\",\"&H5B8384&\",\"&H4F6B58&\",\"&H7A5278&\",\"&H7C7B57&\",\"&H5B8384&\",\"&H4F6B58&\",\"&H7A5278&\",\"&H7C7B57&\",\"&H5B8384&\",\"&H4F6B58&\",\"&H7A5278&\",\"&H7C7B57&\",\"&H5B8384&\",\"&H4F6B58&\",\"&H7A5278&\",\"&H7C7B57&\",\"&H5B8384&\",\"&H4F6B58&\",\"&H7A5278&\",\"&H7C7B57&\",\"&H5B8384&\",\"&H4F6B58&\",\"&H7A5278&\",\"&H7C7B57&\",\"&H5B8384&\",\"&H4F6B58&\",\"&H7A5278&\",\"&H7C7B57&\",\"&H5B8384&\",\"&H4F6B58&\",\"&H7A5278&\",\"&H7C7B57&\",\"&H5B8384&\",\"&H4F6B58&\",\"&H7A5278&\",\"&H7C7B57&\",\"&H5B8384&\",\"&H4F6B58&\",\"&H7A5278&\",\"&H7C7B57&\",\"&H5B8384&\",\"&H4F6B58&\",\"&H7A5278&\",\"&H7C7B57&\",\"&H5B8384&\",\"&H4F6B58&\",\"&H7A5278&\",\"&H7C7B57&\",\"&H5B8384&\",\"&H4F6B58&\",\"&H7A5278&\",\"&H7C7B57&\",\"&H5B8384&\",\"&H4F6B58&\",\"&H7A5278&\",\"&H7C7B57&\",\"&H5B8384&\",\"&H4F6B58&\",\"&H7A5278&\",\"&H7C7B57&\",\"&H5B8384&\",\"&H4F6B58&\",\"&H7A5278&\",\"&H7C7B57&\",\"&H5B8384&\",\"&H4F6B58&\",\"&H7A5278&\",\"&H7C7B57&\",\"&H5B8384&\",\"&H4F6B58&\",\"&H7A5278&\",\"&H7C7B57&\",\"&H5B8384&\",\"&H4F6B58&\",\"&H7A5278&\",\"&H7C7B57&\",\"&H5B8384&\",\"&H4F6B58&\",\"&H7A5278&\",\"&H7C7B57&\",\"&H5B8384&\",\"&H4F6B58&\",\"&H7A5278&\",\"&H7C7B57&\",\"&H5B8384&\",\"&H4F6B58&\",\"&H7A5278&\",\"&H7C7B57&\",\"&H5B8384&\",\"&H4F6B58&\",\"&H7A5278&\",\"&H7C7B57&\",\"&H5B8384&\",\"&H4F6B58&\",\"&H7A5278&\"} ; s = \"m 26 257 b 48 257 48 228 26 228 b 5 228 5 257 26 257 \""},{1,"0:00:00.00","0:00:00.00","Dưới","",0,0,0,"template noblank notext loop 5","!retime(\"syl\",-25,900+($si-1)*50)!{\\shad0\\fad(0,300)\\1vc(!x[$si]!,!x[$si]!,&HFFFFFF&,&HFFFFFF&)\\3c!y[$si]!\\fscx5\\fscy5\\bord5\\blur5\\an5\\move($center,$middle,!$scenter+math.random(-100,100)!,!$smiddle+math.random(-50,50)!\\t(0,900,\\bord5\\blur5\\fscx10\\fscy10)}{\\p1}m 52 51 b 68 32 106 32 122 51 b 138 67 138 108 123 123 b 110 139 64 138 52 122 b 35 107 35 67 52 51 \""},{1,"0:00:00.00","0:00:00.00","Dưới","",0,0,0,"template noblank notext loop 5","!retime(\"syl\",0,-$dur+200)!{\\an5\\frz!math.random(-100,100)!\\fad(0,100)\\an5\\1vc(!x[$si]!,!x[$si]!,&HFFFFFF&,&HFFFFFF&)\\3c!y[$si]!\\bord0\\shad0\\fscx150\\fscy150\\pos($scenter,$smiddle)\\t(0,1000,\\frz!math.random(-500,500)!)}{\\p1}m 24 23 l 25 0 l 25 24 l 50 0 l 26 25 l 44 24 l 26 26 l 40 40 l 25 26 l 0 50 l 24 25 l 0 22 l 0 22 l 24 24 l 10 7 l 24 23 \""},{2,"0:00:00.00","0:00:00.00","Dưới","heart phase 2",0,0,0,"Template noblank","!retime(\"syl\",0,700)!{\\fad(0,300)\\an6\\fad(0,50)\\clip(!$lleft-50!,!$middle-50!,!$lright+50!,!$middle+95!)\\move($scenter,$smiddle,$scenter,!$smiddle+100!)\\t(0,$dur,\\frz5\\1vc(!x[$si]!,!x[$si]!,&HFFFFFF&,&HFFFFFF&)\\3c!y[$si]!\\fscx100\\fscy100)\\p1}m 0 -7 b 7 -22 17 -12 14 -4 b 14 0 0 11 0 13 b 0 11 -14 0 -14 -4 b -16 -12 -7 -22 0 -7 m -11 -11 b -13 -11 -13 -7 -10 -8 b -9 -8 -9 -11 -11 -11 m -13 -5 b -13 -1 -6 5 -2 8 b -1 9 0 8 -1 7 b -3 6 -11 -1 -12 -5 b -12 -6 -13 -6 -13 -5 \""},{0,"0:00:00.00","0:00:00.00","Dưới","",0,0,0,"code syl all","color = {\"90\",\"200\"}; factor = 15; function char_counter(ref) ci[ref] = ci[ref] + 1; return \"\" end; ci = { 0 }; cn = _G.unicode.len(orgline.text_stripped:gsub(\" \",\"\")); shape = {\"m 34 0 l 33 33 b 24 21 19 26 33 33 l 0 34 l 33 35 b 19 44 24 49 33 35 l 34 68 l 35 35 b 43 49 48 44 35 35 l 68 34 l 35 33 b 48 26 44 21 35 33\",\"m 4 0 l 0 4 l 4 8 l 8 4 \"}; delay = 550; size = 40; temp = {}; function set_temp(ref,val) temp[ref] = val; return val; end"},{1,"0:00:00.00","0:00:00.00","Dưới","",0,0,0,"template char noblank","!retime(\"start2syl\",-1000+($si-1)*250,-25)!{\\an5\\1vc(!x[$si]!,!x[$si]!,&HFFFFFF&,&HFFFFFF&)\\3c!y[$si]!\\bord3\\fry200\\frx200\\move($center,!$middle-50!,$scenter,$smiddle,0,500)\\fad(200,0)\\t(0,500,\\frx0\\fry0\\blur0)}"},{0,"0:00:00.00","0:00:00.00","Dưới","hilight(char)",0,0,0,"template noblank","!retime(\"presyl\",0,500)!{\\an5\\fad(0,300)\\move($center,$middle,!$center-50!,!$middle-50!)\\1vc(!x[$si]!,!x[$si]!,&HFFFFFF&,&HFFFFFF&)\\3c!y[$si]!\\t(0,500,1.3,\\fr360\\fscx60\\fscy60)}"}}
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

