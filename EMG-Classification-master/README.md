# EMG-Classification
This repository contains code for basic finger and hand gesture classification using EMG signal as input and some pretrained deep neural networks such as -googlenet, Alexnet etc. Datasets has been taken from [Rami Khusaba Electromyogram repository](https://www.rami-khushaba.com/electromyogram-emg-repository.html) [[1]](https://www.rami-khushaba.com/electromyogram-emg-repository.html). and [sEMG for Basic Hand movements Data Set] (https://archive.ics.uci.edu/ml/datasets/sEMG+for+Basic+Hand+movements) [[2]] (https://archive.ics.uci.edu/ml/datasets/sEMG+for+Basic+Hand+movements)

## Steps for running this code
### Step 1
First download the datasets from [these link](https://www.rami-khushaba.com/electromyogram-emg-repository.html) and (https://archive.ics.uci.edu/ml/datasets/sEMG+for+Basic+Hand+movements) and extract in the same folder where you will run the codes. The first dataset is from [Rami Khusaba Electromyogram repository](https://www.rami-khushaba.com/electromyogram-emg-repository.html). It contains 10 classes of individual finger movements, i.e.,Thumb (T), Index (I), Middle (M), Ring (R),Thumb–Index (T–I), Thumb–Middle (T–M), Thumb–Ring (T–R), Thumb–Little (T–L), hand close (HC), Little (L), Thumb–Little (T–L) from 10 subjects. We only used first 8 classes. The second dataset is from [sEMG for Basic Hand movements Data Set] (https://archive.ics.uci.edu/ml/datasets/sEMG+for+Basic+Hand+movements). Here the subjects were asked to perform repeatedly six movements, which can be considered as daily hand grasps: Spherical, Tip, Palmar, Lateral, Cylindrical and Hook from 5 subjects. 

  

### Step 2
Open MATLAB and click on the file named `Hd.mat` (A Bandpass Butterworth filter object)  to import it in MATLAB workspace. 

### Step 3
Run the function `read` in MATLAB command window in the following style -
```
EMGData = read(sub, Hd);
```
Here sub = 1,2,3,..etc. the desired number of subjects you want to read.

### Step 4
Now run the file `script` section by section using ![Image of run section](https://github.com/Arafat245/EMG-Classification/blob/master/Capture.JPG) in the following style -
```
parentDir = './';
dataDir = 'EMGD1All';
helperCreateEMGDirectories(EMGData,parentDir,dataDir)
```
You can give your own name for dataDir. Plot the EMG data for first 1000 samples using the following section -
```
helperPlotReps(EMGData)
```
Create a scalogram for 1st 1000 samples and visualize it-
```
Fs = 4000;
fb = cwtfilterbank('SignalLength',1000,...
    'SamplingFrequency',Fs,...
    'VoicesPerOctave',12);
sig = EMGData.Data(1,1:1000);
[cfs,frq] = wt(fb,sig);
t = (0:999)/Fs;figure;pcolor(t,frq,abs(cfs))
set(gca,'yscale','log');shading interp;axis tight;
title('Scalogram');xlabel('Time (s)');ylabel('Frequency (Hz)')
```
Create RGB images for all EMG signals-
```
helperCreateRGBfromTF(EMGData,parentDir,dataDir)
```
This may take a while, be patient. Store all the images in `allImages` variable -
```
allImages = imageDatastore(fullfile(parentDir,dataDir),...
    'IncludeSubfolders',true,...
    'LabelSource','foldernames');
```
Split the images in training and validation sets (here ratio is 0.7) -
```
rng default
[imgsTrain,imgsValidation] = splitEachLabel(allImages,0.7,'randomized');
disp(['Number of training images: ',num2str(numel(imgsTrain.Files))]);
disp(['Number of validation images: ',num2str(numel(imgsValidation.Files))]);
```
Now you can run the deep neural network `googlenet`-
```
net = googlenet;
```
Visualize the layers -
```
lgraph = layerGraph(googlenet);
numberOfLayers = numel(lgraph.Layers);
figure('Units','normalized','Position',[0.1 0.1 0.8 0.8]);
plot(lgraph)
title(['GoogLeNet Layer Graph: ',num2str(numberOfLayers),' Layers']);

net.Layers(1)
```
Remove the last 4 layers and add 4 new layers -
```
lgraph = removeLayers(lgraph,{'pool5-drop_7x7_s1','loss3-classifier','prob','output'});

numClasses = numel(categories(imgsTrain.Labels));
newLayers = [
    dropoutLayer(0.6,'Name','newDropout')
    fullyConnectedLayer(numClasses,'Name','fc','WeightLearnRateFactor',5,'BiasLearnRateFactor',5)
    softmaxLayer('Name','softmax')
    classificationLayer('Name','classoutput')];
lgraph = addLayers(lgraph,newLayers);

lgraph = connectLayers(lgraph,'pool5-7x7_s1','newDropout');
inputSize = net.Layers(1).InputSize;
```
Specify training options-
```
options = trainingOptions('sgdm',...
    'MiniBatchSize',15,...
    'MaxEpochs',20,...
    'InitialLearnRate',1e-4,...
    'ValidationData',imgsValidation,...
    'ValidationFrequency',10,...
    'Verbose',1,...
    'ExecutionEnvironment','cpu',...
    'Plots','training-progress');
```
Now you can train-
```
rng default
trainedGN = trainNetwork(imgsTrain,lgraph,options);
```
Follow almost same procedure for `alexnet` and other networks in the subsequent sections.

## References
[1] R. N. Khushaba, M. Takruri, S. Kodagoda, and G. Dissanayake, "Toward Improved Control of Prosthetic Fingers Using Surface Electromyogram (EMG) Signals," Expert Systems with Applications, vol 39, no. 12, pp. 10731–10738, 2012.
[2] N. Nahid, A. Rahman and M. A. R. Ahad, "Deep Learning Based Surface EMG Hand Gesture Classification for Low-Cost Myoelectric Prosthetic Hand," 2020 Joint 9th International Conference on Informatics, Electronics & Vision (ICIEV) and 2020 4th International Conference on Imaging, Vision & Pattern Recognition (icIVPR), Kitakyushu, Japan, 2020, pp. 1-8, doi: 10.1109/ICIEVicIVPR48672.2020.9306613.
