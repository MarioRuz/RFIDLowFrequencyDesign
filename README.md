# RFIDLowFrequencyDesign
This code is provided as supplementary material for the submitted paper "Accident Prevention in Agricultural Machinery Using Radiofrequency Technology: A Prototype Application to Olive Net Collectors." The code enables the calculation of the number of loops for a given planar geometry and a specific inductance value.

Inductance is a key parameter in inductive coupling antennas, particularly for achieving resonance and ensuring proper performance in tag detection. Please note that the presence of metals near the antenna can alter the total inductance value, potentially detuning it.

![](https://github.com/MarioRuz/RFIDLowFrequencyDesign/blob/main/RoboticTestingExample.gif)

**VotalgeDependency.m** shows the dependency with speed velocity and applied voltage to the RFID antenna.

The information contained in the folders is as follows:

- **/AntennaInductanceEstimation** contains the MATLAB scripts for the estimation of number of turns to meet 27 uH.
- **/RoboticTesting** contains the datasets from experiments carried out with the robotic experimental approach.

Contact the authors for more information <mario.ruz.at.uco.es>


