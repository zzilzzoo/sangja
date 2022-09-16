<!doctype html>
<html class="fixed">
<head>

<!-- Basic -->
<meta charset="UTF-8">

<meta name="keywords" content="SangJa Admin" />
<meta name="description" content="SangJa Admin">
<meta name="author" content="">

<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<!-- Web Fonts  -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800|Shadows+Into+Light"
	rel="stylesheet" type="text/css">

<!-- Vendor CSS -->
<link rel="stylesheet"
	href="../resources/vendor/bootstrap/css/bootstrap.css" />
<link rel="stylesheet"
	href="../resources/vendor/animate/animate.compat.css">
<link rel="stylesheet"
	href="../resources/vendor/font-awesome/css/all.min.css" />
<link rel="stylesheet"
	href="../resources/vendor/boxicons/css/boxicons.min.css" />
<link rel="stylesheet"
	href="../resources/vendor/magnific-popup/magnific-popup.css" />
<link rel="stylesheet"
	href="../resources/vendor/bootstrap-datepicker/css/bootstrap-datepicker3.css" />

<!-- Theme CSS -->
<link rel="stylesheet" href="../resources/css/theme.css" />

<!-- Skin CSS -->
<link rel="stylesheet" href="../resources/css/skins/default.css" />

<!-- Theme Custom CSS -->
<link rel="stylesheet" href="../resources/css/custom.css">

<!-- Head Libs -->
<script src="../resources/vendor/modernizr/modernizr.js"></script>

</head>
<body>
	<!-- start: page -->
	<section class="body-sign">
		<div class="center-sign">
			<div class="panel card-sign">
				<div class="row">
					<div class="col-6 m-0">
						<img src="../resources/img/logo.png" height="76"
							alt="sangja Admin" />
					</div>
					<!-- div class="col-6">
						<div class="card-title-sign text-end">
							<h2 class="title text-uppercase font-weight-bold m-0">
								<i class="bx bx-user-circle me-1 text-6 position-relative top-5"></i>
								Sign In
							</h2>
						</div>
					</div -->
				</div>
				<div class="card-body">
					<form action="signin" method="post">
						<div class="form-group mb-3">
							<label>User</label>
							<div class="input-group">
							    <input type="hidden" name="return_path" value="${return_path}" />							
								<input name="user_id" id="user_id" type="text"
									class="form-control form-control-lg" required /> <span
									class="input-group-text"> <i class="bx bx-user text-4"></i>
								</span>
							</div>
						</div>

						<div class="form-group mb-3">
							<div class="clearfix">
								<label class="float-left">Password</label>
							</div>
							<div class="input-group">
								<input name="user_pwd" type="password"
									class="form-control form-control-lg" required /> <span
									class="input-group-text"> <i class="bx bx-lock text-4"></i>
								</span>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-8">
								<div class="checkbox-custom checkbox-default">
									<input id="saveId" name="rememberme" type="checkbox" /> <label
										for="RememberMe">Remember Me</label>
								</div>
							</div>
						</div>

						<span class="mt-3 mb-3 line-thru text-center text-uppercase">
							<span>and</span>
						</span>

						<div class="mb-1 text-center">
							<button type="submit"
								class="mb-3 ms-1 me-1 btn btn-primary btn-lg btn-block" onclick="saveid();">
								<i class="fas fa-sign-in-alt"></i> Sign In
							</button>
						</div>

					</form>
				</div>
			</div>

			<p class="text-center text-muted mt-3 mb-3">&copy; Copyright
				2021. All Rights Reserved.</p>
		</div>
	</section>
	<!-- end: page -->

	<!-- Vendor -->
	<script src="../resources/vendor/jquery/jquery.js"></script>
	<script
		src="../resources/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
	<script src="../resources/vendor/popper/umd/popper.min.js"></script>
	<script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="../resources/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script src="../resources/vendor/common/common.js"></script>
	<script src="../resources/vendor/nanoscroller/nanoscroller.js"></script>
	<script
		src="../resources/vendor/magnific-popup/jquery.magnific-popup.js"></script>
	<script
		src="../resources/vendor/jquery-placeholder/jquery.placeholder.js"></script>

	<!-- Specific Page Vendor -->

	<!-- Theme Base, Components and Settings -->
	<script src="../resources/js/theme.js"></script>

	<!-- Theme Custom -->
	<script src="../resources/js/custom.js"></script>

	<!-- Theme Initialization Files -->
	<script src="../resources/js/theme.init.js"></script>

	<script type="text/javascript">
		$(function() {

			fnInit();

		});

		function frm_check() {
			saveid();
		}

		function fnInit() {
			var cookieid = getCookie("saveid");
			console.log(cookieid);
			if (cookieid != "") {
				$("input:checkbox[id='saveId']").prop("checked", true);
				$('#user_id').val(cookieid);
			}

		}

		function setCookie(name, value, expiredays) {
			var todayDate = new Date();
			todayDate.setTime(todayDate.getTime() + 0);
			if (todayDate > expiredays) {
				document.cookie = name + "=" + escape(value)
						+ "; path=/; expires=" + expiredays + ";";
			} else if (todayDate < expiredays) {
				todayDate.setDate(todayDate.getDate() + expiredays);
				document.cookie = name + "=" + escape(value)
						+ "; path=/; expires=" + todayDate.toGMTString() + ";";
			}

			console.log(document.cookie);
		}

		function getCookie(Name) {
			var search = Name + "=";
			console.log("search : " + search);

			if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면 
				offset = document.cookie.indexOf(search);
				console.log("offset : " + offset);
				if (offset != -1) { // 쿠키가 존재하면 
					offset += search.length;
					// set index of beginning of value
					end = document.cookie.indexOf(";", offset);
					console.log("end : " + end);
					// 쿠키 값의 마지막 위치 인덱스 번호 설정 
					if (end == -1)
						end = document.cookie.length;
					console.log("end위치  : " + end);

					return unescape(document.cookie.substring(offset, end));
				}
			}
			return "";
		}

		function saveid() {
			var expdate = new Date();
			if ($("#saveId").is(":checked")) {
				expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30);
				setCookie("saveid", $("#user_id").val(), expdate);
			} else {
				expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 30);
				setCookie("saveid", $("#user_id").val(), expdate);

			}
		}
	</script>


</body>
</html>