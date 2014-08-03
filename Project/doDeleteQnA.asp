<!--#include file="Connect.asp"-->
<%
	id=request("id") 'menerima parameter id
	query="delete from QnA where KodeQnA=" & id 'menampung perintah kedalam variabel query
	response.Write(query) 
	rs.open query,con,1,3 'menjalankan perintah hapus
	response.Redirect("QnA.asp") 'meredirect ke halaman QnA...
%>