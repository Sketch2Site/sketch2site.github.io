#!/bin/bash

# copy uploaded file to destination
echo "Copying uploaded image into AI Model"
cp user-interface/uploads/demo.jpg TrainYourOwnYOLO/Data/Source_Images/demo.jpeg

echo "Initializing AI Model"
cd TrainYourOwnYOLO

echo "Activating environment"
source env/bin/activate

echo "Breaking image into components"
cd Data/Source_Images/Test_Images
rm *.jpeg
cd ..
cp demo.jpeg Test_Images/
cd Test_Images/
python3 converter.py
cd ..
cd ..
cd ..
pwd

echo "Opening caller directory"
cd 3_Inference

echo "Running AI Model"
python3 Detector.py

echo "Extracting results"
cd ..
cd ..
cp TrainYourOwnYOLO/Data/Source_Images/Test_Image_Detection_Results/Detection_Results.csv result.csv
node builder.js
