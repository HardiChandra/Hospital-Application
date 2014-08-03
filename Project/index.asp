<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<table width="800" height="200" border="1" align="center">
  <tr>
    <td colspan="2"><img src="Images/banner.jpg" /></td>
  </tr>
  <tr>
    <td width="677">
Halaman Index<br />
        <img src="Images/hospital061113_3_560.jpg" width="200" height="200" />&nbsp;&nbsp;
        <img src="Images/hospital-equipment.jpg" width="200" height="200" />&nbsp;&nbsp;
        <img src="Images/HospitalEmergency.jpg" width="200" height="200" />
    </td>
  <td width="217" align="center" valign="top">
  	<form action="doLogin.asp">
        <table border="1">
            <tr>
                <td>Username</td>
                <td><label>
                  <input type="text" name="username" id="username" />
                </label></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><label>
                  <input type="password" name="password" id="password" />
                </label></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" /></td>
            </tr>
            <%
				'menampilkan pesan error
				errr=request("err")
				if errr <> "" then
			%>
            <tr>
            	<td colspan="2" align="center">

            <%
					Response.Write(errr)
				end if
			%>
	            </td>	
            </tr>
        </table>
    </form>
    Haven't sign up yet?? <a href="register.asp">register</a>
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center">Copyright</td>
  </tr>
</table>
</body>
</html>