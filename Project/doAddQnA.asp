<!--#include file="Connect.asp"-->
<%
	QnA=request("QnA") 'menampung isi QnA yang ada
	if QnA="" then 'validasi QnA
		response.Redirect("addQnA.asp?err=QnA Must Be Filled!!") 
	else
		'menjalankan perintah untuk menambahkan QnA yang ada...
		query="insert into QnA(Username, IsiPesan, TanggalPost) values('" & Session("user") & "','" & QnA & "','" & date & "')"
		response.Write(query)
		rs.open query,con,1,3
		response.Redirect("addQnA.asp?err=QnA has Been added!!")
	end if
%>