

local tr = aegisub.gettext

script_name = tr"Effect 007W một dòng màu xanh kí tự chuyển sang trái"
script_description = tr"W Hiệu ứng karaoke, 1 dòng, màu xanh, kí tự bay sang trái"
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
	E.text="v=0 cc=string.len(syl.text) function count() v=v+1 return v end"
	E.effect="code syl"
	subs.insert(1,E)
	--//-------------------------
	E.text="!retime(\"syl\",-$sstart/2-500,-$sdur)!{\\pos($sx,$sy)\\fade($sdur/3,0)}"
	E.effect="template syl"
	subs.insert(2,E)
	--//-------------------------
	E.text="!retime(\"syl\",0,($ldur-$send)/2)!{\\move($sx,$sy,!$sx-100!,!$sy!,!$sdur/cc*count()!,$dur)\\t(\\1c&Hff0000\\alpha100)}"
	E.effect="template syl char"
	subs.insert(3,E)
	--//-------------------------

	--//-------------------------
	aegisub.debug.out(0, "* Chú ý:\n Load lại video để tính toán lại vị trí và kích thước subtitle cho phù hợp với kiểu định dạng.... " .." - holyeyed".."\n")
end

aegisub.register_macro(script_name, script_description, add_effect)

