_.mixin
  isInt: (n) ->
    typeof n is 'number' and n % 1 is 0

  toTitleCase: (txt) ->
    txt.replace /\w*/g, (txt) ->
      txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase()

  convertToYesNo: (bln) ->
    return '<span class="n_a">n/a</span>' if bln is undefined
    return '<span class="yes">Yes</span>' if bln is true
    return '<span class="no">No</span>'

  toPhoneNumber: (num) ->
    regex = /\D*([2-9][0-9][0-9])\D*([2-9][0-9][0-9])\D*([0-9][0-9][0-9][0-9])\D*/
    num.replace regex, "($1) $2-$3"
