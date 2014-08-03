<%
	set con=Server.CreateObject("ADODB.Connection") 'membuat variable con sebagai connection
	set rs=Server.CreateObject("ADODB.Recordset")	'membuat rs untuk menampung dan mengeksekusi
	set rs2=Server.CreateObject("ADODB.Recordset")	'membuat rs2 untuk menampung dan mengeksekusi
	set rs3=Server.CreateObject("ADODB.Recordset")	'membuat rs3 untuk menampung dan mengeksekusi
	con.open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("database.accdb") + ";Persist Security Info=False"
	'melakukan koneksi
%>