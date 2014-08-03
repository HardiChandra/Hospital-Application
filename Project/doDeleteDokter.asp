<!--#include file="Connect.asp"-->
<%
	id=request("id") 'menerima id dari dokter yang ingin dihapus
	
	'mengambil username yang ada
	query2="select username from MsDokter where KodeDokter=" & id
	response.Write(query2)
	if rs2.state then rs2.close
	rs2.open query2,con,1,3
	'perintah untuk menghapus dari msuser
	query3="delete from MsUser where Username='" & rs2(0) & "'"
	if rs3.state then rs3.close
	response.Write(query3)
	rs3.open query3,con,1,3
	'perintah untuk menghapus dari msdoketer
	query="delete from MsDokter where KodeDokter=" & id
	response.Write(query)
	if rs.state then rs.close
	rs.open query,con,1,3
	
	response.Redirect("manageUser.asp")
%>