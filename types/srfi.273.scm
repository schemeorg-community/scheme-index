(((name . "define-check")
  (signature syntax-rules ()
             ((_ name predicate)))
  (subsigs (predicate (lambda (obj) *)))
  (desc . "Defines a new name-d checking predicate based on the provided predicate (possibly evaluated)"))
 ((name . "define-values-checked")
  (signature syntax-rules ()
             ((_ (name ...) (predicate ...) form)))
  (subsigs
   (predicate (lambda (obj) *)))
  (desc . "Same as define-values, but makes sure the values returned by form abide by checks. Further symbol value modifications may be checked too."))
 ((name . "declare-checked")
  (signature syntax-rules ()
             ((_ (proc-name arg ...)))
             ((_ (proc-name arg ...) => (predicate ...)))
             ((_ name predicate)))
  (subsigs
   (arg
    (pattern
     name
     (name predicate)))
   (predicate (lambda (obj) *)))
  (desc . "This syntax declares checks for a given value (in the first form) before / after the value itself was bound to a name. Or argument / return checks for a procedure defined separately. In the case of the procedure check declaration, argument checks are specified as either (arg pred?) (list of 2 elements) or arg (a single symbol,) like in define-checked. Return value type checks, introduced by => symbol, are syntactically optional. They specify the checks for procedure return value(s) when provided. ")))
