

local tr = aegisub.gettext

script_name = tr"Effect 009W một dòng tan biến bông tuyết về bên trái"
script_description = tr"W Hiệu ứng karaoke, 1 dòng, với chữ tan biến bông tuyết về bên trái"
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
		E.text="!retime(\"syl\",0,0)!{\\move($sx,!$sy-math.random(50)!,!$sx-math.random(200)-50!,!$sy-50!)\\c&ffffff\\2a&Hff\\bord0\\shad2\\fad(0,$dur/3)\\t(\\frz270\\blur!math.random(10)!)\\p!math.random(5)!}m -15 7 b -19 -2 -15 -11 -6 -15 b 3 -19 17 -11 17 -2 b 17 12 8 16 3 16 b -1 16 -10 16 -15 7 {\\p0}"
	E.effect="template syl notext loop 5"
	subs.insert(4,E)
	--//-------------------------

	--//-------------------------
	aegisub.debug.out(0, "* Chú ý:\n Load lại video để tính toán lại vị trí và kích thước subtitle cho phù hợp với kiểu định dạng.... " .." - holyeyed".."\n")
end

aegisub.register_macro(script_name, script_description, add_effect)

