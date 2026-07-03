local tr = aegisub.gettext
script_name = tr"Thêm đếm 3 2 1 bắt đầu"
script_description = tr"kiểu W"
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
	local strue=false
	local pdiag=0
	local fdiag={}
	local fdline={}
	local ltime=0
	local sl=nil
	local dl=nil
	local fd=nil
	--tìm vị trí điểm cần thêm
	for i=1,#subs do
	ln=subs[i]
	if ln.class=="info" then
	if pinfo==0 then pinfo = i end
	elseif ln.class=="style" then
	if pstyle==0 then pstyle = i sl=ln end
	if ln.style=="holyeyed" then strue=true end
	elseif ln.class=="dialogue" then
	if pdiag==0 then pdiag = i dl=ln end
	if ln.comment==false then
		if (ln.start_time - ltime > 3000 ) then fdiag[#fdiag+1] = i fdline[#fdline+1]=ln end
		ltime=ln.end_time
	end
	else
	--ko xác định kiểu line
	end
	end
	--aegisub.debug.out(pinfo.." "..pstyle.." "..pdiag)
	local add=0;
	if strue==false then
	sl.name="holyeyed"
	subs.insert(pdiag,sl)
	add=1
	end
	for j=1,#fdiag do
	local stime=fdline[j].start_time-3000
	for i=0,2 do
	fdline[j].effect="cdown"
	fdline[j].style="holyeyed"
	fdline[j].start_time=stime+(i*1000)
	fdline[j].end_time=stime+((i+1)*1000)
	fdline[j].text="{\\blur50\\4c&Hf0f0f0\\1c&Hf0f0f0\\1a&HffH\\4a&Ha0\\3c&H000000\\fs200\\t(\\alpha&H00H)}"..(3-i)
	aegisub.debug.out(tostring(fdiag[j]).." "..tostring(i).." "..tostring((j-1)*3))
	subs.insert(fdiag[j]+i+(j-1)*3+add,fdline[j])
	end
	end
end

aegisub.register_macro(script_name, script_description, add_effect)

