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
			'mengecek role dari user yang telah login
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
  Find a Doctor : <br />
  <form action="findDoctor.asp">
    <table>
    	<tr>
        	<td>Search : </td>
            <td> <input type="text" name="search" /></td>
            <td>
			<select name="by">
            	<option value="NamaDokter">Nama Dokter</option>
                <option value="Spesialisasi">Speciality</option>
                <option value="Bahasa">Bahasa</option>
            </select>
            </td>
            <td>
            <input type="submit" />
            </td>
        </tr>
    </table>
  </form>
  <br />
  <table border="1">
  	<tr>
    	<td>Username</td>
        <td>Nama</td>
        <td>Email</td>
        <td>Spesialisasi</td>
        <td>Bahasa</td>        
    </tr>
  <%
  	'searching
  	search=Request("search")
	by=Request("by")
	if search="" then
		query="select * from MsDokter"
	else
		query="select * from MsDokter where " & by & " like '%" & search & "%'"
	end if
	if rs.state then rs.close
	rs.open query,con,1,3
	
	'paging
	JumlahPerPage=2
	Page=Request("Page")
	if Page="" then Page=1
	jumlahHalaman = rs.recordcount / jumlahPerPage
	if (rs.recordCount mod jumlahPerPage) <> 0 then 
		jumlahHalaman = jumlahHalaman + 1 
	end if
	
	for j=1 to (page-1) * jumlahPerPage
		rs.movenext
	next
	j=0
	while not rs.eof and j<JumlahPerPage
	%>
    	<tr>
        	<td><%=rs(4)%></td>
            <td><%=rs(1)%></td>
            <td><%=rs(2)%></td>
            <td><%=rs(3)%></td>
            <td><%=rs(5)%></td>
        </tr>
    <%
		j=j+1
		rs.movenext
	wend
  %>
  <tr>
    	<td align="center" colspan="5">
        	<%
				k=1
				while k<=JumlahHalaman
			%>
            		<a href="findDoctor.asp?Page=<%=k%>"><%=k%></a>
            <%
					k=k+1
				wend
			%>
        </td>
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
