<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 로그인 회원가입 버튼 시작 -->
<button type="button" class="btn btn-warning" data-toggle="modal"
	data-target="#signupModal"
	style="width: 80px; float: right; font-family: 'Hanna', serif;">회원가입</button>
<button type="button" class="btn btn-primary"
	style="margin-right: 8px; width: 75px; float: right; font-family: 'Hanna', serif;"
	data-toggle="modal" data-target="#loginModal">로그인</button>

<!-- 로그인 회원가입 버튼 끝 -->


<!-- 로그인 Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
	data-backdrop="static" aria-labelledby="exampleModalLabel"
	aria-hidden="true">
	<div class="modal-dialog" role="document" style="width: 400px;">
		<div class="modal-content"
			style="background-color: rgb(106, 181, 224); border-radius: 10px">
			<div style="width: 100%; text-align: right; padding: 10px;">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close" style="font-size: 40px">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">

				<!-- container -->

				<div class="logo-image" style="text-align: center;">
					<img src="/img/refrigerator.png" alt="logo" width="300px"
						height="300px" />
				</div>
				<h1 class="display1"
					style="font-family: 'Hanna', serif; color: rgb(252, 252, 252);">로그인</h1>

				<form action="/login/ckeck.do" method="POST" role="form">
					<div id="form-login-username" class="form-group">
						<input class="form-control" name="email" type="email" size="18"
							placeholder="가입한 이메일" alt="가입된 이메일" required /> <span
							class="form-highlight"></span> <span class="form-bar"></span>

					</div>
					<div id="form-login-password" class="form-group">
						<input class="form-control" name="password" type="password"
							size="18" placeholder="비밀번호" alt="비밀번호" required> <span
							class="form-highlight"></span> <span class="form-bar"></span>

					</div>

					<!-- 로그인 버튼과 비밀번호찾기 회원가입 링크 시작 -->
					<div>
						<button class="btn btn-block btn-info ripple-effect" type="submit"
							style="margin-top: 20px; margin-bottom: 5px; font-family: 'Hanna', serif; font-size: 20px;"
							name="Submit" alt="로그인">
							로그인 <i class="fas fa-sign-in-alt"></i>
						</button>
						<div class="row">
							<div class="col-6" style="text-align: left;">
							</div>
							<div class="col-6" style="font-weight: bold; text-align: right;">
								<a href="javascript:void(0)" data-toggle="modal"
									data-target="#signupModal" data-dismiss="modal">회원가입</a>
							</div>

						</div>

					</div>
					<!-- 로그인 버튼과 비밀번호찾기 회원가입 링크 끝 -->
				</form>

			</div>

		</div>
	</div>
</div>


<!-- 회원가입 Modal -->
<div class="modal fade" id="signupModal" tabindex="-1" role="dialog"
	data-backdrop="static" aria-labelledby="exampleModalLabel"
	aria-hidden="true">
	<div class="modal-dialog" role="document" style="width: 400px;">
		<div class="modal-content"
			style="background-color: #eebe65; border-radius: 10px">
			<div style="width: 100%; text-align: right; padding: 10px;">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close" style="font-size: 40px">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">

				<!-- container -->

				
				<div class="logo-image">
					<img src="/img/education.png" alt="logo" width="300px"
						height="300px" style="margin-left: 25px; margin-bottom: 30px;" />
				</div>
				<h1 class="display1"
					style="font-family: 'Hanna', serif; color: rgb(252, 252, 252);">회원가입</h1>

				<form action="/sign_up/insert_user.do" method="POST" role="form">
					<div id="form-login-username" class="form-group">
						<input class="form-control" name="email" type="email" size="18"
							placeholder="가입할 이메일" alt="가입할 이메일" required /> <span
							class="form-highlight"></span> <span class="form-bar"></span>

					</div>
					<div id="form-login-password" class="form-group">
						<input id="pw" class="form-control" name="password1"
							style="margin-bottom: 15px;" type="password" size="18"
							placeholder="비밀번호" alt="비밀번호" required onkeyup="return isSame();">
						<input id="pwCheck" class="form-control" name="password2"
							type="password" size="18" placeholder="비밀번호 확인" alt="비밀번호 확인"
							required onkeyup="return isSame();">
						<div>
							<div id="same"></div>
						</div>
						<span class="form-highlight"></span> <span class="form-bar"></span>

					</div>

					<div>
						<button class="btn btn-block btn-info ripple-effect" type="submit" onclick="return number_length()"
							style="font-family: 'Hanna', serif; font-size: 20px; margin-top: 20px; margin-bottom: 5px;"
							name="Submit" alt="회원가입">
							회원가입 <i class="fas fa-user-plus"></i>
						</button>
					</div>
				</form>
				
				<script type="text/javascript">

					//비밀번호 일치여부 실시간 확인
					function isSame() {
						const pw = document.getElementById('pw').value;
						const pwCheck = document.getElementById('pwCheck').value;
						if (pw === pwCheck) {
							document.getElementById('same').innerHTML = '비밀번호가 일치합니다.';
							document.getElementById('same').style.color = 'blue';
						} else {
							document.getElementById('same').innerHTML = '비밀번호가 일치하지 않습니다.';
							document.getElementById('same').style.color = 'red';
						}

					}
					
				//비밀번호 자릿수 검사
				function number_length(){
				const pw = document.getElementById('pw').value;	
				const pwCheck = document.getElementById('pwCheck').value;
					if (pw.length < 6 || pw.length > 16){
				window.alert('비밀번호는 6자리 이상 16자리 이하만 사용 가능합니다.')
				document.getElementById('pw').value=document.getElementById('pwCheck').value='';
				document.getElementById('same').innerHTML='';
					}
					if(pw!=pwCheck){
						window.alert('비밀번호를 다시 확인해주세요.')
						return false;
					}
				}
				</script>


			</div>

		</div>
	</div>
</div>