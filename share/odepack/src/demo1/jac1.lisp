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


(defun jac1 (neq t$ y ml mu pd nrowpd)
  (declare (type (f2cl-lib:integer4) nrowpd mu ml)
           (type (array double-float (*)) pd y)
           (type (double-float) t$)
           (type (array f2cl-lib:integer4 (*)) neq))
  (f2cl-lib:with-multi-array-data
      ((neq f2cl-lib:integer4 neq-%data% neq-%offset%)
       (y double-float y-%data% y-%offset%)
       (pd double-float pd-%data% pd-%offset%))
    (prog ()
      (declare)
      (setf (f2cl-lib:fref pd-%data% (1 1) ((1 nrowpd) (1 *)) pd-%offset%)
              0.0d0)
      (setf (f2cl-lib:fref pd-%data% (1 2) ((1 nrowpd) (1 *)) pd-%offset%)
              1.0d0)
      (setf (f2cl-lib:fref pd-%data% (2 1) ((1 nrowpd) (1 *)) pd-%offset%)
              (-
               (* -6.0d0
                  (f2cl-lib:fref y-%data% (1) ((1 *)) y-%offset%)
                  (f2cl-lib:fref y-%data% (2) ((1 *)) y-%offset%))
               1.0d0))
      (setf (f2cl-lib:fref pd-%data% (2 2) ((1 nrowpd) (1 *)) pd-%offset%)
              (* 3.0d0
                 (- 1.0d0
                    (* (f2cl-lib:fref y-%data% (1) ((1 *)) y-%offset%)
                       (f2cl-lib:fref y-%data% (1) ((1 *)) y-%offset%)))))
      (go end_label)
     end_label
      (return (values nil nil nil nil nil nil nil)))))

(in-package #-gcl #:cl-user #+gcl "CL-USER")
#+#.(cl:if (cl:find-package '#:f2cl) '(and) '(or))
(eval-when (:load-toplevel :compile-toplevel :execute)
  (setf (gethash 'fortran-to-lisp::jac1 fortran-to-lisp::*f2cl-function-info*)
          (fortran-to-lisp::make-f2cl-finfo
           :arg-types '((array fortran-to-lisp::integer4 (*)) (double-float)
                        (array double-float (*)) (fortran-to-lisp::integer4)
                        (fortran-to-lisp::integer4) (array double-float (*))
                        (fortran-to-lisp::integer4))
           :return-values '(nil nil nil nil nil nil nil)
           :calls 'nil)))

