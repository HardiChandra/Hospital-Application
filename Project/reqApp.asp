<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	'cek session
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
			'mengecek role dari pasien yang login..
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
  <td width="714" align="left" valign="top"><form id="form1" name="form1" method="post" action="doReqApp.asp">
    <table width="345" height="152" border="1" cellspacing="10" cellpadding="10">
    	<%
			id=Request("id")
		%>
    	<input type="hidden" value="<%=id%>" name="id" />
      <tr>
        <td colspan="2" align="center">Request Appointment</td>
      </tr>
      <tr>
        <td width="88">Nama Dokter</td>
        <td width="181"><label>
          <select name="dokter" id="dokter">
          <%
		  	'untuk menampilkan data dokter
		  	query="select * from MsDokter"
			if rs.state then rs.close
			rs.open query,con,1,3
			while not rs.eof
		%>
        		<option value="<%=rs(0)%>"><%=rs(1)%></option>
                
        <%
        		rs.movenext
			wend
		  %>
          </select>
        </label></td>
      </tr>
      <tr>
        <td>Tanggal</td>
        <td><label>
              <input name="tanggal" type="text" id="tanggal" size="2" maxlength="2" />
            </label>
            - 
            <label>
            <input name="bulan" type="text" id="bulan" size="2" maxlength="2" />
            </label>
            - 
            <label>
            <input name="tahun" type="text" id="tahun" size="4" maxlength="4" />
            </label>
            (dd-mm-yyyy)</td>
      </tr>
      <tr>
        <td>Jam</td>
        <td><label>
          <input name="jam" type="text" id="jam" size="5" />
        </label></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><label>
          <input type="submit" name="button" id="button" value="Submit" />
          <input type="reset" name="button2" id="button2" value="Reset" />
        </label></td>
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
    </table>
    </form>
  </td>
  </tr>
  <tr>
    <td colspan="2" align="center">Copyright</td>
  </tr>
</table>
</body>
</html>
