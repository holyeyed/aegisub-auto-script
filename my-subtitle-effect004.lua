﻿

local tr = aegisub.gettext

script_name = tr"Effect 004W hai dòng karaoke với hình thôi bay lên"
script_description = tr"W Hiệu ứng karaoke, 2 dòng, với chữ bay lên với sao hình thoi"
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
	E.text="cl1=\"aaaaff\" cl2=\"ffffff\"  et=300 hpos=70 npos={0,0} function idx(cl) if (cl%2) == 0 then return 0 else return hpos end end shape=\"m -16 2 b -16 2 -16 2 -16 2 b -5 1 -2 -5 1 -15 b 2 -5 6 1 16 2 b 6 5 2 8 1 17 b 1 17 1 17 1 17 b -1 9 -3 5 -16 2\" function rdpos(x,y) npos[0]= math.random(x-100,x+100) npos[1]=math.random(y-100,y+100) return \"\" end function rdcl() return string.format(\"%x\",math.random(0,0xffffff)) end mau={\"eecef9\",\"eef3cc\",\"9ed5ff\",\"a4fff9\",\"9fffb4\",\"c3d8eb\",\"c5f4c1\",\"ad8da6\"} cl1=mau[math.random(0,#mau)]"
	E.effect="code once"
	subs.insert(1,E)
	--//-------------------------
	E.text="!retime(\"line\",-et,-$dur)!{\\pos($lx,!$ly-idx($li)!)\\c&!cl1!}"
	E.effect="template line"
	subs.insert(2,E)
	--//-------------------------
		E.text="!retime(\"syl\",-$sstart,-$sdur)!{\\pos($sx,!$sy-idx($li)!)\\c&!cl1!\\2c&!cl2!}"
	E.effect="template syl"
	subs.insert(3,E)
	--//-------------------------
		E.text="!retime(\"syl\",0,$lend-$send-$lstart)!!rdpos($sx,$sy-idx($li))!{\\3c&ffffff\\t(\\fry360,\\be!math.random(1,20)!)\\c&!rdcl()!\\move($sx,!$sy-idx($li)!,!math.random($sx,$sx+100)!,!math.random($sy-idx($li),$sy-idx($li)-400)!)}"
	E.effect="template syl"
	subs.insert(4,E)
	--//-------------------------
			E.text="!retime(\"syl\",0,$lend-$send-$lstart)!!rdpos($sx,$sy-idx($li))!{\\3c&ffffff\\t(\\fry360,\\be!math.random(1,20)!)\\c&!rdcl()!\\move(!math.random($sx,$sx+100)!,!$sy-idx($li)!,!math.random($sx,$sx+100)!,!math.random($sy-idx($li),$sy-idx($li)-400)!)\\p!math.random(1,2 )!}!shape!{\\p0}"
	E.effect="template syl notext loop 5"
	subs.insert(4,E)
	--//-------------------------
	aegisub.debug.out(0, "* Chú ý:\n Load lại video để tính toán lại vị trí và kích thước subtitle cho phù hợp với kiểu định dạng.... " .." - holyeyed".."\n")
end

aegisub.register_macro(script_name, script_description, add_effect)

