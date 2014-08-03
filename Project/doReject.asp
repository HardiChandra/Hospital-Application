<!--#include file="Connect.asp"-->
<%
	id=request("id") 'menerima id yang dikirim
	query="update Appointment set Status='Rejected' where KodeApp=" & id 'membuat query
	response.Write(query) 
	if rs.state then rs.close 'jika rs pernah dibuka maka di close terlebih dahulu
	rs.open query,con,1,3 'mengeksekusi perintah
	response.Redirect("appList.asp?page=1") 'meredirect ke halaman lain
%>