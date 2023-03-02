import pandas as pd 
import matplotlib.pyplot as plt
import numpy as np 

df_data = pd.read_csv("Summerize.csv")

data_xyz = df_data.loc[:9, '3_2_1_xyz'].to_numpy()
data_yz = df_data.loc[:9, '3_2_1_yz']

fig1 = plt.figure()
ax1 = fig1.add_subplot(111)
data1 = (data_xyz, data_yz)
ax1.boxplot(data1, sym='')
ax1.grid()
ax1.set_xticklabels(['Previous goal', 'Relieved goal'], fontsize=14)
ax1.set_ylabel('Calculation time [s]', fontsize=14)
fig1.savefig('3_2_1.eps')
fig1.savefig('3_2_1.svg')


fig2 = plt.figure()
ax2 = fig2.add_subplot(111, ylabel='Calculation time [s]')
data2 = (df_data.loc[:9, '3_2_2fullscan'], df_data.loc[:9, '3_2_2efficient'])
ax2.boxplot(data2, sym='')
ax2.grid()
ax2.set_xticklabels(['Fullscan and\nclustering', 'Efficient\nextraction'], fontsize=14)
ax2.set_ylabel('Calculation time [s]', fontsize=14)
fig2.savefig('3_2_2.eps')
fig2.savefig('3_2_2.svg')


fig3 = plt.figure()
ax3 = fig3.add_subplot(111, ylabel='Calculation time [s]')
data3 = (df_data.loc[:, '3_4_1Forward'], df_data.loc[:, '3_4_1Reverse'], df_data.loc[:, '3_4_1Connect'])
ax3.boxplot(data3, sym='')
ax3.grid()
ax3.set_xticklabels(['Forward\nsearch', 'Reverse\nsearch', 'Bidirectional\nsearch'], fontsize=14)
ax3.set_ylabel('Calculation time [s]', fontsize=14)
fig3.savefig('3_4_1.eps')
fig3.savefig('3_4_1.svg')
