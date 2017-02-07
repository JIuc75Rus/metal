//= require jquery
//= require jquery_ujs
//= require Admin/app
//= require Admin/bootstrap
//= require Admin/jquery.dataTables
//= require Admin/dataTables.bootstrap
//= require tinymce
//= require tinymce-jquery
$(document).ready(function() {
    $('#example').DataTable( {
        "language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Russian.json"
        }
    } );
} );