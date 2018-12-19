<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	document.ready(function() {
		$("#sub").click(function() {

			alert("aasa");

		});
	});
</script>
</head>
<body>
	<select id="ddlViewBy">
		<option value="1">test1</option>
		<option value="2">test2</option>
		<option value="3">test3</option>
	</select>
	<button id="sub">Chọn</button>
	<p>Click the button to trigger a function that will output "Hello
		World" in a p element with id="demo".</p>

	<button onclick="myFunction()">Click me</button>

	<p id="demo"></p>

	<script>
		function myFunction() {
			var e = document.getElementById("ddlViewBy");
			var strUser = e.options[e.selectedIndex].value;
			alert(strUser);
		}
	</script>
</body>
</html>