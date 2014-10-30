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
  (defun f2 (neq t$ y ydot)
    (declare (type (array double-float (*)) ydot y)
             (type (double-float) t$)
             (type (array f2cl-lib:integer4 (*)) neq))
    (f2cl-lib:with-multi-array-data
        ((neq f2cl-lib:integer4 neq-%data% neq-%offset%)
         (y double-float y-%data% y-%offset%)
         (ydot double-float ydot-%data% ydot-%offset%))
      (prog ((d 0.0d0) (i 0) (j 0) (k 0))
        (declare (type (f2cl-lib:integer4) k j i) (type (double-float) d))
        (f2cl-lib:fdo (j 1 (f2cl-lib:int-add j 1))
                      ((> j ng) nil)
          (tagbody
            (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                          ((> i ng) nil)
              (tagbody
                (setf k
                        (f2cl-lib:int-add i
                                          (f2cl-lib:int-mul
                                           (f2cl-lib:int-sub j 1)
                                           ng)))
                (setf d
                        (* -2.0d0
                           (f2cl-lib:fref y-%data% (k) ((1 *)) y-%offset%)))
                (if (/= i 1)
                    (setf d
                            (+ d
                               (*
                                (f2cl-lib:fref y-%data%
                                               ((f2cl-lib:int-sub k 1))
                                               ((1 *))
                                               y-%offset%)
                                alph1))))
                (if (/= j 1)
                    (setf d
                            (+ d
                               (*
                                (f2cl-lib:fref y-%data%
                                               ((f2cl-lib:int-sub k ng))
                                               ((1 *))
                                               y-%offset%)
                                alph2))))
                (setf (f2cl-lib:fref ydot-%data% (k) ((1 *)) ydot-%offset%)
                        d)))))
       label10
        (go end_label)
       end_label
        (return (values nil nil nil nil))))))

(in-package #-gcl #:cl-user #+gcl "CL-USER")
#+#.(cl:if (cl:find-package '#:f2cl) '(and) '(or))
(eval-when (:load-toplevel :compile-toplevel :execute)
  (setf (gethash 'fortran-to-lisp::f2 fortran-to-lisp::*f2cl-function-info*)
          (fortran-to-lisp::make-f2cl-finfo
           :arg-types '((array fortran-to-lisp::integer4 (*)) (double-float)
                        (array double-float (*)) (array double-float (*)))
           :return-values '(nil nil nil nil)
           :calls 'nil)))

