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


(defun cinit (cc)
  (declare (type (array double-float (*)) cc))
  (let ()
    (symbol-macrolet ((ax (aref (pcom1-part-0 *pcom1-common-block*) 0))
                      (ay (aref (pcom1-part-0 *pcom1-common-block*) 1))
                      (dx (aref (pcom1-part-0 *pcom1-common-block*) 422))
                      (dy (aref (pcom1-part-0 *pcom1-common-block*) 423))
                      (ns (aref (pcom1-part-1 *pcom1-common-block*) 0))
                      (mx (aref (pcom1-part-1 *pcom1-common-block*) 1))
                      (my (aref (pcom1-part-1 *pcom1-common-block*) 2))
                      (mxns (aref (pcom1-part-1 *pcom1-common-block*) 3)))
      (f2cl-lib:with-multi-array-data
          ((cc double-float cc-%data% cc-%offset%))
        (prog ((jy 0) (jx 0) (iyoff 0) (ioff 0) (ici 0) (i 0) (y 0.0d0)
               (x 0.0d0) (argy 0.0d0) (argx 0.0d0))
          (declare (type (double-float) argx argy x y)
                   (type (f2cl-lib:integer4) i ici ioff iyoff jx jy))
          (f2cl-lib:fdo (jy 1 (f2cl-lib:int-add jy 1))
                        ((> jy my) nil)
            (tagbody
              (setf y (* (f2cl-lib:int-sub jy 1) dy))
              (setf argy (* 16.0d0 y y (- ay y) (- ay y)))
              (setf iyoff (f2cl-lib:int-mul mxns (f2cl-lib:int-sub jy 1)))
              (f2cl-lib:fdo (jx 1 (f2cl-lib:int-add jx 1))
                            ((> jx mx) nil)
                (tagbody
                  (setf x (* (f2cl-lib:int-sub jx 1) dx))
                  (setf argx (* 16.0d0 x x (- ax x) (- ax x)))
                  (setf ioff
                          (f2cl-lib:int-add iyoff
                                            (f2cl-lib:int-mul ns
                                                              (f2cl-lib:int-sub
                                                               jx
                                                               1))))
                  (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                                ((> i ns) nil)
                    (tagbody
                      (setf ici (f2cl-lib:int-add ioff i))
                      (setf (f2cl-lib:fref cc-%data% (ici) ((1 *)) cc-%offset%)
                              (+ 10.0d0 (* i argx argy)))
                     label5))
                 label10))
             label20))
          (go end_label)
         end_label
          (return (values nil)))))))

(in-package #-gcl #:cl-user #+gcl "CL-USER")
#+#.(cl:if (cl:find-package '#:f2cl) '(and) '(or))
(eval-when (:load-toplevel :compile-toplevel :execute)
  (setf (gethash 'fortran-to-lisp::cinit fortran-to-lisp::*f2cl-function-info*)
          (fortran-to-lisp::make-f2cl-finfo
           :arg-types '((array double-float (*)))
           :return-values '(nil)
           :calls 'nil)))

