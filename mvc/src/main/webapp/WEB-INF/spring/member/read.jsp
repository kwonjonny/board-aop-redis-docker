	<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
	<!DOCTYPE html>
	<html lang="kr">

	<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>FastPickup</title>
	</head>

	<body>
	<%@ include file="../include/header.jsp" %>
	<div class="container-fluid">
	<div class="row">
	<div class="col-md-12">
		<h3>회원 상세</h3>
		<div class="card">
			<div class="bg-light rounded h-100 p-4">
				<form onsubmit="onSubmitForm(event)" method="get">
					<dl class="detail_content">
						<dt>이름</dt>
						<dd>${list.memberName}</dd>
						<dt>Email</dt>
						<dd class="email">${list.email}</dd>
						<dt>전화번호</dt>
						<dd>${list.memberPhone}</dd>
					</dl>
				</form>
			</div>
		</div>
		<!-- Member Delete & Member Signout & Member Update & Board List Page -->
		<form onsubmit="return false;" action="/spring/member/delete" method="post">
			<div class="button_wrap mt-4">
				<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
					<button type="submit" class="btn btn-primary btn-delete"
						onclick="confirmDelete(event)">회원 탈퇴</button>
					<a href="/spring/member/list" class="btn btn-outline-dark">목록으로</a>
				</sec:authorize>
				<a href="/spring/member/update/${list.email}" class="btn btn-dark">정보 수정</a>
				<a href="/spring/member/logout" class="btn btn-dark">로그아웃</a>
			</div>
		</form>
		<!-- Update Complete Message Start -->
		<div class="modal alertModal" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-body">${message}</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기
						</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Update Complete Message End -->
		<!-- Delete Confrim Message Modal -->
		<div class="modal deleteModal" tabindex="-1" role="dialog">
			<form method="post" class="actionForm">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-body">정말 삭제 하시겠습니까?</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary btnDeleteModal"
								data-bs-dismiss="modal">Confirm
							</button>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close
							</button>
						</div>
					</div>
				</div>
			</form>
		</div>
		<!-- Delete Confrim Message Modal -->
	</div>
	</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="/js/FCMTokenToFCMServer.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<script>
	<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
	// '삭제' 버튼 클릭 시 모달 띄우기
		document.querySelector('.btn-delete').addEventListener('click', function (event) {
			event.preventDefault();
		// 모달 보이기
		$('.deleteModal').modal('show');
	});
	</sec:authorize>

	// '확인' 버튼 클릭 시 폼 제출하기
	document.querySelector('.btnDeleteModal').addEventListener('click', function () {
		var email = document.querySelector('.email').textContent;
		var form = document.querySelector('form[action="/spring/member/delete"]');
		form.action = '/spring/member/delete/' + encodeURIComponent(email);
		form.submit();
	});

	const alertModal = new bootstrap.Modal(document.querySelector(".alertModal"))
	let message = "${message}";
	if (message !== "") {
		alertModal.show();
	}
	setTimeout(function () {
		alertModal.hide();
	}, 1500);
	</script>

	</body>

	</html>