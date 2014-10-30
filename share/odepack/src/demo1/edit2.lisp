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
  (defun edit2 (y t$ erm)
    (declare (type (double-float) erm t$) (type (array double-float (*)) y))
    (f2cl-lib:with-multi-array-data
        ((y double-float y-%data% y-%offset%))
      (prog ((a1 0.0d0) (a2 0.0d0) (er 0.0d0) (ex 0.0d0) (yt 0.0d0) (i 0) (j 0)
             (k 0))
        (declare (type (f2cl-lib:integer4) k j i)
                 (type (double-float) yt ex er a2 a1))
        (setf erm 0.0d0)
        (if (= t$ 0.0d0) (go end_label))
        (setf ex 0.0d0)
        (if (<= t$ 30.0d0) (setf ex (exp (* -2.0d0 t$))))
        (setf a2 1.0d0)
        (f2cl-lib:fdo (j 1 (f2cl-lib:int-add j 1))
                      ((> j ng) nil)
          (tagbody
            (setf a1 1.0d0)
            (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                          ((> i ng) nil)
              (tagbody
                (setf k
                        (f2cl-lib:int-add i
                                          (f2cl-lib:int-mul
                                           (f2cl-lib:int-sub j 1)
                                           ng)))
                (setf yt
                        (*
                         (expt t$ (f2cl-lib:int-sub (f2cl-lib:int-add i j) 2))
                         ex
                         a1
                         a2))
                (setf er
                        (abs
                         (- (f2cl-lib:fref y-%data% (k) ((1 25)) y-%offset%)
                            yt)))
                (setf erm (max erm er))
                (setf a1 (/ (* a1 alph1) i))
               label50))
            (setf a2 (/ (* a2 alph2) j))
           label60))
        (go end_label)
       end_label
        (return (values nil nil erm))))))

(in-package #-gcl #:cl-user #+gcl "CL-USER")
#+#.(cl:if (cl:find-package '#:f2cl) '(and) '(or))
(eval-when (:load-toplevel :compile-toplevel :execute)
  (setf (gethash 'fortran-to-lisp::edit2 fortran-to-lisp::*f2cl-function-info*)
          (fortran-to-lisp::make-f2cl-finfo
           :arg-types '((array double-float (*)) (double-float) (double-float))
           :return-values '(nil nil fortran-to-lisp::erm)
           :calls 'nil)))

