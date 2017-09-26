clear
A=load('TiVCu_H.txt');
B=[];
for ii=1:size(A,1)
    if A(ii,4)<0
        B=[B;A(ii,:)];
    end
end
C=[B(:,8)+B(:,7)*0.5      sqrt(3)*0.5*B(:,7)      B(:,4)
    0 0 0
    1 0 0
    0.5 sqrt(3)*0.5 0
    
    ];%
D=[A(:,8)+A(:,7)*0.5      sqrt(3)*0.5*A(:,7)      A(:,4)
    0 0 0
    1 0 0
    0.5 sqrt(3)*0.5 0
    
    ];%
 DT = delaunayTriangulation(C(:,1),C(:,2),C(:,3))
 K = convexHull(DT)
 figure
 plot3(D(:,1),D(:,2),D(:,3),'.')
 hold on
 for jj=1:size(K,1)
     T=[C(K(jj,1),:)
         C(K(jj,2),:)
           C(K(jj,3),:)
           C(K(jj,1),:)];
     plot3(T(:,1),T(:,2),T(:,3))
     hold on 
 end
 figure 
 [h,hg,htick]=terplot;
 hold on
 for jj=1:size(K,1)
     T=[C(K(jj,1),1:2)
         C(K(jj,2),1:2)
           C(K(jj,3),1:2)
           C(K(jj,1),1:2)];
     plot(T(:,1),T(:,2))
     hold on 
 end
 hlabels=terlabel('V%→','←Ti%','Cu%→');
 
text(-0.1,-0.025,'Ti','fontsize',16);
hold on
text(0.485,0.93,'V','fontsize',16);
hold on
text(1.1,-0.025,'Cu','fontsize',16);
 