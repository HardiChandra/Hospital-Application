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
    <td>
    	<form action="doRegister.asp">
		<table width="446" border="1" cellpadding="10" cellspacing="10" align="center">
          <tr>
            <td colspan="2" align="center">Registration <a href="index.asp">(back to index)</a></td>
          </tr>
          <tr>
            <td>Username</td>
            <td><input type="text" name="username" id="username" /></td>
          </tr>
          <tr>
            <td>Password</td>
            <td><label>
              <input type="password" name="password" id="password" />
            </label></td>
          </tr>
          <tr>
            <td>Confirm Password</td>
            <td><label>
              <input type="password" name="confirmpassword" id="confirmpassword" />
            </label></td>
          </tr>
          <tr>
            <td>First Name</td>
            <td><label>
              <input type="text" name="firstname" id="firstname" />
            </label></td>
          </tr>
          <tr>
            <td>Last Name</td>
            <td><label>
              <input type="text" name="lastname" id="lastname" />
            </label></td>
          </tr>
          <tr>
            <td>Gender</td>
            <td><label>
              <input name="gender" type="radio" id="gender" value="Male" checked="CHECKED" />
            Male </label><label>
            <input name="gender" type="radio" id="gender" value="Female" />
            Female</label></td>
          </tr>
          <tr>
            <td>Date of Birth</td>
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
            <td>Email Address</td>
            <td><label>
              <input type="text" name="email" id="email" />
            </label></td>
          </tr>
          <tr>
            <td>Hospital Number</td>
            <td><label>
              <input type="text" name="hospitalnumber" id="hospitalnumber" />
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
		  	errr=Request("err") 'menampung error ke variable errr
			if errr <> "" then 'jika errr tidak kosong maka tampilkan
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
