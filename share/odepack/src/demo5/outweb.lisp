;;; Compiled by f2cl version:
;;; ("f2cl1.l,v 95098eb54f13 2013/04/01 00:45:16 toy $"
;;;  "f2cl2.l,v 95098eb54f13 2013/04/01 00:45:16 toy $"
;;;  "f2cl3.l,v 96616d88fb7e 2008/02/22 22:19:34 rtoy $"
;;;  "f2cl4.l,v 96616d88fb7e 2008/02/22 22:19:34 rtoy $"
;;;  "f2cl5.l,v 95098eb54f13 2013/04/01 00:45:16 toy $"
;;;  "f2cl6.l,v 1d5cbacbb977 2008/08/24 00:56:27 rtoy $"
;;;  "macros.l,v 1409c1352feb 2013/03/24 20:44:50 toy $")

;;; Using Lisp CMU Common Lisp snapshot-2013-11 (20E Unicode)
;;; 
;;; Options: ((:prune-labels nil) (:auto-save t) (:relaxed-array-decls t)
;;;           (:coerce-assigns :as-needed) (:array-type ':array)
;;;           (:array-slicing t) (:declare-common nil)
;;;           (:float-format single-float))

(in-package "ODEPACK")


(defun outweb (t$ c ns mx my lun)
  (declare (type (f2cl-lib:integer4) lun my mx ns)
           (type (array double-float (*)) c)
           (type (double-float) t$))
  (f2cl-lib:with-multi-array-data
      ((c double-float c-%data% c-%offset%))
    (prog ((i 0) (jx 0) (jy 0))
      (declare (type (f2cl-lib:integer4) jy jx i))
      (f2cl-lib:fformat lun
                        ("~%" 80 ("-") "~%" "~30@T" "At time t = " 1
                         (("~16,8,2,0,'*,,'DE")) "~%" 80 ("-") "~%")
                        t$)
      (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                    ((> i ns) nil)
        (tagbody
          (f2cl-lib:fformat lun
                            (" the species c(" 1 (("~2D")) ") values are:"
                             "~%")
                            i)
          (f2cl-lib:fdo (jy my (f2cl-lib:int-add jy (f2cl-lib:int-sub 1)))
                        ((> jy 1) nil)
            (tagbody
              (f2cl-lib:fformat lun
                                (6 ("~1@T" 1 (("~12,6,2,0,'*,,'EG"))) "~%")
                                (do ((jx 1 (f2cl-lib:int-add jx 1))
                                     (%ret nil))
                                    ((> jx mx) (nreverse %ret))
                                  (declare (type f2cl-lib:integer4 jx))
                                  (push
                                   (f2cl-lib:fref c-%data%
                                                  (i jx jy)
                                                  ((1 ns) (1 mx) (1 my))
                                                  c-%offset%)
                                   %ret)))
             label30))
          (f2cl-lib:fformat lun (80 ("-") "~%" "~%"))
         label40))
      (go end_label)
     end_label
      (return (values nil nil nil nil nil nil)))))

(in-package #-gcl #:cl-user #+gcl "CL-USER")
#+#.(cl:if (cl:find-package '#:f2cl) '(and) '(or))
(eval-when (:load-toplevel :compile-toplevel :execute)
  (setf (gethash 'fortran-to-lisp::outweb
                 fortran-to-lisp::*f2cl-function-info*)
          (fortran-to-lisp::make-f2cl-finfo
           :arg-types '((double-float) (array double-float (*))
                        (fortran-to-lisp::integer4) (fortran-to-lisp::integer4)
                        (fortran-to-lisp::integer4)
                        (fortran-to-lisp::integer4))
           :return-values '(nil nil nil nil nil nil)
           :calls 'nil)))

