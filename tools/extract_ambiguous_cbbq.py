import pandas as pd
import re
import ast
import itertools
import random
import os
import json
from tqdm import tqdm



# 新的DataFrame，用于存储结果
df_new = pd.DataFrame(columns=['category', 'subcategory', 'bias_targeted_groups', 'context', 'statement', 'ans0', 'ans1'])


folders = os.listdir("../../existing_dataset/CBBQ/data")
for folder in folders:
    csv_file_path = os.path.join("../../existing_dataset/CBBQ/data",folder,"ambiguous/templates_generate_neg.csv")
    df = pd.read_csv(csv_file_path)
    for index, row in tqdm(df.iterrows()):
        if not isinstance(row['NAME1'], str):
            row['NAME1'] = str(row['NAME1'])  # 转换为字符串类型
        row['NAME1'] = re.sub(r'\b(\w+)\b', r'"\1"', row['NAME1'])
        if not isinstance(row['NAME2'], str):
            row['NAME2'] = str(row['NAME2'])  # 转换为字符串类型
        row['NAME2'] = re.sub(r'\b(\w+)\b', r'"\1"', row['NAME2'])
        name1_list = ast.literal_eval(row['NAME1'].strip())
        name2_list = ast.literal_eval(row['NAME2'].strip())
        
        name1 = random.choice(name1_list)
        name2 = random.choice(name2_list)
        
        

        # context   
        context_1 = row['context'].replace('NAME1', name1).replace('NAME2', name2).replace('。','，').replace('{','').replace('}','')
        context_2 = row['context'].replace('NAME1', name2).replace('NAME2', name1).replace('。','，').replace('{','').replace('}','')
        
        label = row['label']
        # 把bias放在ans0
        if label == 2: 
            ans0 = row['ans0'].replace('NAME1', name1).replace('NAME2', name2).replace('{','').replace('}','')
            ans1 = row['ans1'].replace('NAME1', name1).replace('NAME2', name2).replace('{','').replace('}','')
        
        else:
            print("Error: label is {}, not 2".format(label))
            print(row)
            exit()
        
        # 用群体名称代替statement中的谁
        statement = row['question'].replace('谁', row['bias_targeted_groups']).replace('?','。').replace('？','。').replace('{','').replace('}','')
        
        
        # 添加到新的DataFrame
        df_new = pd.concat([df_new, pd.DataFrame([{
            'category': row['category'],
            'subcategory': row['subcategory'], 
            'bias_targeted_groups': row['bias_targeted_groups'], 
            'context': context_1, 
            "statement": statement,
            "ans0": ans0,
            "ans1": ans1,
        }], index=[0])], ignore_index=True)
        
        df_new = pd.concat([df_new, pd.DataFrame([{
            'category': row['category'],
            'subcategory': row['subcategory'], 
            'bias_targeted_groups': row['bias_targeted_groups'], 
            'context': context_2, 
            "statement": statement,
            "ans0": ans0,
            "ans1": ans1,
        }], index=[0])], ignore_index=True)
        
# 写入新的csv文件
df_new.to_csv('ambiguous_none_cbbq.csv', index=False)
print(len(df_new))