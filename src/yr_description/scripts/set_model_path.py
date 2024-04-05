#!/usr/bin/env python
import os

def set_gazebo_model_path():
    model_path = "/home/vishwajeet/catkin_ws/src/yr_description/worlds/models"
    current_gazebo_model_path = os.environ.get('GAZEBO_MODEL_PATH', '')

    # Append the new model path to the existing GAZEBO_MODEL_PATH
    # Check if the model_path is not already in the GAZEBO_MODEL_PATH to avoid duplicates
    if model_path not in current_gazebo_model_path.split(os.pathsep):
        new_gazebo_model_path = os.pathsep.join([model_path, current_gazebo_model_path]).strip(os.pathsep)
        os.environ['GAZEBO_MODEL_PATH'] = new_gazebo_model_path
        print(f"GAZEBO_MODEL_PATH has been set to: {new_gazebo_model_path}")
    else:
        print("Model path already set in GAZEBO_MODEL_PATH.")

if __name__ == "__main__":
    set_gazebo_model_path()
