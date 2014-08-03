<!--#include file="Connect.asp"-->
<%
	'menampungp parameter yang dikirim
	firstname=Request("firstname")
	lastname=Request("lastname")
	gender=Request("gender")
	tanggal=Request("tanggal")
	bulan=Request("bulan")
	tahun=Request("tahun")
	DOB=bulan & "/" & tanggal & "/" & tahun
	email=Request("email")
	hospitalnumber=Request("hospitalnumber")
	
	'pengecekan kabisat
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
	'validasi-validasi lain
	if firstname = "" then
		Response.Redirect("myProfile.asp?err=First Name must be filled!!")		
	elseif lastname = "" then
		Response.Redirect("myProfile.asp?err=Last Name must be filled!!")
	elseif tanggal = "" then
		Response.Redirect("myProfile.asp?err=tanggal must be filled!!")
	elseif isNumeric(tanggal) = false then
		Response.Redirect("myProfile.asp?err=tanggal harus diisi angka")
	elseif bulan = "" then
		Response.Redirect("myProfile.asp?err=bulan must be filled!!")
	elseif isNumeric(bulan) = false then
		Response.Redirect("myProfile.asp?err=bulan harus diisi angka")
	elseif tahun = "" then
		Response.Redirect("myProfile.asp?err=tahun must be filled!!")
	elseif isNumeric(tahun) = false then
		Response.Redirect("myProfile.asp?err=tahun harus diisi angka")
	elseif tanggal > 31 or tanggal < 1 then
		Response.Redirect("myProfile.asp?err=tanggal tidak boleh lebih besar dari 31 atau lebih kecil dari 1")
	elseif bulan > 12 or bulan < 1 then
		Response.Redirect("myProfile.asp?err=bulan tidak boleh lebih besar dari 12 atau lebih kecil dari 1")
	elseif tahun < 1900 then
		Response.Redirect("myProfile.asp?err=tahun harus lebih besar dari tahun 1900")
	elseif statuskabisat = 1 and tanggal > 29 then
		Response.Redirect("myProfile.asp?err=bulan february tahun kabisat hanya sampai tanggal 29")		
	elseif bulan=2 and tanggal > 28 and statuskabisat = 0 then
		Response.Redirect("myProfile.asp?err=bulan february hanya sampai tanggal 28 kecuali tahun kabisat")
	elseif bulan=4 and tanggal > 30 then
		Response.Redirect("myProfile.asp?err=bulan april hanya sampai tanggal 30")
	elseif bulan=6 and tanggal > 30 then
		Response.Redirect("myProfile.asp?err=bulan juni hanya sampai tanggal 30")
	elseif bulan=9 and tanggal > 30 then
		Response.Redirect("myProfile.asp?err=bulan september hanya sampai tanggal 30")		
	elseif bulan=11 and tanggal > 30 then
		Response.Redirect("myProfile.asp?err=bulan november hanya sampai tanggal 30")		
	elseif validemailaddress=0 then
		Response.Redirect("myProfile.asp?err=invalid email address")		
	else
		'menjlankan perintah unuk mengupdate profile
		query2="select KodePasien from MsPasien where username='" & Session("user") & "'"
		if rs2.state then rs2.close
		rs2.open query2,con,1,3
		
		query="update MsPasien set Fname='" & firstname & "', Lname='" & lastname & "', Email='" & email & "', DOB='" & DOB & "', HospitalNumber='" & hospitalnumber & "', Gender='" & gender & "' where KodePasien=" & rs2(0)
		response.Write(query)
		if rs.state then rs.close
		rs.open query,con,1,3
		response.Redirect("myProfile.asp?err=edit sukses!!")
	end if
%>