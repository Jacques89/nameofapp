App.product = App.cable.subscriptions.create("ProductChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
    $(".alert.alert-info").show();
  },
   disconnected: function() {
    // Called when the subscription has been terminated by the server
  },
   received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    $(".alert.alert-info").show();
  },

  listen_to_comments: function() {
  return this.perform('listen', {
    product_id: $("[data-product-id]").data("product-id")
  });
}
});

$(document).on('turbolinks:load', function() {
  App.product.listen_to_comments();
});