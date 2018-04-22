function  par1=PSOMultiTrain()
sigma=50;

n=100;   %粒子群粒子个数
 
%初始化粒子群，定义结构体
%结构体中元素，
par=struct([]);　　　　　　　　　　
for i=1:n
    par(i).l1n=randperm(200);
    par(i).l2n=randperm(200);
    par(i).l3n=randperm(200);
    par(i).l1l=rand(0,1); 
    par(i).l2l=rand(0,1);
    par(i).l3l=rand(0,1);  
    par(i).gw=rand(0,1); 
    par(i).gf=rand(0,1);
    par(i).gp=rand(0,1);  
    par(i).vl1n=-1+2*rand();      
    par(i).vl2n=-1+2*rand();   
    par(i).vl3n=-1+2*rand();      
    par(i).vl1l=-1+2*rand();
    par(i).vl2l=-1+2*rand();      
    par(i).vl3l=-1+2*rand();   
    par(i).vgw=-1+2*rand();      
    par(i).vgf=-1+2*rand(); 
    par(i).vgp=-1+2*rand();  
    par(i).fit=0;               
    par(i).bestfit=0;
    par(i).bestl1n=par(i).l1n;      
    par(i).bestl2n=par(i).l2n;   
    par(i).bestl3n=par(i).l3n;      
    par(i).bestl1l=par(i).l1l;
    par(i).bestl2l=par(i).l2l;      
    par(i).bestl3l=par(i).l3l;   
    par(i).bestgw=par(i).gw;      
    par(i).bestgf=-par(i).gf; 
    par(i).bestgp=par(i).gp;            
end
par_best=par(1);    %初始化粒子群中最佳粒子
 
for k=1:10   
    for p=1:n
        [par(p) par_best]=update_par(par(p),par_best);  %更新每个粒子信息        
    end 
end