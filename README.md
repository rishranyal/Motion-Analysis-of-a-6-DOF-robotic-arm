# Motion-Analysis-of-a-6-DOF-robotic-arm

![arduino-braccio-robotic-arm-desc3](https://github.com/user-attachments/assets/44d21fcd-ee06-4c96-88ba-7a19f9c3410a)

This study explores the motion analysis and forward kinematics of the Braccio robotic arm, a six-degree-of-freedom (DOF) system, using advanced simulation and computational tools.

The project began with the physical assembly of the robotic arm, focusing on understanding its structural and functional components. Following this, a digital replica of the arm was created by meticulously modeling each part in MSC Adams, a robust platform for dynamic simulation of mechanical systems.

In MSC Adams, the individual components of the Braccio arm were assembled into a complete model, enabling a detailed motion analysis. This included evaluating joint behavior, range of motion, and overall system dynamics. The study provided insights into the interplay between the robotic arm’s structural design and its operational efficiency, highlighting constraints and optimization opportunities.

Further, the forward kinematics of the robotic arm was analyzed using MATLAB, where mathematical models were derived to determine the position and orientation of the end effector based on joint angles. These kinematic equations were validated through simulation results, ensuring accuracy in predicting the arm's spatial movements. The integration of MSC Adams for dynamic simulation and MATLAB for kinematic computation provided a comprehensive framework for analyzing the Braccio robotic arm.

# Instructions for Using the Files:

1. Download the parasolid file and open it in MSC Adams View.
2. Apply your own constraints and motion to the joints of the arm.
3. If you want a fully simulated model, download the Simulated ADAMS file and run the preconfigured simulation.
4. For co-simulation, open the ADAMS model in MSC Adams.
5. Open the Control Plant model in MATLAB or load the co-simulated file.
6. To perform inverse kinematics, open the Rigid Body file and the Inverse Kinematics file in MATLAB.
7. Run the files to obtain the desired results.
