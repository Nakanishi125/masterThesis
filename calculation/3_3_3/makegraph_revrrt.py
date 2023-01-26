import pandas as pd 
import matplotlib.pyplot as plt 
import numpy as np 


fig = plt.figure()
ax = fig.add_subplot(111, xlim=(0, 500000), ylim=(0, 2e6), xlabel='The number of iterations', ylabel='The size of C_free_obj [mm^2 deg]')
fn = ['data1.csv','data2.csv','data3.csv','data4.csv','data5.csv']
   
for f in range(len(fn)):
    df_data = pd.read_csv(fn[f], header=None)
    data = df_data.to_numpy()
    
    n = len(data)
    for i in range(n):
        if i != n-1:
            add = np.array([data[2*i+1, 0]-1, data[2*i, 1]])
            data = np.insert(data, 2*i+1, add, axis=0)
   
    x = data[:, 0]
    y = data[:, 1]
    for i in range(len(y)):
        y[i] = y[i]*500
    
    
    ax.plot(x, y,label=f)


fig.savefig("transition_vol.eps")
