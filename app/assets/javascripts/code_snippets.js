 function showOnlyOne(id) {
     $('.default').hide();
     $('.code-snippet').each(function(index) {
         if ($(this).attr("id") == id) {
             $(this).show();
         } else {
             $(this).hide();
         }
     });
     return false;
 };
