function [trainX, trainY, testX, testY] = dataload(index)
    dataset_name = ["abalone", "bank", "car", "cardiotocography-10clases", "cardiotocography-3clases", ...
                    "chess-krvkp", "contrac", "image-segmentation", "led-display", "molec-biol-splice"];
    data_name = char(dataset_name(index));
    % Load datasets (The string inside the load function is the path to the .mat file)
    train_set = load(['../MatDataset/',data_name,'/',data_name,'_Train.mat']);
    test_set = load(['../MatDataset/',data_name,'/',data_name,'_Test.mat']);

    % Collect training/testing dataset
    trainX = train_set.Data;
    trainY = train_set.Label;
    testX = test_set.Data;
    testY = test_set.Label;
end