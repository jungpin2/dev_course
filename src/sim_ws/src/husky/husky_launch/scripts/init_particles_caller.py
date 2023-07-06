#! /usr/bin/env python

import rospy
from std_srvs.srv import Empty, EmptyRequest
import sys

rospy.init_node("init_particles_caller")
rospy.wait_for_service('/global_localization')

disperse_particles_service = rospy.ServiceProxy('/global_localization', Empty)
msg = EmptyRequest()
result = disperse_particles_service(msg)

rospy.loginfo(result)
