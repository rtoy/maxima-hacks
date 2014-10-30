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


(defun setpar ()
  (let ((pcom1-acoef
         (make-array 400
                     :element-type 'double-float
                     :displaced-to (pcom1-part-0 *pcom1-common-block*)
                     :displaced-index-offset 2))
        (pcom1-bcoef
         (make-array 20
                     :element-type 'double-float
                     :displaced-to (pcom1-part-0 *pcom1-common-block*)
                     :displaced-index-offset 402))
        (pcom1-diff
         (make-array 20
                     :element-type 'double-float
                     :displaced-to (pcom1-part-0 *pcom1-common-block*)
                     :displaced-index-offset 425)))
    (symbol-macrolet ((aa (aref (pcom0-part-0 *pcom0-common-block*) 0))
                      (ee (aref (pcom0-part-0 *pcom0-common-block*) 1))
                      (gg (aref (pcom0-part-0 *pcom0-common-block*) 2))
                      (bb (aref (pcom0-part-0 *pcom0-common-block*) 3))
                      (dprey (aref (pcom0-part-0 *pcom0-common-block*) 4))
                      (dpred (aref (pcom0-part-0 *pcom0-common-block*) 5))
                      (acoef pcom1-acoef)
                      (bcoef pcom1-bcoef)
                      (alph (aref (pcom1-part-0 *pcom1-common-block*) 424))
                      (diff pcom1-diff)
                      (ns (aref (pcom1-part-1 *pcom1-common-block*) 0))
                      (mx (aref (pcom1-part-1 *pcom1-common-block*) 1))
                      (my (aref (pcom1-part-1 *pcom1-common-block*) 2)))
      (prog ((np 0) (j 0) (i 0))
        (declare (type (f2cl-lib:integer4) i j np))
        (setf np 3)
        (setf mx 6)
        (setf my 6)
        (setf aa 1.0d0)
        (setf ee 10000.0d0)
        (setf gg 5.0d-7)
        (setf bb 1.0d0)
        (setf dprey 1.0d0)
        (setf dpred 0.5d0)
        (setf alph 1.0d0)
        (setf ns (f2cl-lib:int-mul 2 np))
        (f2cl-lib:fdo (j 1 (f2cl-lib:int-add j 1))
                      ((> j np) nil)
          (tagbody
            (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                          ((> i np) nil)
              (tagbody
                (setf (f2cl-lib:fref acoef
                                     ((f2cl-lib:int-add np i) j)
                                     ((1 20) (1 20)))
                        ee)
                (setf (f2cl-lib:fref acoef
                                     (i (f2cl-lib:int-add np j))
                                     ((1 20) (1 20)))
                        (- gg))
               label60))
            (setf (f2cl-lib:fref acoef (j j) ((1 20) (1 20))) (- aa))
            (setf (f2cl-lib:fref acoef
                                 ((f2cl-lib:int-add np j)
                                  (f2cl-lib:int-add np j))
                                 ((1 20) (1 20)))
                    (- aa))
            (setf (f2cl-lib:fref bcoef (j) ((1 20))) bb)
            (setf (f2cl-lib:fref bcoef ((f2cl-lib:int-add np j)) ((1 20)))
                    (- bb))
            (setf (f2cl-lib:fref diff (j) ((1 20))) dprey)
            (setf (f2cl-lib:fref diff ((f2cl-lib:int-add np j)) ((1 20)))
                    dpred)
           label70))
        (go end_label)
       end_label
        (return (values))))))

(in-package #-gcl #:cl-user #+gcl "CL-USER")
#+#.(cl:if (cl:find-package '#:f2cl) '(and) '(or))
(eval-when (:load-toplevel :compile-toplevel :execute)
  (setf (gethash 'fortran-to-lisp::setpar
                 fortran-to-lisp::*f2cl-function-info*)
          (fortran-to-lisp::make-f2cl-finfo :arg-types 'nil
                                            :return-values 'nil
                                            :calls 'nil)))

