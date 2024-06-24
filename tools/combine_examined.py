import pandas as pd
from tqdm import tqdm

id = 0

dataset_file = 'data/zh/{}_conversation.csv'.format(type)

df_new = pd.DataFrame(columns=['id', 'category', 'subcategory', 'bias_targeted_groups', 'context', 'statement', 'generated_conversation', 'ans0', 'ans1', 'follow_or_anti_bias', 'usable', 'method', 'modified_converstaion'])

# 读入dataset_file文件
df = pd.read_csv(dataset_file, encoding='utf-8-sig')


# 按行遍历df
for index, line in zip(range(len(df)), ws.iter_rows(min_row=2, values_only=True)):
    # print(df.iloc[index]['category'])
    # print(row)
    row = df.iloc[index]
    
        # 添加到新的DataFrame
    df_new = pd.concat([df_new, pd.DataFrame([{
        'id': id,
        'category': row['category'],
        'subcategory': row['subcategory'], 
        'bias_targeted_groups': row['bias_targeted_groups'], 
        'context': row['context'], 
        'statement': row['statement'],
        'generated_conversation':row['conversation'],
        'ans0': row['ans0'],
        'ans1': row['ans1'],
        'follow_or_anti_bias': line[1],
        'usable': line[2],
        'method': line[3],
        'modified_converstaion': line[4],
    }], index=[0])], ignore_index=True)
    id += 1
    
# 保存到新的文件中
df_new.to_csv('examined_data/zh/examined_{}_conversation.csv'.format(type), index=False, encoding='utf-8-sig')
    
