angular.module('desafioApp', ['ngMaterial','md.data.table', "ngRoute", "ngMdIcons"]);
angular.module('desafioApp')
.config(['$httpProvider', function($httpProvider) {
$httpProvider.defaults.xsrfHeaderName = 'X-CSRF-TOKEN';
$httpProvider.interceptors.push(function() {
    return {
        response: function(response) {
            $httpProvider.defaults.headers.common['X-CSRF-TOKEN'] = response.headers('X-CSRF-TOKEN');
            return response;
        }
    }    
});
}])