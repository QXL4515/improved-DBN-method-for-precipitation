function [par par_best]=update_par(par,par_best)
    par.l1n=par.l1n+par.vl1n;  
    par.l2n=par.l2n+par.vl2n;
    par.l3n=par.l3n+par.vl3n;
    par.l1l=par.l11+par.vl11;
    par.l2l=par.l2l+par.vl2l;
    par.l3l=par.l3l+par.vl3l;
    par.gw=par.gw+par.vgw;
    par.gf=par.gf+par.vgf;
    par.gp=par.gp+par.vgp;    
    par.fit=compute_fit(par);    %计算当前粒子适应度
    %Gx为具有最佳适应度粒子的位置
    %PBx为当前粒子的最佳位置
    c1=0.5;
    c2=0.5;
    par.vl1n=par.vl1n+c1*rand()*(par_best.l1n-par.l1n)+c2*rand()*(par.bestl1n-par.l1n);
    par.vl2n=par.vl2n+c1*rand()*(par_best.l2n-par.l2n)+c2*rand()*(par.bestl2n-par.l2n);
    par.vl3n=par.vl3n+c1*rand()*(par_best.l3n-par.l3n)+c2*rand()*(par.bestl3n-par.l3n);
    par.vl1l=par.vl1l+c1*rand()*(par_best.l1l-par.l1l)+c2*rand()*(par.bestl1l-par.l1l);
    par.vl2l=par.vl2l+c1*rand()*(par_best.l2l-par.l2l)+c2*rand()*(par.bestl2l-par.l2l);
    par.vl3l=par.vl3l+c1*rand()*(par_best.l3l-par.l3l)+c2*rand()*(par.bestl3l-par.l3l);
    par.vgw=par.vgw+c1*rand()*(par_best.gw-par.gw)+c2*rand()*(par.gwn-par.gw);
    par.vgf=par.vgf+c1*rand()*(par_best.gf-par.gf)+c2*rand()*(par.gf-par.gf);  
    par.vgp=par.vgp+c1*rand()*(par_best.gp-par.gp)+c2*rand()*(par.gp-par.gp);  
    if par.fit<par.bestfit      %如果当前粒子适应度要好于当前粒子最佳适应度
        par.bestfit=par.fit;    %则更新当前粒子最佳适应度
        par.bestl1n=par.l1n;
        par.bestl2n=par.l2n;
        par.bestl3n=par.l3n;
        par.bestl1l=par.l1l;
        par.bestl2l=par.l2l;
        par.bestl3l=par.l3l;
        par.bestgw=par.gw;
        par.bestgf=par.gf;
        par.bestgp=par.gp;
       %更新当前粒子最佳位置
        if par.bestfit<par_best.fit     %如果当前粒子适应度好于最佳粒子适应度
            par_best.fit=par.bestfit;   %则更新最佳粒子适应度
                                 %更新最佳粒子位置
            par_best.l1n=par.l1n;
            par_best.l2n=par.l2n;
            par_best.l3n=par.l3n;
            par_best.l1l=par.l1l;
            par_best.l2l=par.l2l;
            par_best.l3l=par.l3l;
            par_best.gw=par.gw;
            par_best.gf=par.gf;
            par_best.gp=par.gp;
        end
    end
 
end