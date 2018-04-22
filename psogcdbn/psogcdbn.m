clear all;
close all;
clc;
par =psogcdbn();
err =trainDNN(par{1},par{2},par{3},par{4},par{5},par{6},par{7},par{8},par{9});
