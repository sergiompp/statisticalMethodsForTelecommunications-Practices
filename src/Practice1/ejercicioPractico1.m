clc
clear all

%% EJERCICIO 1
%--------------------------------------------------------------------------
% Siendo el valor de las dos variables descritas a una muestra aleatoria
% simple de 20 alumnos calcula:
%--------------------------------------------------------------------------
altura = [175; 182; 156; 175; 190; 174; 186; 160; 179; 168; 170; 194; 174; 189; 168; 178; 169; 163; 153; 160];
peso = [69; 89; 50; 69; 88; 76; 88; 59; 81; 69; 81; 85; 73; 94; 70; 80; 75; 75; 52; 65];

% a) Realiza la tabla de frecuencias completa para la variable ALTURA

tablaAltura = tabulate(altura);
abs_acum_altura = cumsum(tablaAltura(:,2));
rel_acum_altura = cumsum(tablaAltura(:,3));
tablaTotalAltura = [tablaAltura abs_acum_altura rel_acum_altura];

% b) Realiza la tabla de frecuencias completa para la variable PESO

tablaPeso = tabulate(peso);
abs_acum_peso = cumsum(tablaPeso(:,2));
rel_acum_peso = cumsum(tablaPeso(:,3));
tablaTotalPeso = [tablaPeso abs_acum_peso rel_acum_peso];

%--------------------------------------------------------------------------
% VISUALIZACIÓN DE LAS TABLAS COMPLETAS:
%--------------------------------------------------------------------------
tablaTotalAltura
tablaTotalPeso

% c)Calcula media, mediana, varianza y desviación típica para cada una de las variables
mediaAltura = mean(altura);
medianaAltura = median(altura);
varianzaAltura = var(altura);
desviacionTipicaAltura = std(altura);

mediaPeso = mean(peso);
medianaPeso = median(peso);
varianzaPeso = var(peso);
desviacionTipicaPeso = std(peso);

% d) Realiza el histograma de ambas variables
subplot(2,1,1)
hist(altura, 10)
title('Personas / Altura');
xlabel('cm');
ylabel('Nº Personas');

subplot(2,1,2)
hist(peso, 10)
title('Personas / Peso');
xlabel('Kg');
ylabel('Nº Personas');

% e) Calcula la correlación

coefCorrelacion = corrcoef(altura, peso)

% f) Realiza el gráfico de dispersión para las variables conjuntamente
figure 
plot(altura, peso, '.')
title('Gráfico de Dispersión');
xlabel('Altura [cm]');
ylabel('Peso [kg]');

% g) Dibuja el diagrama de sectores para cada variable con la frecuencia relativa.
figure
pie(tablaAltura(:,2))
title('Frecuencia Relativa -  Altura');

figure
pie(tablaPeso(:,2))
title('Frecuencia Relativa - Peso');

% h) Calcula la covarianza entre las variables.
covarianza = cov(altura, peso)

%% EJERCICIO 2
%--------------------------------------------------------------------------
% La probabilidad que un estudiante que matricula en la universidad se gradúe
% es de 0,6.
% Calcular la probabilidad de que escogidos 20 alumnos:
%--------------------------------------------------------------------------

% Es una dist. Binomial

% a) Ninguno acabe graduándose
prob_0_graduados = binopdf(0,20,0.6);
% b) Que se gradúen la mitad de los veinte.
prob_mitad_graduados = binopdf(10,20,0.6);
% c) Que se gradúen todos.
prob_todos_graduados = binopdf(20,20,0.6);
% d) Que se gradúen como mucho 13 alumnos.
prob_max_13_graduados = 0; 
for i = 0:13
    prob_max_13_graduados = prob_max_13_graduados + binopdf(i,20,0.6);
end

%% EJERCICIO 3
%--------------------------------------------------------------------------
% Conociendo que las ventas en telefonía móvil siguen una distribución 
% normal con media poblacional 25 millones y desviación estándar de 2 millones.
% Calcula:
%--------------------------------------------------------------------------

% Es una dist. Normal

% a) Probabilidad de que las ventas sean menores a 21 millones este año
probVentasMenor21Mill = normcdf(21,25,2);

% b) Probabilidad que las ventas se encuentren entre los 23 y los 27 millones.
probVentasMenor23Mill = normcdf(23,25,2);
probVentasMayor27Mill = 1-normcdf(27,25,2);
probVentas23_27Mill = 1 - probVentasMenor23Mill - probVentasMayor27Mill;

%% 

altura2 = [1;1;2;1;2;1;1;2;2;1;1;1;1;1;1;1];


figure
pie(altura2)
title('Frecuencia Relativa -  Altura');
legend('153','156','160','163','168','169','170','174','175','178','179','182','186','189','190','194')


%%
peso2 = [1;1;1;1;3;1;1;2;1;1;2;1;2;1;1];



figure
pie(peso2)
title('Frecuencia Relativa -  Peso');
legend('50','52','59','65','69','70','73','75','76','80','81','85','88','89','94')

