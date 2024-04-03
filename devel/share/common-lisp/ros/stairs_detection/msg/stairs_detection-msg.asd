
(cl:in-package :asdf)

(defsystem "stairs_detection-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "stair_info" :depends-on ("_package_stair_info"))
    (:file "_package_stair_info" :depends-on ("_package"))
  ))