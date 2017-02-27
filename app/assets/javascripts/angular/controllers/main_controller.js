(function () {
    "use strict";

    angular.module("app").controller("MainCtrl", [
        "$scope", "$http",
        function ($scope, $http) {
            var main = this;

            main.commentReply = function(idx) {
                main.showCommentBox = idx;
            };

            main.commentReplyCancel = function() {
                main.showCommentBox = false;
            };
        }
    ]);
})();
