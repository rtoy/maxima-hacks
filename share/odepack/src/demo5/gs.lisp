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


(defun gs (n hl0 z x)
  (declare (type (array double-float (*)) x z)
           (type (double-float) hl0)
           (type (array f2cl-lib:integer4 (*)) n))
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
    (symbol-macrolet ((cox pcom1-cox)
                      (coy pcom1-coy)
                      (ns (aref (pcom1-part-1 *pcom1-common-block*) 0))
                      (mx (aref (pcom1-part-1 *pcom1-common-block*) 1))
                      (my (aref (pcom1-part-1 *pcom1-common-block*) 2))
                      (mxns (aref (pcom1-part-1 *pcom1-common-block*) 3))
                      (itmax (aref (pcom2-part-1 *pcom2-common-block*) 3)))
      (f2cl-lib:with-multi-array-data
          ((n f2cl-lib:integer4 n-%data% n-%offset%)
           (z double-float z-%data% z-%offset%)
           (x double-float x-%data% x-%offset%))
        (prog ((jy 0) (jx 0) (iyoff 0) (iter 0) (ici 0) (ic 0) (i 0)
               (gamma2 (make-array 20 :element-type 'double-float))
               (gamma (make-array 20 :element-type 'double-float))
               (elamda 0.0d0)
               (cof1 (make-array 20 :element-type 'double-float))
               (beta2 (make-array 20 :element-type 'double-float))
               (beta (make-array 20 :element-type 'double-float)))
          (declare (type (array double-float (20)) beta gamma beta2 gamma2
                                                   cof1)
                   (type (double-float) elamda)
                   (type (f2cl-lib:integer4) i ic ici iter iyoff jx jy))
          (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                        ((> i ns) nil)
            (tagbody
              (setf elamda
                      (/ 1.0d0
                         (+ 1.0d0
                            (* 2.0d0
                               hl0
                               (+ (f2cl-lib:fref cox (i) ((1 20)))
                                  (f2cl-lib:fref coy (i) ((1 20))))))))
              (setf (f2cl-lib:fref beta (i) ((1 20)))
                      (* hl0 (f2cl-lib:fref cox (i) ((1 20))) elamda))
              (setf (f2cl-lib:fref beta2 (i) ((1 20)))
                      (* 2.0d0 (f2cl-lib:fref beta (i) ((1 20)))))
              (setf (f2cl-lib:fref gamma (i) ((1 20)))
                      (* hl0 (f2cl-lib:fref coy (i) ((1 20))) elamda))
              (setf (f2cl-lib:fref gamma2 (i) ((1 20)))
                      (* 2.0d0 (f2cl-lib:fref gamma (i) ((1 20)))))
              (setf (f2cl-lib:fref cof1 (i) ((1 20))) elamda)
             label10))
          (setf iter 1)
          (f2cl-lib:fdo (jy 1 (f2cl-lib:int-add jy 1))
                        ((> jy my) nil)
            (tagbody
              (setf iyoff (f2cl-lib:int-mul mxns (f2cl-lib:int-sub jy 1)))
              (f2cl-lib:fdo (jx 1 (f2cl-lib:int-add jx 1))
                            ((> jx mx) nil)
                (tagbody
                  (setf ic
                          (f2cl-lib:int-add iyoff
                                            (f2cl-lib:int-mul ns
                                                              (f2cl-lib:int-sub
                                                               jx
                                                               1))))
                  (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                                ((> i ns) nil)
                    (tagbody
                      (setf ici (f2cl-lib:int-add ic i))
                      (setf (f2cl-lib:fref x-%data% (ici) ((1 *)) x-%offset%)
                              (* (f2cl-lib:fref cof1 (i) ((1 20)))
                                 (f2cl-lib:fref z-%data%
                                                (ici)
                                                ((1 *))
                                                z-%offset%)))
                      (setf (f2cl-lib:fref z-%data% (ici) ((1 *)) z-%offset%)
                              0.0d0)
                     label30))
                 label40))
             label50))
          (go label160)
         label70
          (setf iter (f2cl-lib:int-add iter 1))
          (setf jy 1)
          (setf jx 1)
          (setf ic (f2cl-lib:int-mul ns (f2cl-lib:int-sub jx 1)))
          (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                        ((> i ns) nil)
            (tagbody
              (setf ici (f2cl-lib:int-add ic i))
             label75
              (setf (f2cl-lib:fref x-%data% (ici) ((1 *)) x-%offset%)
                      (+
                       (* (f2cl-lib:fref beta2 (i) ((1 20)))
                          (f2cl-lib:fref x-%data%
                                         ((f2cl-lib:int-add ici ns))
                                         ((1 *))
                                         x-%offset%))
                       (* (f2cl-lib:fref gamma2 (i) ((1 20)))
                          (f2cl-lib:fref x-%data%
                                         ((f2cl-lib:int-add ici mxns))
                                         ((1 *))
                                         x-%offset%))))))
          (f2cl-lib:fdo (jx 2 (f2cl-lib:int-add jx 1))
                        ((> jx (f2cl-lib:int-add mx (f2cl-lib:int-sub 1))) nil)
            (tagbody
              (setf ic (f2cl-lib:int-mul ns (f2cl-lib:int-sub jx 1)))
              (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                            ((> i ns) nil)
                (tagbody
                  (setf ici (f2cl-lib:int-add ic i))
                 label80
                  (setf (f2cl-lib:fref x-%data% (ici) ((1 *)) x-%offset%)
                          (+
                           (* (f2cl-lib:fref beta (i) ((1 20)))
                              (f2cl-lib:fref x-%data%
                                             ((f2cl-lib:int-add ici ns))
                                             ((1 *))
                                             x-%offset%))
                           (* (f2cl-lib:fref gamma2 (i) ((1 20)))
                              (f2cl-lib:fref x-%data%
                                             ((f2cl-lib:int-add ici mxns))
                                             ((1 *))
                                             x-%offset%))))))
             label85))
          (setf jx mx)
          (setf ic (f2cl-lib:int-mul ns (f2cl-lib:int-sub jx 1)))
          (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                        ((> i ns) nil)
            (tagbody
              (setf ici (f2cl-lib:int-add ic i))
             label90
              (setf (f2cl-lib:fref x-%data% (ici) ((1 *)) x-%offset%)
                      (* (f2cl-lib:fref gamma2 (i) ((1 20)))
                         (f2cl-lib:fref x-%data%
                                        ((f2cl-lib:int-add ici mxns))
                                        ((1 *))
                                        x-%offset%)))))
          (f2cl-lib:fdo (jy 2 (f2cl-lib:int-add jy 1))
                        ((> jy (f2cl-lib:int-add my (f2cl-lib:int-sub 1))) nil)
            (tagbody
              (setf iyoff (f2cl-lib:int-mul mxns (f2cl-lib:int-sub jy 1)))
              (setf jx 1)
              (setf ic iyoff)
              (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                            ((> i ns) nil)
                (tagbody
                  (setf ici (f2cl-lib:int-add ic i))
                 label95
                  (setf (f2cl-lib:fref x-%data% (ici) ((1 *)) x-%offset%)
                          (+
                           (* (f2cl-lib:fref beta2 (i) ((1 20)))
                              (f2cl-lib:fref x-%data%
                                             ((f2cl-lib:int-add ici ns))
                                             ((1 *))
                                             x-%offset%))
                           (* (f2cl-lib:fref gamma (i) ((1 20)))
                              (f2cl-lib:fref x-%data%
                                             ((f2cl-lib:int-add ici mxns))
                                             ((1 *))
                                             x-%offset%))))))
              (f2cl-lib:fdo (jx 2 (f2cl-lib:int-add jx 1))
                            ((> jx (f2cl-lib:int-add mx (f2cl-lib:int-sub 1)))
                             nil)
                (tagbody
                  (setf ic
                          (f2cl-lib:int-add iyoff
                                            (f2cl-lib:int-mul ns
                                                              (f2cl-lib:int-sub
                                                               jx
                                                               1))))
                  (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                                ((> i ns) nil)
                    (tagbody
                      (setf ici (f2cl-lib:int-add ic i))
                     label100
                      (setf (f2cl-lib:fref x-%data% (ici) ((1 *)) x-%offset%)
                              (+
                               (* (f2cl-lib:fref beta (i) ((1 20)))
                                  (f2cl-lib:fref x-%data%
                                                 ((f2cl-lib:int-add ici ns))
                                                 ((1 *))
                                                 x-%offset%))
                               (* (f2cl-lib:fref gamma (i) ((1 20)))
                                  (f2cl-lib:fref x-%data%
                                                 ((f2cl-lib:int-add ici mxns))
                                                 ((1 *))
                                                 x-%offset%))))))
                 label105))
              (setf jx mx)
              (setf ic
                      (f2cl-lib:int-add iyoff
                                        (f2cl-lib:int-mul ns
                                                          (f2cl-lib:int-sub jx
                                                                            1))))
              (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                            ((> i ns) nil)
                (tagbody
                  (setf ici (f2cl-lib:int-add ic i))
                 label110
                  (setf (f2cl-lib:fref x-%data% (ici) ((1 *)) x-%offset%)
                          (* (f2cl-lib:fref gamma (i) ((1 20)))
                             (f2cl-lib:fref x-%data%
                                            ((f2cl-lib:int-add ici mxns))
                                            ((1 *))
                                            x-%offset%)))))
             label115))
          (setf jy my)
          (setf iyoff (f2cl-lib:int-mul mxns (f2cl-lib:int-sub jy 1)))
          (setf jx 1)
          (setf ic iyoff)
          (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                        ((> i ns) nil)
            (tagbody
              (setf ici (f2cl-lib:int-add ic i))
             label120
              (setf (f2cl-lib:fref x-%data% (ici) ((1 *)) x-%offset%)
                      (* (f2cl-lib:fref beta2 (i) ((1 20)))
                         (f2cl-lib:fref x-%data%
                                        ((f2cl-lib:int-add ici ns))
                                        ((1 *))
                                        x-%offset%)))))
          (f2cl-lib:fdo (jx 2 (f2cl-lib:int-add jx 1))
                        ((> jx (f2cl-lib:int-add mx (f2cl-lib:int-sub 1))) nil)
            (tagbody
              (setf ic
                      (f2cl-lib:int-add iyoff
                                        (f2cl-lib:int-mul ns
                                                          (f2cl-lib:int-sub jx
                                                                            1))))
              (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                            ((> i ns) nil)
                (tagbody
                  (setf ici (f2cl-lib:int-add ic i))
                 label125
                  (setf (f2cl-lib:fref x-%data% (ici) ((1 *)) x-%offset%)
                          (* (f2cl-lib:fref beta (i) ((1 20)))
                             (f2cl-lib:fref x-%data%
                                            ((f2cl-lib:int-add ici ns))
                                            ((1 *))
                                            x-%offset%)))))
             label130))
          (setf jx mx)
          (setf ic
                  (f2cl-lib:int-add iyoff
                                    (f2cl-lib:int-mul ns
                                                      (f2cl-lib:int-sub jx
                                                                        1))))
          (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                        ((> i ns) nil)
            (tagbody
              (setf ici (f2cl-lib:int-add ic i))
             label135
              (setf (f2cl-lib:fref x-%data% (ici) ((1 *)) x-%offset%) 0.0d0)))
         label160
          (setf jy 1)
          (f2cl-lib:fdo (jx 2 (f2cl-lib:int-add jx 1))
                        ((> jx (f2cl-lib:int-add mx (f2cl-lib:int-sub 1))) nil)
            (tagbody
              (setf ic (f2cl-lib:int-mul ns (f2cl-lib:int-sub jx 1)))
              (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                            ((> i ns) nil)
                (tagbody
                  (setf ici (f2cl-lib:int-add ic i))
                 label170
                  (setf (f2cl-lib:fref x-%data% (ici) ((1 *)) x-%offset%)
                          (+ (f2cl-lib:fref x-%data% (ici) ((1 *)) x-%offset%)
                             (* (f2cl-lib:fref beta (i) ((1 20)))
                                (f2cl-lib:fref x-%data%
                                               ((f2cl-lib:int-sub ici ns))
                                               ((1 *))
                                               x-%offset%))))))
             label175))
          (setf jx mx)
          (setf ic (f2cl-lib:int-mul ns (f2cl-lib:int-sub jx 1)))
          (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                        ((> i ns) nil)
            (tagbody
              (setf ici (f2cl-lib:int-add ic i))
             label180
              (setf (f2cl-lib:fref x-%data% (ici) ((1 *)) x-%offset%)
                      (+ (f2cl-lib:fref x-%data% (ici) ((1 *)) x-%offset%)
                         (* (f2cl-lib:fref beta2 (i) ((1 20)))
                            (f2cl-lib:fref x-%data%
                                           ((f2cl-lib:int-sub ici ns))
                                           ((1 *))
                                           x-%offset%))))))
          (f2cl-lib:fdo (jy 2 (f2cl-lib:int-add jy 1))
                        ((> jy (f2cl-lib:int-add my (f2cl-lib:int-sub 1))) nil)
            (tagbody
              (setf iyoff (f2cl-lib:int-mul mxns (f2cl-lib:int-sub jy 1)))
              (setf jx 1)
              (setf ic iyoff)
              (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                            ((> i ns) nil)
                (tagbody
                  (setf ici (f2cl-lib:int-add ic i))
                 label185
                  (setf (f2cl-lib:fref x-%data% (ici) ((1 *)) x-%offset%)
                          (+ (f2cl-lib:fref x-%data% (ici) ((1 *)) x-%offset%)
                             (* (f2cl-lib:fref gamma (i) ((1 20)))
                                (f2cl-lib:fref x-%data%
                                               ((f2cl-lib:int-sub ici mxns))
                                               ((1 *))
                                               x-%offset%))))))
              (f2cl-lib:fdo (jx 2 (f2cl-lib:int-add jx 1))
                            ((> jx (f2cl-lib:int-add mx (f2cl-lib:int-sub 1)))
                             nil)
                (tagbody
                  (setf ic
                          (f2cl-lib:int-add iyoff
                                            (f2cl-lib:int-mul ns
                                                              (f2cl-lib:int-sub
                                                               jx
                                                               1))))
                  (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                                ((> i ns) nil)
                    (tagbody
                      (setf ici (f2cl-lib:int-add ic i))
                      (setf (f2cl-lib:fref x-%data% (ici) ((1 *)) x-%offset%)
                              (+
                               (f2cl-lib:fref x-%data%
                                              (ici)
                                              ((1 *))
                                              x-%offset%)
                               (* (f2cl-lib:fref beta (i) ((1 20)))
                                  (f2cl-lib:fref x-%data%
                                                 ((f2cl-lib:int-sub ici ns))
                                                 ((1 *))
                                                 x-%offset%))
                               (* (f2cl-lib:fref gamma (i) ((1 20)))
                                  (f2cl-lib:fref x-%data%
                                                 ((f2cl-lib:int-sub ici mxns))
                                                 ((1 *))
                                                 x-%offset%))))
                     label195))
                 label200))
              (setf jx mx)
              (setf ic
                      (f2cl-lib:int-add iyoff
                                        (f2cl-lib:int-mul ns
                                                          (f2cl-lib:int-sub jx
                                                                            1))))
              (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                            ((> i ns) nil)
                (tagbody
                  (setf ici (f2cl-lib:int-add ic i))
                  (setf (f2cl-lib:fref x-%data% (ici) ((1 *)) x-%offset%)
                          (+ (f2cl-lib:fref x-%data% (ici) ((1 *)) x-%offset%)
                             (* (f2cl-lib:fref beta2 (i) ((1 20)))
                                (f2cl-lib:fref x-%data%
                                               ((f2cl-lib:int-sub ici ns))
                                               ((1 *))
                                               x-%offset%))
                             (* (f2cl-lib:fref gamma (i) ((1 20)))
                                (f2cl-lib:fref x-%data%
                                               ((f2cl-lib:int-sub ici mxns))
                                               ((1 *))
                                               x-%offset%))))
                 label205))
             label210))
          (setf jy my)
          (setf iyoff (f2cl-lib:int-mul mxns (f2cl-lib:int-sub jy 1)))
          (setf jx 1)
          (setf ic iyoff)
          (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                        ((> i ns) nil)
            (tagbody
              (setf ici (f2cl-lib:int-add ic i))
             label215
              (setf (f2cl-lib:fref x-%data% (ici) ((1 *)) x-%offset%)
                      (+ (f2cl-lib:fref x-%data% (ici) ((1 *)) x-%offset%)
                         (* (f2cl-lib:fref gamma2 (i) ((1 20)))
                            (f2cl-lib:fref x-%data%
                                           ((f2cl-lib:int-sub ici mxns))
                                           ((1 *))
                                           x-%offset%))))))
          (f2cl-lib:fdo (jx 2 (f2cl-lib:int-add jx 1))
                        ((> jx (f2cl-lib:int-add mx (f2cl-lib:int-sub 1))) nil)
            (tagbody
              (setf ic
                      (f2cl-lib:int-add iyoff
                                        (f2cl-lib:int-mul ns
                                                          (f2cl-lib:int-sub jx
                                                                            1))))
              (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                            ((> i ns) nil)
                (tagbody
                  (setf ici (f2cl-lib:int-add ic i))
                  (setf (f2cl-lib:fref x-%data% (ici) ((1 *)) x-%offset%)
                          (+ (f2cl-lib:fref x-%data% (ici) ((1 *)) x-%offset%)
                             (* (f2cl-lib:fref beta (i) ((1 20)))
                                (f2cl-lib:fref x-%data%
                                               ((f2cl-lib:int-sub ici ns))
                                               ((1 *))
                                               x-%offset%))
                             (* (f2cl-lib:fref gamma2 (i) ((1 20)))
                                (f2cl-lib:fref x-%data%
                                               ((f2cl-lib:int-sub ici mxns))
                                               ((1 *))
                                               x-%offset%))))
                 label220))
             label225))
          (setf jx mx)
          (setf ic
                  (f2cl-lib:int-add iyoff
                                    (f2cl-lib:int-mul ns
                                                      (f2cl-lib:int-sub jx
                                                                        1))))
          (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                        ((> i ns) nil)
            (tagbody
              (setf ici (f2cl-lib:int-add ic i))
              (setf (f2cl-lib:fref x-%data% (ici) ((1 *)) x-%offset%)
                      (+ (f2cl-lib:fref x-%data% (ici) ((1 *)) x-%offset%)
                         (* (f2cl-lib:fref beta2 (i) ((1 20)))
                            (f2cl-lib:fref x-%data%
                                           ((f2cl-lib:int-sub ici ns))
                                           ((1 *))
                                           x-%offset%))
                         (* (f2cl-lib:fref gamma2 (i) ((1 20)))
                            (f2cl-lib:fref x-%data%
                                           ((f2cl-lib:int-sub ici mxns))
                                           ((1 *))
                                           x-%offset%))))
             label230))
          (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                        ((> i (f2cl-lib:fref n (1) ((1 1)))) nil)
            (tagbody
             label300
              (setf (f2cl-lib:fref z-%data% (i) ((1 *)) z-%offset%)
                      (+ (f2cl-lib:fref z-%data% (i) ((1 *)) z-%offset%)
                         (f2cl-lib:fref x-%data% (i) ((1 *)) x-%offset%)))))
          (if (< iter itmax) (go label70))
          (go end_label)
         end_label
          (return (values nil nil nil nil)))))))

(in-package #-gcl #:cl-user #+gcl "CL-USER")
#+#.(cl:if (cl:find-package '#:f2cl) '(and) '(or))
(eval-when (:load-toplevel :compile-toplevel :execute)
  (setf (gethash 'fortran-to-lisp::gs fortran-to-lisp::*f2cl-function-info*)
          (fortran-to-lisp::make-f2cl-finfo
           :arg-types '((array fortran-to-lisp::integer4 (*)) (double-float)
                        (array double-float (*)) (array double-float (*)))
           :return-values '(nil nil nil nil)
           :calls 'nil)))

