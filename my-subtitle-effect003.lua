

local tr = aegisub.gettext

script_name = tr"Effect 003L hai dòng căn trái"
script_description = tr"L Hiệu ứng giản đơn 2 dòng, giúp dễ dàng hát kịp lời nhạc, lời nhạc canh sang trái"
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
	subs[i]=ln
	end
	end
	E.comment=true
	E.text="!retime(\"line\",-700,0)!{\\move(!$lx+100!,!$ly-math.fmod($li,2)*$lheight*1.5!,$lx,!$ly-math.fmod($li,2)*$lheight*1.5!,0,100)\\alpha&H50\\t(600,800,\\alpha0)\\t(!$ldur+500!,!$ldur+700!,\\alpha&Hff\\blur10)}"
	E.effect="template line"
	subs.insert(1,E)
	aegisub.debug.out(0, "* Chú ý:\n Load lại video để tính toán lại vị trí và kích thước subtitle cho phù hợp với kiểu định dạng.... " .." - holyeyed".."\n")
end

aegisub.register_macro(script_name, script_description, add_effect)

