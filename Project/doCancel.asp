<!--#include file="Connect.asp"-->
<%
	id=request("id") 'menerima parameter id
	query="delete from Appointment where KodeApp=" & id 'menampung perintah kedalam variable query
	if rs.state then rs.close 'kalau rs sedang terbuka, maka tutup rs tersebut...
	rs.open query,con,1,3 'mengeksekusi perintah
	response.Redirect("appList.asp?page=1") ' memindahkan kehalaman lain...
%>