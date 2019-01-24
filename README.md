# Structured-Light-Laser-Stripe-Reconstruction


Automatically detects a laser stripe on an object seen in the image, given, there are no illumination invariants at play and no other conditions causing a deviation from a controlled test environment, uses the coordinates of the points of the laser stripe on the image to generate a depth map per column of the image. After doing that, fits a plane to the light plane, which is basically determining the plane coefficients (equation describing the plane) of the laser plane. This stage represents the calibration and after this the parameters of the plane can be used to determine the depth of the image (approximate distance of the object from the camera center) given the pixel coordinates of where the laser stripe falls on the object.

Test images and results included within. 

Please give credit to this work if you use it and link back to this page.
