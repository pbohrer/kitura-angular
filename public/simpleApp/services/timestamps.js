angular.module('simpleApp')

    .service('TimestampService', ['$http', function ($http) {

        this.get = function(callback) {
            var url = '/timestamps';
            var results = $http.get(url).then(function(response) {
            	callback(response.data)
            });

            return
        }

        this.set = function() {
            var url = '/timestamps';
            console.log("sending post")
            return $http.post(url);
        }

	    this.reset = function() {
	        var url = '/timestamps';
	        console.log("sending delete")
	        return $http.delete(url);
	    }
}]);
