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


(defun fweb (neq t$ cc cdot)
  (declare (type (array double-float (*)) cdot cc)
           (type (double-float) t$)
           (type (array f2cl-lib:integer4 (*)) neq))
  (let ((pcom1-cox
         (make-array 20
                     :element-type 'double-float
                     :displaced-to (pcom1-part-0 *pcom1-common-block*)
                     :displaced-index-offset 445))
        (pcom1-coy
         (make-array 20
                     :element-type 'double-float
                     :displaced-to (pcom1-part-0 *pcom1-common-block*)
                     :displaced-index-offset 465)))
    (symbol-macrolet ((dx (aref (pcom1-part-0 *pcom1-common-block*) 422))
                      (dy (aref (pcom1-part-0 *pcom1-common-block*) 423))
                      (cox pcom1-cox)
                      (coy pcom1-coy)
                      (ns (aref (pcom1-part-1 *pcom1-common-block*) 0))
                      (mx (aref (pcom1-part-1 *pcom1-common-block*) 1))
                      (my (aref (pcom1-part-1 *pcom1-common-block*) 2))
                      (mxns (aref (pcom1-part-1 *pcom1-common-block*) 3)))
      (f2cl-lib:with-multi-array-data
          ((neq f2cl-lib:integer4 neq-%data% neq-%offset%)
           (cc double-float cc-%data% cc-%offset%)
           (cdot double-float cdot-%data% cdot-%offset%))
        (prog ((jy 0) (jx 0) (iyoff 0) (idyu 0) (idyl 0) (idxu 0) (idxl 0)
               (ici 0) (ic 0) (i 0) (y 0.0d0) (x 0.0d0) (dcyui 0.0d0)
               (dcyli 0.0d0) (dcxui 0.0d0) (dcxli 0.0d0))
          (declare (type (double-float) dcxli dcxui dcyli dcyui x y)
                   (type (f2cl-lib:integer4) i ic ici idxl idxu idyl idyu iyoff
                                             jx jy))
          (f2cl-lib:fdo (jy 1 (f2cl-lib:int-add jy 1))
                        ((> jy my) nil)
            (tagbody
              (setf y (* (f2cl-lib:int-sub jy 1) dy))
              (setf iyoff (f2cl-lib:int-mul mxns (f2cl-lib:int-sub jy 1)))
              (setf idyu mxns)
              (if (= jy my) (setf idyu (f2cl-lib:int-sub mxns)))
              (setf idyl mxns)
              (if (= jy 1) (setf idyl (f2cl-lib:int-sub mxns)))
              (f2cl-lib:fdo (jx 1 (f2cl-lib:int-add jx 1))
                            ((> jx mx) nil)
                (tagbody
                  (setf x (* (f2cl-lib:int-sub jx 1) dx))
                  (setf ic
                          (f2cl-lib:int-add iyoff
                                            (f2cl-lib:int-mul ns
                                                              (f2cl-lib:int-sub
                                                               jx
                                                               1))
                                            1))
                  (webr x y t$
                   (f2cl-lib:array-slice cc-%data%
                                         double-float
                                         (ic)
                                         ((1 *))
                                         cc-%offset%)
                   (f2cl-lib:array-slice cc-%data%
                                         double-float
                                         ((+ (f2cl-lib:fref neq (1) ((1 1)))
                                             ic))
                                         ((1 *))
                                         cc-%offset%))
                  (setf idxu ns)
                  (if (= jx mx) (setf idxu (f2cl-lib:int-sub ns)))
                  (setf idxl ns)
                  (if (= jx 1) (setf idxl (f2cl-lib:int-sub ns)))
                  (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                                ((> i ns) nil)
                    (tagbody
                      (setf ici (f2cl-lib:int-sub (f2cl-lib:int-add ic i) 1))
                      (setf dcyli
                              (-
                               (f2cl-lib:fref cc-%data%
                                              (ici)
                                              ((1 *))
                                              cc-%offset%)
                               (f2cl-lib:fref cc-%data%
                                              ((f2cl-lib:int-sub ici idyl))
                                              ((1 *))
                                              cc-%offset%)))
                      (setf dcyui
                              (-
                               (f2cl-lib:fref cc-%data%
                                              ((f2cl-lib:int-add ici idyu))
                                              ((1 *))
                                              cc-%offset%)
                               (f2cl-lib:fref cc-%data%
                                              (ici)
                                              ((1 *))
                                              cc-%offset%)))
                      (setf dcxli
                              (-
                               (f2cl-lib:fref cc-%data%
                                              (ici)
                                              ((1 *))
                                              cc-%offset%)
                               (f2cl-lib:fref cc-%data%
                                              ((f2cl-lib:int-sub ici idxl))
                                              ((1 *))
                                              cc-%offset%)))
                      (setf dcxui
                              (-
                               (f2cl-lib:fref cc-%data%
                                              ((f2cl-lib:int-add ici idxu))
                                              ((1 *))
                                              cc-%offset%)
                               (f2cl-lib:fref cc-%data%
                                              (ici)
                                              ((1 *))
                                              cc-%offset%)))
                      (setf (f2cl-lib:fref cdot-%data%
                                           (ici)
                                           ((1 *))
                                           cdot-%offset%)
                              (+
                               (* (f2cl-lib:fref coy (i) ((1 20)))
                                  (- dcyui dcyli))
                               (* (f2cl-lib:fref cox (i) ((1 20)))
                                  (- dcxui dcxli))
                               (f2cl-lib:fref cc-%data%
                                              ((f2cl-lib:int-add
                                                (f2cl-lib:fref neq (1) ((1 1)))
                                                ici))
                                              ((1 *))
                                              cc-%offset%)))
                     label80))
                 label90))
             label100))
          (go end_label)
         end_label
          (return (values nil nil nil nil)))))))

(in-package #-gcl #:cl-user #+gcl "CL-USER")
#+#.(cl:if (cl:find-package '#:f2cl) '(and) '(or))
(eval-when (:load-toplevel :compile-toplevel :execute)
  (setf (gethash 'fortran-to-lisp::fweb fortran-to-lisp::*f2cl-function-info*)
          (fortran-to-lisp::make-f2cl-finfo
           :arg-types '((array fortran-to-lisp::integer4 (*)) (double-float)
                        (array double-float (*)) (array double-float (*)))
           :return-values '(nil nil nil nil)
           :calls '(fortran-to-lisp::webr))))

