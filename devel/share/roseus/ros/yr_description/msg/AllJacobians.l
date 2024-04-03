;; Auto-generated. Do not edit!


(when (boundp 'yr_description::AllJacobians)
  (if (not (find-package "YR_DESCRIPTION"))
    (make-package "YR_DESCRIPTION"))
  (shadow 'AllJacobians (find-package "YR_DESCRIPTION")))
(unless (find-package "YR_DESCRIPTION::ALLJACOBIANS")
  (make-package "YR_DESCRIPTION::ALLJACOBIANS"))

(in-package "ROS")
;;//! \htmlinclude AllJacobians.msg.html


(defclass yr_description::AllJacobians
  :super ros::object
  :slots (_jacobians _names ))

(defmethod yr_description::AllJacobians
  (:init
   (&key
    ((:jacobians __jacobians) ())
    ((:names __names) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _jacobians __jacobians)
   (setq _names __names)
   self)
  (:jacobians
   (&rest __jacobians)
   (if (keywordp (car __jacobians))
       (send* _jacobians __jacobians)
     (progn
       (if __jacobians (setq _jacobians (car __jacobians)))
       _jacobians)))
  (:names
   (&optional __names)
   (if __names (setq _names __names)) _names)
  (:serialization-length
   ()
   (+
    ;; yr_description/JacobianMatrix[] _jacobians
    (apply #'+ (send-all _jacobians :serialization-length)) 4
    ;; string[] _names
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _names)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; yr_description/JacobianMatrix[] _jacobians
     (write-long (length _jacobians) s)
     (dolist (elem _jacobians)
       (send elem :serialize s)
       )
     ;; string[] _names
     (write-long (length _names) s)
     (dolist (elem _names)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; yr_description/JacobianMatrix[] _jacobians
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _jacobians (let (r) (dotimes (i n) (push (instance yr_description::JacobianMatrix :init) r)) r))
     (dolist (elem- _jacobians)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; string[] _names
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _names (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _names i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(setf (get yr_description::AllJacobians :md5sum-) "027902274eec53728e88db4b2e276d6d")
(setf (get yr_description::AllJacobians :datatype-) "yr_description/AllJacobians")
(setf (get yr_description::AllJacobians :definition-)
      "JacobianMatrix[] jacobians
string[] names  # Names of the links/end-effectors corresponding to each Jacobian

================================================================================
MSG: yr_description/JacobianMatrix
float64[] data  # Flattened matrix data
uint32 rows     # Number of rows in the matrix
uint32 columns  # Number of columns in the matrix

")



(provide :yr_description/AllJacobians "027902274eec53728e88db4b2e276d6d")


