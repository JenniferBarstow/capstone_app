$(document).ready(function() {
	var quizId = $('.quiz-id').text();
	$.ajax({
		url: "/quizzes/" + quizId + "/student_quizzes",
		type: "get",
		dataType: "json",
		success: function(student_quizzes) {
			$(".number-of-racers").text(student_quizzes.length + " Racers");
			student_quizzes.forEach(function(student_quiz, i){
				var score = student_quiz.score;
				$(".grid-col-" + i + " .grid-row-" + (score - 1)).removeClass('pink');
				$(".grid-col-" + i + " .grid-row-" + (score)).addClass('pink')
			});
		},
		error: function(data) {
		}
	});

	var questions = $(".question-block");
	questions.hide();
	$(questions[0]).show();

	$(document).on('submit', ".question-form", function(e) {
		var values = {};
		$.each($(this).serializeArray(), function(i, field) {
		    values[field.name] = field.value;
		});

		var submittedAnswerId = values["answer_id"];
		var studentId = values["student_id"];
		var questionId = $(this.closest(".question-block")).data("question-id");
		var correctAnswerId = $(questions[0]).data("correct-answer-id");

		if (submittedAnswerId == correctAnswerId) {
			questions.first().remove(); 
 			questions = $(".question-block");
			$(questions[0]).show();
		} else {
			$(questions[0]).hide();
			var tmp = questions.first().remove();
			$(".question-list").append(tmp);
			questions = $(".question-block");
			$(questions[0]).show();
		}

		$.ajax({
			url: "/questions/" + questionId + "/answer",
			type: "post",
			dataType: "json",
			data: {answer_id: submittedAnswerId, student_id: studentId},
			success: function(student_quizzes) {
				var theWinner = student_quizzes.filter(function(obj) { return obj.score >= 10 });
				if (theWinner.length > 0) {
					$(".number-of-racers").text("Player " + theWinner[0].student_id + " Is the Winner");
				} else {
					$(".number-of-racers").text(student_quizzes.length + " Racers");
				}

				student_quizzes.forEach(function(student_quiz, i) {
					var score = student_quiz.score;
					$(".grid-col-" + i + " .grid-row-" + (score - 1)).removeClass('pink');
					$(".grid-col-" + i + " .grid-row-" + (score)).addClass('pink');
				});
			}
		});

		e.preventDefault();
	});

	$('#add-answer').click(function(event){
		var numberOfInputs = $("input[name='question[answers][]']").length
		var html = "<div class='form-group'><div class='radio'>";
		html += "<div class='col-md-12'><input type='radio' name='question[answer_id]' class='form-control' value='";
		html += numberOfInputs;
		html += "'><input name='question[answers][]' placeholder='Please insert an answer' class='form-control'></div></div></div>";
		$('.new-groups').append(html)
		event.preventDefault();
	});
});