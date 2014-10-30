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


(let ((alph1 1.0d0) (alph2 1.0d0) (ng 5))
  (declare (type (double-float) alph1 alph2) (type (f2cl-lib:integer4) ng))
  (defun jac2 (neq t$ y ml mu pd nrowpd)
    (declare (type (f2cl-lib:integer4) nrowpd mu ml)
             (type (array double-float (*)) pd y)
             (type (double-float) t$)
             (type (array f2cl-lib:integer4 (*)) neq))
    (f2cl-lib:with-multi-array-data
        ((neq f2cl-lib:integer4 neq-%data% neq-%offset%)
         (y double-float y-%data% y-%offset%)
         (pd double-float pd-%data% pd-%offset%))
      (prog ((j 0) (mband 0) (mu1 0) (mu2 0))
        (declare (type (f2cl-lib:integer4) mu2 mu1 mband j))
        (setf mband (f2cl-lib:int-add ml mu 1))
        (setf mu1 (f2cl-lib:int-add mu 1))
        (setf mu2 (f2cl-lib:int-add mu 2))
        (f2cl-lib:fdo (j 1 (f2cl-lib:int-add j 1))
                      ((> j (f2cl-lib:fref neq (1) ((1 *)))) nil)
          (tagbody
            (setf (f2cl-lib:fref pd-%data%
                                 (mu1 j)
                                 ((1 nrowpd) (1 *))
                                 pd-%offset%)
                    -2.0d0)
            (setf (f2cl-lib:fref pd-%data%
                                 (mu2 j)
                                 ((1 nrowpd) (1 *))
                                 pd-%offset%)
                    alph1)
           label10
            (setf (f2cl-lib:fref pd-%data%
                                 (mband j)
                                 ((1 nrowpd) (1 *))
                                 pd-%offset%)
                    alph2)))
        (f2cl-lib:fdo (j ng (f2cl-lib:int-add j ng))
                      ((> j (f2cl-lib:fref neq (1) ((1 *)))) nil)
          (tagbody
           label20
            (setf (f2cl-lib:fref pd-%data%
                                 (mu2 j)
                                 ((1 nrowpd) (1 *))
                                 pd-%offset%)
                    0.0d0)))
        (go end_label)
       end_label
        (return (values nil nil nil nil nil nil nil))))))

(in-package #-gcl #:cl-user #+gcl "CL-USER")
#+#.(cl:if (cl:find-package '#:f2cl) '(and) '(or))
(eval-when (:load-toplevel :compile-toplevel :execute)
  (setf (gethash 'fortran-to-lisp::jac2 fortran-to-lisp::*f2cl-function-info*)
          (fortran-to-lisp::make-f2cl-finfo
           :arg-types '((array fortran-to-lisp::integer4 (*)) (double-float)
                        (array double-float (*)) (fortran-to-lisp::integer4)
                        (fortran-to-lisp::integer4) (array double-float (*))
                        (fortran-to-lisp::integer4))
           :return-values '(nil nil nil nil nil nil nil)
           :calls 'nil)))

