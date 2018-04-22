function err=compute_fit(par)
    err =trainDNN(par.l1n,par.l2n,par.l3n,par.l1l,par.l2l,par.l3l,par.gw,par.gf,par.gp)
end