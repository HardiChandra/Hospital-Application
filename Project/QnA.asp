<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	'cek session...
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
			'pengecekan role dari user
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
  	Question & Ask:<br />
    <table border="1">
    	<tr>
          	<td>Username</td>        
        	<td>Isi Pesan</td>
        	<td>Tanggal Post</td>            
			<td></td>
        </tr>
    <%
		'mendapatkan role dari user yang login
		query2="select Role from MsUser where username='" & username & "'"
		if rs2.state then rs2.close
		rs2.open query2,con,1,3
		role=rs2(0)
		'menampilkan qna
		query="select * from QnA"
		if rs.state then rs.close
		rs.open query,con,1,3
		'paging
		JumlahPerPage=2
		Page=Request("Page")
		if Page="" then Page=1
	jumlahHalaman = rs.recordcount / jumlahPerPage
			if rs.recordCount mod jumlahPerPage <> 0 then 
				jumlahHalaman = jumlahHalaman + 1 
			end if
			

			for j=1 to (page-1) * jumlahPerPage

				rs.movenext
			next
			j=0
		while not rs.eof and j<JumlahPerPage
			if lcase(rs(1)) = lcase(username) then
				statusDel=1
			else
				statusDel=0
			end if
			response.Write(rs.recordcount / jumlahPerPage)
	%>
		<tr>
        	<td><%=rs(1)%></td>
            <td><%=rs(2)%></td>
            <td><%=rs(3)%></td>
            <td>
            	<%
					if role="administrator" or statusDel=1 then
				%>
                		<a href="doDeleteQnA.asp?id=<%=rs(0)%>">Delete</a>
                <%
					end if
				%>
            </td>
        </tr>
	<%
			j=j+1
			rs.movenext
		wend
	%> 
    <tr>
    	<td align="center" colspan="4">
        	<%
				k=1
				while k<=JumlahHalaman
			%>
            		<a href="QnA.asp?Page=<%=k%>"><%=k%></a>
            <%
					k=k+1
				wend
			%>
        </td>
    </tr>
    	<tr>
        	<td colspan="4"><a href="addQnA.asp">Add QnA</a></td>
        </tr>
        </table>
  </td>
  </tr>
  <tr>
    <td colspan="2" align="center">Copyright</td>
  </tr>
</table>
</body>
</html>
