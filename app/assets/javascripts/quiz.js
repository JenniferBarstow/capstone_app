$(document).ready(function() {
	// on page load, populate the number of racers
	var quizId = $('.quiz-id').text();
	$.ajax({
		url: "/quizzes/" + quizId + "/student_quizzes",
		type: "get",
		dataType: "json",
		success: function(student_quizzes) {
			$(".number-of-racers").text(student_quizzes.length + " Racers");
			student_quizzes.forEach(function(student_quiz, i){
				var score = student_quiz.score;
				// grid-col is based off of index the student_quiz is in the returned array
				// grid-row is based off of score
				$(".grid-col-" + i + " .grid-row-" + (score - 1)).removeClass('pink');
				$(".grid-col-" + i + " .grid-row-" + (score)).addClass('pink')
			});
		},
		error: function(data) {
		}
	});

	$('#add-answer').click(function(event){
		var numberOfInputs = $("input[name='question[answers][]']").length
		var html = "<div class='form-group'><div class='radio'><div class='col-md-1'><input type='radio' name='question[answer_id]' class='form-control' value='";
		html += numberOfInputs;
		html += "'></div><div class='col-md-11'><input name='question[answers][]' placeholder='Please insert an answer' class='form-control'></div></div></div>";
		$('.new-groups').append(html)
		event.preventDefault();
	});

	var questions = $(".question-block");
	var questionCounter = 0;
	questions.hide();
	$(questions[questionCounter]).show();

	$(".question-form").on("submit", function(e) {
		// parse form inputs in a `values` object that behaves like params
		var values = {};
		$.each($(this).serializeArray(), function(i, field) {
		    values[field.name] = field.value;
		});
		// set submitted answer id
		var answerId = values["answer_id"];
		var studentId = values["student_id"];

		// get id for the question ID ajax request
		var questionId = $(this.closest(".question-block")).data("question-id");

		// toggling questions
		$(questions[questionCounter]).hide();
		questionCounter += 1;
		$(questions[questionCounter]).show();

		$.ajax({
			url: "/questions/" + questionId + "/answer",
			type: "post",
			dataType: "json",
			data: {answer_id: answerId, student_id: studentId},
			success: function(student_quizzes) {
				$(".number-of-racers").text(student_quizzes.length + " Racers");
				student_quizzes.forEach(function(student_quiz, i){
					var score = student_quiz.score;
					// grid-col is based off of index the student_quiz is in the returned array
					// grid-row is based off of score
					$(".grid-col-" + i + " .grid-row-" + (score - 1)).removeClass('pink');
					$(".grid-col-" + i + " .grid-row-" + (score)).addClass('pink');
				});
			}
		});

		e.preventDefault();
	});
})