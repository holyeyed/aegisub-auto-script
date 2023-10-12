

local tr = aegisub.gettext

script_name = tr"Effect 005W một dòng tan biến về bên trái"
script_description = tr"W Hiệu ứng karaoke, 1 dòng, với chữ tan biến về bên trái"
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
	E.text="function color() s= string.format(\"%x\",math.random(0xffffff)) return s end"
	E.effect="code once"
	subs.insert(1,E)
	--//-------------------------
	E.text="!retime(\"syl\",-$sstart/3*2-500,-$dur)!{\\pos($sx,!$sy!)\\bord0\\shad2\\1c&ffffff\\fad($dur/3*10,0)}"
	E.effect="template syl"
	subs.insert(2,E)
	--//-------------------------
		E.text="!retime(\"syl\",0,0)!{\\pos($sx,$sy)\\bord0\\shad2\\c&!color()!\\fad(0,$dur*10)}"
	E.effect="template syl"
	subs.insert(3,E)
	--//-------------------------
		E.text="!retime(\"syl\",0,0)!{\\move($sx,!$sy-math.random(50)!,!$sx-math.random(200)-50!,!$sy-50!)\\c&!color()!\\2a&Hff\\bord0\\shad2\\fad(0,$dur/3)\\t(\\frz360)\\p1}m 0 0 b 0 0 0 0 0 0 b -1 -4 1 -6 4 -6 b 5 -5 5 -1 2 -1 b 5 -2 6 -1 7 1 b 6 3 4 3 2 2 b 4 4 2 5 1 7 b -1 6 -2 4 -1 3 b -2 5 -4 5 -6 3 b -6 1 -4 0 -2 0 b -4 0 -5 -1 -5 -3 b -3 -5 -1 -5 0 -3   {\\p0}"
	E.effect="template syl notext loop 5"
	subs.insert(4,E)
	--//-------------------------

	--//-------------------------
	aegisub.debug.out(0, "* Chú ý:\n Load lại video để tính toán lại vị trí và kích thước subtitle cho phù hợp với kiểu định dạng.... " .." - holyeyed".."\n")
end

aegisub.register_macro(script_name, script_description, add_effect)

