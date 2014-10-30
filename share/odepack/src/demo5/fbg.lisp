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


(defun fbg (neq t$ cc jx jy cdot)
  (declare (type (array double-float (*)) cdot cc)
           (type (double-float) t$)
           (type (f2cl-lib:integer4) jy jx neq))
  (let ()
    (symbol-macrolet ((dx (aref (pcom1-part-0 *pcom1-common-block*) 422))
                      (dy (aref (pcom1-part-0 *pcom1-common-block*) 423))
                      (ns (aref (pcom1-part-1 *pcom1-common-block*) 0))
                      (mx (aref (pcom1-part-1 *pcom1-common-block*) 1)))
      (f2cl-lib:with-multi-array-data
          ((cc double-float cc-%data% cc-%offset%)
           (cdot double-float cdot-%data% cdot-%offset%))
        (prog ((ic 0) (iblok 0) (y 0.0d0) (x 0.0d0))
          (declare (type (double-float) x y)
                   (type (f2cl-lib:integer4) iblok ic))
          (setf iblok
                  (f2cl-lib:int-add jx
                                    (f2cl-lib:int-mul (f2cl-lib:int-sub jy 1)
                                                      mx)))
          (setf y (* (f2cl-lib:int-sub jy 1) dy))
          (setf x (* (f2cl-lib:int-sub jx 1) dx))
          (setf ic
                  (f2cl-lib:int-add
                   (f2cl-lib:int-mul ns (f2cl-lib:int-sub iblok 1))
                   1))
          (webr x y t$
           (f2cl-lib:array-slice cc-%data%
                                 double-float
                                 (ic)
                                 ((1 neq))
                                 cc-%offset%)
           cdot)
          (go end_label)
         end_label
          (return (values nil nil nil nil nil nil)))))))

(in-package #-gcl #:cl-user #+gcl "CL-USER")
#+#.(cl:if (cl:find-package '#:f2cl) '(and) '(or))
(eval-when (:load-toplevel :compile-toplevel :execute)
  (setf (gethash 'fortran-to-lisp::fbg fortran-to-lisp::*f2cl-function-info*)
          (fortran-to-lisp::make-f2cl-finfo
           :arg-types '((fortran-to-lisp::integer4) (double-float)
                        (array double-float (*)) (fortran-to-lisp::integer4)
                        (fortran-to-lisp::integer4) (array double-float (*)))
           :return-values '(nil nil nil nil nil nil)
           :calls '(fortran-to-lisp::webr))))

