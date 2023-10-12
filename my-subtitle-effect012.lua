

local tr = aegisub.gettext

script_name = tr"Effect 012W một dòng karaoke với hiệu ứng kí tự sao"
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
		ln.align=1
		ln.vertical=true
		ln.fontsize=46 
		ln.margin_l=20
		ln.margin_t=85
		ln.bold=true
		ln.fontname="Arial"
		subs[i]=ln
		end
	end
	E.comment=true
	E.text="!retime(\"syl\",-700-$start/2,-$dur)!{\\alpha&Hff&\\pos($x,$y)\\t(\\alpha&H00&)}"
	E.effect="template syl"
	subs.insert(1,E)
	--//-------------------------

		E.text="!retime(\"syl\",0,0)!{\\bord0\\alpha!math.random(30,80)!\\t(\\1c&H00ff00)\\move($x,$y,!$x-math.random(0,50)!,!$y-math.random(0,50)!)}*"
	E.effect="template syl notext loop 5"
	subs.insert(2,E)
	--//-------------------------
	E.text="!retime(\"syl\",0,0)!{\\t(\\1c&H00ffff)\\move($x,$y,!$x-50!,!$y-50!)}"
	E.effect="template syl"
	subs.insert(3,E)

	--//-------------------------
	
	--//-------------------------
	--//-------------------------
	aegisub.debug.out(0, "* Chú ý:\n Load lại video để tính toán lại vị trí và kích thước subtitle cho phù hợp với kiểu định dạng.... " .." - holyeyed".."\n")
end

aegisub.register_macro(script_name, script_description, add_effect)

