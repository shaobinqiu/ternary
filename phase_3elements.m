clear
A=load('TiVCu_H.txt');
binary=load('TiVCu_binary.txt');
for ll=1:size(binary,1)
binary(ll,6)=binary(ll,1)/(binary(ll,1)+binary(ll,2)+binary(ll,3));
binary(ll,7)=binary(ll,2)/(binary(ll,1)+binary(ll,2)+binary(ll,3));
binary(ll,8)=binary(ll,3)/(binary(ll,1)+binary(ll,2)+binary(ll,3));
end
A=[A;binary];
B=[];
for ii=1:size(A,1)
    if A(ii,4)<0 
        B=[B;A(ii,:)];
    end
end
C=[B(:,8)+B(:,7)*0.5      sqrt(3)*0.5*B(:,7)      B(:,4)  B(:,1:3)
    0 0 0  1 0 0
    1 0 0  0 0 1
    0.5 sqrt(3)*0.5 0 0 1 0
    
    ];
D=[A(:,8)+A(:,7)*0.5      sqrt(3)*0.5*A(:,7)      A(:,4)
    0 0 0
    1 0 0
    0.5 sqrt(3)*0.5 0
    
    ];%
 DT = delaunayTriangulation(C(:,1),C(:,2),C(:,3))
 K = convexHull(DT)%find convex points
 figure
 plot3(D(:,1),D(:,2),D(:,3),'.')
 hold on
 C_p=[];
 for jj=1:size(K,1)
     T=[C(K(jj,1),:)
         C(K(jj,2),:)
           C(K(jj,3),:)
           C(K(jj,1),:)];
       C_p=[C_p;T];
     plot3(T(:,1),T(:,2),T(:,3))
     hold on 
 end
 C_p=unique(C_p,'rows');
 figure 
 [h,hg,htick]=terplot;
 hold on
 for jj=1:size(K,1)
     T=[C(K(jj,1),1:2)
         C(K(jj,2),1:2)
           C(K(jj,3),1:2)
           C(K(jj,1),1:2)];
     plot(T(:,1),T(:,2),'k','LineWidth',2)
     hold on 
 end%plot triangles
 hlabels=terlabel('V%→','←Ti%','Cu%→');
 
text(-0.1,-0.025,'Ti','fontsize',16);
hold on
text(0.485,0.93,'V','fontsize',16);
hold on
text(1.1,-0.025,'Cu','fontsize',16);

for kk=1:size(C_p,1)
    if abs(C_p(kk,1)*C_p(kk,2)*C_p(kk,3))>0.00001
        text(C_p(kk,1),C_p(kk,2),['Ti',int2str(C_p(kk,4)),'V',int2str(C_p(kk,5)),'Cu',int2str(C_p(kk,6))],'Color','blue','fontsize',12);
    end
end%mark the convex points