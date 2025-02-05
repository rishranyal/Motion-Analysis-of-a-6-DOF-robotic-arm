clc; clear; close all;

% Load the robot model from saved file
load('braccio_model.mat', 'robot');

% Create an Inverse Kinematics Solver
ik = robotics.InverseKinematics('RigidBodyTree', robot);
weights = [10 10 10 1 1 1];  % Give more weight to position (x, y, z)
initialGuess = robot.homeConfiguration;  % Start from default pose

% Define Target End-Effector Position (Modify as needed)
targetPose = trvec2tform([0.19,0,0.2]);  % Change (x, y, z) as needed

% Solve for Joint Angles
[configSol, solInfo] = ik('link6', targetPose, weights, initialGuess);

% Get the actual end-effector position
actualTransform = getTransform(robot, configSol, 'link6', 'base');
actualPosition = tform2trvec(actualTransform);  % Extract (x, y, z)

% Display the actual position
disp('Actual End-Effector Position (x, y, z):');
disp(actualPosition);
% Display Results
disp('Joint Angles Solution:');
disp(rad2deg(configSol));

% Visualize the Robot in the New Position
figure;
show(robot, configSol);
title('Braccio Robot - Inverse Kinematics Solution');
view(3);
grid on;

hold on;
plot3(0, 0, 0, 'ro', 'MarkerSize', 10, 'LineWidth', 2); % Origin (red dot)
plot3(actualPosition(1), actualPosition(2), actualPosition(3), 'bo', 'MarkerSize', 10, 'LineWidth', 2); % End-Effector (blue dot)
text(0, 0, 0, '  Origin', 'FontSize', 10, 'Color', 'r');
text(actualPosition(1), actualPosition(2), actualPosition(3), '  End-Effector', 'FontSize', 10, 'Color', 'b');

disp(['IK Status: ', solInfo.Status]);
