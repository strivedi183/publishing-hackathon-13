$(function() {
  search('one-hundred-years-of-solitude');
  console.log('loading');
});

var results = {};



function search(query) {
  $.ajax({
    url:'http://openlibrary.org/search.json?q='+query,
    dataType:'jsonp',
    method:'get',
    jsonp: false,
    jsonpCallback:'my_callback',
    success: function(data) {
    },
    complete: function(data, status) {
    }

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