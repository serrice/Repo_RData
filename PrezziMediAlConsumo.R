## carico librerie
library(ggplot2)

## CARICO I DATI
## file_prezzi <- read.csv("PrezziMediAlConsumo.csv", colClasses = "character")
setwd("D:/sergio/sviluppo/R/OpenData")
prezzi <- read.csv("./data/PrezziMediAlConsumo.csv")

#controllo dataset
head(prezzi)
summary(prezzi)
sum(as.numeric(prezzi$olio.extra.oliva), na.rm = TRUE)

ggplot(prezzi, aes(x = anni, y = Alimenti, colour = Alimenti )) + 
        geom_line(aes(y = pane, colour = "Pane")) + 
        geom_line(aes(y = pasta, colour = "Pasta")) +
        geom_line(aes(y = riso, colour = "Riso")) +        
        geom_line(aes(y = patate, colour = "Patate")) +        
        geom_line(aes(y = carne.bovi, colour = "Carne bovina")) +
        geom_line(aes(y = carne.sui, colour = "Carne suina")) + 
        geom_line(aes(y = salame, colour = "Salame")) +        
        geom_line(aes(y = uova, colour = "Uova")) +
        geom_line(aes(y = latte, colour = "Latte")) +
        geom_line(aes(y = burro, colour = "Burro")) +
        geom_line(aes(y = lardo, colour = "Lardo")) +
        geom_line(aes(y = olio.extra.oliva, colour = "Olio extravergine d'oliva")) +
        geom_line(aes(y = olio.oliva, colour = "Olio d'oliva")) +
        geom_line(aes(y = vino, colour = "Vino")) +
        geom_line(aes(y = caffe, colour = "Caffè")) +
        geom_line(aes(y = zucchero, colour = "Zucchero")) +
        xlab("Periodo rilevamento") +
        ylab("Alimenti") +
        ggtitle("Beni di Consumo - Alimenti 1861 - 2011")
        


###############esempio
ggplot(tg, aes(x=dose, y=length, shape=supp)) +
        geom_line(position=position_dodge(0.2)) + # Dodge lines by 0.2
        geom_point(position=position_dodge(0.2), size=4)