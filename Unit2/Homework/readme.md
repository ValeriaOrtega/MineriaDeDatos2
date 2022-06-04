Investigation 1

1. What is the origin of the graphs?
The beginnings of the graphic elaboration of data began in the 17th century, showing
advances that paved the way for the development of modern graphics.
In 1637, René Descartes published three books on physics: Geometry, Dioptrics, and
Meteors whose introduction Discourse on the Method made him famous. In geometry he created
the Cartesian coordinate system that laid the foundations for technical drawing and
scientific. This system established the relationship between the represented line and the
equation that defines it. In 1644 Michael F. Van Langren produced what
It is probably the first representation of statistical data, showing the
variations in the determination of longitude between the city of Toledo (Spain) and
Rome Italy).

But it is William Playfair (1759-1823), an English politician and economist, who gives him the
definitive boost to what is now known as statistical graphics. That's why it's
Considered the inventor of line, bar, and pie charts.
Playfair, exposes his idea that graphics allow a more
efficient than frequency tables. Playfair published the book entitled The
Commercial and Political Atlas (1786), which contains 43 charts of series of
time and for the first time, a bar graph is used. In 1801, he uses the first
pie chart in his Playfair's Statistical Breviary.

Playfair invented a universal visual language applicable to science and commerce
alike, even though he was not understood by his contemporaries, he was going to
determine a completely new paradigm in data analysis. with his
work, changed assumptions and views about how data could
be exhibited and make them understandable to others. His work in graphics
performed for more than 36 years. He acted based on the following principles that he
himself established:
● The graphical method is a way to simplify the tedious and the complex. • The
busy men need some kind of visual aid.

● The graph is more accessible than a table. • The graphic method is
consistent with the eyes.

2. What is the grammar of graphs?
In grammar, graphs have five basic components from which
we can control virtually every aspect of a chart. ggplot()
implements in its syntax. Several of the elements are created by default, for
example from data mapping ggplot() creates the scale with its marks and
labels. In the case of coordinates, it always takes a system by default.
Cartesian. In all cases we can subsequently modify these values ​​by
flaw.

● A mapping specification to variables.
● They can refer both to the axes of the graph (x, y)
● as well as other properties such as colors, symbols, sizes, fonts,
types of lines, etc.
● In ggplot() they are specified with the arguments passed to aes().
● A coordinate system.
● Controls the projection of numerical data into space.
● By default ggpplot() creates a Cartesian coordinate system with the axes
x and y,
● We can change it to polar, ternary or projection coordinates
cartographic
● It can be modified by adding + coord_*, where * is any system of
coordinates included in ggplot() or its extensions.
● A scale.
● Controls the relationship between the number series we are representing and its
representation in space.
● By default ggplot() creates a natural scale for the axes in which these
they extend a little more than the maximum and minimum observations.
● By default ggplot() places the axes at 0 on the scale.
● We can change the scale through a transformation, for example,
going from natural to logarithmic scale.
● By default ggplot() creates closed number scale marks and labels
(units, tens, hundreds, thousands, etc.), depending on the range of
our data.
● It is possible to change the number and location of scale marks and/or labels.
● It can be modified by adding + scale _*_°, where * is the axis that we are going to
modify and ° the type of scale we are using: continuous or discrete.
● A statistical transformation.
● Controls the necessary transformation of the data for its representation.
● For example, do the frequency counts for a bar graph or
a histogram.
● Or more complex transformations like those needed for a boxplot.
● Does not apply to all graphics and there is the possibility of doing it ourselves
themselves and pass the transformed data to ggplot().
● It can be modified with the argument stat= "*", where * is the transformation
what we want to do. stat = identity to do no transformation and
we use it when provided by the user.
● A geometric element.
● It is the element that represents the data in the chart.
● We can use different elements to represent the same data.
● Or combine several in the same graph.
● Complete labels.
● ggplot() takes from the variables names for the axes and labels for the
scales (discrete or continuous)
● Of the additional mappings (that is, those that do not refer directly to
axes) legend labels.
● Annotations.
● Titles, subtitles, bullets and any other annotation that we want to include
will be entered directly by the user.

3. What is a graph?
A chart is a graphical representation of data. The visualization of the data by
means of graphics helps to detect patterns, trends, relationships and structures
of the data. Use the graphs together with the maps to explore the data or
help tell a story.
Charts can be created from both tabular and raster data,
and there is a different set of charts for each type of data. The data
tabular refer to vector or entity data, as well as tables
independent, while raster data refers to images or data
based on pixels.

References:

[1] ¿Qué es un gráfico?—ArcGIS Pro | Documentación. (s. f.). Qué es un
gráfico.
https://pro.arcgis.com/es/pro-app/latest/help/analysis/geoprocessing/charts/wh
at-is-a-chart-.htm
[2] Los gráficos y su historia - Gráficos estadísticos. (s. f.). Los gráficos y su
historia.
https://1library.co/article/los-gr%C3%A1ficos-y-su-historia-gr%C3%A1ficos-est
ad%C3%ADsticos.yr3j3e8y
[3] Paladino, M. (s. f.). Gráficos en R. La gramática de los gráficos.
https://www.institutomora.edu.mx/testU/SitePages/martinpaladino/graficos_co
n_r_y_ggplot.html

Investigation 2

What is a statistical probability distribution?
A probability distribution is one that allows us to establish the whole range of
outcomes likely to occur in a given experiment. That is, it describes the
probability that an event will occur in the future.

Types of Statistical Probability Distributions
● Binomial probability distribution:
It is a discrete probability and it occurs very frequently in our lives.
everyday. It was proposed by Jakob Bernoulli (1654-1705), and is used with
events that have a binary response, generally classified as
"success or failure". Some examples where this distribution is applied are:

➢ Whether or not a person has a disease.
➢ If a woman is pregnant.
➢ Whether a product is successful or not.
➢ Whether or not a flight is delayed.
➢ If a coin toss comes up heads instead of tails.
● Poisson probability distribution:
It gets its name from the French mathematician Simeon Denis Poisson.
(1781-1840). Describes the number of times an event occurs
during a specific interval, this interval can be of time, distance, area or
volume. The probability of occurrence is proportional to the length of the interval.
Some examples where this distribution is applied are:

➢ The number of vehicles a dealer sells per day.
➢ Number of calls per hour received by a company.

➢ When it is required to know the number of defects in a batch of fabric.
➢ Number of automobile accidents in the year.
➢ Number of ship arrivals at a port per day.
● Normal probability distribution:
The normal probability distribution is one of the most important distributions in statistics.
and in the calculation of probabilities.
It is bell-shaped, symmetric, and has an area under the curve of 1.

As mentioned above, the application of this distribution of
probability is very wide. Some examples are:

➢ The effect of a medicine or drug.
➢ The temperature change at a specific time of year.
➢ Morphological characters such as weight or height in a group of
individuals.

References:
[1] Delgado, J. S. (s. f.). ¿Qué es la distribución de probabilidad? ¿Qué es la
distribución de probabilidad?
https://www.pragma.com.co/blog/que-es-la-distribucion-de-probabilidad
[2] Conoce las principales distribuciones de probabilidad | Conexión ESAN. (s.
f.). Conoce las principales distribuciones de probabilidad.

https://www.esan.edu.pe/conexion-esan/conoce-las-principales-distribuciones-
de-probabilidad

