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
;;;           (:array-slicing t) (:declare-common t)
;;;           (:float-format single-float))

(in-package "ODEPACK")


(defstruct (pcom0
             (:predicate is-pcom0-p))
  (part-0 (make-array 6 :element-type '(double-float))
          :type (simple-array (double-float) (6))))


(defparameter *pcom0-common-block*
  (let* ()
    (declare (ignorable))
    (make-pcom0)))


(defstruct (pcom1
             (:predicate is-pcom1-p))
  (part-0 (make-array 485 :element-type '(double-float))
          :type (simple-array (double-float) (485)))
  (part-1 (make-array 4 :element-type '(f2cl-lib:integer4))
          :type (simple-array (f2cl-lib:integer4) (4))))


(defparameter *pcom1-common-block*
  (let* ()
    (declare (ignorable))
    (make-pcom1)))


(defstruct (pcom2
             (:predicate is-pcom2-p))
  (part-0 (make-array 2 :element-type '(double-float))
          :type (simple-array (double-float) (2)))
  (part-1 (make-array 4 :element-type '(f2cl-lib:integer4))
          :type (simple-array (f2cl-lib:integer4) (4))))


(defparameter *pcom2-common-block*
  (let* ()
    (declare (ignorable))
    (make-pcom2)))


(defstruct (pcom3
             (:predicate is-pcom3-p))
  (part-0 (make-array 188 :element-type '(f2cl-lib:integer4))
          :type (simple-array (f2cl-lib:integer4) (188))))


(defparameter *pcom3-common-block*
  (let* ()
    (declare (ignorable))
    (make-pcom3)))


(let ((lrw 5213) (liw 67))
  (declare (type (f2cl-lib:integer4) lrw liw))
  (defun opkdemo5 ()
    (let ((pcom1-diff
           (make-array 20
                       :element-type 'double-float
                       :displaced-to (pcom1-part-0 *pcom1-common-block*)
                       :displaced-index-offset 425))
          (pcom1-cox
           (make-array 20
                       :element-type 'double-float
                       :displaced-to (pcom1-part-0 *pcom1-common-block*)
                       :displaced-index-offset 445))
          (pcom1-coy
           (make-array 20
                       :element-type 'double-float
                       :displaced-to (pcom1-part-0 *pcom1-common-block*)
                       :displaced-index-offset 465))
          (pcom3-jgx
           (make-array 21
                       :element-type 'f2cl-lib:integer4
                       :displaced-to (pcom3-part-0 *pcom3-common-block*)
                       :displaced-index-offset 6))
          (pcom3-jgy
           (make-array 21
                       :element-type 'f2cl-lib:integer4
                       :displaced-to (pcom3-part-0 *pcom3-common-block*)
                       :displaced-index-offset 27))
          (pcom3-jigx
           (make-array 50
                       :element-type 'f2cl-lib:integer4
                       :displaced-to (pcom3-part-0 *pcom3-common-block*)
                       :displaced-index-offset 48))
          (pcom3-jigy
           (make-array 50
                       :element-type 'f2cl-lib:integer4
                       :displaced-to (pcom3-part-0 *pcom3-common-block*)
                       :displaced-index-offset 98))
          (pcom3-jxr
           (make-array 20
                       :element-type 'f2cl-lib:integer4
                       :displaced-to (pcom3-part-0 *pcom3-common-block*)
                       :displaced-index-offset 148))
          (pcom3-jyr
           (make-array 20
                       :element-type 'f2cl-lib:integer4
                       :displaced-to (pcom3-part-0 *pcom3-common-block*)
                       :displaced-index-offset 168)))
      (symbol-macrolet ((aa (aref (pcom0-part-0 *pcom0-common-block*) 0))
                        (ee (aref (pcom0-part-0 *pcom0-common-block*) 1))
                        (gg (aref (pcom0-part-0 *pcom0-common-block*) 2))
                        (bb (aref (pcom0-part-0 *pcom0-common-block*) 3))
                        (dprey (aref (pcom0-part-0 *pcom0-common-block*) 4))
                        (dpred (aref (pcom0-part-0 *pcom0-common-block*) 5))
                        (ax (aref (pcom1-part-0 *pcom1-common-block*) 0))
                        (ay (aref (pcom1-part-0 *pcom1-common-block*) 1))
                        (dx (aref (pcom1-part-0 *pcom1-common-block*) 422))
                        (dy (aref (pcom1-part-0 *pcom1-common-block*) 423))
                        (alph (aref (pcom1-part-0 *pcom1-common-block*) 424))
                        (diff pcom1-diff)
                        (cox pcom1-cox)
                        (coy pcom1-coy)
                        (ns (aref (pcom1-part-1 *pcom1-common-block*) 0))
                        (mx (aref (pcom1-part-1 *pcom1-common-block*) 1))
                        (my (aref (pcom1-part-1 *pcom1-common-block*) 2))
                        (mxns (aref (pcom1-part-1 *pcom1-common-block*) 3))
                        (uround (aref (pcom2-part-0 *pcom2-common-block*) 0))
                        (srur (aref (pcom2-part-0 *pcom2-common-block*) 1))
                        (mp (aref (pcom2-part-1 *pcom2-common-block*) 0))
                        (mq (aref (pcom2-part-1 *pcom2-common-block*) 1))
                        (mpsq (aref (pcom2-part-1 *pcom2-common-block*) 2))
                        (itmax (aref (pcom2-part-1 *pcom2-common-block*) 3))
                        (meshx (aref (pcom3-part-0 *pcom3-common-block*) 0))
                        (meshy (aref (pcom3-part-0 *pcom3-common-block*) 1))
                        (ngx (aref (pcom3-part-0 *pcom3-common-block*) 2))
                        (ngy (aref (pcom3-part-0 *pcom3-common-block*) 3))
                        (ngrp (aref (pcom3-part-0 *pcom3-common-block*) 4))
                        (mxmp (aref (pcom3-part-0 *pcom3-common-block*) 5))
                        (jgx pcom3-jgx)
                        (jgy pcom3-jgy)
                        (jigx pcom3-jigx)
                        (jigy pcom3-jigy)
                        (jxr pcom3-jxr)
                        (jyr pcom3-jyr))
        (prog ((nst 0) (nsdif 0) (nqu 0) (nps 0) (npe 0) (nout 0) (nnidif 0)
               (nni 0) (nlidif 0) (nli 0) (nfndif 0) (nfldif 0) (nfe 0)
               (neq (make-array 1 :element-type 'f2cl-lib:integer4)) (ncfn 0)
               (ncfl 0) (mf 0) (lenrw 0) (leniw 0) (jpre 0) (jacflg 0)
               (iwork (make-array 67 :element-type 'f2cl-lib:integer4))
               (itol 0) (itask 0) (istate 0) (iout 0) (iopt 0) (imod3 0) (i 0)
               (tout 0.0d0) (t$ 0.0d0)
               (rwork (make-array 5213 :element-type 'double-float))
               (rtol (make-array 1 :element-type 'double-float)) (rcfn 0.0d0)
               (rcfl 0.0d0) (hu 0.0d0)
               (cc (make-array 576 :element-type 'double-float))
               (atol (make-array 1 :element-type 'double-float)) (avdim 0.0d0))
          (declare (type (array double-float (576)) cc)
                   (type (array double-float (5213)) rwork)
                   (type (array f2cl-lib:integer4 (67)) iwork)
                   (type (array f2cl-lib:integer4 (1)) neq)
                   (type (array double-float (1)) atol rtol)
                   (type (double-float) avdim hu rcfl rcfn t$ tout)
                   (type (f2cl-lib:integer4) i imod3 iopt iout istate itask
                                             itol jacflg jpre leniw lenrw mf
                                             ncfl ncfn nfe nfldif nfndif nli
                                             nlidif nni nnidif nout npe nps nqu
                                             nsdif nst))
          (f2cl-lib::open-file :unit 6 :file "demout" :status "new")
          (f2cl-lib::open-file :unit 8 :file "ccout" :status "new")
          (setf ax 1.0d0)
          (setf ay 1.0d0)
          (setpar)
          (setf (f2cl-lib:fref neq (1) ((1 1))) (f2cl-lib:int-mul ns mx my))
          (setf mxns (f2cl-lib:int-mul mx ns))
          (setf dx (/ ax (f2cl-lib:int-sub mx 1)))
          (setf dy (/ ay (f2cl-lib:int-sub my 1)))
          (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                        ((> i ns) nil)
            (tagbody
              (setf (f2cl-lib:fref cox (i) ((1 20)))
                      (/ (f2cl-lib:fref diff (i) ((1 20))) (expt dx 2)))
             label10
              (setf (f2cl-lib:fref coy (i) ((1 20)))
                      (/ (f2cl-lib:fref diff (i) ((1 20))) (expt dy 2)))))
          (f2cl-lib:fformat 6
                            (" Demonstration program for DLSODPK package" "~%"
                             "~%" " Food web problem with ns species, ns =" 1
                             (("~4D")) "~%"
                             " Predator-prey interaction and diffusion on a 2-d square"
                             "~%" "~%" " Mesh dimensions (mx,my) =" 2 (("~4D"))
                             "~%" " Total system size is neq =" 1 (("~7D"))
                             "~%" "~%" "~%")
                            ns
                            mx
                            my
                            (f2cl-lib:fref neq (1) ((1 1))))
          (f2cl-lib:fformat 6
                            (" Matrix parameters:  a =" 1
                             (("~12,4,2,0,'*,,'DE")) "   e =" 1
                             (("~12,4,2,0,'*,,'DE")) "   g =" 1
                             (("~12,4,2,0,'*,,'DE")) "~%" "~20@T" " b =" 1
                             (("~12,4,2,0,'*,,'DE")) "~%" "~%"
                             " Diffusion coefficients: dprey =" 1
                             (("~12,4,2,0,'*,,'DE")) "   dpred =" 1
                             (("~12,4,2,0,'*,,'DE")) "~%"
                             " Rate parameter alpha =" 1
                             (("~12,4,2,0,'*,,'DE")) "~%" "~%" "~%")
                            aa
                            ee
                            gg
                            bb
                            dprey
                            dpred
                            alph)
          (setf jpre 3)
          (setf jacflg 1)
          (setf (f2cl-lib:fref iwork (3) ((1 67))) jpre)
          (setf (f2cl-lib:fref iwork (4) ((1 67))) jacflg)
          (setf iopt 0)
          (setf mp ns)
          (setf mq (f2cl-lib:int-mul mx my))
          (setf mpsq (f2cl-lib:int-mul ns ns))
          (setf uround (dumach))
          (setf srur (f2cl-lib:fsqrt uround))
          (setf meshx mx)
          (setf meshy my)
          (setf mxmp (f2cl-lib:int-mul meshx mp))
          (setf ngx 2)
          (setf ngy 2)
          (setf ngrp (f2cl-lib:int-mul ngx ngy))
          (gset meshx ngx jgx jigx jxr)
          (gset meshy ngy jgy jigy jyr)
          (setf (f2cl-lib:fref iwork (1) ((1 67)))
                  (f2cl-lib:int-mul mpsq ngrp))
          (setf (f2cl-lib:fref iwork (2) ((1 67))) (f2cl-lib:int-mul mp ngrp))
          (setf itmax 5)
          (setf itol 1)
          (setf (f2cl-lib:fref rtol (1) ((1 1))) 1.0d-5)
          (setf (f2cl-lib:fref atol (1) ((1 1)))
                  (f2cl-lib:fref rtol (1) ((1 1))))
          (setf itask 1)
          (f2cl-lib:fformat 6
                            (" Preconditioning uses interaction-only block-diagonal"
                             " matrix" "~%"
                             " with block-grouping, and Gauss-Seidel iterations"
                             "~%" "~%"
                             " Number of diagonal block groups = ngrp =" 1
                             (("~4D")) "   (ngx by ngy, ngx =" 1 (("~2D"))
                             "  ngy =" 1 (("~2D")) " )" "~%" "~%"
                             " G-S preconditioner uses itmax iterations, itmax ="
                             1 (("~3D")) "~%" "~%"
                             " Tolerance parameters: rtol =" 1
                             (("~10,2,2,0,'*,,'DE")) "   atol =" 1
                             (("~10,2,2,0,'*,,'DE")) "~%")
                            ngrp
                            ngx
                            ngy
                            itmax
                            (f2cl-lib:fref rtol (1) ((1 1)))
                            (f2cl-lib:fref atol (1) ((1 1))))
          (f2cl-lib:fdo (mf 10 (f2cl-lib:int-add mf 1))
                        ((> mf 29) nil)
            (tagbody
              (if (and (> mf 10) (< mf 21)) (go label90))
              (if (and (> mf 24) (< mf 29)) (go label90))
              (f2cl-lib:fformat 6
                                ("~%" "~%" 80 ("-") "~%" "~%"
                                 " Solution with mf =" 1 (("~3D")) "~%" "~%"
                                 "   t       nstep  nfe  nni  nli  npe  nq"
                                 "~4@T"
                                 "h          avdim    ncf rate    lcf rate"
                                 "~%")
                                mf)
              (setf t$ 0.0d0)
              (setf tout 1.0d-8)
              (setf nout 18)
              (if (= mf 10) (setf nout 6))
              (if (or (= mf 23) (= mf 24)) (setf nout 10))
              (cinit cc)
              (if (= mf 22) (outweb t$ cc ns mx my 8))
              (setf istate 1)
              (setf nli 0)
              (setf nni 0)
              (setf ncfn 0)
              (setf ncfl 0)
              (setf nst 0)
              (f2cl-lib:fdo (iout 1 (f2cl-lib:int-add iout 1))
                            ((> iout nout) nil)
                (tagbody
                  (multiple-value-bind
                        (var-0 var-1 var-2 var-3 var-4 var-5 var-6 var-7 var-8
                         var-9 var-10 var-11 var-12 var-13 var-14 var-15 var-16
                         var-17)
                      (dlsodpk #'fweb neq cc t$ tout itol rtol atol itask
                       istate iopt rwork lrw iwork liw #'jacbg #'solsbg mf)
                    (declare (ignore var-0 var-1 var-2 var-4 var-5 var-6 var-7
                                     var-8 var-10 var-11 var-12 var-13 var-14
                                     var-15 var-16 var-17))
                    (setf t$ var-3)
                    (setf istate var-9))
                  (setf nsdif
                          (f2cl-lib:int-sub (f2cl-lib:fref iwork (11) ((1 67)))
                                            nst))
                  (setf nst (f2cl-lib:fref iwork (11) ((1 67))))
                  (setf nfe (f2cl-lib:fref iwork (12) ((1 67))))
                  (setf npe (f2cl-lib:fref iwork (13) ((1 67))))
                  (setf nnidif
                          (f2cl-lib:int-sub (f2cl-lib:fref iwork (19) ((1 67)))
                                            nni))
                  (setf nni (f2cl-lib:fref iwork (19) ((1 67))))
                  (setf nlidif
                          (f2cl-lib:int-sub (f2cl-lib:fref iwork (20) ((1 67)))
                                            nli))
                  (setf nli (f2cl-lib:fref iwork (20) ((1 67))))
                  (setf nfndif
                          (f2cl-lib:int-sub (f2cl-lib:fref iwork (22) ((1 67)))
                                            ncfn))
                  (setf ncfn (f2cl-lib:fref iwork (22) ((1 67))))
                  (setf nfldif
                          (f2cl-lib:int-sub (f2cl-lib:fref iwork (23) ((1 67)))
                                            ncfl))
                  (setf ncfl (f2cl-lib:fref iwork (23) ((1 67))))
                  (setf nqu (f2cl-lib:fref iwork (14) ((1 67))))
                  (setf hu (f2cl-lib:fref rwork (11) ((1 5213))))
                  (setf avdim 0.0d0)
                  (setf rcfn 0.0d0)
                  (setf rcfl 0.0d0)
                  (if (> nnidif 0)
                      (setf avdim
                              (coerce
                               (/ (f2cl-lib:freal nlidif)
                                  (f2cl-lib:freal nnidif))
                               'double-float)))
                  (if (> nsdif 0)
                      (setf rcfn
                              (coerce
                               (/ (f2cl-lib:freal nfndif)
                                  (f2cl-lib:freal nsdif))
                               'double-float)))
                  (if (> nnidif 0)
                      (setf rcfl
                              (coerce
                               (/ (f2cl-lib:freal nfldif)
                                  (f2cl-lib:freal nnidif))
                               'double-float)))
                  (f2cl-lib:fformat 6
                                    (1 (("~10,2,2,0,'*,,'DE")) 1 (("~5D")) 1
                                     (("~6D")) 3 (("~5D")) 1 (("~4D")) 2
                                     (("~11,2,2,0,'*,,'DE")) 1
                                     (("~10,2,2,0,'*,,'DE")) 1
                                     (("~12,2,2,0,'*,,'DE")) "~%")
                                    t$
                                    nst
                                    nfe
                                    nni
                                    nli
                                    npe
                                    nqu
                                    hu
                                    avdim
                                    rcfn
                                    rcfl)
                  (setf imod3
                          (- iout
                             (* 3 (the f2cl-lib:integer4 (truncate iout 3)))))
                  (if (and (= mf 22) (= imod3 0)) (outweb t$ cc ns mx my 8))
                  (if (= istate 2) (go label65))
                  (f2cl-lib:fformat 6
                                    ("~%" "~%" " final time reached =" 1
                                     (("~12,4,2,0,'*,,'DE")) "~%" "~%" "~%")
                                    t$)
                  (go label75)
                 label65
                  (if (> tout 0.9d0) (setf tout (+ tout 1.0d0)))
                  (if (< tout 0.9d0) (setf tout (* tout 10.0d0)))
                 label70))
             label75
              (setf nst (f2cl-lib:fref iwork (11) ((1 67))))
              (setf nfe (f2cl-lib:fref iwork (12) ((1 67))))
              (setf npe (f2cl-lib:fref iwork (13) ((1 67))))
              (setf lenrw (f2cl-lib:fref iwork (17) ((1 67))))
              (setf leniw (f2cl-lib:fref iwork (18) ((1 67))))
              (setf nni (f2cl-lib:fref iwork (19) ((1 67))))
              (setf nli (f2cl-lib:fref iwork (20) ((1 67))))
              (setf nps (f2cl-lib:fref iwork (21) ((1 67))))
              (if (> nni 0)
                  (setf avdim
                          (coerce (/ (f2cl-lib:freal nli) (f2cl-lib:freal nni))
                                  'double-float)))
              (setf ncfn (f2cl-lib:fref iwork (22) ((1 67))))
              (setf ncfl (f2cl-lib:fref iwork (23) ((1 67))))
              (f2cl-lib:fformat 6
                                ("~%" "~%" " Final statistics for this run:"
                                 "~%" " rwork size =" 1 (("~8D"))
                                 "   iwork size =" 1 (("~6D")) "~%"
                                 " number of time steps            =" 1
                                 (("~5D")) "~%"
                                 " number of f evaluations         =" 1
                                 (("~5D")) "~%"
                                 " number of preconditioner evals. =" 1
                                 (("~5D")) "~%"
                                 " number of preconditioner solves =" 1
                                 (("~5D")) "~%"
                                 " number of nonlinear iterations  =" 1
                                 (("~5D")) "~%"
                                 " number of linear iterations     =" 1
                                 (("~5D")) "~%"
                                 " average subspace dimension  =" 1
                                 (("~8,4,0,'*,F")) "~%" 1 (("~5D"))
                                 " nonlinear conv. failures," 1 (("~5D"))
                                 " linear conv. failures" "~%")
                                lenrw
                                leniw
                                nst
                                nfe
                                npe
                                nps
                                nni
                                nli
                                avdim
                                ncfn
                                ncfl)
             label90))
         end_label
          (return nil))))))

(in-package #-gcl #:cl-user #+gcl "CL-USER")
#+#.(cl:if (cl:find-package '#:f2cl) '(and) '(or))
(eval-when (:load-toplevel :compile-toplevel :execute)
  (setf (gethash 'fortran-to-lisp::opkdemo5
                 fortran-to-lisp::*f2cl-function-info*)
          (fortran-to-lisp::make-f2cl-finfo :arg-types 'nil
                                            :return-values 'nil
                                            :calls '(fortran-to-lisp::dlsodpk
                                                     fortran-to-lisp::outweb
                                                     fortran-to-lisp::cinit
                                                     fortran-to-lisp::gset))))

