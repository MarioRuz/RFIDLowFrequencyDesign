% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function obtains the nearest excess number of 
% turns to 27 microhenries.|
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function valor = numbeOfturns(vector)
flag = 0;
dim = size(vector);
columnas = dim(1,2);
dif = 1000;                
for i = 1:columnas
   dif_nueva = vector(i)-27;
   if(dif_nueva <= dif & dif_nueva >=0)
       flag = 1;
       dif = dif_nueva;
       valor = i;
   end
end
if flag == 0
    disp('All values are less than 27 µH, check the inductance vector.')
    valor = 'Check the inductance vector';
end

