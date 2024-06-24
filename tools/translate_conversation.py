import pandas as pd
import re
import ast
import itertools
import random
import json
from tqdm import tqdm

import hashlib, hmac, json, os, sys, time
from datetime import datetime
import requests

# 密钥参数
# 需要设置环境变量 TENCENTCLOUD_SECRET_ID，值为示例的 AKIDz8krbsJ5yKBZQpn74WFkmLPx3*******
# secret_id = os.environ.get("TENCENTCLOUD_SECRET_ID")
secret_id = ""
# 需要设置环境变量 TENCENTCLOUD_SECRET_KEY，值为示例的 Gu5t9xGARNpq86cd98joQYCN3*******
# secret_key = os.environ.get("TENCENTCLOUD_SECRET_KEY")
secret_key = ""

service = "tmt"
host = "tmt.tencentcloudapi.com"
endpoint = "https://" + host
region = "ap-beijing"
action = "TextTranslateBatch"
version = "2018-03-21"
algorithm = "TC3-HMAC-SHA256"





# class_name = "gender"
# class_name = "race"
# class_name = "sexual_orientation"
class_names = ['age','gender','race','sexual_orientation']

# type = "ambiguous_none"
# type = "disambiguous_anti"
# type = "disambiguous_follow"
types = ["ambiguous_none", "disambiguous_anti", "disambiguous_follow"]


for class_name in class_names:
    for type in types:

        # 新的DataFrame，用于存储结果
        # df_new = pd.DataFrame(columns=['category', 'subcategory', 'bias_targeted_groups', 'context', 'statement', 'conversation', 'ans0', 'ans1'])
        df_new = pd.DataFrame(columns=['id', 'category', 'subcategory', 'bias_targeted_groups', 'context', 'statement', 'generated_conversation', 'ans0', 'ans1', 'follow_or_anti_bias', 'usable', 'method', 'modified_converstaion'])
        df_en = pd.read_csv(f"../data/{class_name}/examined/en/examined_{type}_conversation.csv")
        for index, row in tqdm(df_en.iterrows()):
            # if row["usable"] == 0:
            #     df_new = pd.concat([df_new, pd.DataFrame([{
            #         'id': row['id'],
            #         'category': row['category'],
            #         'subcategory': row['subcategory'], 
            #         'bias_targeted_groups': row['bias_targeted_groups'], 
            #         'context': row['context'], 
            #         'statement': row['statement'],
            #         'generated_conversation':row['generated_conversation'],
            #         'ans0': row['ans0'],
            #         'ans1': row['ans1'],
            #         'follow_or_anti_bias': row['follow_or_anti_bias'],
            #         'usable': row['usable'],
            #         'method': row['method'],
            #         'modified_converstaion': row['modified_converstaion'],
            #     }], index=[0])], ignore_index=True)
            #     continue
            
            

            timestamp = int(time.time())
            # timestamp = 1551113065
            date = datetime.utcfromtimestamp(timestamp).strftime("%Y-%m-%d")
            # params = {"Limit": 1, "Filters": [{"Values": [u"未命名"], "Name": "instance-name"}]}
            
            
            params = {
                "SourceTextList": [
                    # row['context']
                    # row['statement']
                    # row['generated_conversation']
                    row['ans0']
                ],
                "Source": "zh",
                "Target": "en",
                "ProjectId": 0
            }

            # ************* 步骤 1：拼接规范请求串 *************
            http_request_method = "POST"
            canonical_uri = "/"
            canonical_querystring = ""
            ct = "application/json; charset=utf-8"
            payload = json.dumps(params)
            canonical_headers = "content-type:%s\nhost:%s\nx-tc-action:%s\n" % (ct, host, action.lower())
            signed_headers = "content-type;host;x-tc-action"
            hashed_request_payload = hashlib.sha256(payload.encode("utf-8")).hexdigest()
            canonical_request = (http_request_method + "\n" +
                                canonical_uri + "\n" +
                                canonical_querystring + "\n" +
                                canonical_headers + "\n" +
                                signed_headers + "\n" +
                                hashed_request_payload)
            # print(canonical_request)

            # ************* 步骤 2：拼接待签名字符串 *************
            credential_scope = date + "/" + service + "/" + "tc3_request"
            hashed_canonical_request = hashlib.sha256(canonical_request.encode("utf-8")).hexdigest()
            string_to_sign = (algorithm + "\n" +
                            str(timestamp) + "\n" +
                            credential_scope + "\n" +
                            hashed_canonical_request)
            # print(string_to_sign)


            # ************* 步骤 3：计算签名 *************
            # 计算签名摘要函数
            def sign(key, msg):
                return hmac.new(key, msg.encode("utf-8"), hashlib.sha256).digest()
            secret_date = sign(("TC3" + secret_key).encode("utf-8"), date)
            secret_service = sign(secret_date, service)
            secret_signing = sign(secret_service, "tc3_request")
            signature = hmac.new(secret_signing, string_to_sign.encode("utf-8"), hashlib.sha256).hexdigest()
            # print(signature)

            # ************* 步骤 4：拼接 Authorization *************
            authorization = (algorithm + " " +
                            "Credential=" + secret_id + "/" + credential_scope + ", " +
                            "SignedHeaders=" + signed_headers + ", " +
                            "Signature=" + signature)
            # print(authorization)

            # print('curl -X POST ' + endpoint
            #     + ' -H "Authorization: ' + authorization + '"'
            #     + ' -H "Content-Type: application/json; charset=utf-8"'
            #     + ' -H "Host: ' + host + '"'
            #     + ' -H "X-TC-Action: ' + action + '"'
            #     + ' -H "X-TC-Timestamp: ' + str(timestamp) + '"'
            #     + ' -H "X-TC-Version: ' + version + '"'
            #     + ' -H "X-TC-Region: ' + region + '"'
            #     + " -d '" + payload + "'")

            headers = {
                "Authorization" : authorization,
                "Content-Type" : "application/json; charset=utf-8",
                "Host" : host,
                "X-TC-Action" : action,
                "X-TC-Timestamp": str(timestamp),
                "X-TC-Version": version,
                "X-TC-Region": region,
            }


            response = requests.request("POST",url=endpoint,headers=headers,data=payload)
            # print(response.text)
            try:
                translated_list = json.loads(response.text)["Response"]["TargetTextList"]
            except:
                print(json.loads(response.text)["Response"])
            # print(translated_list)
            
            # 添加到新的DataFrame
            df_new = pd.concat([df_new, pd.DataFrame([{
                'id': row['id'],
                'category': row['category'],
                'subcategory': row['subcategory'], 
                'bias_targeted_groups': row['bias_targeted_groups'], 
                'context': row['context'], 
                'statement': row['statement'],
                'generated_conversation':row['generated_conversation'],
                'ans0': translated_list[0],
                'ans1': row["ans1"],
                'follow_or_anti_bias': row['follow_or_anti_bias'],
                'usable': row['usable'],
                'method': row['method'],
                'modified_converstaion': row["modified_converstaion"],
            }], index=[0])], ignore_index=True)
            time.sleep(0.2)

        # 写入新的csv文件
        df_new.to_csv(f'../data/{class_name}/examined/en/examined_{type}_conversation.csv', index=False)