$(function(){
  $('.sidebar .sidebar-menu li a').on('click', function () {
    const $this = $(this);
    if ($this.parent().hasClass('open')) {
      $this
        .parent()
        .children('.dropdown-menu')
        //.slideUp(200, () => {
        .slideUp(200, function(){
          $this.parent().removeClass('open');
        });
    } else {
      $this
        .parent()
        .parent()
        .children('li.open')
        .children('.dropdown-menu')
        .slideUp(200);

      $this
        .parent()
        .parent()
        .children('li.open')
        .children('a')
        .removeClass('open');

      $this
        .parent()
        .parent()
        .children('li.open')
        .removeClass('open');

      $this
        .parent()
        .children('.dropdown-menu')
        //.slideDown(200, () => {
        .slideDown(200, function(){
          $this.parent().addClass('open');
        });
    }
  });
  
  
   $('.sidebar-toggle').on('click', function(e){	  
    $('.app').toggleClass('is-collapsed');
    e.preventDefault();
  });
  

})









  // Sidebar Activity Class
  const sidebarLinks = $('.sidebar').find('.sidebar-link');

  sidebarLinks	
  	//.each((index, el) => {
  	.each(function(index, el){
      $(el).removeClass('active');
    })
// href > onclick 변경 후 주석처리    
//    .filter(function () {
//      const href = $(this).attr('href');
//      const pattern = href[0] === '/' ? href.substr(1) : href;
//      return pattern === (window.location.pathname).substr(1);
//    })
    .addClass('active');

  // ٍSidebar Toggle
  //$('.sidebar-toggle').on('click', e => {
  $('.sidebar-toggle').on('click', function(e){	  
    $('.app').toggleClass('is-collapsed');
    e.preventDefault();
  });

  /**
   * Wait untill sidebar fully toggled (animated in/out)
   * then trigger window resize event in order to recalculate
   * masonry layout widths and gutters.
   */
  //$('#sidebar-toggle').click(e => {


//$('.btn-popover').on('click', function () {
	//$(".popover-resign").hide();
	//var pop_id = $(this).attr("data-id");
	//$("#"+pop_id).show();
	//$(this).removeClass("btn-popover");
	//$(this).addClass("btn-popover-close");
//});


$('.btn-popover').toggle(function() {
  
	var pop_id = $(this).attr("data-id");
	$("#"+pop_id).show();
	$(this).removeClass("btn-popover");
	$(this).addClass("btn-popover-close");
	console.log("333");
}, function() {
 	
	var pop_id = $(this).attr("data-id");
	$("#"+pop_id).hide();
	
});



