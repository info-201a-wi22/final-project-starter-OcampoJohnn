# Police Violence Against Marginalized Groups and Why it Happens: Police Violence

#### Authors: Jesse Ocampo (jsssth@uw.edu),
#### Emm Ocampo (emmoc7@uw.edu),
#### John Ocampo (ocampojo@uw.edu)

<br/>
<div align = "center">
INFO-201: Technical Foundations of Informatics - The Information School - University of Washington<br/>
WINTER 2022<br/> Date: 3/9/2022
</div>

## Abstract:
As people debate the causes for police fatalities, the number of victims has remained consistent over the last few years. This report attempts to approach the stable number of police shootings across the US—despite changes in training and strong support for police reform. We hope to answer why police officers decide to resort to fatal force in confrontations with civilians.
<br/>

## Keywords:
Police shootings; Excessive force; Police reform
<br/>

## 1. Introduction:
While everyone knows that the debate between the police and their use of excessive force against civilians has reached a boiling point in recent years, the data paints a dreadful consistency in the number of fatal shootings by police officers **despite mitigation efforts.** This also remains the case in spite of the nationwide protests sparked by tragic shootings; such as the 2020 shooting of George Floyd. As data scientists, we need to know what the raw data has to say about police violence against different peoples. To that end, we have analyzed data from the [Washington Post’s Police Shooting Database](https://github.com/washingtonpost/data-police-shootings) to find answers to our research questions. Additionally, it should be noted that this dataset contains information from January 1st, 2015 and runs through February 17th, 2022.

<br/>

## 2. Design Situation:
### Framing the topic of concern
As experts may be aware, police violence against marginalized groups has an extensive history that runs not for years, but for centuries. As [Time Magazine](https://time.com/4779112/police-history-origins/) states, the origin of the police force in the South was for the “preservation of the slavery system.” As such, our group concentrated on a prominent and important issue; police shootings over the past seven years with a focus on race. With the help of the Washington Post's database we were able to learn that despite the outcry of recent high-profile shootings, the number of police shootings of civilians has not lowered. This remains true despite the recent  support for justice system reforms.

From the year tracking started in 2015, to the most recent complete year, we haven't seen a reduction in the number of deaths at the hands of the police. In fact, the number of police shootings per year has slowly increased since 2016. According to the [U.S. Census Bureau](https://www.census.gov/quickfacts/fact/table/US/PST045221), Black people make up 13.4% of the total US population and White people make up 76.3% of the total US population. Yet, as we have seen through the bar graph displayed in the summary page, Black people are shot at nearly one half the rate of White people. This is a disproportion of nearly two times the expected frequency. What this information tells us is that despite the claims of increased training, funding, accountability of police officers, poorer and or more racially segregated areas are subject to harsher policing. This assumption is supported by [a recent study](https://ajph.aphapublications.org/doi/10.2105/AJPH.2018.304851) comparing police-related shootings and neighborhood economics.

### Human Values
Racism and police violence are today seen so closely related that they seem tied together at the seams, however, our data has shown that the overall issue when it comes to police shootings is substantially more complicated than racism. We know this is the case because in more recent years, police violence, and especially police shootings, tend to be concentrated more along the lines of social economical status. In other words, police shootings tend to happen more to marginalized and often poorer individuals. While we were unable to determine the socioeconomic status of the victims of the police shootings that our database contained, we did notice the racial discrepancy.

### Stakeholders
Everyone is a stakeholder in this issue. However, it is important to acknowledge that the people who are most deeply affected by police shootings violence are ethnic minorities and other marginalized groups. This includes Black people, Hispanics, the homeless, and even immigrants. A vital distinction about those affected directly is the fact that these people lack the same avenues of power that their more affluent and privileged counterparts enjoy. Similarly, minority groups are also often the indirect stakeholders for the results of laws and reforms. Many members of minority groups live paycheck to paycheck and don't have the time nor means to fight against police brutality until they don't have a choice.

### Benefits and Harms
The harms of analyzing this data is clear. Bad actors my twist the data to make unsubstantiated claims by stereotyping minorities. They could say that minorities are simply more violent than white people, or that they are more likely to shoot at police officers. To that end, we decided to dig through the data and visualize how what weapons victims carry as they are killed by police officers.

While we have tried our best to make it difficult for people to misinterpret the dataset we worked with, it is still possible for bad actors to twist the data and our visualizations to make unsubstantiated claims via the stereotyping of minorities. They could claim that the reason why Black people are shot so much more disproportionately is because they're simply more aggressive. Obviously, the real answer is much more complex than such a binary answer, and to that end we opted to create the visualization in the "Were They Armed?" page.

Yes, most victims of police shootings carry guns. However, there is also a notable number that are unarmed, or carry toy weapons and they also lose their lives. The true value of that visualization bleeds into the broader topic of gun rights, but at least people using this type of data in bad faith may hesitate to use it. ~~Or risk having their own guns taken away~~

<br/>

## 3. Research Questions:
1. Who are the people most affected by police shootings?
2. What are the most common reasons police officers may cite for fatal encounters?
3. Where do police shootings take place the most?

It is imperative to note that while the research questions we have tried to answer in this project do not appear to be overly complicated, any meaningful answer will be a significant step on the road to social justice and perhaps possible future reforms. Moreover, while we acknowledge the fact that reputable organizations such as the New York Times, the Washington Post, and others have been reporting on significant police violence against minorities for numerous years, it hasn’t been until recently that concrete action to combat these injustices has been demanded by the general public.

In reality, easy to read data that could show police violence against minorities and other marginalized groups by the numbers would be a useful tool to show legislators, local governments, and other police organizations in order to improve the relationship between law enforcement and the affected groups. At the end of the day, we simply want to answer who are the people most deeply affected by police violence and the possible reasons as to why these groups specifically suffer the most.

<br/>

## 4. Dataset:
Although much information has been collected about police violence in the United States, especially in regards to police shootings, we decided to concentrate on the `Washington Post’s Police Shooting Database.` This extensive dataset contains 17 features and 7,087 observations. We have used it to make all visualizations used in this application and report.

The Washington Post titled this dataset as **Fatal Force** and they explain that the collection of data began January 1st 2015. It is vital to mention that this data was collected in an effort to visualize the amount of people who have been shot fatally by police since 2015 and continues to be update regularly.

The way in which the Washington Post collects its own data about police shootings is by, “culling local news reports, law enforcement websites and social media, and by monitoring independent databases such as Killed by Police and Fatal Encounters,” they also further explain that “the Post conducted additional reporting in many cases.” In other words, this dataset comes directly from the Washington Post’s extensive analysis on fatal police shootings since the start of 2015. This makes us confident in its usability and accuracy.

<br/>

## 5. Findings:
Although extensive data is required to make accurate and critical answers to our research questions, the dataset provided by the Washington Post has helped us to attempt to answer them. The answer to the first question is clear, minorities are simply more likely to be killed by police officers than White people. Sadly, Black people take up a disproportionate percentage in this problem, as we have seen through the visualizations in this application.

The next two questions are more difficult to answer. While we have often heard that many of the people shot by police are mentally ill, we were surprised to find that isn't true. As seen in the "Notable distinctions" page, the overwhelming majority of people involved in police shootings have no history of mental illness. This effectively debunks the myth that people use police officers as a form of suicide. So what are we left with? Guns. Most of the victims shot to death by police officers had some type of gun with them when they were shot. This is one of the most common answer police officers cite for fatal encounters: and it's justified. What isn't justified is the dumbfounding number of police officers without their point of view through recordings. We cannot continue to have this discussion if we are literally unable to see what happens in these situations

The last question is even more perplexing than the first two. While we learned that police shootings are more common in low income areas through outside sources, we expected to find some sense of outliers while mapping our data. The map in the "In Summary" page shows that New Mexico, Oklahoma, and Alaska are notable key states with higher rates of police shootings when adjusted to population. On the other side of the coin, New York of all places stands out of being one of the fewest shootings states despite its large population. That said, police shootings seem to be a country-level problem rather than an issue plaguing a single state.

<br/>

## 6. Discussion:
It is imperative to note that while the research questions we have tried to answer in this project do not appear to be overly complicated, any meaningful answer will be a significant step on the road to social justice and future reforms. Putting race aside for a moment, the loss of any life is tragic, but currently these police shootings are a lose lose situation for everyone involved. How many innocent people have died for playing with a toy gun at the wrong time? How many have wrongfully died for legally owning a gun during one of these altercations? We only have the police's word in most of these cases. Our eyes are locked away with the cameras police officers are supposed to carry.

Moreover, while we acknowledge the fact that reputable organizations such as the New York Times, the Washington Post, and others have been reporting on significant police violence against minorities for numerous years, it hasn’t been until recently that concrete action to combat these injustices has been demanded by the general public. In reality, easy to read data that could show police violence against minorities and other marginalized groups by the numbers would be a useful tool to show legislators, local governments, and other police organizations in order to improve the relationship between law enforcement and the affected groups. At the end of the day, we simply want to answer who are the people most deeply affected by police violence and the possible reasons as to why these groups specifically suffer the most.



## 7. Conclusion:
No one wins with how the stage is currently set up. After several discussions, we have concluded that the police officer's use of excessive force is tied to our countries liberal gun laws and our inability to fit these officers with proper cameras. Police officers have lost support across the country because of the consistent number of shootings every year. It needs to change; either by making access to guns more difficult or by outfitting every police officer with a camera.


## Acknowledgement:
We would like to thank our Professor David G. Hendry for giving us an ~~excuse~~ opportunity to research a topic we are deeply invested in. Our Teaching Assistant, Shawon Sarkar for ~~putting up with~~ thoughtfully answering questions we've asked her; and a special shout-out to Thomas J. Wilson for all the help he provided on Teams. :hugs:


## References:
- Maxman, Olivia. (2017, May 18). _How the U.S. Got Its Police Force._ Time Magazine. https://time.com/4779112/police-history-origins/  
- Feldman, Justin et al. (2018, Oct 20). _Police-Related Deaths and Neighborhood Economic and Racial/Ethnic Polarization, United States, 2015–2016._ American Public Health Association. https://ajph.aphapublications.org/doi/10.2105/AJPH.2018.304851  
- NA. (2015). _Police Shooting Database._ The Washington Post. https://github.com/washingtonpost/data-police-shootings
