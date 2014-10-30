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


(defun jacbg (f neq t$ cc ccsv rewt f0 f1 hl0 bd ipbd ier)
  (declare (type (f2cl-lib:integer4) ier)
           (type (array f2cl-lib:integer4 (*)) ipbd)
           (type (array double-float (*)) bd f1 f0 rewt ccsv cc)
           (type (double-float) hl0 t$)
           (type (array f2cl-lib:integer4 (*)) neq))
  (let ((pcom3-jxr
         (make-array 20
                     :element-type 'f2cl-lib:integer4
                     :displaced-to (pcom3-part-0 *pcom3-common-block*)
                     :displaced-index-offset 148))
        (pcom3-jyr
         (make-array 20
                     :element-type 'f2cl-lib:integer4
                     :displaced-to (pcom3-part-0 *pcom3-common-block*)
                     :displaced-index-offset 168)))
    (symbol-macrolet ((uround (aref (pcom2-part-0 *pcom2-common-block*) 0))
                      (srur (aref (pcom2-part-0 *pcom2-common-block*) 1))
                      (mp (aref (pcom2-part-1 *pcom2-common-block*) 0))
                      (mpsq (aref (pcom2-part-1 *pcom2-common-block*) 2))
                      (ngx (aref (pcom3-part-0 *pcom3-common-block*) 2))
                      (ngy (aref (pcom3-part-0 *pcom3-common-block*) 3))
                      (ngrp (aref (pcom3-part-0 *pcom3-common-block*) 4))
                      (mxmp (aref (pcom3-part-0 *pcom3-common-block*) 5))
                      (jxr pcom3-jxr)
                      (jyr pcom3-jyr))
      (f2cl-lib:with-multi-array-data
          ((neq f2cl-lib:integer4 neq-%data% neq-%offset%)
           (cc double-float cc-%data% cc-%offset%)
           (ccsv double-float ccsv-%data% ccsv-%offset%)
           (rewt double-float rewt-%data% rewt-%offset%)
           (f0 double-float f0-%data% f0-%offset%)
           (f1 double-float f1-%data% f1-%offset%)
           (bd double-float bd-%data% bd-%offset%)
           (ipbd f2cl-lib:integer4 ipbd-%data% ipbd-%offset%))
        (prog ((n 0) (jy 0) (jx 0) (jj 0) (j 0) (iip 0) (igy 0) (igx 0) (ig 0)
               (if00 0) (if0 0) (idiag 0) (ibd 0) (i 0) (r0 0.0d0) (r 0.0d0)
               (fac 0.0d0))
          (declare (type (double-float) fac r r0)
                   (type (f2cl-lib:integer4) i ibd idiag if0 if00 ig igx igy
                                             iip j jj jx jy n))
          (setf n (f2cl-lib:fref neq-%data% (1) ((1 1)) neq-%offset%))
         label200
          (setf fac (dvnorm n f0 rewt))
          (setf r0 (* 1000.0d0 (abs hl0) uround n fac))
          (if (= r0 0.0d0) (setf r0 1.0d0))
          (setf ibd 0)
          (f2cl-lib:fdo (igy 1 (f2cl-lib:int-add igy 1))
                        ((> igy ngy) nil)
            (tagbody
              (setf jy (f2cl-lib:fref jyr (igy) ((1 20))))
              (setf if00 (f2cl-lib:int-mul (f2cl-lib:int-sub jy 1) mxmp))
              (f2cl-lib:fdo (igx 1 (f2cl-lib:int-add igx 1))
                            ((> igx ngx) nil)
                (tagbody
                  (setf jx (f2cl-lib:fref jxr (igx) ((1 20))))
                  (setf if0
                          (f2cl-lib:int-add if00
                                            (f2cl-lib:int-mul
                                             (f2cl-lib:int-sub jx 1)
                                             mp)))
                  (f2cl-lib:fdo (j 1 (f2cl-lib:int-add j 1))
                                ((> j mp) nil)
                    (tagbody
                      (setf jj (f2cl-lib:int-add if0 j))
                      (setf r
                              (max
                               (* srur
                                  (abs
                                   (f2cl-lib:fref cc-%data%
                                                  (jj)
                                                  ((1 *))
                                                  cc-%offset%)))
                               (/ r0
                                  (f2cl-lib:fref rewt-%data%
                                                 (jj)
                                                 ((1 *))
                                                 rewt-%offset%))))
                      (setf (f2cl-lib:fref cc-%data% (jj) ((1 *)) cc-%offset%)
                              (+
                               (f2cl-lib:fref cc-%data%
                                              (jj)
                                              ((1 *))
                                              cc-%offset%)
                               r))
                      (setf fac (/ (- hl0) r))
                      (fbg (aref neq 0) t$ cc jx jy f1)
                      (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                                    ((> i mp) nil)
                        (tagbody
                         label210
                          (setf (f2cl-lib:fref bd-%data%
                                               ((f2cl-lib:int-add ibd i))
                                               ((1 *))
                                               bd-%offset%)
                                  (*
                                   (-
                                    (f2cl-lib:fref f1-%data%
                                                   (i)
                                                   ((1 *))
                                                   f1-%offset%)
                                    (f2cl-lib:fref cc-%data%
                                                   ((f2cl-lib:int-add
                                                     (f2cl-lib:fref neq
                                                                    (1)
                                                                    ((1 1)))
                                                     if0
                                                     i))
                                                   ((1 *))
                                                   cc-%offset%))
                                   fac))))
                      (setf (f2cl-lib:fref cc-%data% (jj) ((1 *)) cc-%offset%)
                              (f2cl-lib:fref ccsv-%data%
                                             (jj)
                                             ((1 *))
                                             ccsv-%offset%))
                      (setf ibd (f2cl-lib:int-add ibd mp))
                     label220))
                 label230))
             label240))
         label260
          (setf ibd 1)
          (setf iip 1)
          (f2cl-lib:fdo (ig 1 (f2cl-lib:int-add ig 1))
                        ((> ig ngrp) nil)
            (tagbody
              (setf idiag ibd)
              (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                            ((> i mp) nil)
                (tagbody
                  (setf (f2cl-lib:fref bd-%data% (idiag) ((1 *)) bd-%offset%)
                          (+
                           (f2cl-lib:fref bd-%data%
                                          (idiag)
                                          ((1 *))
                                          bd-%offset%)
                           1.0d0))
                 label270
                  (setf idiag
                          (f2cl-lib:int-add idiag (f2cl-lib:int-add mp 1)))))
              (multiple-value-bind (var-0 var-1 var-2 var-3 var-4)
                  (dgefa
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
                   ier)
                (declare (ignore var-0 var-1 var-2 var-3))
                (setf ier var-4))
              (if (/= ier 0) (go label290))
              (setf ibd (f2cl-lib:int-add ibd mpsq))
              (setf iip (f2cl-lib:int-add iip mp))
             label280))
         label290
          (go end_label)
         end_label
          (return (values nil nil nil nil nil nil nil nil nil nil nil ier)))))))

(in-package #-gcl #:cl-user #+gcl "CL-USER")
#+#.(cl:if (cl:find-package '#:f2cl) '(and) '(or))
(eval-when (:load-toplevel :compile-toplevel :execute)
  (setf (gethash 'fortran-to-lisp::jacbg fortran-to-lisp::*f2cl-function-info*)
          (fortran-to-lisp::make-f2cl-finfo
           :arg-types '(t (array fortran-to-lisp::integer4 (*)) (double-float)
                        (array double-float (*)) (array double-float (*))
                        (array double-float (*)) (array double-float (*))
                        (array double-float (*)) (double-float)
                        (array double-float (*))
                        (array fortran-to-lisp::integer4 (*))
                        (fortran-to-lisp::integer4))
           :return-values '(nil nil nil nil nil nil nil nil nil nil nil
                            fortran-to-lisp::ier)
           :calls '(fortran-to-lisp::dgefa fortran-to-lisp::fbg
                    fortran-to-lisp::dvnorm))))

