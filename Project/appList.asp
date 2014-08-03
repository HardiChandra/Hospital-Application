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
			'pengecekan role dari user yang login
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
  	Appointment List : <br />
  	<table border="1">
    	
  	<%
		'menampilkan data user yang merupakan pasien
		query3="select role from MsUser where username='" & username & "'"
		if rs3.state then rs3.close
		rs3.open query3,con,1,3
		if rs3(0) = "pasien" then		
		query2="select KodePasien from MsPasien where Username='" & session("user") & "'"
		if rs2.state then rs2.close
		rs2.open query2,con,1,3
		
		
		'menampilkand ata yang diinginkan
		query="select NamaDokter, spesialisasi, tanggal, jam, status, KodeApp from MsDokter MD, Appointment A where MD.KodeDokter=A.KodeDokter and KodePasien=" & rs2(0)
		if rs.state then rs.close
		rs.open query,con,1,3
	%>
    <tr>
        	<td>Nama Dokter</td>
            <td>Spesialisasi</td>
            <td>Tanggal</td>
            <td>Jam</td>                        
            <td>Status</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>            
        </tr>
    <%
		'paging...
		JumlahPerPage=3
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
        	<td><%=rs(0)%></td>
            <td><%=rs(1)%></td>
            <td><%=rs(2)%></td>
            <td><%=rs(3)%></td>
            <td><%=rs(4)%></td>
            <%
				if rs(4) = "waiting" then
					if rs3(0) = "pasien" then
			%>
                    <td><a href="edit.asp?id=<%=rs(5)%>">Edit</a></td>
                    <td><a href="doCancel.asp?id=<%=rs(5)%>">Cancel</a></td>                
             <%
			 		elseif rs3(0) = "dokter" then
			%>
            		<td><a href="doApprove.asp?id=<%=rs(5)%>">Approve</a></td>
                    <td><a href="doReject.asp?id=<%=rs(5)%>">Reject</a></td> 
            <%
			 		end if
				end if
			%>
        </tr>
    <%
			j=j+1
			rs.movenext
		wend
	%>
    <%
		elseif rs3(0) = "dokter" then
		'menampilkan data dokter yanga ada...
		query2="select KodeDokter from MsDokter where Username='" & session("user") & "'"
		if rs2.state then rs2.close
		rs2.open query2,con,1,3
		query="select FName, spesialisasi, tanggal, jam, status, KodeApp from MsPasien MP, Appointment A, MsDokter MD where MP.KodePasien=A.KodePasien and MD.KodeDokter=A.KodeDokter and A.KodeDokter=" & rs2(0)
		if rs.state then rs.close
		rs.open query,con,1,3
	%>
    <tr>
        	<td>Nama Pasien</td>
            <td>Spesialisasi</td>
            <td>Tanggal</td>
            <td>Jam</td>                        
            <td>Status</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>            
        </tr>
    <%
		'paging...
		JumlahPerPage=3
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
        	<td><%=rs(0)%></td>
            <td><%=rs(1)%></td>
            <td><%=rs(2)%></td>
            <td><%=rs(3)%></td>
            <td><%=rs(4)%></td>
            <%
				if rs(4) = "waiting" then
					if rs3(0) = "pasien" then
			%>
                    <td><a href="edit.asp?id=<%=rs(5)%>">Edit</a></td>
                    <td><a href="doCancel.asp?id=<%=rs(5)%>">Cancel</a></td>                
             <%
			 		elseif rs3(0) = "dokter" then
			%>
            		<td><a href="doApprove.asp?id=<%=rs(5)%>">Approve</a></td>
                    <td><a href="doReject.asp?id=<%=rs(5)%>">Reject</a></td> 
            <%
			 		end if
				end if
			%>
        </tr>
    <%
			j=j+1
			rs.movenext
		wend
		end if
	%>
    <tr>
    	<td align="center" colspan="7">
        	<%
				k=1
				while k<=JumlahHalaman
			%>
            		<a href="appList.asp?Page=<%=k%>"><%=k%></a>
            <%
					k=k+1
				wend
			%>
        </td>
    </tr>
    </table>
    <br />
    <a href="reqApp.asp">Request Appointment</a>
  </td>
  </tr>
  <tr>
    <td colspan="2" align="center">Copyright</td>
  </tr>
</table>
</body>
</html>
