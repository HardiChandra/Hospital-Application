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
			'menjalankan perintah untuk menampilkan data
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
  <%
  	'menjalankan perintah untuk menampilkan data pasien...
  	query="select * from MsPasien where username='" & username & "'"
	if rs.state then rs.close
	rs.open query,con,1,3
	if not rs.eof then
  %>
  <form action="doEditProfile.asp">
  <table width="394" border="1" cellpadding="10" cellspacing="10">
    <tr>
      <td colspan="2" align="center">User Profile</td>
      </tr>
    <tr>
      <td>Username</td>
      <td><input type="text" disabled="disabled" name="username" value="<%=rs(4)%>" /></td>
    </tr>
    <tr>
      <td>First Name</td>
      <td><input type="text" name="firstname" value="<%=rs(1)%>" /></td>
    </tr>
    <tr>
      <td>Last Name</td>
      <td><input type="text" name="lastname" value="<%=rs(2)%>" /></td>
    </tr>
    <tr>
      <td>Gender</td>
      <td>
      	<%
			if rs(7)="Male" then
		%>
       	 <label>
              <input name="gender" type="radio" id="gender" value="Male" checked="CHECKED" />
            Male </label><label>
            <input name="gender" type="radio" id="gender" value="Female" />
            Female</label>
        <%	
			elseif rs(7)="Female" then
		%>
        <label>
              <input name="gender" type="radio" id="gender" value="Male"/>
            Male </label><label>
            <input name="gender" type="radio" id="gender" value="Female" checked="checked" />
            Female</label>
        <%
			end if
		%>
      </td>
    </tr>
    <tr>
    	<td>Date of Birth</td>
        <td><label>
              <input name="tanggal" type="text" id="tanggal" size="2" maxlength="2" value="<%=day(rs(5))%>" />
            </label>
            - 
            <label>
            <input name="bulan" type="text" id="bulan" size="2" maxlength="2" value="<%=month(rs(5))%>"/>
            </label>
            - 
            <label>
            <input name="tahun" type="text" id="tahun" size="4" maxlength="4" value="<%=year(rs(5))%>"/>
            </label>
            (dd-mm-yyyy)</td>
    </tr>
    <tr>
    	<td>Email Address</td>
        <td><input type="text" name="email" value="<%=rs(3)%>" /></td>
    </tr>
    <tr>
    	<td>Hospital Number</td>
        <td><input type="text" name="hospitalnumber" value="<%=rs(6)%>" /></td>
    </tr>
    <tr>
    	<td>&nbsp;</td>
        <td><input name="Submit" type="submit" value="Edit" /></td>
    </tr>
    <%
		errr=request("err")
		if errr <> "" then
	%>
    <tr>
    	<td colspan="2" align="center"><%=errr%></td>
    </tr>
    <%
		end if
	%>
  </table></form>
  <%
  	end if
  %>
  </td>
  </tr>
  <tr>
    <td colspan="2" align="center">Copyright</td>
  </tr>
</table>

</body>
</html>
