$(document).ready(function(){
  // $('.countries').select2();
  // $('.companies').select2();
  // $('.country-filter').select2();
  // $('.currencies').select2();
  $('.custom-select').select2();

  $('.datepicker-input').datepicker({
    format: 'dd M yyyy'
  });


  $('.datepicker-month-only').datepicker({
    format: 'dd M yyyy',
    maxViewMode: 'months',
    minViewMode: 'months',
    autoclose: true
  });

});