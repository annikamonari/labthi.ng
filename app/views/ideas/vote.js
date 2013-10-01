$("div.vote-wrapper").html('<%= j render 'shared/vote_buttons', voteable: @idea, :formats => :html %>');
console.log("did it");