$(document).ready(function() {
	
	$('#add-answer').click(function(event){
		var numberOfInputs = $("input[name='question[answers][]']").length
		var html = "<div class='form-group'><div class='radio'><div class='col-md-1'><input type='radio' name='question[answer_id]' class='form-control' value='";
		html += numberOfInputs + 1 ;
		html += "'></div><div class='col-md-11'><input name='question[answers][]' placeholder='Please insert an answer' class='form-control'></div></div></div>";
		$('.new-groups').append(html)
		event.preventDefault();
	})

	$( ".list-group-item" ).click(function() {
  console.log( "Click handler here" );
});

})