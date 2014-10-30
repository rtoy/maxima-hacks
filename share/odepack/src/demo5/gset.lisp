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


(defun gset (m ng jg jig jr)
  (declare (type (array f2cl-lib:integer4 (*)) jr jig jg)
           (type (f2cl-lib:integer4) ng m))
  (f2cl-lib:with-multi-array-data
      ((jg f2cl-lib:integer4 jg-%data% jg-%offset%)
       (jig f2cl-lib:integer4 jig-%data% jig-%offset%)
       (jr f2cl-lib:integer4 jr-%data% jr-%offset%))
    (prog ((ig 0) (j 0) (len1 0) (mper 0) (ngm1 0))
      (declare (type (f2cl-lib:integer4) ngm1 mper len1 j ig))
      (setf mper (the f2cl-lib:integer4 (truncate m ng)))
      (f2cl-lib:fdo (ig 1 (f2cl-lib:int-add ig 1))
                    ((> ig ng) nil)
        (tagbody
         label10
          (setf (f2cl-lib:fref jg-%data% (ig) ((1 *)) jg-%offset%)
                  (f2cl-lib:int-add 1
                                    (f2cl-lib:int-mul (f2cl-lib:int-sub ig 1)
                                                      mper)))))
      (setf (f2cl-lib:fref jg-%data%
                           ((f2cl-lib:int-add ng 1))
                           ((1 *))
                           jg-%offset%)
              (f2cl-lib:int-add m 1))
      (setf ngm1 (f2cl-lib:int-sub ng 1))
      (setf len1 (f2cl-lib:int-mul ngm1 mper))
      (f2cl-lib:fdo (j 1 (f2cl-lib:int-add j 1))
                    ((> j len1) nil)
        (tagbody
         label20
          (setf (f2cl-lib:fref jig-%data% (j) ((1 *)) jig-%offset%)
                  (+ 1 (the f2cl-lib:integer4 (truncate (- j 1) mper))))))
      (setf len1 (f2cl-lib:int-add len1 1))
      (f2cl-lib:fdo (j len1 (f2cl-lib:int-add j 1))
                    ((> j m) nil)
        (tagbody
         label25
          (setf (f2cl-lib:fref jig-%data% (j) ((1 *)) jig-%offset%) ng)))
      (f2cl-lib:fdo (ig 1 (f2cl-lib:int-add ig 1))
                    ((> ig ngm1) nil)
        (tagbody
         label30
          (setf (f2cl-lib:fref jr-%data% (ig) ((1 *)) jr-%offset%)
                  (f2cl-lib:int (+ 0.5d0 (* (- ig 0.5d0) mper))))))
      (setf (f2cl-lib:fref jr-%data% (ng) ((1 *)) jr-%offset%)
              (f2cl-lib:int
               (* 0.5d0 (f2cl-lib:int-add 1 (f2cl-lib:int-mul ngm1 mper) m))))
      (go end_label)
     end_label
      (return (values nil nil nil nil nil)))))

(in-package #-gcl #:cl-user #+gcl "CL-USER")
#+#.(cl:if (cl:find-package '#:f2cl) '(and) '(or))
(eval-when (:load-toplevel :compile-toplevel :execute)
  (setf (gethash 'fortran-to-lisp::gset fortran-to-lisp::*f2cl-function-info*)
          (fortran-to-lisp::make-f2cl-finfo
           :arg-types '((fortran-to-lisp::integer4) (fortran-to-lisp::integer4)
                        (array fortran-to-lisp::integer4 (*))
                        (array fortran-to-lisp::integer4 (*))
                        (array fortran-to-lisp::integer4 (*)))
           :return-values '(nil nil nil nil nil)
           :calls 'nil)))

