Italy Consumer Prices
========================================================

### Get Data

The data were downloaded from the link of historical Italian National Institute of Statistics (**ISTAT**) 
[http://www.istat.it] (http://www.istat.it/it/prodotti/banche-dati).
The downloaded file is in Excel format and it was necessary to make a change in the CSV file.

```{r getData}
prezzi <- read.table("./data/PrezziMediAlConsumo.csv", header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)
```


### Data
For the years from 1943 onwards were considered, for the food, the prices of the free market, while for the years prior to the war period were considered legal exchange rates. For some genres (ie bread and pasta from 1944 to 1949, and for the oil and sugar 1944-1950), the prices are the average prices between legal and open market prices, weighted by the quantities sold in the two different markets. 

They were used for the evaluation of the coefficients of average prices for the different years considered. 
Please note that these coefficients are calculated on the basis of the general index of consumer prices for the families of workers and employees and not the dynamics of the price of individual products to which they apply. 

#### Description of the data
The data set has 17 variables with 151 observations, the CSV formatted file has the following form (I have not translated the names of the columns):

```{r headDati}
head(prezzi)
```

### Display Data

#### Preparation of data for the graph
In order to use the library ggplot2 graphics, imported data were not used with a data frame of 17x151 but have been manipulated in order to obtain a data frame 3x2416, the first column, called "food" indicates the type of commodity, the second, called the "years", indicates the survey year, the last, "price" is the variable of interest, the code used was:

```{r TrasformgetData}
prezzi_long = with( prezzi, 
    rbind (
        data.frame(food = "Bread", anni = anni, prezzo = pane),
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
```

#### Drawing the graph

```{r warning=FALSE, fig.align='center', fig.height=8, fig.width=15}
library(ggplot2)
ggplot(prezzi_long, aes(x=anni,y=prezzo,colour=food,group=food)) + 
    geom_line() +
    xlab("Detection period [yr]") +
    ylab("Food") +
    ggtitle("Consumer Goods - Food 1861 - 2011")   +
    labs(color="Legend text")
```
