                                                                        %Calculos
                                                                %Half waveleght dipole
                                                             %Antenna and radio propagation
                                                         %Profesor: Ing. Oscar Napoleon Martinez
                                                                     %Elaborado Por:
                                                    %  *Yeser Alfredo Morales *Jarib Castillo *Efrain Ibarra
%               ------------------------------------------------------------------------------------------------------------------------            %
clc; clear all;


%                                                               Datos Pedidos al Usuario

display('Por favor digite los siguientes datos')
PT=input('Potencia de entrada en el Generador  (W):  ');                         %Potencia de entrada en la antena dipolo
r=input('radio (m):  ');                                                         %Radio o distancia a medir el campo electrico y Magnetico
f1=input('Ingrese frecuencia en MHz:   ');           f=f1*1e6;                 %Frecuencia a la que opera el dipolo
lx=input('Numeros de lambda en eje X "a*lambda": ');                           %Dimension de apertura rectangular en eje X
ly=input('Numeros de lanmda en eje Y "b*lambda": ');                           %Dimension de apertura rectangular en eje Y
r1=input('Ingrese el radio exterior  en mm:  ');     R1=r1*1e-3                 %Radio mayor del tubo.
r2=input('Ingrese el radio interior  en mm:  ');     R2=r2*1e-3                 %Radio menor del tubo.
%for m=87.5e6:200e3:108e6;
%   f=m;
m=0;

%               _________________________________________________________________________________________________________________________           %
 %                                            Calculos de variables que caracterizan la Dipolo Media Onda

Rrad=73;                                                                      %Resistencia de radiacion del dipolo en ohms.
n=120*pi;                                                                     %Impedancia intrinseca del espacio libre.
UAl=(pi*4e-7) ;                                                               %Permeabilidad del Aluminio
CondAl=(3.5e7);                                                               %Conductividad del Aluminio
c=3e8;                                                                        %Velocidad de la Luz.
At=pi*(R1^2-R2^2)                                                             %Area transversal del tubo.
lambda = c/f;                                                                 %Longitud de onda.
k =(2*pi)/lambda;                                                             %Numero de ondas.
L=lambda./2;                                                                  %Longitud de dipolo.
Rloss= ((L/(2*pi*At))*sqrt((pi*f*UAl)/CondAl))                                %Resistencia de perdida.
Ecd=Rrad/(Rloss+Rrad)                                                         %Eficiencia de conduccion del dielectrico.
Prad=Ecd*PT                                                                   %Potencia Total Radiada.
Io=sqrt(2*Prad/Rrad)                                                          %Corriente.
theta=2/3*pi;                                                                 %Valor de Theta en grados para mostrar valores puntuales.
E=60*1j*Io*exp(-1j*k*r)*(1/r)*(cos((pi/2)*cos(theta))./sin(theta))            %Ecuacion del campo el�ctrico en valor puntual a Theta.
H=(1/(2*pi))*1j*Io*exp(-1j*k*r)*(1/r)*(cos((pi/2)*cos(theta))./sin(theta))    %Ecuacion del campo magn�tico en valor puntual a Theta.
Wav=(15*Io^2)/(pi*r^2)*((cos((pi/2)*cos(theta))./sin(theta))).^2              %Densidad de potencia radiada o vector de poynting promedio en valor puntual a Theta.
Wo=(15*Io.^2)/(pi*r.^2)                                                       %Densidad de potencia radiada maxima
U=(15*Io.^2)/pi*((cos((pi/2)*cos(theta))./sin(theta))).^2                     %Intensidad de radiaci�n en valor puntual a Theta
Umax=(15*Io.^2)/pi                                                            %Intensidad m�xima de radiaci�n en valor puntual a Theta.
FR=Wav/Wo                                                                     %Intensidad de radiacion normalizada en valor puntual a Theta.
D=4*pi*U/Prad                                                                 %Directividad
DdB=10*log10(D)                                                               %Directividad en decibelios.
Do=4*pi*Umax/Prad                                                             %Directividad M�xima.
DodB=10*log10(Do)                                                             %Directividad M�xima en decibelios.
HPBW=(1-sqrt(1-4*27e-4*101/Do))/54e-4                                         %Half power beamwidth.
G=Ecd*D                                                                       %Ganancia.
GdB=10*log10(G)                                                               %Ganancia en decibelios.
Go=Ecd*Do                                                                     %Ganancia M�xima.
GodB=10*log10(Go)                                                             %Ganancia M�xima en decibelios.
ohmA=4*pi/Do                                                                  %Angulo s�lido del haz.
Ae=(lambda^2)/4*pi*G                                                          %Area efectiva.
Aem=(lambda^2)/4*pi*Go                                                        %Area M�xima efectiva.


%                     Graficas - Campo Electrico - Campo Magnetico - Intensidad de radiacion - Vector de poynting - Directividad -                      
%                                                          Todas Expresadas en forma Polar

    theta=[0.0 0.0
1.0 0.0
2.0 0.0
3.0 0.0
4.0 0.0
5.0 0.1
6.0 0.1
7.0 0.1
8.0 0.2
9.0 0.2
10.0 0.3
11.0 0.3
12.0 0.4
13.0 0.5
14.0 0.6
15.0 0.7
16.0 0.8
17.0 0.9
18.0 1.0
19.0 1.1
20.0 1.2
21.0 1.3
22.0 1.4
23.0 1.6
24.0 1.7
25.0 1.9
26.0 2.0
27.0 2.2
28.0 2.3
29.0 2.5
30.0 2.7
31.0 2.9
32.0 3.0
33.0 3.2
34.0 3.4
35.0 3.6
36.0 3.8
37.0 4.0
38.0 4.2
39.0 4.5
40.0 4.7
41.0 4.9
42.0 5.2
43.0 5.4
44.0 5.6
45.0 5.9
46.0 6.1
47.0 6.4
48.0 6.7
49.0 6.9
50.0 7.2
51.0 7.5
52.0 7.8
53.0 8.0
54.0 8.3
55.0 8.6
56.0 8.9
57.0 9.2
58.0 9.5
59.0 9.8
60.0 10.1
61.0 10.4
62.0 10.7
63.0 11.0
64.0 11.4
65.0 11.7
66.0 12.0
67.0 12.3
68.0 12.6
69.0 13.0
70.0 13.3
71.0 13.6
72.0 14.0
73.0 14.3
74.0 14.6
75.0 15.0
76.0 15.3
77.0 15.7
78.0 16.0
79.0 16.4
80.0 16.7
81.0 17.1
82.0 17.4
83.0 17.8
84.0 18.1
85.0 18.5
86.0 18.8
87.0 19.2
88.0 19.5
89.0 19.9
90.0 20.2
91.0 20.6
92.0 20.9
93.0 21.2
94.0 21.6
95.0 21.9
96.0 22.3
97.0 22.6
98.0 22.9
99.0 23.2
100.0 23.5
101.0 23.8
102.0 24.1
103.0 24.4
104.0 24.7
105.0 25.0
106.0 25.3
107.0 25.5
108.0 25.8
109.0 26.1
110.0 26.3
111.0 26.6
112.0 26.8
113.0 27.1
114.0 27.3
115.0 27.6
116.0 27.8
117.0 28.1
118.0 28.3
119.0 28.6
120.0 28.8
121.0 29.1
122.0 29.3
123.0 29.5
124.0 29.8
125.0 30.0
126.0 30.3
127.0 30.5
128.0 30.7
129.0 31.0
130.0 31.2
131.0 31.5
132.0 31.7
133.0 32.0
134.0 32.3
135.0 32.5
136.0 32.8
137.0 33.0
138.0 33.3
139.0 33.6
140.0 33.9
141.0 34.2
142.0 34.5
143.0 34.8
144.0 35.1
145.0 35.5
146.0 35.8
147.0 36.1
148.0 36.5
149.0 36.9
150.0 37.2
151.0 37.6
152.0 37.9
153.0 38.3
154.0 38.5
155.0 38.8
156.0 38.9
157.0 39.0
158.0 39.1
159.0 39.1
160.0 39.0
161.0 38.9
162.0 38.7
163.0 38.5
164.0 38.3
165.0 38.0
166.0 37.8
167.0 37.6
168.0 37.3
169.0 37.1
170.0 36.9
171.0 36.8
172.0 36.7
173.0 36.6
174.0 36.6
175.0 36.6
176.0 36.6
177.0 36.7
178.0 36.8
179.0 37.0
180.0 37.2
181.0 37.4
182.0 37.7
183.0 38.1
184.0 38.5
185.0 39.0
186.0 39.5
187.0 40.2
188.0 40.9
189.0 41.8
190.0 42.8
191.0 44.0
192.0 45.4
193.0 47.1
194.0 49.0
195.0 51.1
196.0 52.4
197.0 51.9
198.0 49.9
199.0 47.6
200.0 45.6
201.0 43.8
202.0 42.4
203.0 41.1
204.0 40.0
205.0 39.1
206.0 38.2
207.0 37.5
208.0 36.8
209.0 36.2
210.0 35.7
211.0 35.2
212.0 34.8
213.0 34.4
214.0 34.0
215.0 33.8
216.0 33.5
217.0 33.3
218.0 33.1
219.0 32.9
220.0 32.8
221.0 32.7
222.0 32.6
223.0 32.5
224.0 32.4
225.0 32.3
226.0 32.2
227.0 32.2
228.0 32.0
229.0 31.9
230.0 31.8
231.0 31.6
232.0 31.4
233.0 31.2
234.0 31.0
235.0 30.8
236.0 30.5
237.0 30.3
238.0 30.0
239.0 29.7
240.0 29.4
241.0 29.0
242.0 28.7
243.0 28.3
244.0 28.0
245.0 27.7
246.0 27.3
247.0 26.9
248.0 26.6
249.0 26.2
250.0 25.9
251.0 25.5
252.0 25.2
253.0 24.9
254.0 24.5
255.0 24.2
256.0 23.9
257.0 23.6
258.0 23.2
259.0 22.9
260.0 22.6
261.0 22.3
262.0 22.0
263.0 21.8
264.0 21.5
265.0 21.2
266.0 20.9
267.0 20.6
268.0 20.3
269.0 20.0
270.0 19.7
271.0 19.4
272.0 19.2
273.0 18.9
274.0 18.6
275.0 18.3
276.0 18.0
277.0 17.7
278.0 17.4
279.0 17.0
280.0 16.7
281.0 16.4
282.0 16.1
283.0 15.8
284.0 15.5
285.0 15.2
286.0 14.8
287.0 14.5
288.0 14.2
289.0 13.9
290.0 13.5
291.0 13.2
292.0 12.9
293.0 12.6
294.0 12.3
295.0 12.0
296.0 11.6
297.0 11.3
298.0 11.0
299.0 10.7
300.0 10.4
301.0 10.1
302.0 9.8
303.0 9.5
304.0 9.2
305.0 8.9
306.0 8.6
307.0 8.3
308.0 8.1
309.0 7.8
310.0 7.5
311.0 7.2
312.0 7.0
313.0 6.7
314.0 6.5
315.0 6.2
316.0 5.9
317.0 5.7
318.0 5.5
319.0 5.2
320.0 5.0
321.0 4.8
322.0 4.5
323.0 4.3
324.0 4.1
325.0 3.9
326.0 3.7
327.0 3.5
328.0 3.3
329.0 3.1
330.0 2.9
331.0 2.7
332.0 2.5
333.0 2.4
334.0 2.2
335.0 2.0
336.0 1.9
337.0 1.7
338.0 1.6
339.0 1.5
340.0 1.3
341.0 1.2
342.0 1.1
343.0 1.0
344.0 0.9
345.0 0.8
346.0 0.7
347.0 0.6
348.0 0.5
349.0 0.4
350.0 0.3
351.0 0.3
352.0 0.2
353.0 0.2
354.0 0.1
355.0 0.1
356.0 0.1
357.0 0.0
358.0 0.0
359.0 0.0
360.0 0.0] ;                   %Valor de Theta y Phi para mostrar Graficas de las variables en sus grados 
    fi=[0.0 0.0
1.0 0.0
2.0 0.0
3.0 0.0
4.0 0.0
5.0 0.1
6.0 0.1
7.0 0.1
8.0 0.2
9.0 0.2
10.0 0.3
11.0 0.3
12.0 0.4
13.0 0.5
14.0 0.6
15.0 0.7
16.0 0.8
17.0 0.9
18.0 1.0
19.0 1.1
20.0 1.2
21.0 1.3
22.0 1.4
23.0 1.6
24.0 1.7
25.0 1.9
26.0 2.0
27.0 2.2
28.0 2.3
29.0 2.5
30.0 2.7
31.0 2.9
32.0 3.0
33.0 3.2
34.0 3.4
35.0 3.6
36.0 3.8
37.0 4.0
38.0 4.2
39.0 4.5
40.0 4.7
41.0 4.9
42.0 5.2
43.0 5.4
44.0 5.6
45.0 5.9
46.0 6.1
47.0 6.4
48.0 6.7
49.0 6.9
50.0 7.2
51.0 7.5
52.0 7.8
53.0 8.0
54.0 8.3
55.0 8.6
56.0 8.9
57.0 9.2
58.0 9.5
59.0 9.8
60.0 10.1
61.0 10.4
62.0 10.7
63.0 11.0
64.0 11.4
65.0 11.7
66.0 12.0
67.0 12.3
68.0 12.6
69.0 13.0
70.0 13.3
71.0 13.6
72.0 14.0
73.0 14.3
74.0 14.6
75.0 15.0
76.0 15.3
77.0 15.7
78.0 16.0
79.0 16.4
80.0 16.7
81.0 17.1
82.0 17.4
83.0 17.8
84.0 18.1
85.0 18.5
86.0 18.8
87.0 19.2
88.0 19.5
89.0 19.9
90.0 20.2
91.0 20.6
92.0 20.9
93.0 21.2
94.0 21.6
95.0 21.9
96.0 22.3
97.0 22.6
98.0 22.9
99.0 23.2
100.0 23.5
101.0 23.8
102.0 24.1
103.0 24.4
104.0 24.7
105.0 25.0
106.0 25.3
107.0 25.5
108.0 25.8
109.0 26.1
110.0 26.3
111.0 26.6
112.0 26.8
113.0 27.1
114.0 27.3
115.0 27.6
116.0 27.8
117.0 28.1
118.0 28.3
119.0 28.6
120.0 28.8
121.0 29.1
122.0 29.3
123.0 29.5
124.0 29.8
125.0 30.0
126.0 30.3
127.0 30.5
128.0 30.7
129.0 31.0
130.0 31.2
131.0 31.5
132.0 31.7
133.0 32.0
134.0 32.3
135.0 32.5
136.0 32.8
137.0 33.0
138.0 33.3
139.0 33.6
140.0 33.9
141.0 34.2
142.0 34.5
143.0 34.8
144.0 35.1
145.0 35.5
146.0 35.8
147.0 36.1
148.0 36.5
149.0 36.9
150.0 37.2
151.0 37.6
152.0 37.9
153.0 38.3
154.0 38.5
155.0 38.8
156.0 38.9
157.0 39.0
158.0 39.1
159.0 39.1
160.0 39.0
161.0 38.9
162.0 38.7
163.0 38.5
164.0 38.3
165.0 38.0
166.0 37.8
167.0 37.6
168.0 37.3
169.0 37.1
170.0 36.9
171.0 36.8
172.0 36.7
173.0 36.6
174.0 36.6
175.0 36.6
176.0 36.6
177.0 36.7
178.0 36.8
179.0 37.0
180.0 37.2
181.0 37.4
182.0 37.7
183.0 38.1
184.0 38.5
185.0 39.0
186.0 39.5
187.0 40.2
188.0 40.9
189.0 41.8
190.0 42.8
191.0 44.0
192.0 45.4
193.0 47.1
194.0 49.0
195.0 51.1
196.0 52.4
197.0 51.9
198.0 49.9
199.0 47.6
200.0 45.6
201.0 43.8
202.0 42.4
203.0 41.1
204.0 40.0
205.0 39.1
206.0 38.2
207.0 37.5
208.0 36.8
209.0 36.2
210.0 35.7
211.0 35.2
212.0 34.8
213.0 34.4
214.0 34.0
215.0 33.8
216.0 33.5
217.0 33.3
218.0 33.1
219.0 32.9
220.0 32.8
221.0 32.7
222.0 32.6
223.0 32.5
224.0 32.4
225.0 32.3
226.0 32.2
227.0 32.2
228.0 32.0
229.0 31.9
230.0 31.8
231.0 31.6
232.0 31.4
233.0 31.2
234.0 31.0
235.0 30.8
236.0 30.5
237.0 30.3
238.0 30.0
239.0 29.7
240.0 29.4
241.0 29.0
242.0 28.7
243.0 28.3
244.0 28.0
245.0 27.7
246.0 27.3
247.0 26.9
248.0 26.6
249.0 26.2
250.0 25.9
251.0 25.5
252.0 25.2
253.0 24.9
254.0 24.5
255.0 24.2
256.0 23.9
257.0 23.6
258.0 23.2
259.0 22.9
260.0 22.6
261.0 22.3
262.0 22.0
263.0 21.8
264.0 21.5
265.0 21.2
266.0 20.9
267.0 20.6
268.0 20.3
269.0 20.0
270.0 19.7
271.0 19.4
272.0 19.2
273.0 18.9
274.0 18.6
275.0 18.3
276.0 18.0
277.0 17.7
278.0 17.4
279.0 17.0
280.0 16.7
281.0 16.4
282.0 16.1
283.0 15.8
284.0 15.5
285.0 15.2
286.0 14.8
287.0 14.5
288.0 14.2
289.0 13.9
290.0 13.5
291.0 13.2
292.0 12.9
293.0 12.6
294.0 12.3
295.0 12.0
296.0 11.6
297.0 11.3
298.0 11.0
299.0 10.7
300.0 10.4
301.0 10.1
302.0 9.8
303.0 9.5
304.0 9.2
305.0 8.9
306.0 8.6
307.0 8.3
308.0 8.1
309.0 7.8
310.0 7.5
311.0 7.2
312.0 7.0
313.0 6.7
314.0 6.5
315.0 6.2
316.0 5.9
317.0 5.7
318.0 5.5
319.0 5.2
320.0 5.0
321.0 4.8
322.0 4.5
323.0 4.3
324.0 4.1
325.0 3.9
326.0 3.7
327.0 3.5
328.0 3.3
329.0 3.1
330.0 2.9
331.0 2.7
332.0 2.5
333.0 2.4
334.0 2.2
335.0 2.0
336.0 1.9
337.0 1.7
338.0 1.6
339.0 1.5
340.0 1.3
341.0 1.2
342.0 1.1
343.0 1.0
344.0 0.9
345.0 0.8
346.0 0.7
347.0 0.6
348.0 0.5
349.0 0.4
350.0 0.3
351.0 0.3
352.0 0.2
353.0 0.2
354.0 0.1 
355.0 0.1
356.0 0.1
357.0 0.0
358.0 0.0
359.0 0.0
360.0 0.0];     %                                    Correspondientes a estas.
    
                                                                             
    E1=60*1j*Io*exp(-1j*k*r)*(1/r)*(cos((pi/2)*cos(theta))./sin(theta))      %Ecuacion del campo el�ctrico utilizada para Graficar.
    figure(m+1);
    subplot(2,3,1)
    polar(theta,abs(E1))
    view(-270,-90)
    title('Campo Electrico')
    H1=(1/(2*pi))*1j*Io*exp(-1j*k*r)*(1/r)*(cos((pi/2)*cos(theta))./sin(theta));%Ecuacion del campo magn�tico utilizada para Graficar.
    subplot(2,3,2)
    polar(theta,abs(H1),'r')
    view(-270,-90)
    title('Campo Magnetico')
    subplot(2,3,3)
    Wav1=(15*Io^2)/(pi*r^2)*((cos((pi/2)*cos(theta))./sin(theta))).^2 ;         %Densidad de potencia radiada o vector de poynting promedio utilizada para Graficar.
    Wo1=(15*Io.^2)/(pi*r.^2) ;                                                  %Densidad de potencia radiada maxima.
    FR1=Wav1/Wo1 ;                                                              %Intensidad de radiacion normalizada utilizada para Graficar.
    polar(theta,abs(FR1),'y')
    view(-270,-90)
    title('Intensidad de radiacion')
    subplot(2,3,4)
    polar(theta, abs(Wav1),'c')
    view(-270,-90)
    title('Vector de poynting')
    subplot(2,3,5)
    U1=(15*Io.^2)/pi*((cos((pi/2)*cos(theta))./sin(theta))).^2;                  %Intensidad de radiaci�n utilizada para Graficar.
    D1=4*pi*abs(U1)/Prad ;                                                       %Directividad utilizada para Graficar.
    polar(theta, D1,'g')
    view(-270,-90)
    title('Directividad')
      
%                                                    Graficas - Campo Electrico - Campo Magnetico                     
%                                                          Expresadas en forma Rectangular
    figure(m+2);
    subplot(2,2,1:2)
    plot(theta,abs(E1),'b')
    grid;
    title('Campo Electrico')
    xlabel('0:2*pi')
    ylabel('Campo Electrico V/M')
    subplot(2,2,3:4)
    plot(theta,abs(H1),'r')
    grid;
    title('Campo Magnetico')
    xlabel('0:2*pi')
    ylabel('Campo Magnetico A/M')
    
    %                                                       Grafica 3D Patron de radiacion 
    
    [FI,THETA]=meshgrid(fi,theta);

    %                                                        creacion del Patron de Radiacion.
                                                                   
    %U2=(15*Io.^2)/pi*((cos((pi/2)*cos(THETA))./sin(THETA))).^2;                     %Intensidad de radiaci�n utilizada para Graficar.
    E2=abs(60*1j*Io*exp(-1j*k*r)*(1/r)*(cos((pi/2)*cos(THETA))./sin(THETA)));
    
    %                   cambio de coordenadas esfericas a rectangulares que son las que se usan para graficas en %3D en matlab. 

    X=abs(E2).*sin(THETA).*cos(FI);
    Y=abs(E2).*sin(THETA).*sin(FI);
    Z=abs(E2).*cos(THETA);
    figure(m+3); 
    R=surface(X,Y,Z,E2);
    meshc(X,Y,Z,E2);
    grid;
    axis equal
    lighting gouraud
    shading interp
    view(0,40)
    title('Intensidad de radiacion')
    
                                                             %Vistas del Patron de Radiacion                                                                                                                                                                                                                                    
phi=linspace(0,2*pi);
tetha=linspace(0,pi);
[t,p]=meshgrid(tetha,phi);
E3=abs(60*1j*Io*exp(-1j*k*r)*(1/r)*(cos((pi/2)*cos(t))./sin(t)));
%e=abs((60*1j*Io)*exp(-1j*k*r)*(1/r).*(cos((pi/2).*cos(t))./sin(t))); 
%U3=abs((15*Io.^2)/pi*((cos((pi/2)*cos(t))./sin(t))).^2);
x=E3.*sin(t).*cos(p);
y=E3.*sin(t).*sin(p);
z=E3.*cos(t);
figure(m+4)
polar(p,E3)                                                                 %   Patr�n de Radiaci�n en proporcion a la Direcci�n del campo
title('Patr�n de Radiaci�n en proporci�n a la Direcci�n del campo')
figure(m+5)
plot(x,y)                                                                   %   Patr�n de radiaci�n en los planos X,Y
title('Patr�n de radiaci�n en los planos X,Y')
figure(m+6)
plot(y,z)                                                                   %   Patr�n de radiaci�n en los planos Y,Z
title('Patr�n de radiaci�n en los planos Y,Z')

 %                                                        Apertura Rectangular Referencia Ulaby 
    y=lx*sin(theta);
    f=(sinc(pi*y)).^2;
    %subplot(2,3,4)
    figure(m+7);
    plot(y,f)
    %polar(y,f)
    xlim([-5,5]);
    ylim([-0.002,1.1]);
    grid;
    xlabel('longitud de onda en la apertura rectangular X');
    ylabel('Patron de radiacion S(R,theta)/Smax');
    title('Patron de apertura rectangular Ulaby');

 
%                                                    Apertura Rectangular 3D Referencia PDF Orfanidis
    [theta,phi] = meshgrid(0:1:90, 0:9:360);
    theta = theta*pi/180; phi = phi*pi/180;
    vx = lx*sin(theta).*cos(phi);
    vy = ly*sin(theta).*sin(phi);
    Fo= abs((1 + cos(theta))/2 .* sinc(vx) .* sinc(vy));
    %subplot(2,3,5)
    figure(m+8); 
    surface(vx,vy,Fo);
    %meshc(vx,vy,Fo);
    axis equal
    grid;
    xlabel('longitud de onda en la apertura rectangular X');
    ylabel('longitud de onda en la apertura rectangular Y');
    zlabel('Patron de radiacion E(theta,phi)/Emax');
    title('Pattern of rectangular aperture');
    colormap jet
    shading flat
    %end
    %surf(X,Y,Z)
    %title('grafica mesh'),xlabel('eje x'),ylabel('eje y'),zlabel('eje z')

