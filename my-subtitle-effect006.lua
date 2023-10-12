

local tr = aegisub.gettext

script_name = tr"Effect 006W một dòng màu cầu vòng ghép kí tự"
script_description = tr"W Hiệu ứng karaoke, 1 dòng, màu cầu vòng, ghép các ký tự"
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
		ln.align=2
		ln.vertical=true
		ln.fontsize=72 
		ln.fontname="UTM American Sans"
		ln.margin_l=20
		ln.margin_t=85
		subs[i]=ln
		end
	end
	E.comment=true
	E.text="i=0 function count() i=i+1 if i==7 then i=0 end return \"\" end color={\"0000ff\",\"0088ff\",\"00ffff\",\"00ff88\",\"88ff00\",\"ff0088\",\"ff00ff\"}"
	E.effect="code once"
	subs.insert(1,E)
	--//-------------------------
	E.text="!retime(\"syl\",-500,$ldur-$send-500)!!count()!{\\move(!$x-math.random(-20,20)!,!$y-((i%2)*2-1)*50!,$x,$y,0,!$dur-200!)\\1c&H!color[i+1]!&\\t(\\fad($sdur/3,$sdur/3)\\4c&Hffffff&\\blur5)}"
	E.effect="template syl char"
	subs.insert(2,E)
	--//-------------------------
	
	--//-------------------------

	--//-------------------------
	aegisub.debug.out(0, "* Chú ý:\n Load lại video để tính toán lại vị trí và kích thước subtitle cho phù hợp với kiểu định dạng.... " .." - holyeyed".."\n")
end

aegisub.register_macro(script_name, script_description, add_effect)

