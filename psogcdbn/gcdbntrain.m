function dbn = gcdbntrain(dbn, x, opts)
    n = numel(dbn.rbm);

    dbn.rbm{1} = gcrbmtrain(dbn.rbm{1}, x, opts);
    for i = 2 : n
        x = gcrbmup(dbn.rbm{i - 1}, x);
        dbn.rbm{i} = gcrbmtrain(dbn.rbm{i}, x, opts);
    end

end
