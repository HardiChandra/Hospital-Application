<!--#include file="Connect.asp"-->
<%
	id=request("id") 'untuk menerima id yang dikirimkan
	query="update Appointment set Status='Approved' where KodeApp=" & id 'menampung perintah ke variable query
	response.Write(query) 
	if rs.state then rs.close 'jika rs masih terbuka maka ditutup terlebih dulu
	rs.open query,con,1,3 'menjalankan perintah
	response.Redirect("appList.asp?page=1")
%>