% Clear workspace
clc; clear; close all;

% Define the D-H Parameters (converted to meters)
dhparams = [ 0    0     0.0715  0;
             0    pi/2  0       0;
             0.125  0    0       0;
             0.125  0    0       0;
             0    pi/2  0.190   0;
             0    0     0       0];

% Create a robotics RigidBodyTree model
robot = robotics.RigidBodyTree('DataFormat', 'column', 'MaxNumBodies', 7);

% Base Link
prevBody = 'base';

% Loop through D-H parameters to create links
for i = 1:size(dhparams,1)
    body = robotics.RigidBody(['link', num2str(i)]);
    joint = robotics.Joint(['joint', num2str(i)], 'revolute');
    
    % Extract D-H Parameters
    a = dhparams(i,1);     % Link Length (meters)
    alpha = dhparams(i,2); % Link Twist (radians)
    d = dhparams(i,3);     % Link Offset (meters)
    theta = dhparams(i,4); % Joint Angle (radians) (Variable)

    % Directly Use the D-H Parameters with MATLAB’s built-in function
    setFixedTransform(joint, [a alpha d theta], 'dh');
    
    % Assign the Joint to the Body
    body.Joint = joint;
    
    % Attach to Previous Body
    addBody(robot, body, prevBody);
    prevBody = body.Name;
end

% 🚀 Ensure Proper Visualization
figure;
ax = axes;
show(robot, 'Parent', ax);
title('Braccio Robot Visualization');
view(3); % Set 3D View
grid on;

save('braccio_model.mat','robot')
