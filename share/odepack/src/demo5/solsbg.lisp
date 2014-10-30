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


(defun solsbg (n t$ cc f0 wk hl0 bd ipbd v lr ier)
  (declare (type (f2cl-lib:integer4) ier lr)
           (type (array f2cl-lib:integer4 (*)) ipbd)
           (type (array double-float (*)) v bd wk f0 cc)
           (type (double-float) hl0 t$)
           (type (array f2cl-lib:integer4 (*)) n))
  (let ((pcom3-jigx
         (make-array 50
                     :element-type 'f2cl-lib:integer4
                     :displaced-to (pcom3-part-0 *pcom3-common-block*)
                     :displaced-index-offset 48))
        (pcom3-jigy
         (make-array 50
                     :element-type 'f2cl-lib:integer4
                     :displaced-to (pcom3-part-0 *pcom3-common-block*)
                     :displaced-index-offset 98)))
    (symbol-macrolet ((mp (aref (pcom2-part-1 *pcom2-common-block*) 0))
                      (mpsq (aref (pcom2-part-1 *pcom2-common-block*) 2))
                      (meshx (aref (pcom3-part-0 *pcom3-common-block*) 0))
                      (meshy (aref (pcom3-part-0 *pcom3-common-block*) 1))
                      (ngx (aref (pcom3-part-0 *pcom3-common-block*) 2))
                      (jigx pcom3-jigx)
                      (jigy pcom3-jigy))
      (f2cl-lib:with-multi-array-data
          ((n f2cl-lib:integer4 n-%data% n-%offset%)
           (cc double-float cc-%data% cc-%offset%)
           (f0 double-float f0-%data% f0-%offset%)
           (wk double-float wk-%data% wk-%offset%)
           (bd double-float bd-%data% bd-%offset%)
           (v double-float v-%data% v-%offset%)
           (ipbd f2cl-lib:integer4 ipbd-%data% ipbd-%offset%))
        (prog ((jy 0) (jx 0) (iv 0) (iip 0) (igy 0) (igx 0) (igm1 0) (ig0 0)
               (ibd 0))
          (declare (type (f2cl-lib:integer4) ibd ig0 igm1 igx igy iip iv jx
                                             jy))
          (setf ier 0)
          (if (or (= lr 0) (= lr 1) (= lr 3)) (gs n hl0 v wk))
          (cond
            ((or (= lr 0) (= lr 2) (= lr 3))
             (setf iv 1)
             (f2cl-lib:fdo (jy 1 (f2cl-lib:int-add jy 1))
                           ((> jy meshy) nil)
               (tagbody
                 (setf igy (f2cl-lib:fref jigy (jy) ((1 50))))
                 (setf ig0 (f2cl-lib:int-mul (f2cl-lib:int-sub igy 1) ngx))
                 (f2cl-lib:fdo (jx 1 (f2cl-lib:int-add jx 1))
                               ((> jx meshx) nil)
                   (tagbody
                     (setf igx (f2cl-lib:fref jigx (jx) ((1 50))))
                     (setf igm1
                             (f2cl-lib:int-add (f2cl-lib:int-sub igx 1) ig0))
                     (setf ibd
                             (f2cl-lib:int-add 1 (f2cl-lib:int-mul igm1 mpsq)))
                     (setf iip (f2cl-lib:int-add 1 (f2cl-lib:int-mul igm1 mp)))
                     (dgesl
                      (f2cl-lib:array-slice bd-%data%
                                            double-float
                                            (ibd)
                                            ((1 *))
                                            bd-%offset%)
                      mp mp
                      (f2cl-lib:array-slice ipbd-%data%
                                            f2cl-lib:integer4
                                            (iip)
                                            ((1 *))
                                            ipbd-%offset%)
                      (f2cl-lib:array-slice v-%data%
                                            double-float
                                            (iv)
                                            ((1 *))
                                            v-%offset%)
                      0)
                     (setf iv (f2cl-lib:int-add iv mp))
                    label10))
                label20))))
          (go end_label)
         end_label
          (return (values nil nil nil nil nil nil nil nil nil nil ier)))))))

(in-package #-gcl #:cl-user #+gcl "CL-USER")
#+#.(cl:if (cl:find-package '#:f2cl) '(and) '(or))
(eval-when (:load-toplevel :compile-toplevel :execute)
  (setf (gethash 'fortran-to-lisp::solsbg
                 fortran-to-lisp::*f2cl-function-info*)
          (fortran-to-lisp::make-f2cl-finfo
           :arg-types '((array fortran-to-lisp::integer4 (*)) (double-float)
                        (array double-float (*)) (array double-float (*))
                        (array double-float (*)) (double-float)
                        (array double-float (*))
                        (array fortran-to-lisp::integer4 (*))
                        (array double-float (*)) (fortran-to-lisp::integer4)
                        (fortran-to-lisp::integer4))
           :return-values '(nil nil nil nil nil nil nil nil nil nil
                            fortran-to-lisp::ier)
           :calls '(fortran-to-lisp::dgesl fortran-to-lisp::gs))))

