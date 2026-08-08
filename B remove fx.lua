local tr = aegisub.gettext
script_name = tr"Loại bỏ fx vừa áp dụng"
script_description = tr"kiểu L"
script_author = "holyeyed"
script_version = "1.0"

function gtext(l)
if l.class=="info" then
	return l.key.." "..l.value
end
if l.class=="style" then
	return l.name.." "..l.raw
end
if l.class=="dialogue" then
	return l.text
end
	return "unknow"
end

function add_effect(subs, sel)
	--xres, yres, ar, artype = aegisub.video_size()
	local pinfo=0
	local pstyle=0
	local pdiag=0
	local strue=false
	local fdiag={}
	local sl=nil
	local dl=nil
	local fd=nil
	--tìm vị trí điểm cần thêm
	for i=#subs,1,-1 do
		ln=subs[i]
		if ln.class=="info" then
			if pinfo==0 then pinfo = i end
		elseif ln.class=="style" then
			if pstyle==0 then pstyle = i sl=ln end
			if ln.style=="holyeyed" then strue=true end
		elseif ln.class=="dialogue" then
			--aegisub.debug.out("Effect "..ln.effect)
			if pdiag==0 then pdiag = i dl=ln end
			if ln.comment==true and ln.effect=="karaoke" then
				ln.comment=false
				ln.effect=""
				subs[i]=ln
			end
			if ln.comment==false and ln.effect=="fx" or ln.text=="" then
				subs.delete(i)
			end
		else
		--ko xác định kiểu line
		end
	end
	--aegisub.debug.out(pinfo.." "..pstyle.." "..pdiag)
end

aegisub.register_macro(script_name, script_description, add_effect)

