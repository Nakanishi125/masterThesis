import pandas as pd 
import matplotlib.pyplot as plt 
import numpy as np 


fig = plt.figure()
ax = fig.add_subplot(111, xlim=(0, 500000), ylim=(0, 3000),xlabel='The number of iterations', ylabel='The size of C_free_obj')
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
    
    
    ax.plot(x, y,label=f)


fig.savefig("transition.eps")
