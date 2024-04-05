
(cl:in-package :asdf)

(defsystem "yr_description-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "ComputeLeftFootPosition" :depends-on ("_package_ComputeLeftFootPosition"))
    (:file "_package_ComputeLeftFootPosition" :depends-on ("_package"))
    (:file "ComputeRightFootPosition" :depends-on ("_package_ComputeRightFootPosition"))
    (:file "_package_ComputeRightFootPosition" :depends-on ("_package"))
    (:file "IKLeft" :depends-on ("_package_IKLeft"))
    (:file "_package_IKLeft" :depends-on ("_package"))
    (:file "IKRight" :depends-on ("_package_IKRight"))
    (:file "_package_IKRight" :depends-on ("_package"))
    (:file "SolveIKLeftFoot" :depends-on ("_package_SolveIKLeftFoot"))
    (:file "_package_SolveIKLeftFoot" :depends-on ("_package"))
    (:file "SolveIKLeftThigh" :depends-on ("_package_SolveIKLeftThigh"))
    (:file "_package_SolveIKLeftThigh" :depends-on ("_package"))
    (:file "SolveIKRightFoot" :depends-on ("_package_SolveIKRightFoot"))
    (:file "_package_SolveIKRightFoot" :depends-on ("_package"))
    (:file "SolveIKRightThigh" :depends-on ("_package_SolveIKRightThigh"))
    (:file "_package_SolveIKRightThigh" :depends-on ("_package"))
  ))