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


(defun webr (x y t$ c rate)
  (declare (type (array double-float (*)) rate c) (type (double-float) t$ y x))
  (let ((pcom1-acoef
         (make-array 400
                     :element-type 'double-float
                     :displaced-to (pcom1-part-0 *pcom1-common-block*)
                     :displaced-index-offset 2))
        (pcom1-bcoef
         (make-array 20
                     :element-type 'double-float
                     :displaced-to (pcom1-part-0 *pcom1-common-block*)
                     :displaced-index-offset 402)))
    (symbol-macrolet ((acoef pcom1-acoef)
                      (bcoef pcom1-bcoef)
                      (alph (aref (pcom1-part-0 *pcom1-common-block*) 424))
                      (ns (aref (pcom1-part-1 *pcom1-common-block*) 0)))
      (f2cl-lib:with-multi-array-data
          ((c double-float c-%data% c-%offset%)
           (rate double-float rate-%data% rate-%offset%))
        (prog ((i 0) (fac 0.0d0))
          (declare (type (double-float) fac) (type (f2cl-lib:integer4) i))
          (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                        ((> i ns) nil)
            (tagbody
             label10
              (setf (f2cl-lib:fref rate-%data% (i) ((1 *)) rate-%offset%)
                      0.0d0)))
          (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                        ((> i ns) nil)
            (tagbody
              (daxpy ns (f2cl-lib:fref c-%data% (i) ((1 *)) c-%offset%)
               (f2cl-lib:array-slice acoef double-float (1 i) ((1 20) (1 20)))
               1 rate 1)
             label15))
          (setf fac (+ 1.0d0 (* alph x y)))
          (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                        ((> i ns) nil)
            (tagbody
             label20
              (setf (f2cl-lib:fref rate-%data% (i) ((1 *)) rate-%offset%)
                      (* (f2cl-lib:fref c-%data% (i) ((1 *)) c-%offset%)
                         (+ (* (f2cl-lib:fref bcoef (i) ((1 20))) fac)
                            (f2cl-lib:fref rate-%data%
                                           (i)
                                           ((1 *))
                                           rate-%offset%))))))
          (go end_label)
         end_label
          (return (values nil nil nil nil nil)))))))

(in-package #-gcl #:cl-user #+gcl "CL-USER")
#+#.(cl:if (cl:find-package '#:f2cl) '(and) '(or))
(eval-when (:load-toplevel :compile-toplevel :execute)
  (setf (gethash 'fortran-to-lisp::webr fortran-to-lisp::*f2cl-function-info*)
          (fortran-to-lisp::make-f2cl-finfo
           :arg-types '((double-float) (double-float) (double-float)
                        (array double-float (*)) (array double-float (*)))
           :return-values '(nil nil nil nil nil)
           :calls '(fortran-to-lisp::daxpy))))

