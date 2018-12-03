clc
clear

[input,target] = CepstralProc();

trainingNetwork = patternnet([12 12]);

trainingNetwork.inputs{1}.processFcns = {'removeconstantrows','mapminmax'};
trainingNetwork.outputs{2}.processFcns = {'removeconstantrows','mapminmax'};

trainingNetwork.divideFcn = 'dividerand'; % Divide data randomly
trainingNetwork.divideMode = 'sample'; % Divide up every sample
trainingNetwork.divideParam.trainRatio = 70/100;
trainingNetwork.divideParam.valRatio = 15/100;
trainingNetwork.divideParam.testRatio = 15/100;

trainingNetwork.trainFcn = 'trainlm';

trainingNetwork.performFcn = 'mse';

trainingNetwork.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
 'plotregression', 'plotfit'};

trainingNetwork.trainParam.epochs=1000;
%trainingNetwork.trainParam.mu=0.005;

[trainingNetwork,tr] = train(trainingNetwork,input,target);

output = trainingNetwork(input);
errors = gsubtract(target,output);
performance = perform(trainingNetwork,target,output)

trainTargets = target .* tr.trainMask{1};
valTargets = target .* tr.valMask{1};
testTargets = target .* tr.testMask{1};
trainPerformance = perform(trainingNetwork,trainTargets,output)
valPerformance = perform(trainingNetwork,valTargets,output)
testPerformance = perform(trainingNetwork,testTargets,output)

view(trainingNetwork)

figure, plotperform(tr)
figure, plottrainstate(tr)
figure, plotconfusion(target,output)
figure, ploterrhist(errors)