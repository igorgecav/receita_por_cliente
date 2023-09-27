# receitas ict

## Pacotes e bibliotecas ##
#####
packages_to_load <- c("zoo", "dplyr", "tidyr", "lubridate", "ggplot2", "readxl", "readr", "purrr", "writexl", "openxlsx", "gridExtra")

# Check if the packages are already installed and load them
for (package in packages_to_load) {
  if (!requireNamespace(package, quietly = TRUE)) {
    install.packages(package)
  }
  library(package, character.only = TRUE)
}
#
#####

# receitas, cliente, tipo de serviço
######------------------------------------------------------------------

cgs = read.csv("C:/Users/igorc/Desktop/AFC/AFC 002 - AFC 003/ICT/cgs_filtrado.csv")
print(cgs)
# Especifique os formatos de data para cada coluna
formato_data1_data2 <- "%d/%m/%y"
formato_data5 <- "%d/%m/%y"

# Use a função mutate para aplicar a conversão nas colunas desejadas
cgs <- cgs %>%
  mutate(
    data1 = as.Date(data1, format = formato_data1_data2),
    data2 = as.Date(data2, format = formato_data1_data2),
    data5 = as.Date(data5, format = formato_data5)
  )

# Visualize o dataframe após a conversão
print(cgs)
#########----------------------------------------------------------------

# tabelas por mes
#####--------------------------------------------------------------------
cgs = read.csv("C:/Users/igorc/Desktop/AFC/AFC 002 - AFC 003/ICT/cgs_filtrado.csv")
print(cgs)
# Especifique os formatos de data para cada coluna
formato_data1_data2 <- "%d/%m/%y"
formato_data5 <- "%d/%m/%y"

# Use a função mutate para aplicar a conversão nas colunas desejadas
cgs <- cgs %>%
  mutate(
    data1 = as.Date(data1, format = formato_data1_data2),
    data2 = as.Date(data2, format = formato_data1_data2),
    data5 = as.Date(data5, format = formato_data5)
  )
cgs <- cgs %>%
  mutate(
    dia = as.integer(format(data1, "%d")),  # Extrai o dia
    mes = as.integer(format(data1, "%m")),  # Extrai o mês
    ano = as.integer(format(data1, "%y"))   # Extrai o ano
  )
# Visualize o dataframe após a conversão
print(cgs)
#####--------------------------------------------------------------------
  
# resultados por mes
#######-------------------------------------

# Supondo que você já tenha as colunas 'mes' e 'cliente' em seu dataframe 'cgs'

# Use a função group_by e summarize para contar os clientes por mês e cliente
resultados <- cgs %>%
  group_by(mes, cliente) %>%
  summarize(quantidade_cliente = n())
resultados <- resultados %>%
  arrange(mes, desc(quantidade_cliente))

# Visualize os resultados
print(resultados)


#########---------------------------------------

# colunas de meses
##########-------------------------------------------

# Carregue a biblioteca tidyr se ainda não estiver carregada
library(tidyr)

# Suponha que você já tenha os resultados organizados em 'resultados'

# Use a função pivot_wider para criar colunas separadas para cada mês
novo_dataframe <- resultados %>%
  pivot_wider(names_from = mes, values_from = quantidade_cliente, names_prefix = "mes_")

# Visualize o novo dataframe
print(novo_dataframe)

###########----------------------------------------------




  