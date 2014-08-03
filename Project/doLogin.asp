<!--#include file="Connect.asp"-->
<%
	username=Request("username") 'menerima username
	password=Request("password") 'menerima password
	
	if username = "" then 'validasi user kosong
		response.Redirect("index.asp?err=username must be filled!!")
	elseif password = "" then 'validasi password kosong
		response.Redirect("index.asp?err=password must be filled!!")
	else
		'menjalankan perintah untuk mengecek apakah username dan password yang dimasukkan valid
		query="select * from MsUser where username='" & username & "' and password='" & password & "'"
		rs.open query,con,1,3
		if not rs.eof then
			Session.Contents("user")=username 'menyimpan user yang telah login ke session.. 
			Application("jumlah") = Application("jumlah") + 1 'menambah jumlah user yang telah berkunjung
			Response.Redirect("home.asp") 'memindahkan ke halaman home
		else
			response.Redirect("index.asp?err=wrong username or password!!")
		end if
	end if
%>