<!--#include file="Connect.asp"-->
<%
	'menerima parameter yang dikirimkan dan ditampung ke variable
	username=Request("username")
	password=Request("password")
	confirmpassword=Request("confirmpassword")
	firstname=Request("firstname")
	lastname=Request("lastname")
	gender=Request("gender")
	tanggal=Request("tanggal")
	bulan=Request("bulan")
	tahun=Request("tahun")
	DOB=bulan & "/" & tanggal & "/" & tahun
	email=Request("email")
	hospitalnumber=Request("hospitalnumber")
	
	'pengecaekan tahun kabisat
	if bulan=2 and tahun mod 4=0 then
		statuskabisat=1
	else
		statuskabisat=0
	end if
	'pengecekan email
	if InStr(email, "@") > 0 AND InStr(email, ".") > 0 and InStr(email, "@") < InStr(email, ".") Then
		validemailaddress=1
	else
		validemailaddress=0
	end if
	'validasi-validasi yang ada
	if username = "" then
		Response.Redirect("register.asp?err=username must be filled!!")
	elseif password = "" then
		Response.Redirect("register.asp?err=password must be filled!!")	
	elseif confirmpassword = "" then
		Response.Redirect("register.asp?err=confirm password must be filled!!")	
	elseif password <> confirmpassword then
		Response.Redirect("register.asp?err=you have entered diferend password and confirm password!!")
	elseif firstname = "" then
		Response.Redirect("register.asp?err=First Name must be filled!!")		
	elseif lastname = "" then
		Response.Redirect("register.asp?err=Last Name must be filled!!")
	elseif tanggal = "" then
		Response.Redirect("register.asp?err=tanggal must be filled!!")
	elseif isNumeric(tanggal) = false then
		Response.Redirect("register.asp?err=tanggal harus diisi angka")
	elseif bulan = "" then
		Response.Redirect("register.asp?err=bulan must be filled!!")
	elseif isNumeric(bulan) = false then
		Response.Redirect("register.asp?err=bulan harus diisi angka")
	elseif tahun = "" then
		Response.Redirect("register.asp?err=tahun must be filled!!")
	elseif isNumeric(tahun) = false then
		Response.Redirect("register.asp?err=tahun harus diisi angka")
	elseif tanggal > 31 or tanggal < 1 then
		Response.Redirect("register.asp?err=tanggal tidak boleh lebih besar dari 31 atau lebih kecil dari 1")
	elseif bulan > 12 or bulan < 1 then
		Response.Redirect("register.asp?err=bulan tidak boleh lebih besar dari 12 atau lebih kecil dari 1")
	elseif tahun < 1900 then
		Response.Redirect("register.asp?err=tahun harus lebih besar dari tahun 1900")
	elseif statuskabisat = 1 and tanggal > 29 then
		Response.Redirect("register.asp?err=bulan february tahun kabisat hanya sampai tanggal 29")		
	elseif bulan=2 and tanggal > 28 and statuskabisat = 0 then
		Response.Redirect("register.asp?err=bulan february hanya sampai tanggal 28 kecuali tahun kabisat")
	elseif bulan=4 and tanggal > 30 then
		Response.Redirect("register.asp?err=bulan april hanya sampai tanggal 30")
	elseif bulan=6 and tanggal > 30 then
		Response.Redirect("register.asp?err=bulan juni hanya sampai tanggal 30")
	elseif bulan=9 and tanggal > 30 then
		Response.Redirect("register.asp?err=bulan september hanya sampai tanggal 30")		
	elseif bulan=11 and tanggal > 30 then
		Response.Redirect("register.asp?err=bulan november hanya sampai tanggal 30")		
	elseif validemailaddress=0 then
		Response.Redirect("register.asp?err=invalid email address")		
	else
		'menjalankan perintah insert untuk menambah data
		query="insert into MsPasien(Fname,Lname,Email,Username,DOB,HospitalNumber,Gender) values('" & firstname & "','" & lastname & "','" & email & "','" & username & "','" & DOB & "','" & hospitalnumber & "','" & gender & "')"
		if rs.state then rs.close
			rs.open query,con,1,3
		
		query="insert into MsUser values('" & username & "','" & password & "','pasien')"
		if rs.state then rs.close
			rs.open query,con,1,3
		response.Redirect("register.asp?err=register success!!")
	end if
%>