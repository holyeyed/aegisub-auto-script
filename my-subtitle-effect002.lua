

local tr = aegisub.gettext

script_name = tr"Effect 002E tuyết rơi mùa hè"
script_description = tr"E Hiệu ứng tuyết rơi với số lần lặp lại là 10 bông tuyết, bạn có thể thay đổi nó thành nhiều hơn"
script_author = "holyeyed"
script_version = "1.0"

function add_effect(subs, sel)
	local E=subs[sel[1]]
	--aegisub.debug.out(0, "this class is " .. tostring(E.class))
	E.comment=true
	E.text="{!nextpos()!}*"
	E.effect="template line notext loop 10"
	subs.insert(sel[1],E)
	E.text="L=10 w=1000 h=1000 id=0 shape={} function npos(ix) p={x=math.random(0,w), y=0, z=ix} return p end; for i=0,L do shape[i]=npos(i) end;  function nextpos()  pos=shape[id] mv=\"\\\\move(\"..pos.x..\",\"..pos.y..\",\" pos.x=math.random(pos.x-pos.z*20,pos.x+pos.z*20) pos.y=math.random(pos.y+50,pos.y+pos.z*100) mv=mv..pos.x..\",\"..pos.y..\")\\\\fs\"..(60+pos.z*2)..\"\\\\3ceeeeee\\\\blur\"..math.abs(pos.z-L/2)*2 if pos.y>=h then pos.y=0 end shape[id]=pos id=id+1 if id>=L then id=0 end return mv end; "
	E.effect="code once"
	subs.insert(sel[1],E)
end

aegisub.register_macro(script_name, script_description, add_effect)

