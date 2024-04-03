;; Auto-generated. Do not edit!


(when (boundp 'yr_description::JacobianMatrix)
  (if (not (find-package "YR_DESCRIPTION"))
    (make-package "YR_DESCRIPTION"))
  (shadow 'JacobianMatrix (find-package "YR_DESCRIPTION")))
(unless (find-package "YR_DESCRIPTION::JACOBIANMATRIX")
  (make-package "YR_DESCRIPTION::JACOBIANMATRIX"))

(in-package "ROS")
;;//! \htmlinclude JacobianMatrix.msg.html


(defclass yr_description::JacobianMatrix
  :super ros::object
  :slots (_data _rows _columns ))

(defmethod yr_description::JacobianMatrix
  (:init
   (&key
    ((:data __data) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:rows __rows) 0)
    ((:columns __columns) 0)
    )
   (send-super :init)
   (setq _data __data)
   (setq _rows (round __rows))
   (setq _columns (round __columns))
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:rows
   (&optional __rows)
   (if __rows (setq _rows __rows)) _rows)
  (:columns
   (&optional __columns)
   (if __columns (setq _columns __columns)) _columns)
  (:serialization-length
   ()
   (+
    ;; float64[] _data
    (* 8    (length _data)) 4
    ;; uint32 _rows
    4
    ;; uint32 _columns
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _data
     (write-long (length _data) s)
     (dotimes (i (length _data))
       (sys::poke (elt _data i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; uint32 _rows
       (write-long _rows s)
     ;; uint32 _columns
       (write-long _columns s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _data i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; uint32 _rows
     (setq _rows (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _columns
     (setq _columns (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get yr_description::JacobianMatrix :md5sum-) "c15edb606601a21cc2f127b349ea452b")
(setf (get yr_description::JacobianMatrix :datatype-) "yr_description/JacobianMatrix")
(setf (get yr_description::JacobianMatrix :definition-)
      "float64[] data  # Flattened matrix data
uint32 rows     # Number of rows in the matrix
uint32 columns  # Number of columns in the matrix

")



(provide :yr_description/JacobianMatrix "c15edb606601a21cc2f127b349ea452b")


