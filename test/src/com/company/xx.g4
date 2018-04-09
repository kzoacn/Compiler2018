grammar xx;
variable
    :Id
    | variable '.' Id
    ;
Id: 'ccc' ;