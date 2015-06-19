$(document).ready(function() {
	$('#add-answer').click(function(event){
		var numberOfInputs = $("input[name='question[answers][]']").length
		var html = "<div class='form-group'><div class='radio'><div class='col-md-1'><input type='radio' name='question[answer_id]' class='form-control' value='";
		html += numberOfInputs;
		html += "'></div><div class='col-md-11'><input name='question[answers][]' placeholder='Please insert an answer' class='form-control'></div></div></div>";
		$('.new-groups').append(html)
		event.preventDefault();
	})

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
			data: {answer_id: answerId },
			success: function(data) {
				var score = data.score;
				// column is based off of player id, which we are hard coding 0
				// grid-row is based off of score
				$(".grid-col-0 .grid-row-" + score).css('background-color', "pink")

			}
		});

		e.preventDefault();
	})


})