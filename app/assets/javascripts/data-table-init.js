$(document).ready(function() {
  $(".data-table").DataTable(
    {
        "paging":   true,
        "ordering": true,
        "info":     true,
        "order": [1, "desc"]
    }
  );
});