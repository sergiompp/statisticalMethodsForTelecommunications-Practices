clc
clear all

% VISUALIZACIÓN DATOS
disp('METODOS ESTADISTICOS PARA LAS COMUNICACIONES - PRÁCTICA 2 ');
disp('FECHA REALIZACIÓN: ABRIL 2021');
disp(' ');
%% EJERCICIO 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parte 1: Centrales Europa
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--------------------------------------------------------------------------
% CONTRASTE DE HIPOTESIS
% Ho: mediaRuidoEuropa <= 83
% H1: mediaRuidoEuropa > 83
%--------------------------------------------------------------------------
ruidoCentralesEuropa = [79, 85, 90, 85, 84, 88, 86, 79];
mediaEuropa = 83;
alpha = 0.01;                            % Nivel de Significación (= alpha)
                                         % Nivel de Confianza (= 1-alpha)
                                                    
[muahatEuropa, simahatEuropa, muciEuropa]=normfit(ruidoCentralesEuropa, alpha);
% muahat - Media
% simahat - Varianza  
% muci - Intervalo Confianza (al nivel de confianza)

% ------------- Caso bilateral ------------- 
[hEuropa, pEuropa, ciEuropa] = ttest(ruidoCentralesEuropa, mediaEuropa, alpha);
% h - Hipotesis que acepta (Ho - 0/ H1 - 1)
% p - p-valor (Si es < que alpha - Se rechaza Ho)
%             (Si es > que alpha - No se rechaza Ho)
% ci - Intervalo 

% VISUALIZACIÓN DATOS
disp('***************************************************************');
disp('                          EJERCICIO 1');
disp('***************************************************************');
disp(' ');
disp(' ');

disp('---------------------------------------------------------------');
disp('--------------- PARTE 1: Datos Centrales Europa ---------------');
disp('---------------------------------------------------------------');
disp(' ');

disp('CONTRASTE DE HIPOTESIS:');
disp(' - H0: Media Ruido Europa <= 83 dB');
disp(' - H1: Media Ruido Europa > 83 dB');
disp(' ');

disp('Valores Obtenidos: ');      
disp([' - Media: u = ',num2str(muahatEuropa), ' dB']);
disp([' - Varianza: sigma = ',num2str(simahatEuropa)]);
disp([' - Intervalo de Confianza (al 99 %): I.C. = [',num2str(muciEuropa(1)), '; ',num2str(muciEuropa(2)),']']);
disp(' ');

disp('Valores del t-test: ');      
disp([' - Hipótesis Aceptada: H = ',num2str(hEuropa)]);
disp([' - p - valor = ',num2str(pEuropa)]);
disp(' ');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parte 2: Centrales EEUU
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--------------------------------------------------------------------------
% CONTRASTE DE HIPOTESIS
% Ho: mediaEEUU <= mediaEuropa
% H1: mediaEEUU > mediaEuropa
%--------------------------------------------------------------------------
ruidoCentralesEEUU = [76, 79, 80, 73, 74, 78, 75, 79, 81, 72];
mediaEEUU = mean(ruidoCentralesEEUU);
alphaNuevo = 0.05;

[muahatEEUU, simahatEEUU, muciEEUU]=normfit(ruidoCentralesEEUU, alphaNuevo);

% VISUALIZACIÓN DATOS
disp('---------------------------------------------------------------');
disp('---------------- PARTE 2: Datos Centrales EEUU ----------------');
disp('---------------------------------------------------------------');
disp(' ');

disp('Valores Obtenidos: ');      
disp([' - Media: u = ',num2str(muahatEEUU), ' dB']);
disp([' - Varianza: sigma = ',num2str(simahatEEUU)]);
disp([' - Intervalo de Confianza (al 95 %): I.C. = [',num2str(muciEEUU(1)), '; ',num2str(muciEEUU(2)),']']);
disp(' ');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parte 3: Contraste 2 Poblaciones
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[h2Poblaciones,p2Poblaciones,ci2Poblaciones] = ttest2(ruidoCentralesEuropa, ruidoCentralesEEUU, alphaNuevo);     % Para 2 poblaciones

% VISUALIZACIÓN DATOS
disp('---------------------------------------------------------------');
disp('---------- PARTE 3: Comparación de las 2 Poblaciones ----------');
disp('---------------------------------------------------------------');
disp(' ');

disp('CONTRASTE DE HIPOTESIS:');
disp(' - H0: Media Ruido EEUU [dB] <= Media Ruido Europa [dB]');
disp(' - H1: Media Ruido EEUU [dB] > Media Ruido Europa [dB]');
disp(' ');

disp('Valores del t-test para las 2 poblaciones: ');      
disp([' - Hipótesis Aceptada: H = ',num2str(h2Poblaciones)]);
disp([' - p - valor = ',num2str(p2Poblaciones)]);
disp([' - Intervalo de Confianza (al 95 %): I.C. = [',num2str(ci2Poblaciones(1)), '; ',num2str(ci2Poblaciones(2)),']']);
disp(' ');

% PLOTEADO DATOS
figure('Name', 'Ejercicio 1', 'NumberTitle','off');
subplot(1,2,1);
plot(ruidoCentralesEuropa);
title('Ruido de las centrales de Europa');
xlabel('Nº Central');
ylabel('Ruido Originado [en dB]');
subplot(1,2,2);
plot(ruidoCentralesEEUU);
xlabel('Nº Central');
ylabel('Ruido Originado [en dB]');



%% EJERCICIO 3
clc
%--------------------------------------------------------------------------
% CONTRASTE DE HIPOTESIS
% Ho: mediaClientesAtendidos = 150
% H1: mediaClientesAtendidos /= 150
%--------------------------------------------------------------------------
mediaClientesAtendidos = 150;
desviacionClientesAtendidos = 3.4;
alphaClientesAtendidos = 0.05;

clientesAtendidos = [128, 197, 176, 185, 146, 165, 148, 184, 149, 177, 146, 156];



[hClientes,sigClientes,ciClientes] = ttest(clientesAtendidos, mediaClientesAtendidos, alphaClientesAtendidos, 'both');    

% PLOTEADO DATOS
figure('Name', 'Ejercicio 3', 'NumberTitle','off');
plot(clientesAtendidos);
title('Número Clientes Atendidos En Cada Mes');
xlabel('Mes');
ylabel('Número de Clientes / Mes');

% VISUALIZACIÓN DATOS
disp('***************************************************************');
disp('                          EJERCICIO 3');
disp('***************************************************************');
disp(' ');
disp(' ');

disp('---------------------------------------------------------------');
disp('----------------------- Datos Obtenidos -----------------------');
disp('---------------------------------------------------------------');
disp(' ');

disp([' - Media Poblacional: u = ',num2str(mediaClientesAtendidos)]);
disp([' - Desviación Poblacional: sigma = ',num2str(desviacionClientesAtendidos)]);
disp(' ');

disp('CONTRASTE DE HIPOTESIS:');
disp(' - H0: Media Clientes Atendidos = 150');
disp(' - H1: Media Clientes Atendidos /= 150');
disp(' ');

disp('Valores del t-test: ');      
disp([' - Hipótesis Aceptada: H = ',num2str(hClientes)]);
disp([' - Sigma = ',num2str(sigClientes)]);
disp([' - Intervalo de Confianza (al 95 %): I.C. = [',num2str(ciClientes(1)), '; ',num2str(ciClientes(2)),']']);
disp(' ');

%% EJERCICIO 4.1
clc
%--------------------------------------------------------------------------
% CONTRASTE DE HIPOTESIS
% Ho: ingresosMediosPostCovid <= ingresosMediosPreCovid
% H1: ingresosMediosPostCovid > ingresosMediosPreCovid
%--------------------------------------------------------------------------

ingresosMediosPreCovid_Febrero = [1 3 2 3 4 3 2 3 1 4 3 4 2 3 4 2 3 1 3 2 4 3 5 3 2 4 3 2 4 3 2 4 1 3 2 4 3 5 3 2 3 4 3 2 3 4 1 3 2 3 4 3 5 3 2 3 2 1 3 2 2 3 4 3 2 3 4 3 2 3 3 4 3 2 3 4 2 3 2 3 2 2 3 3 4 2 3 2 4 3 2 3 4 5 3 2 3 2 3 4 3 2 3 4 3 2 3 1 3 2];
ingresosMediosPostCovid_Marzo = [3 5 4 5 5 6 5 4 6 3 2 3 5 4 6 5 7 6 4 5 3 4 5 6 5 4 3 5 4 6 5 4 3 5 6 4 3 2 4 3 5 6 5 4 3 4 5 4 3 5 4 3 5 6 4 3 4 5 4 3 4 5 4 3 4 5 2 3 4 5 3];

alphaCovid = 0.05;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ÉPOCA PRECOVID

[mediaIngresosPreCovid, sigmaIngresosPreCovid, muciPreCovid]=normfit(ingresosMediosPreCovid_Febrero, alphaCovid);

% VISUALIZACIÓN DATOS
disp('***************************************************************');
disp('                          EJERCICIO 4');
disp('***************************************************************');
disp(' ');
disp(' ');


disp('---------------------------------------------------------------');
disp('-------------- Datos Obtenidos Previos al Covid ---------------');
disp('---------------------------------------------------------------');
disp(' ');

disp([' - Media Poblacional: u = ',num2str(mediaIngresosPreCovid*1000), ' €']);
disp([' - Desviación Poblacional: sigma = ',num2str(sigmaIngresosPreCovid*1000), ' €']);
disp([' - Intervalo de Confianza (al 95 %): I.C. = [',num2str(muciPreCovid(1)*1000), ' €; ',num2str(muciPreCovid(2)*1000),' €]']);
disp(' ');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ÉPOCA POSTCOVID

[mediaIngresosPostCovid, sigmaIngresosPostCovid, muciPostCovid]=normfit(ingresosMediosPostCovid_Marzo, alphaCovid);

% VISUALIZACIÓN DATOS
disp('---------------------------------------------------------------');
disp('------------ Datos Obtenidos Posteriores al Covid -------------');
disp('---------------------------------------------------------------');
disp(' ');

disp([' - Media Poblacional: u = ',num2str(mediaIngresosPostCovid*1000), ' €']);
disp([' - Desviación Poblacional: sigma = ',num2str(sigmaIngresosPostCovid*1000), ' €']);
disp([' - Intervalo de Confianza (al 95 %): I.C. = [',num2str(muciPostCovid(1)*1000), ' €; ',num2str(muciPostCovid(2)*1000),' €]']);
disp(' ');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COMPARACIÓN POBLACIONES

[h_2poblac,p_2poblac,ci_2poblac] = ttest2(ingresosMediosPreCovid_Febrero, ingresosMediosPostCovid_Marzo, alphaCovid);     

% VISUALIZACIÓN DATOS
disp('CONTRASTE DE HIPOTESIS:');
disp(' - H0: Ingresos Medios Post Covid <= Ingresos Medios Pre Covid');
disp(' - H1: Ingresos Medios Post Covid > Ingresos Medios Pre Covid');
disp(' ');

disp('Valores del t-test: ');      
disp([' - Hipótesis Aceptada: H = ',num2str(h_2poblac)]);
disp([' - p - valor = ',num2str(p_2poblac)]);
disp([' - Intervalo de Confianza (al 95 %): I.C. = [',num2str(ci_2poblac(1)), '; ',num2str(ci_2poblac(2)),']']);
disp(' ');

%% EJERCICIO 4.2
clc
close all
% Ajustes de distribuciones (Weibull o Normal)

figure('Name', 'Ejercicio 4', 'NumberTitle','off');
subplot(1,2,1);
histogram(ingresosMediosPreCovid_Febrero);
title('Ingresos Medios Pre Covid - Febrero');
xlabel('x 1000 €');
ylabel('Nº Supermercados');
subplot(1,2,2);
histogram(ingresosMediosPostCovid_Marzo);
title('Ingresos Medios Post Covid - Marzo');
xlabel('x 1000 €');
ylabel('Nº Supermercados');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INGRESOS PRE COVID - FEBRERO
% Para Weibull
[hPreCovidDistribucionWeibull,pPreCovidDistribucionWeibull]=WiebulloNormal(ingresosMediosPreCovid_Febrero, 'weibull')

% El gráfico del histograma no es una distribucion Wiebull (sólo son 110 
% datos, más podría acercar)


% Para Normal
[hPreCovidDistribucionNormal,pPreCovidDistribucionNormal]=WiebulloNormal(ingresosMediosPreCovid_Febrero, 'normal')

% El gráfico del histograma no es una distribucion Normal (sólo son 110
% datos, más podría acercarse a una dist Normal)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INGRESOS POST COVID - MARZO

% Para Weibull
[hPostCovidDistribucionWeibull,pPostCovidDistribucionWeibull]=WiebulloNormal(ingresosMediosPostCovid_Marzo, 'weibull')

% El gráfico del histograma no es una distribucion Wiebull (sólo son 72 
% datos, más podría acercar)


% Para Normal
[hPostCovidDistribucionNormal,pPostCovidDistribucionNormal] = WiebulloNormal(ingresosMediosPostCovid_Marzo, 'normal')

% El gráfico del histograma no es una distribucion Normal (sólo son 72 
% datos, más podría acercarse a una dist Normal)

%% FUNCIONES
function [hDistribucion, pDistribucion] = WiebulloNormal(source, distribucion)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Función que determina si la distribución de los datos se trata de una
    % de tipo Normal o Weibull
    % 
    % PARAMETROS ENTRADA:
    % source: Datos a analizar
    % distribucion: 'weibull' o 'normal'. Si se pretende analizar una u otra
    %
    % PARAMETROS SALIDA:
    % hDistribucion: Devuelve 0 si es correcta la hipótesis de la 
    %                  distribución propuesta y 1 en caso contrario
    % pDistribucion: p-valor
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    fitdist(source', distribucion);
    [hDistribucion,pDistribucion]=chi2gof(source, 'CDF', ans);       % Contraste chi cuadrado
end
