function er=trainDNN(l1n,l2n,l3n,l1l,l2l,l3l,gw,gf,gp)
load data1;

train_x = double(train_x);
test_x  = double(test_x);
train_y = double(train_y);
test_y  = double(test_y);

rand('state',0)
dbn.sizes = [pn,pm,pl];
opts.numepochs =   88;
opts.batchsize = 80;
opts.momentum  =   0;
opts.alpha     =  [l11,l2l,l3l];
opts.gc        =  [gw,gf,gp];
dbn = gcdbnsetup(dbn, train_x, opts);
dbn = gcdbntrain(dbn, train_x, opts);

nn = dbnunfoldtonn(dbn, 1);
nn.activation_function = 'sigm';

opts.numepochs =  100;
opts.batchsize = 80;
nn = nntrain(nn, train_x, train_y, opts);
[er, bad] = nntest(nn, test_x, test_y);

