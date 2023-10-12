

local tr = aegisub.gettext

script_name = tr"Effect 001L hai dòng lyric"
script_description = tr"L Hiệu ứng giản đơn 2 dòng, giúp dễ dàng hát kịp lời nhạc"
script_author = "holyeyed"
script_version = "1.0"

function add_effect(subs, sel)
	local E=subs[sel[1]]
	--aegisub.debug.out(0, "this class is " .. tostring(E.class))
	E.comment=true
	E.text="!retime(\"line\",-700,0)!{\\move($lx,!$ly-100!,$lx,$ly,!600+$ldur/10!,!$ldur/10+700!)\\xbord5\\ybord5\\be0\\alpha&H70&\\t(!600+$ldur/10!,!$ldur/10+700!,\\alpha&H00&\\fscx120\\fscy120)}"
	E.effect="template line"
	subs.insert(sel[1],E)
end

aegisub.register_macro(script_name, script_description, add_effect)

