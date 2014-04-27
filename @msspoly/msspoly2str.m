function str = msspoly2str(p)
% str =  msspoly2str(p) - Returns a string, str,  representing the msspoly, p.
%

if isempty(p)
    str = sprintf('   Empty msspoly matrix: %d-by-%d\n',p.dim(1),p.dim(2));
    return
end

S{p.dim(1),p.dim(2)}=[];             % strings of entries

ns = size(p.sub,1);

for i=1:ns,
    ii=p.sub(i,1);
    jj=p.sub(i,2);
    S{ii,jj}=msspoly.term_to_string(S{ii,jj},[p.var(i,:) p.pow(i,:) p.coeff(i,:)]);
end

L=zeros(1,p.dim(2));
for i=1:p.dim(2),
    L(i)=3;
    for j=1:p.dim(1),
        k=length(S{j,i});
        if k==0,
            S{j,i}=' 0';
        else
            L(i)=max(L(i),k);
        end
    end
end
str = [];

for i=1:p.dim(1),
    if i>1
      str = sprintf('%s\n',str);
    end
    str_i = [];
    for j=1:p.dim(2),
        str_i = [str_i,sprintf('%s%s  ',repmat(' ',1,L(j)-length(S{i,j})),S{i,j})];
    end
    str = [str, sprintf('[  %s]',str_i)];
end
        

