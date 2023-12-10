<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<section id="bannerimonials" class="bannerimonials">
	<div class="slides-1 swiper">
		<div class="swiper-wrapper">
			<div>
				<div class="bannerimonial-item">
					<div id="banner"></div>
				</div>
			</div>
		</div>
	</div>
<script>
	
	/* 배너 예고편 출력 ajax */
	function setBanner(post) {
		let run = true;
		let output = "";
		let randomNumber = "";

		while (run) {
			randomNumber = Math.floor(Math.random() * (post.length - 1)) + 1;

			if (post[randomNumber].fmVideoName != '0') {
				output += "<video loop autoplay=\"\" muted=\"\" style=\"/* width:center; */ height:500px;  margin:100px 0px 0px 300px; \">";
				output += "<source src=" + post[randomNumber].fmVideoName + "\ type=\"video/mp4\">";
				output += "</video>";
				$("#banner").html(output);
				run = false;
			}
		}
	}
</script>
</section>
