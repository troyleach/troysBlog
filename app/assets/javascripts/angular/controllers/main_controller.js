(function () {
    "use strict";

    angular.module("app").controller("MainCtrl", [
        "$scope", "$http",
        function ($scope, $http) {
            var main = this;
            main.testing = 'this is a test fucker face';
        }
    ]);
})();
