<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	'pengecekan session
	username=session("user")
	if username="" then
		Response.Redirect("index.asp?err=login first!!")
	end if
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>
<!--#include file="Connect.asp"-->
<body>
<table width="800" height="200" border="1" align="center">
  <tr>
    <td colspan="2"><img src="Images/banner.jpg" /></td>
  </tr>
  <tr>
    <td width="180" valign="top">
      <table width="180" border="0">
      	<%
			'menjalankan perintah untuk mengecek role dari user
			query="select role from MsUser where username='" & Session("user") & "'"
			rs.open query,con,1,3
			if rs(0) = "pasien" then
		%>
        <tr>
          <td><a href="home.asp">Home</a></td>
        </tr>
        <tr>
          <td><a href="myProfile.asp">My Profile</a></td>
        </tr>
        <tr>
          <td><a href="appList.asp">Appointment List</a></td>
        </tr>
        <tr>
          <td><a href="findDoctor.asp">Find a Doctor</a></td>
        </tr>
        <tr>
          <td><a href="QnA.asp">QnA</a></td>
        </tr>
        <%
			elseif rs(0) = "dokter" then
		%>
         <tr>
          <td><a href="home.asp">Home</a></td>
        </tr>
        <tr>
          <td><a href="appList.asp">Appointment List</a></td>
        </tr>
        <tr>
          <td><a href="QnA.asp">QnA</a></td>
        </tr>
        <%
			elseif rs(0) = "administrator" then
		%>
        <tr>
          <td><a href="home.asp">Home</a></td>
        </tr>
        <tr>
          <td><a href="manageUser.asp">Manage User</a></td>
        </tr>
        <tr>
          <td><a href="QnA.asp">QnA</a></td>
        </tr>
        <%
			end if
		%>
        <tr>
          <td><a href="logout.asp">logout</a></td>
        </tr>
      </table></td>
  <td width="714" align="left" valign="top">
 Halaman Home<br />
 Welcome, <%=Session("user")%><br />
 Jumlah Pengunjung = <%=Application("jumlah")%>
 </td>
  </tr>
  <tr>
    <td colspan="2" align="center">Copyright</td>
  </tr>
</table>
</body>
</html>
