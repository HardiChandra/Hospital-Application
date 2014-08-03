<!--#include file="Connect.asp"-->
<%
	id=request("id") 'mengambil id
	
	'mencari username dari kodepasien yang didapat
	query2="select username from MsPasien where KodePasien=" & id 
	response.Write(query2)
	if rs2.state then rs2.close
	rs2.open query2,con,1,3
	'mengahapus dari msuser
	query3="delete from MsUser where Username='" & rs2(0) & "'"
	if rs3.state then rs3.close
	response.Write(query3)
	rs3.open query3,con,1,3
	'menghapus dari mspasien
	query="delete from MsPasien where KodePasien=" & id
	response.Write(query)
	if rs.state then rs.close
	rs.open query,con,1,3
	
	response.Redirect("manageUser.asp")
%>