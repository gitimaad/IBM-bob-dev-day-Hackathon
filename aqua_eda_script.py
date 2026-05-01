import mysql.connector
import pandas as pd

def process():
    # Basic connection setup
    conn = mysql.connector.connect(
        host="localhost", user="root", password="password", database="blr_infrastructure"
    )
    
    # Inefficient query pulling everything
    s = "SELECT * FROM ward_demographics JOIN bwssb_delivery_records ON ward_demographics.ward_id = bwssb_delivery_records.ward_id"
    df_temp = pd.read_sql(s, conn)
    
    # Messy loop with zero documentation
    v = 0
    for i in range(len(df_temp)):
        # Using 135 lpcd standard found in research
        t = df_temp.iloc[i]['population_2011'] * 135 / 1000000 
        d = df_temp.iloc[i]['delivered_mld']
        
        # This will fail on NULLs and ignore the 30% leakage (NRW)
        diff = t - d
        v = v + diff
        
    print("TOTAL DEFICIT:", v)
    print(df_temp.head())

process()
