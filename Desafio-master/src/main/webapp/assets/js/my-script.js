function saveClient() {
	var name = $('#name').val();
	var age = $('#age').val();
	var profession = $('#profession').val();
	$.ajax({
		url: '/MyWebProject/index/save?name=' + name + '&age=' + age + '&profession=' + profession,
		success: function(result) {
			alert(result);
		}
	});
}