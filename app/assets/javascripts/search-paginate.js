(function() {

  var interceptHistoryStateChanges = function() {

    var originalPushState = window.history.pushState;
    window.history.pushState = function() {
      var incomingState = arguments[0];
      var urlOfClickedLink = incomingState.url;
      var clickedLink =
        $("a[data-history-target-state][href='" + urlOfClickedLink + "']");
      console.log("clickedLink", clickedLink);
      incomingState.search = clickedLink.data("history-target-state").search;
      console.log("pushState intercepted!", incomingState);
      
      var result = originalPushState.apply(this, arguments);
      // var result = originalPushState(arguments[0], arguments[1]);
      return result;
    };

    var originalReplaceState = window.history.replaceState;
    window.history.replaceState = function() {
      console.log("replaceState intercepted!");
      console.log("current state", window.history.state);
      if (!$.isEmptyObject(window.history.state) && $.isPlainObject(window.history.state.search)) {
        arguments[0].search = window.history.state.search;
      }
      console.log("incoming state", arguments[0]);
      var result = originalReplaceState.apply(this, arguments);
      return result;
    };

  };
  interceptHistoryStateChanges();
})();