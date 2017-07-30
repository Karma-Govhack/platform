function toggleVolunteerForm() {
  $('#homepageOptions').addClass("hidden");
  $('#volunteerRegForm').removeClass("hidden");
}

function toggleCharityForm() {
  $('#homepageOptions').addClass("hidden");
  $('#charityRegForm').removeClass("hidden");
}

function backToHome(formId) {
  $("'#" + formId + "'").addClass("hidden");
  $('#homepageOptions').removeClass("hidden");
}
