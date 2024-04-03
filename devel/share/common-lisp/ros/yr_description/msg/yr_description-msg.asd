
(cl:in-package :asdf)

(defsystem "yr_description-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "FeetPositions" :depends-on ("_package_FeetPositions"))
    (:file "_package_FeetPositions" :depends-on ("_package"))
  ))