

local tr = aegisub.gettext

script_name = tr"Effect 010WS một dòng chữ bay về bên trái"
script_description = tr"WS Hiệu ứng karaoke, 1 dòng, với chữ bay về bên trái"
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
	E.text="v=-1 cur=0 cc=0 function count() v=v+1 if v>=cc then v=0 end cur=v return v end function cch() cc=cc+1 return \"\" end function ctime() return syl.duration/cc end function ud() if syl.i % 2==0 then return 50 else return -50 end end"
	E.effect="code syl"
	subs.insert(1,E)
	--//-------------------------
	E.text="!cch()!{\\move(!$x+math.random(100)-50!,!$y+math.random(100)-50!,!$x+math.random(100)-50!,!$y+math.random(100)-50!)\\c&9999ff\\3c&9999ff\\blur!math.random(10)!}."
	E.effect="template char notext"
	subs.insert(2,E)
	--//-------------------------
	E.text="!retime(\"syl\",-$sstart/2-500,-$sdur)!{\\pos($sx,$sy)\\c&00ff00\\fade($sdur/3,0)}"
	E.effect="template syl"
	subs.insert(3,E)
	--//-------------------------
	E.text="!retime(\"syl\",count()*ctime(),-($sdur-(cur+1/2)*ctime()))!{\\move($sx,$sy,!$sx-25!,!$sy+ud()!)\\t(\\1c&Hffffff)}"
	E.effect="template syl char"
	subs.insert(4,E)
	--//-------------------------
	E.text="!retime(\"syl\",(count()+1/2)*ctime(),($ldur-$end)/2)!{\\move(!$sx-25!,!$sy+ud()!,!$sx-50!,!$sy!,!0!,!ctime()/2!)\\t(\\1c&H00ffff)}"
	subs.insert(5,E)
	--//-------------------------
	--//-------------------------
	aegisub.debug.out(0, "* Chú ý:\n Load lại video để tính toán lại vị trí và kích thước subtitle cho phù hợp với kiểu định dạng.... " .." - holyeyed".."\n")
end

aegisub.register_macro(script_name, script_description, add_effect)

