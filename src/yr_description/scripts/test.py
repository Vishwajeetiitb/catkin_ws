import rclpy
from rclpy.node import Node
from controller_manager_msgs.srv import SwitchController
from builtin_interfaces.msg import Duration
from trajectory_msgs.msg import JointTrajectory, JointTrajectoryPoint
from std_msgs.msg import Float32MultiArray
from sensor_msgs.msg import JointState
from yr_lle_msgs.msg import JointCmdArray
import time
import numpy as np


class ControllerSwitcher(Node):
    def __init__(self, measurements):
        super().__init__('controller_switcher')
        self.timer = self.create_timer(0.02, self.timer_callback)
        self.cli = self.create_client(SwitchController, '/controller_manager/switch_controller')
        while not self.cli.wait_for_service(timeout_sec=1.0):
            self.get_logger().info('Waiting for controller manager service...')
        
        # Initialize publishers
        self.angle_publisher = self.create_publisher(JointTrajectory, '/yr_angle_controller/joint_trajectory', 10)
        self.torque_publisher = self.create_publisher(Float32MultiArray, '/yr_torque_controller/commands', 10)

        self.measurements = measurementsa

        self.subscription = self.create_subscription(
            JointState,
            '/joint_states',
            self.encoder_callback,
            10)

        self.subscription  # prevent unused variable warning
        self.torque_subscriber = self.create_subscription(
            Float32MultiArray,
            'yr_torque_controller/commands',
            self.cmd_callback,
            10)
        
        self.joint_cmd = None

        self.idx = 0
        self.factor = 1

        self.setpoint = 0.0
        self.error_sum = 0.0
        self.last_error = 0.0
        self.Kp = 1.0  # Proportional gain
        self.Ki = 0.0  # Integral gain
        self.Kd = 0.0  # Derivative gain

    def encoder_callback(self, msg): 
        self.measurements = np.array(msg.position) #['yr_l_pel_joint', 'yr_l_hip_joint', 'yr_l_kne_joint', 'yr_l_ank_joint','yr_r_pel_joint', 'yr_r_hip_joint', 'yr_r_kne_joint', 'yr_r_ank_joint']
        self.get_logger().info('Recieved Joint Message')
        print('Measurements', self.measurements)

    def cmd_callback(self, msg):
        self.get_logger().info('Recieved Joint Cmd Message')
        self.joint_cmd = msg.data
        print('Joint Cmd', self.joint_cmd)

    def set_angles(self,angles):
        activate = ['yr_angle_controller']
        deactivate = ['yr_torque_controller']

        req = SwitchController.Request(
            start_controllers=activate, 
            stop_controllers=deactivate, 
            strictness=1, 
            start_asap=True, 
            timeout=Duration(sec=3, nanosec=0)
        )
        self.future = self.cli.call_async(req)
        msg = JointTrajectory()
        msg.joint_names = ['yr_l_pel_joint', 'yr_l_hip_joint', 'yr_l_kne_joint', 'yr_l_ank_joint',
                            'yr_r_pel_joint', 'yr_r_hip_joint', 'yr_r_kne_joint', 'yr_r_ank_joint']
        point = JointTrajectoryPoint()
        
        point.positions = angles
        point.time_from_start = Duration(sec=1, nanosec=1000)
        msg.points.append(point)
        self.angle_publisher.publish(msg)
        self.get_logger().info('Published example angle command.')

    def set_torques(self,torques):
        deactivate = ['yr_angle_controller']
        activate = ['yr_torque_controller']

        req = SwitchController.Request(
            start_controllers=['yr_torque_controller'], 
            stop_controllers=['yr_angle_controller'], 
            strictness=1, 
            start_asap=True, 
            timeout=Duration(sec=3, nanosec=0)
        )
        self.future = self.cli.call_async(req)
        msg = Float32MultiArray()
        msg.data = torques
        self.torque_publisher.publish(msg)
        self.get_logger().info('Published example torque command.')

    def update_joints(self):
        
        hip = self.measurements[1]

        self.get_logger().info('Setting New Joint Angle')
        hip += self.factor * self.idx * np.pi/180
        positions = self.measurements.copy()
        positions[1] = hip
        self.set_angles(positions)

        if self.idx % 10 == 0:
            self.factor = -1*self.factor
        
        if self.factor == -1:
            self.idx -= .01
        else:
            self.idx += .01

    def timer_callback(self):
        pi = 3.14159265359
        #self.set_angles([-pi/2,-pi/6,pi/2,-pi/4, pi/2,-pi/4, pi/2, -pi/4]) 
        #self.update_joints()
        self.set_torques([-10.0, 100.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0])

def main(args=None):
    rclpy.init(args=args)
    pi = 3.14159265359
    switcher = ControllerSwitcher(np.array([-pi/2,-pi/6,pi/2,-pi/4, pi/2,-pi/4, pi/2, -pi/4]))
    #switcher.set_angles([-pi/2,-pi/6,pi/2,-pi/4, pi/2,-pi/4, pi/2, -pi/4])  # Example: switch to angle mode and publish command
    #witcher.set_torques([-10.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0])
    rclpy.spin(switcher)
    rclpy.shutdown()

if __name__ == '__main__':
    main()