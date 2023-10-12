
local tr = aegisub.gettext

script_name=tr"** Tự động tạo Title"

script_description=tr"macro này sẽ tự động tạo Title bài nhạc và effect"

script_author="holyeyed"

script_version="1.0"



function auto_gen(subs,sels)
button={"yes","no"}
diag={mkdiag()}
--aegisub.log(diag[1].class)
bt, rs = aegisub.dialog.display(diag, button)
--aegisub.log(bt)
--aegisub.log(rs.tb1)
etime=0
ls=0
ttstyle=false
sttstyle=false
fs=0
for i=1,subs.n,1
do
	if subs[i].class=="style" then 
		if subs[i].name=="Title" then ttstyle=true end
		if subs[i].name=="sTitle" then sttstyle=true end
		ls=i
	end

	if subs[i].class=="dialogue" then
	if fs==0 then fs=i end
		-- aegisub.log(i.."-"..subs[i].class.."\n")
		if subs[i].end_time>etime then 
			etime=subs[i].end_time
		end
		ll=subs[i]
	end
end
-- insert template
	aegisub.log(subs[fs].raw.."\n")
	ef=subs[fs]
	ef.comment=true
	ef.style="Title"
	ef.text="x=0 y=0 cl=0 function move(lx,ly) cl=cl+1  if cl%2==0 then return \"\\\\move(\"..x..\",\"..y..\",\"..lx..\",\"..ly..\")\\\\3c&Hffffff\\\\blur5\\\\t(\\\\blur1)\" else x=lx+math.random(-50,50) y=ly+math.random(-50,50) return  \"\\\\move(\"..lx..\",\"..ly..\",\"..x..\",\"..y..\")\\\\3c&Hffffff\\\\t(\\\\blur5)\" end  end"
	ef.effect="code once"
	subs.insert(fs,ef)
	ef.text="{!move($x,$y)!}"
	ef.effect="template line"
	subs.insert(fs,ef)
--insert Title style
		if ttstyle==false then
			ns=subs[ls]
			ns.name="Title"
			ns.fontsize=150
			ns.color1="&H007777ff"
			ns.bold=true
			ns.align=5
			subs.insert(ls,ns)
		end
		if sttstyle==false then
			ns=subs[ls]
			ns.name="sTitle"
			ns.fontsize=50
			ns.color1="&H0077eeff"
			ns.bold=true
			ns.align=5
			subs.insert(ls,ns)
		end
--for key, v in pairs(ll) do
--        aegisub.log('\t'..key..'\t'..type(v).."\t"..tostring(v).."\n")
--end
	
n=math.floor(etime/1000)
ids=string.find(rs.tb1,"\n")
tt=rs.tb1
stt=""
if ids ~=nil then 	aegisub.log(subs[fs].raw.."\n") tt=string.sub(rs.tb1,0,ids-1) stt=string.sub(rs.tb1,ids+1) end
aegisub.log("duration "..n)
for i=0,n,1
do
nl=nline(tt,"Title",0,i*1000,(i+1)*1000)
subs.append(nl)
end

nl=nline(stt,"sTitle",1,0,etime)
subs.append(nl)
end

function nline(dt,style,ly,st,et)
nl={
class="dialogue",comment=false,
layer=ly,margin_l=0,margin_r=0,margin_t=0,margin_b=0,
style=style,actor="",raw="",effect="",
text=dt,start_time=st,end_time=et,duration=(et-st),
section="[Events]",
extra={}
}
return nl
end

function mkdiag()
dx={class="textbox",
x=0,
y=0,
width=20,
height=10,
hint="title text",
name="tb1",
text="Happy World!"}
return dx
end


function valid(subs,sels)
-- dù làm gì đi nữa cũng phải kiểm tra xem thõa điều kiện hay không
return true
end

aegisub.register_macro(script_name,script_description,auto_gen,valid)