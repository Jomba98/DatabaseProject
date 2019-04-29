

import mysql.connector
import plotly.plotly as py
import plotly.figure_factory as ff
import plotly.graph_objs as go



import numpy as np
import pandas as pd

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="nulliusinverba"
)

myCursor = mydb.cursor()
myCursor.execute("USE COD_PROJ;")
myCursor.execute("SELECT StateName FROM States;")
locs = myCursor.fetchall()

#FOR ACQUIRING STATE ABBREVIATIONS REQUIRED BY PLOTLY TOOLS
df = pd.read_csv('/Users/frank/Downloads/datasets-master 2/2011_us_ag_exports.csv')

stateDict = {}
myCursor.execute("SELECT StateId FROM States;")
IDs = myCursor.fetchall()
IDs = [i[0] for i in IDs]

for i in range(0, len(IDs)):
  stateDict[IDs[i]] = df['code'][i]



def Plotter(mapName, scl, values):

  data = [go.Choropleth(colorscale = scl,
                      autocolorscale = False, 
                      locations = list(stateDict.values()),
                      z = values,
                      locationmode = 'USA-states',
                      text = [i[0] for i in locs],
                      marker = go.choropleth.Marker(
                        line = go.choropleth.marker.Line(
                          color = 'rgb(255,255,255)',
                          width = 2)),
                      colorbar = go.choropleth.ColorBar(
                        title = mapName))]

  layout = go.Layout(title = go.layout.Title(text = mapName),
  geo = go.layout.Geo(scope = 'usa', projection = go.layout.geo.Projection(type = 'albers usa'),
  showlakes = True, lakecolor = 'rgb(255, 255, 255)'),)
  
  fig = go.Figure(data = data, layout = layout)

  plotly.offline.plot(fig, filename = (mapName + ".html"))


#QUERY
myCursor.execute("SELECT * FROM EnrollmentRate;") 
medicare = myCursor.fetchall()

#PLOTTING
Plotter("Medicare Enrollment Ratios 2016", 'Blues', [medicare[int(i) - 1][1] for i in list(stateDict.keys())])

#QUERY
myCursor.execute("SELECT * FROM DeathRate;")
DeathRates = myCursor.fetchall()

Plotter("Death Rates 2017", 'Reds', [DeathRates[int(i) - 1][1] for i in list(stateDict.keys())])

#QUERY
myCursor.execute("SELECT * FROM MedianIncomeView;")
Incomes = myCursor.fetchall()

#PLOTTING
Plotter("Median Household Income 2017", 'Greens', [Incomes[int(i) - 1][1] for i in list(stateDict.keys())])
