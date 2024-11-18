function [xtd] = OMP(A,b,Np)
%This function implements the OMP algorithm. 
%reference:https://angms.science/doc/RM/OMP.pdf

%Normalize columns of dictionary
col_norms=vecnorm(A);
nonzero_cols= find(col_norms~=0);
Anorm=A;
Anorm(:,nonzero_cols)=A(:,nonzero_cols)./col_norms(nonzero_cols);
rk=b;                                                     %residue
xtd=zeros(size(A,2),1);   

for k=1:Np
    xk=xtd;
    [maxval,max_index]=max(abs(Anorm'*rk));
    index_set(k)=max_index;                             %support index
    Acols(:,k)=Anorm(:,max_index);                      %support matrix
    xk_coeff=pinv(Acols)*b;
    xk(index_set)=xk_coeff;
    bk=Anorm*xk;
    rk=b-bk;
end

Omega=A(:,index_set);
xtd_coeff=inv(Omega'*Omega)*Omega'*b;
xtd(index_set)=xtd_coeff;