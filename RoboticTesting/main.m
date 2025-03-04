% Estudio estadístico de zonas perimetrales
% Specify txt file.
close all; clear all;

[base_x, base_y, base_z, wobj_x, wobj_y, wobj_z]=importerFunction("./221121_10_12v_32mmPerp500.txt", [2, Inf]);
disp('Number of experiments')
numExperimentos = sum(wobj_x==0)/4
disp('Check points:')
puntosMatriz = 36; % 36 grid points
numPuntos = numExperimentos*puntosMatriz

borrar = find(base_x==0);
base_x(borrar) = []; 
borrar = find(base_y==0);
base_y(borrar) = [];
borrar = find(base_z==0);
base_z(borrar) = [];
borrar = find(wobj_x==0);
wobj_x(borrar) = [];
borrar = find(wobj_y==0);
wobj_y(borrar) = [];
borrar = find(wobj_z==0);
wobj_z(borrar) = [];

% Comprobaciones
if ((length(base_x ) == length(base_y)) && (length(base_x ) == length(base_z)) && numPuntos == length(base_x ))
       disp('Checking correct')
else
    disp('Error, cancel analysis and check txt')
    pause
end

% Matrix build
matrixWobj = [wobj_x,wobj_y,wobj_z]
matrixBase = [base_x,base_y,base_z]

% Raw points (not shown)
% figure(1)
% plot3(wobj_x,wobj_y,wobj_z,'*')
figure; 
scatter3(wobj_x,wobj_y,wobj_z)
xlabel('Stop distance (mm)')
ylabel('y (mm)')
zlabel('z (mm)')
xlim([0 300]);
ylim([-200 200]);
zlim([-60 150]);
hold on;
% Reference plane
[y z] = meshgrid([-175:10:175],[-50:10:150]); % Generate x and y data; 
%surf(X,Y,Z);
surf(zeros(size(y,1),size(z,2)),y,z);
colormap([0.9 0.9 0.9]);
view(27.6, 24.6) 

% Grid
y = [-175 -150 -100 -50 0 50 100 150 175];
z = [140 50 0 -50]; 
puntosy = length(y)
puntosz = length(z)
[Y,Z] = meshgrid(y,z);

distParo = matrixWobj(:,1); 
distParo2 = reshape(distParo,puntosy,puntosz*numExperimentos)';

%% Obtención de datos de un solo punto de entrada de todos los experimentos.
% Spg se quiere obtener todos los puntos de paro de un punto de entrada
% distParo2 está ordenada con matrices de 4 x 9, que en este caso son los
% puntos de entrada. Para obtener un vector con todos los puntos de entrada
% el sexto punto de entrada de la primera fila (esto es, el robot entrando
% por la zona superior, un poco a la derecha):
% Se toma el elemento (1,6) de cada matriz de experimentos

% puntosParoPuntoEspecificoEntrada = distParo2([1:4:end],6)
%% FIN

%for i = 0:length(y):puntos_x*num_experim-puntos_x
%mesh(X,Y,Z_nueva(i+1:i+puntos_x,:)');
%hold on;
%end

% Statitics
% Cell matrix, each element contains a vector with all stop distances for
% ONE position

% Creación de celda de 4*9
cellMatrix = cell(puntosz,puntosy)

% Relleno por filas
for i = 1:puntosz
    for j = 1: puntosy
        cellMatrix{i,j} = distParo2(i:puntosz:puntosz*numExperimentos,j); % contains all samples per entry according to the experimental grid
        % Estadísticos por cada elemento
        varianzas(i,j) = var(cellMatrix{i,j});                 
        desv_tipicas(i,j) = std(cellMatrix{i,j});
        medias(i,j)= mean(cellMatrix{i,j});
    end
end

upperBound = medias+desv_tipicas;
lowerBound = medias-desv_tipicas;
figure
plot3(upperBound,Y,Z,'>','color',[0 0 1]);
hold on;
plot3(lowerBound,Y,Z,'<','color',[0 0 1]);
hold on;
plot3(medias',Y',Z','-.or','markerfacecolor','k'); % Traspongo para que las líneas de unión rojas salgan horizontales (si no, salen verticales).
grid on;
hold on;

% MATRICES
disp('Matrices of standard deviations and average stop values')

% Statistical values for the operation point
% Indices (1,5) (2,5) (3,5)
media_puntoOperacion = mean(medias(1:3,5))
max_puntoOperacion = max(max([cellMatrix{1,5},cellMatrix{2,5}, cellMatrix{3,5}]))
min_puntoOperacion = min(min([cellMatrix{1,5},cellMatrix{2,5}, cellMatrix{3,5}]))

% Global statistical values
max_med = max(medias);
max_med = max(max_med)
min_med = min(medias);
min_med = min(min_med)

max_std = max(desv_tipicas);
max_std = max(max_std)
min_std = min(desv_tipicas);
min_std = min(min_std)

% Detection planes
Y_ = repmat(Y,1,numExperimentos);
Z_ = repmat(Z,1,numExperimentos);
%plot3(Y_,Z_,distParo2,'*');
A=medias+desv_tipicas;
B=medias;
C=medias-desv_tipicas;
[y z] = meshgrid([-175:10:175],[-50:10:150]); % Generate x and y data; % Generate x and y data
%surf(X,Y,Z);
surf(zeros(size(y,1),size(z,2)),y,z);
colormap([0.9 0.9 0.9]);

% Plot líneas media +- desv. típica
for i = 1:puntosy*puntosz
    plot3([A(i);C(i)],[Y(i);Y(i)],[Z(i);Z(i)],'color', 'b')
    hold on;
end
surf(A, Y, Z,'FaceColor','g', 'FaceAlpha',0.5, 'EdgeColor','none')
surf(C, Y, Z,'FaceColor','r', 'FaceAlpha',0.5, 'EdgeColor','none')

% Plot planos
figure;
hold on;
%surf(medias, Y, Z,'FaceColor','b', 'FaceAlpha',0.5, 'EdgeColor','none')
surf(A, Y, Z,'FaceColor','g', 'FaceAlpha',0.5, 'EdgeColor','none')
surf(C, Y, Z,'FaceColor','r', 'FaceAlpha',0.5, 'EdgeColor','none')

% Histograma
figure; histogram(distParo2)

figure; 
%scatter3(wobj_x,wobj_y,wobj_z) % mostraría los puntos
xlabel('Stop distance (mm)')
ylabel('y (mm)')
zlabel('z (mm)')
xlim([0 300]);
ylim([-200 200]);
zlim([-60 150]);
hold on;
gm = importGeometry("antennaPrototype.STL");
rotate(gm,90,[0 0 0],[1 0 0]);
rotate(gm,90,[0 0 0],[0 0 1]);
translate(gm,[-470,0 0]);
translate(gm,[0,-480/2 0]);
translate(gm,[0, 0 -100]);
pdegplot(gm);
hold on;
surf(A, Y, Z,'FaceColor','g', 'FaceAlpha',0.5, 'EdgeColor','none')
surf(C, Y, Z,'FaceColor','r', 'FaceAlpha',0.5, 'EdgeColor','none')

%% Plot líneas media +- desv. típica
for i = 1:puntosy*puntosz
    plot3([A(i);C(i)],[Y(i);Y(i)],[Z(i);Z(i)],'color', 'b')
    hold on;
end

plot3(medias',Y',Z','-.ob');
grid on;
hold on;
%% Fin Plot líneas media +- desv. típica

flag = 0 %guarda archivo
if flag == 1
savefile = '221121_10_12v_32mmPerp500.mat'
save(savefile, 'medias', 'varianzas', 'min_med', 'min_std','max_med',...
    'max_std', 'upperBound', 'lowerBound','max_puntoOperacion','media_puntoOperacion', 'min_puntoOperacion');
end

