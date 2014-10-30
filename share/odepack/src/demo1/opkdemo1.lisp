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


(let ((lout 6) (tout1 1.39283880203d0) (dtout 2.214773875d0))
  (declare (type (f2cl-lib:integer4) lout) (type (double-float) tout1 dtout))
  (defun opkdemo1 ()
    (prog ((y (make-array 25 :element-type 'double-float))
           (rwork (make-array 697 :element-type 'double-float))
           (iwork (make-array 45 :element-type 'f2cl-lib:integer4))
           (rtol (make-array 1 :element-type 'double-float))
           (atol (make-array 1 :element-type 'double-float)) (er 0.0d0)
           (erm 0.0d0) (ero 0.0d0) (hu 0.0d0) (tout 0.0d0) (i 0) (iopar 0)
           (iopt 0) (iout 0) (istate 0) (itask 0) (itol 0) (leniw 0) (lenrw 0)
           (liw 0) (lrw 0) (mband 0) (meth 0) (mf 0) (miter 0) (ml 0) (mu 0)
           (neq (make-array 1 :element-type 'f2cl-lib:integer4)) (nerr 0)
           (nfe 0) (nfea 0) (nje 0) (nout 0) (nqu 0) (nst 0) (t$ 0.0d0))
      (declare (type (array f2cl-lib:integer4 (1)) neq)
               (type (array f2cl-lib:integer4 (45)) iwork)
               (type (f2cl-lib:integer4) nst nqu nout nje nfea nfe nerr mu ml
                                         miter mf meth mband lrw liw lenrw
                                         leniw itol itask istate iout iopt
                                         iopar i)
               (type (array double-float (25)) y)
               (type (array double-float (697)) rwork)
               (type (double-float) t$ tout hu ero erm er)
               (type (array double-float (1)) rtol atol))
      (setf nerr 0)
      (setf itol 1)
      (setf (f2cl-lib:fref rtol (1) ((1 1))) 0.0d0)
      (setf (f2cl-lib:fref atol (1) ((1 1))) 1.0d-6)
      (setf lrw 697)
      (setf liw 45)
      (setf iopt 0)
      (setf (f2cl-lib:fref neq (1) ((1 1))) 2)
      (setf nout 4)
      (f2cl-lib:fformat lout
                        ("~%" " Demonstration program for DLSODE package" "~%"
                         "~%" "~%" " Problem 1:  Van der Pol oscillator:" "~%"
                         "  xdotdot - 3*(1 - x**2)*xdot + x = 0, "
                         "   x(0) = 2, xdot(0) = 0" "~%" " neq =" 1 (("~2D"))
                         "~%" " itol =" 1 (("~3D")) "   rtol =" 1
                         (("~10,1,2,0,'*,,'DE")) "   atol =" 1
                         (("~10,1,2,0,'*,,'DE")) "~%" "~%" "~%")
                        (f2cl-lib:fref neq (1) ((1 1)))
                        itol
                        (f2cl-lib:fref rtol (1) ((1 1)))
                        (f2cl-lib:fref atol (1) ((1 1))))
      (f2cl-lib:fdo (meth 1 (f2cl-lib:int-add meth 1))
                    ((> meth 2) nil)
        (tagbody
          (f2cl-lib:fdo (miter 0 (f2cl-lib:int-add miter 1))
                        ((> miter 3) nil)
            (tagbody
              (setf mf (f2cl-lib:int-add (f2cl-lib:int-mul 10 meth) miter))
              (f2cl-lib:fformat lout
                                ("~%" "~%" "~%" " Solution with mf =" 1
                                 (("~3D")) "~%" "~%" "~5@T"
                                 "t               x               xdot       nq      h"
                                 "~%" "~%" "~%")
                                mf)
              (setf t$ 0.0d0)
              (setf (f2cl-lib:fref y (1) ((1 25))) 2.0d0)
              (setf (f2cl-lib:fref y (2) ((1 25))) 0.0d0)
              (setf itask 1)
              (setf istate 1)
              (setf tout tout1)
              (setf ero 0.0d0)
              (f2cl-lib:fdo (iout 1 (f2cl-lib:int-add iout 1))
                            ((> iout nout) nil)
                (tagbody
                  (multiple-value-bind
                        (var-0 var-1 var-2 var-3 var-4 var-5 var-6 var-7 var-8
                         var-9 var-10 var-11 var-12 var-13 var-14 var-15
                         var-16)
                      (dlsode #'f1 neq y t$ tout itol rtol atol itask istate
                       iopt rwork lrw iwork liw #'jac1 mf)
                    (declare (ignore var-0 var-1 var-2 var-4 var-5 var-6 var-7
                                     var-8 var-10 var-11 var-12 var-13 var-14
                                     var-15 var-16))
                    (setf t$ var-3)
                    (setf istate var-9))
                  (setf hu (f2cl-lib:fref rwork (11) ((1 697))))
                  (setf nqu (f2cl-lib:fref iwork (14) ((1 45))))
                  (f2cl-lib:fformat lout
                                    (1 (("~15,5,2,0,'*,,'DE")) 1
                                     (("~16,5,2,0,'*,,'DE")) 1
                                     (("~14,3,2,0,'*,,'DE")) 1 (("~5D")) 1
                                     (("~14,3,2,0,'*,,'DE")) "~%")
                                    t$
                                    (f2cl-lib:fref y (1) ((1 25)))
                                    (f2cl-lib:fref y (2) ((1 25)))
                                    nqu
                                    hu)
                  (if (< istate 0) (go label175))
                  (setf iopar
                          (- iout
                             (* 2 (the f2cl-lib:integer4 (truncate iout 2)))))
                  (if (/= iopar 0) (go label170))
                  (setf er
                          (/ (abs (f2cl-lib:fref y (1) ((1 25))))
                             (f2cl-lib:fref atol (1) ((1 1)))))
                  (setf ero (max ero er))
                  (cond
                    ((> er 1000.0d0)
                     (f2cl-lib:fformat lout
                                       ("~%" "~%"
                                        " Warning: error exceeds 1000 * tolerance"
                                        "~%" "~%" "~%"))
                     (setf nerr (f2cl-lib:int-add nerr 1))))
                 label170
                  (setf tout (+ tout dtout))))
             label175
              (if (< istate 0) (setf nerr (f2cl-lib:int-add nerr 1)))
              (setf nst (f2cl-lib:fref iwork (11) ((1 45))))
              (setf nfe (f2cl-lib:fref iwork (12) ((1 45))))
              (setf nje (f2cl-lib:fref iwork (13) ((1 45))))
              (setf lenrw (f2cl-lib:fref iwork (17) ((1 45))))
              (setf leniw (f2cl-lib:fref iwork (18) ((1 45))))
              (setf nfea nfe)
              (if (= miter 2)
                  (setf nfea
                          (f2cl-lib:int-sub nfe
                                            (f2cl-lib:int-mul
                                             (f2cl-lib:fref neq (1) ((1 1)))
                                             nje))))
              (if (= miter 3) (setf nfea (f2cl-lib:int-sub nfe nje)))
              (f2cl-lib:fformat lout
                                ("~%" "~%" " Final statistics for this run:"
                                 "~%" " rwork size =" 1 (("~4D"))
                                 "   iwork size =" 1 (("~4D")) "~%"
                                 " number of steps =" 1 (("~5D")) "~%"
                                 " number of f-s   =" 1 (("~5D")) "~%"
                                 " (excluding J-s) =" 1 (("~5D")) "~%"
                                 " number of J-s   =" 1 (("~5D")) "~%"
                                 " error overrun =" 1 (("~10,2,2,0,'*,,'DE"))
                                 "~%")
                                lenrw
                                leniw
                                nst
                                nfe
                                nfea
                                nje
                                ero)
             label190))
         label195))
      (setf (f2cl-lib:fref neq (1) ((1 1))) 25)
      (setf ml 5)
      (setf mu 0)
      (setf (f2cl-lib:fref iwork (1) ((1 45))) ml)
      (setf (f2cl-lib:fref iwork (2) ((1 45))) mu)
      (setf mband (f2cl-lib:int-add ml mu 1))
      (setf nout 5)
      (f2cl-lib:fformat lout
                        ("~%" "~%" "~%" 70 ("-") "~%" "~%" "~%"
                         " Problem 2: ydot = A * y , where"
                         "  A is a banded lower triangular matrix" "~%" "~12@T"
                         "derived from 2-D advection PDE" "~%" " neq =" 1
                         (("~3D")) "   ml =" 1 (("~2D")) "   mu =" 1 (("~2D"))
                         "~%" " itol =" 1 (("~3D")) "   rtol =" 1
                         (("~10,1,2,0,'*,,'DE")) "   atol =" 1
                         (("~10,1,2,0,'*,,'DE")) "~%" "~%" "~%")
                        (f2cl-lib:fref neq (1) ((1 1)))
                        ml
                        mu
                        itol
                        (f2cl-lib:fref rtol (1) ((1 1)))
                        (f2cl-lib:fref atol (1) ((1 1))))
      (f2cl-lib:fdo (meth 1 (f2cl-lib:int-add meth 1))
                    ((> meth 2) nil)
        (tagbody
          (f2cl-lib:fdo (miter 0 (f2cl-lib:int-add miter 1))
                        ((> miter 5) nil)
            (tagbody
              (if (or (= miter 1) (= miter 2)) (go label290))
              (setf mf (f2cl-lib:int-add (f2cl-lib:int-mul 10 meth) miter))
              (f2cl-lib:fformat lout
                                ("~%" "~%" "~%" " Solution with mf =" 1
                                 (("~3D")) "~%" "~%" "~5@T"
                                 "t             max.err.     nq      h" "~%"
                                 "~%" "~%")
                                mf)
              (setf t$ 0.0d0)
              (f2cl-lib:fdo (i 2 (f2cl-lib:int-add i 1))
                            ((> i (f2cl-lib:fref neq (1) ((1 1)))) nil)
                (tagbody label230 (setf (f2cl-lib:fref y (i) ((1 25))) 0.0d0)))
              (setf (f2cl-lib:fref y (1) ((1 25))) 1.0d0)
              (setf itask 1)
              (setf istate 1)
              (setf tout 0.01d0)
              (setf ero 0.0d0)
              (f2cl-lib:fdo (iout 1 (f2cl-lib:int-add iout 1))
                            ((> iout nout) nil)
                (tagbody
                  (multiple-value-bind
                        (var-0 var-1 var-2 var-3 var-4 var-5 var-6 var-7 var-8
                         var-9 var-10 var-11 var-12 var-13 var-14 var-15
                         var-16)
                      (dlsode #'f2 neq y t$ tout itol rtol atol itask istate
                       iopt rwork lrw iwork liw #'jac2 mf)
                    (declare (ignore var-0 var-1 var-2 var-4 var-5 var-6 var-7
                                     var-8 var-10 var-11 var-12 var-13 var-14
                                     var-15 var-16))
                    (setf t$ var-3)
                    (setf istate var-9))
                  (multiple-value-bind (var-0 var-1 var-2)
                      (edit2 y t$ erm)
                    (declare (ignore var-0))
                    (when var-1
                      (setf t$ var-1))
                    (when var-2
                      (setf erm var-2)))
                  (setf hu (f2cl-lib:fref rwork (11) ((1 697))))
                  (setf nqu (f2cl-lib:fref iwork (14) ((1 45))))
                  (f2cl-lib:fformat lout
                                    (1 (("~15,5,2,0,'*,,'DE")) 1
                                     (("~14,3,2,0,'*,,'DE")) 1 (("~5D")) 1
                                     (("~14,3,2,0,'*,,'DE")) "~%")
                                    t$
                                    erm
                                    nqu
                                    hu)
                  (if (< istate 0) (go label275))
                  (setf er (/ erm (f2cl-lib:fref atol (1) ((1 1)))))
                  (setf ero (max ero er))
                  (cond
                    ((> er 1000.0d0)
                     (f2cl-lib:fformat lout
                                       ("~%" "~%"
                                        " Warning: error exceeds 1000 * tolerance"
                                        "~%" "~%" "~%"))
                     (setf nerr (f2cl-lib:int-add nerr 1))))
                 label270
                  (setf tout (* tout 10.0d0))))
             label275
              (if (< istate 0) (setf nerr (f2cl-lib:int-add nerr 1)))
              (setf nst (f2cl-lib:fref iwork (11) ((1 45))))
              (setf nfe (f2cl-lib:fref iwork (12) ((1 45))))
              (setf nje (f2cl-lib:fref iwork (13) ((1 45))))
              (setf lenrw (f2cl-lib:fref iwork (17) ((1 45))))
              (setf leniw (f2cl-lib:fref iwork (18) ((1 45))))
              (setf nfea nfe)
              (if (= miter 5)
                  (setf nfea
                          (f2cl-lib:int-sub nfe (f2cl-lib:int-mul mband nje))))
              (if (= miter 3) (setf nfea (f2cl-lib:int-sub nfe nje)))
              (f2cl-lib:fformat lout
                                ("~%" "~%" " Final statistics for this run:"
                                 "~%" " rwork size =" 1 (("~4D"))
                                 "   iwork size =" 1 (("~4D")) "~%"
                                 " number of steps =" 1 (("~5D")) "~%"
                                 " number of f-s   =" 1 (("~5D")) "~%"
                                 " (excluding J-s) =" 1 (("~5D")) "~%"
                                 " number of J-s   =" 1 (("~5D")) "~%"
                                 " error overrun =" 1 (("~10,2,2,0,'*,,'DE"))
                                 "~%")
                                lenrw
                                leniw
                                nst
                                nfe
                                nfea
                                nje
                                ero)
             label290))
         label295))
      (f2cl-lib:fformat lout
                        ("~%" "~%" "~%" "~%" " Number of errors encountered ="
                         1 (("~3D")) "~%")
                        nerr)
     end_label
      (return nil))))

(in-package #-gcl #:cl-user #+gcl "CL-USER")
#+#.(cl:if (cl:find-package '#:f2cl) '(and) '(or))
(eval-when (:load-toplevel :compile-toplevel :execute)
  (setf (gethash 'fortran-to-lisp::opkdemo1
                 fortran-to-lisp::*f2cl-function-info*)
          (fortran-to-lisp::make-f2cl-finfo :arg-types 'nil
                                            :return-values 'nil
                                            :calls '(fortran-to-lisp::dlsode))))

