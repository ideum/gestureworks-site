//= require vendor/jquery

jQuery(function ($) {
  $('[data-subnav-label]').on('click', function (event) {
    var $this = $(this);
    $this.toggleClass('open');
    $this.siblings('ul.subnav').toggleClass('open');
  });
});
