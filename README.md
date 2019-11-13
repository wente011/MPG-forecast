# MPG-forecast
A simple aggregate forecast of fuel economy in the US. To use for my fleet modeling.

To create a reasonaable "business as usual" scenario, I needed an estimate of of how much fuel economy could improve over time.
The derivative of mpg/time was my target dependent variable for modeling. I took data from after 1989, which demonstrated a more stable 
time series - with the effects of relevant CAFE standards quite evident. 

I was able to determine that the MPG of all light passenger fleet in the US was a moving average process with order 2 differencing. 
After a bootstrap simulation of the fitted model, one could reasonably assume that year over year, the average rate of improvement
would be 1.5% or so in MPG. Still this is assuming that the State's fleet's composition is similar to the US fleet. Not true.

The process inspired a simpler analysis of the State's fleet MPG as a function of model year. Thus, I created a simple OLS multiple 
regression model to calculate the estimated rate of change in MPG for our current fleet. This is using dataset cleaned of extreme outliers in a prior study, 
Controlling for SEGMENT, FUEL_TYPE(of the vehicle), YEAR (of the model), and the significant interaction between Year*FuelType, and Year*Fuel Type*Segment, 
we find significant estimates. Interestingly, the estimates are very close to the aggregate US fleet data.  Because we have been swaping out old light vans etc.. for more efficient 
sedans, we estimate a 1.9% annual increase in MPG, controlling for other variables. 

The output estimates of the model are used exclusively for Light Gas (only) vehicles. 


#More advanced next steps
If there is more interest in modeling these effects, we could do pair-wise comparisons (Tukey, LSmeans) or a simple random forest model.
However, for our purposes for the FAP, a simple trend is good enough.


