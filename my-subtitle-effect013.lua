

local tr = aegisub.gettext

script_name = tr"Effect 013W một dòng karaoke với hiệu ứng sao, tu dong dieu chinh dong"
script_description = tr"W Hiệu ứng karaoke, 1 dòng, kí tự sao"
script_author = "holyeyed"
script_version = "1.0"

function add_effect(subs, sel)
	--xres, yres, ar, artype = aegisub.video_size()
	--aegisub.debug.out(yres.."\n")
	local E=subs[sel[1]]
	for i=1,#subs do
	--aegisub.debug.out(0, i.." this class is " .. tostring(subs[i].class).."\n")
	ln=subs[i]
		if(ln.class=="style" and ln.name=="Default") then 
		ln.align=5
		ln.vertical=true
		ln.fontsize=80
		ln.margin_l=20
		ln.margin_t=85
		ln.bold=true
		ln.fontname="Arial"
		subs[i]=ln
		end
	end
	E.comment=true
	E.text="mw=1280 mh=720 function pos(lw,x,y) s=lw-mw s0=(mw-lw/2)/2 if s>0 then if x<=mw/2 then return \"\"..(x+s/2+s0)..\",\"..y..\"\" else return \"\"..(x-mw/2+s0)..\",\"..(y+line.height)..\"\" end else return \"\"..x..\",\"..y..\"\" end end function rdcl() return string.format(\"%x\",math.random(0,0xffffff)) end cl=rdcl()"
	E.effect="code once"
	subs.insert(1,E)
	--//-------------------------

	E.text="!retime(\"syl\",-700-$start/2,-$dur)!{\\pos(!pos($lwidth,$sx,$sy)!)}"
	E.effect="template syl"
	subs.insert(2,E)
	--//-------------------------
	E.text="!retime(\"syl\",0,0)!{\\move(!pos($lwidth,$sx,$sy)!,!pos($lwidth,$sx,$sy-50)!)\\t(\\1c&H!cl!&\\alpha50\\2c&Hffffff&\\blur10)}"
	E.effect="template syl"
	subs.insert(3,E)

	--//-------------------------
	E.text="!retime(\"syl\",0,0)!{\\move(!pos($lwidth,$sx,$sy+$lheight/2)!,!pos($lwidth,$sx+$swidth,$sy)!)\\t(\\1c&H!cl!&\\alpha50\\2c&Hffffff&\\blur10)\\p1}m -4 -3 b -4 -3 -4 -3 -4 -3 b -5 -5 -3 -8 -1 -9 b 1 -8 3 -6 3 -4 b 5 -5 7 -4 9 -2 b 9 -1 7 2 5 2 b 7 4 7 6 6 8 b 4 8 2 9 0 5 m 0 5 m 0 5 m 0 5 b -1 8 -2 9 -5 9 b -6 7 -6 6 -5 3 b -5 3 -8 3 -10 0 b -8 -3 -6 -3 -4 -3 m -5 -2 {\\p0}"
	E.effect="template syl notext"
	subs.insert(4,E)
	--//-------------------------
	--//-------------------------
	aegisub.debug.out(0, "* Chú ý:\n Load lại video để tính toán lại vị trí và kích thước subtitle cho phù hợp với kiểu định dạng.... " .." - holyeyed".."\n")
end

aegisub.register_macro(script_name, script_description, add_effect)

