<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<body>
	<form action="sale-file" method="post" enctype="multipart/form-data">
		<input type="hidden" name="sale_num" id="sale_num" value="1" /> <input
			type="hidden" name="posturl" id="posturl" value="upload" /> <input
			type="file" name="upload_file" id="upload_file" multiple /><br /> <br />
		<button onclick="fileUpload(); return false;">Submit</button>
	</form>
</body>

<script>
	function fileUpload() {

		var upload_file = $('#upload_file')[0].files[0];
		var sale_num= $('#sale_num').val();
		var posturl= $('#posturl').val();
		var formData = new FormData();
		
		formData.append('upload_file', upload_file);
		formData.append('sale_num', sale_num);
		formData.append('posturl', posturl);
		 $.ajax({
		        type: "POST",
		        enctype: 'multipart/form-data',
		        url: "sale-file",
		        data: formData,
		        processData: false,
		        contentType: false,
		        cache: false,
		        timeout: 600000,
		        success: function (data) {
		            alert("성공");
		        },
		        error: function (e) {
		            alert("실패");
		        }
		    });
		 
		/*var sale_num;
		var upload_file_nm;
		sale_num = document.getElementById("sale_num").value;
		upload_file = document.getElementById("upload_file").files[0];
		alert(upload_file);

		var form = document.createElement("form");
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "Post"); //Post 방식
		form.setAttribute("entype", "multipart/form-data"); //파일업로드
		form.setAttribute("action", "sale-file"); //요청 보낼 주소
		//form.setAttribute("processData",false);
		//form.setAttribute("contentType",false);

		var hiddenField1 = document.createElement("input");
		hiddenField1.setAttribute("type", "hidden");
		hiddenField1.setAttribute("name", "sale_num");
		hiddenField1.setAttribute("value", sale_num);
		form.appendChild(hiddenField1);

		var fField1 = document.createElement("input");
		fField1.setAttribute("type", "file");
		fField1.setAttribute("name", "upload_file");
		fField1.setAttribute("value", upload_file);
		form.appendChild(fField1);

		hiddenField1 = document.createElement("input");
		hiddenField1.setAttribute("type", "hidden");
		hiddenField1.setAttribute("name", "posturl");
		hiddenField1.setAttribute("value", "upload");
		form.appendChild(hiddenField1);

		document.body.appendChild(form);

		form.submit();*/

	}
</script>
</html>