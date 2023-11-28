
$(document).on("click","#startQuiz", function(){
	  var thisId = $(this).data('id');
	  Swal.fire({
      title: 'ONLINE EXAM INSTRUCTIONS',
      //text: 'ONLINE EXAM INSTRUCTIONS <br> You want to take this exam now, your time will start automaticaly',
	   html:'<ol style="text-align:left;"><li>You must use a functioning webcam and microphone</li><li>No cell phones or other secondary devices in the room or test area</li><li>Your desk/table must be clear or any materials except your test-taking device</li><li>No one else can be in the room with you</li><li>No talking </li><li>The testing room must be well-lit and you must be clearly visible</li><li>No dual screens/monitors</li><li>Do not leave the camera </li><li>No use of additional applications or internet</li></ol><br> Are you sure ?? You want to take this exam now, your time will start automaticaly',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, start now!'
 }).then((result) => {
  if (result.value) {
         $.ajax({
          type : "post",
          url : "query/selExamAttemptExe.php",
          dataType : "json",  
          data : {thisId:thisId},
          cache : false,
          success : function(data){
            if(data.res == "alreadyExam")
            {
              Swal.fire(
                'Already Taken ',
                'you already take this exam',
                'error'
              )
            }
            else if(data.res == "takeNow")
            {
              window.location.href="home.php?page=exam&id="+thisId;
              return false;
            }
          },
          error : function(xhr, ErrorStatus, error){
            console.log(status.error);
          }

        });




  }
 });
	return false;
})
$(document).on("click","#startQuiz1", function(){
	Swal.fire("Exam Not Yet Started");
});


// Reset Exam Form
$(document).on("click","#resetExamFrm", function(){
      $('#submitAnswerFrm')[0].reset();
      return false;
});





// Select Time Limit
var mins
var secs;

function cd() {
  var timeExamLimit = $('#timeExamLimit').val();
  mins = 1 * m("" + timeExamLimit); // change minutes here
  secs = 0 + s(":01"); 
  redo();
}

function m(obj) {
  for(var i = 0; i < obj.length; i++) {
      if(obj.substring(i, i + 1) == ":")
      break;
  }
  return(obj.substring(0, i));
}

function s(obj) {
  for(var i = 0; i < obj.length; i++) {
      if(obj.substring(i, i + 1) == ":")
      break;
  }
  return(obj.substring(i + 1, obj.length));
}

function dis(mins,secs) {
  var disp;
  if(mins <= 9) {
      disp = " 0";
  } else {
      disp = " ";
  }
  disp += mins + ":";
  if(secs <= 9) {
      disp += "0" + secs;
  } else {
      disp += secs;
  }
  return(disp);
}

function redo() {
  secs--;
  if(secs == -1) {
      secs = 59;
      mins--;
  }
  document.cd.disp.value = dis(mins,secs); 
  if((mins == 0) && (secs == 0)) {
    $('#examAction').val("autoSubmit");
     $('#submitAnswerFrm').submit();
  } else {
    cd = setTimeout("redo()",1000);
  }
}

function init() {
  cd();
}
window.onload = init;
