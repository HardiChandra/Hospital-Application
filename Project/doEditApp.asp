<!--#include file="Connect.asp"-->
<%
	'menerima id, tanggal, bulan, tahun, dll
	id=request("id")
	tanggal=request("tanggal")
	bulan=request("bulan")
	tahun=request("tahun")
	jam=request("jam")
	dokid=request("dokter")
	
	appdate=bulan & "/" & tanggal & "/" &tahun
	
	'validasi-validasi yang ada
	if tanggal = "" then
		Response.Redirect("edit.asp?err=tanggal must be filled!!")
	elseif isNumeric(tanggal) = false then
		Response.Redirect("edit.asp?err=tanggal harus diisi angka")
	elseif bulan = "" then
		Response.Redirect("edit.asp?err=bulan must be filled!!")
	elseif isNumeric(bulan) = false then
		Response.Redirect("edit.asp?err=bulan harus diisi angka")
	elseif tahun = "" then
		Response.Redirect("edit.asp?err=tahun must be filled!!")
	elseif isNumeric(tahun) = false then
		Response.Redirect("edit.asp?err=tahun harus diisi angka")
	elseif tanggal > 31 or tanggal < 1 then
		Response.Redirect("edit.asp?err=tanggal tidak boleh lebih besar dari 31 atau lebih kecil dari 1")
	elseif bulan > 12 or bulan < 1 then
		Response.Redirect("edit.asp?err=bulan tidak boleh lebih besar dari 12 atau lebih kecil dari 1")
	elseif tahun < 1900 then
		Response.Redirect("edit.asp?err=tahun harus lebih besar dari tahun 1900")
	elseif statuskabisat = 1 and tanggal > 29 then
		Response.Redirect("edit.asp?err=bulan february tahun kabisat hanya sampai tanggal 29")		
	elseif bulan=2 and tanggal > 28 and statuskabisat = 0 then
		Response.Redirect("edit.asp?err=bulan february hanya sampai tanggal 28 kecuali tahun kabisat")
	elseif bulan=4 and tanggal > 30 then
		Response.Redirect("edit.asp?err=bulan april hanya sampai tanggal 30")
	elseif bulan=6 and tanggal > 30 then
		Response.Redirect("edit.asp?err=bulan juni hanya sampai tanggal 30")
	elseif bulan=9 and tanggal > 30 then
		Response.Redirect("edit.asp?err=bulan september hanya sampai tanggal 30")		
	elseif bulan=11 and tanggal > 30 then
		Response.Redirect("edit.asp?err=bulan november hanya sampai tanggal 30")
	elseif jam = "" then
		Response.Redirect("edit.asp?err=jam harus diisi!!")
	else
		'menjalankan perintah
		query="update appointment set KodeDokter=" & dokid & ", tanggal='" & appdate & "', jam=" & jam & " where KodeApp=" & id
		if rs.state then rs.close
		rs.open query,con,1,3
		response.Redirect("edit.asp?err=edit success!!")
	end if
%>