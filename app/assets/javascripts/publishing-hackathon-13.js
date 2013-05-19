$(function() {

  search('the+lord+of+the+rings');
  console.log('loading');
});

var results = {};



function search(query) {

  $.ajax({
    url:'http://openlibrary.org/search.json?callback=my_callback?q='+query,
    dataType:'jsonp',
    method:'get',
    jsonp: 'callback',
    jsonpCallback:'my_callback',
    contentType:'application/javascript'
  });
}


window.my_callback = function(data) {
  console.log(data);
  _.each(data, function(key, value){
      console.log(value);
   });

  // console.log(data.my_callback() );
  // var stuff = data.my_callback();
  // // console.log(typeof(data));
  // results = data.toJSON();
  // $('body').append(data);
}