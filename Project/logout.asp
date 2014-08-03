<%
	Session.Abandon()
	Session.Contents.Remove("nama") 'meremove session yang ada
	Response.Redirect("index.asp") 'meredirect ke halaman lain
%>