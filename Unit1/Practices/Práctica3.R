- max()
- min()
# **Datos** Conjunto de datos de Ingresos:
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)Este es el conjunto de datos de gastos:    expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

# **Solución de la problematica**## Calculear la ganancia así como la diferencia entre los  ingresos y gastos.    profit <- revenue - expenses    profit

## Calcular los impuestos así como el 30% de las ganancias y redondee a 2 puntos decimales

tax <- round(0.30 * profit, 2)    tax


## Calcular las ganancias restantes después de deducir los impuestos

profit.after.tax <- profit - tax    profit.after.tax

## Calcular el margen del beneficio como beneficio después de impuestos sobre ingresos. Redondea a 2 puntos decimales, luego multiplicalos por 100 para obtener el porcentaje

profit.margin <- round(profit.after.tax / revenue, 2) * 100    profit.margin

## Calcular la ganancia media después de impuestos durante los 12 meses

mean_pat <- mean(profit.after.tax)    mean_pat

## Encuentra los meses con ganancias por encima de la media después de impuestos

good.months <- profit.after.tax > mean_pat    good.months

## Los meses malos son lo opuesto a los meses buenos

bad.months <- profit.after.tax < mean_pat    bad.months

## El mejor mes es cuando el beneficio después de impuestos era igual al máximo   

best.month <- profit.after.tax == max(profit.after.tax)    best.month

## El peor mes es cuando el beneficio después de impuestos era igual al mínimo 

worst.month <- profit.after.tax == min(profit.after.tax)    worst.month

## Convertir  todos los cálculos a unidades de 1000 dólares   

revenue.1000 <- round(revenue / 1000, 0)
expenses.1000 <- round(expenses/1000, 0) 
profit.1000 <- round(profit / 1000, 0)  
profit.after.tax.1000 <- round(profit.after.tax / 1000, 0)

## Imprimir los resultados obtenidos 
revenue.1000  
expenses.1000
profit.1000   
profit.after.tax.1000 
profit.margin  
good.months 
bad.months   
best.month   
worst.month

#Extras:
Vista previa de lo que viene en la siguiente sección
M <- rbind(  
  revenue.1000, 
  expenses.1000, 
  profit.1000,  
  profit.after.tax.1000,
  profit.margin,  
  good.months,    
  bad.months, 
  best.month,  
  worst.month  
)
# Imprimir la matriz
M
barplot(M)
