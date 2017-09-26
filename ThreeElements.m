clear 

Main_information=[
    0 0 1 -3.635158
    0 1 0 -7.68810866
    1 0 0 -8.947604
    0 1 6 -30.280011
    0 1 2 -15.461302
    0 2 2 -23.398144
    0 4 3 -42.843389
    0 7 1 -57.872793
    1 0 6 -31.221715
    2 0 5 -36.692165
    3 0 4 -42.023471
    4 0 3 -47.294627
    5 0 2 -52.617267
    6 0 1 -57.825874
    6 1 0 -61.552051
    2 6 0 -64.461114
    1 0 7 -63.037239];%[V Ti Cu  E]

Aeq=(Main_information(:,1:3))';
f=Main_information(:,4);
lb=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ]';
ub=[10^10;10^10;10^10;10^10;10^10;10^10;10^10;10^10;10^10;10^10;
    10^10;10^10;10^10;10^10;10^10;10^10;10^10];
ThreeE_information=load('ThreeE_information.txt');
winners=[];
all_inf=[];
for i=1:size(ThreeE_information)
    beq=ThreeE_information(i,1:3);
    [X,E]=linprog(f,[],[],Aeq,beq,lb,ub);
    deta=ThreeE_information(i,4)-E;
    all_inf=[all_inf;ThreeE_information(i,:) deta];
    if  E>ThreeE_information(i,4)
        winners=[winners;ThreeE_information(i,:)]
    end
end


