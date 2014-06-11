prezzi <- read.table("./data/PrezziMediAlConsumo.csv", header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)
head(prezzi)
summary(prezzi)

# trasformo i dati, inserendo il campo food che identifica il tipo alimento
# metodo 1
prezzi_long = with( prezzi, 
                    rbind ( data.frame(food = "Bread", anni = anni, prezzo = pane),
                            data.frame(food = "Pasta", anni = anni, prezzo = pasta),
                            data.frame(food = "Rice", anni = anni, prezzo = riso),
                            data.frame(food = "Potatoes", anni = anni, prezzo = patate),
                            data.frame(food = "Beef", anni = anni, prezzo = carne.bovi),
                            data.frame(food = "Pork", anni = anni, prezzo = carne.sui),
                            data.frame(food = "Sausage", anni = anni, prezzo = salame),
                            data.frame(food = "Eggs", anni = anni, prezzo = uova),
                            data.frame(food = "Milk", anni = anni, prezzo = latte),
                            data.frame(food = "Butter", anni = anni, prezzo = burro),
                            data.frame(food = "Lard", anni = anni, prezzo = lardo),
                            data.frame(food = "Extra virgin olive oil", anni = anni, prezzo = olio.extra.oliva),
                            data.frame(food = "Olive oil", anni = anni, prezzo = olio.oliva),
                            data.frame(food = "Wine", anni = anni, prezzo = vino),
                            data.frame(food = "Coffee", anni = anni, prezzo = caffe),
                            data.frame(food = "Sugar", anni = anni, prezzo = zucchero)                            
                    )
)

head(prezzi_long)
nrow(prezzi_long)
library(Hmisc)
describe(prezzi_long)

# grafico
library(ggplot2)
ggplot(prezzi_long, aes(x=anni,y=prezzo,colour=food,group=food)) + 
        geom_line() +
        geom_hline(aes(yintercept=3.6), show_guide = TRUE) +
        geom_hline(aes(yintercept=9.4)) +
        scale_y_continuous(limits=c(0, max(prezzi_long$prezzo, na.rm=TRUE)),breaks=0:20*4) +       
        xlab("Detection period [yr]") +
        ylab("Food") +
        ggtitle("Consumer Goods - Food 1861 - 2011")   +
        labs(color="Legend text")


####################
library(gclus)
mydata <- mtcars[c(1, 3, 5, 6)]
mydata.corr <- abs(cor(mydata))
mycolors <- dmat.color(mydata.corr)
myorder <- order.single(mydata.corr)
cpairs(mydata,
       myorder,
       panel.colors=mycolors,
       gap=.5,
       main="Variables Ordered and Colored by Correlation"
)