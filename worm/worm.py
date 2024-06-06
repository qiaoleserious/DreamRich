#!/usr/bin/python 
# -*- coding: utf-8 -*-
import json
import os
import requests
from DataBaseManager import DataBaseManager
from DataBaseManager import LotteryItem
class Worm(object): # type: ignore
    def __init__(self):
        super(Worm,self).__init__()

    def requestURl(self,url):
        
        headers={'Connection':'close'}
        res = requests.get(url,headers=headers,verify=False)
        print(res.status_code)
        print(res.content)
        url = url.replace('/','')
        self.write2json(res.content,url)
        #BeautifulSoup(res.content,'html.parser')
        
    def write2json(self,jsonDic,jsonName):
        print('写入json:'+jsonName)
        if os.path.exists("./log") == False:
            os.mkdir('./log')
        file = open("./log/"+jsonName+".json", "w")
        json.dump(jsonDic, file, sort_keys=True,
                  indent=4, ensure_ascii=False)
        
    def requests_data(self,index):
        cookies = {
            'Hm_lvt_12e4883fd1649d006e3ae22a39f97330': '1606980',
            '_ga': 'GA1.2.1535259899.1606980613',
            'PHPSESSID': 'ko9acne5fc09ag34tauema9dk5',
            'Hm_lvt_692bd5f9c07d3ebd0063062fb0d7622f': '1606980',
            'Hm_lpvt_692bd5f9c07d3ebd0063062fb0d7622f': '1606980',
            '_gid': 'GA1.2.702530936.16077449',
            'Hm_lpvt_12e4883fd1649d006e3ae22a39f97330': '1607745',
        }
        headers = {
            'Connection': 'keep-alive',
            'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36',
            'Accept': '*/*',
            'Sec-Fetch-Site': 'same-site',
            'Sec-Fetch-Mode': 'no-cors',
            'Referer': 'https://www.zhcw.com/kjxx/3d/',
            'Accept-Encoding': 'gzip, deflate, br',
            'Accept-Language': 'zh-CN,zh;q=0.9',
        }

        params = (
            ('callback', 'jQuery1122035713028555611515_1607745050216'),
            ('transactionType', '10001001'),
            ('lotteryId', '1'), #彩票类别
            ('issueCount', '100'),#总数
            ('startIssue', ''),
            ('endIssue', ''),
            ('startDate', ''),
            ('endDate', ''),
            ('type', '1'),
            ('pageNum', index), #分页
            ('pageSize', '100'),  #每页返回数量
            ('tt', '0.7235300526774737'),
            ('_', '1607745050225'),
        )
        # 获取服务器返回数据 
        response = requests.get('https://jc.zhcw.com/port/client_json.php', headers=headers, params=params, cookies=cookies).content.decode('utf-8')
        print(response)
        url = 'https://jc.zhcw.com/port/client_json.php'.replace('/','')
        self.write2json(response,url)
        #截取出数据map
        start = response.find("{")
        end = response.rfind("}") + 1
        dict_str = response[start:end]
        dict_obj = eval(dict_str)
        print(dict_obj)
        #取出彩票数据数组
        lotteryList = dict_obj['data']
        #解析成model
        reslutList = []
        for item in lotteryList:
            lotteryItem = LotteryItem()
            for key, value in item.items():
                setattr(lotteryItem, key, value)
            reslutList.append(lotteryItem)
            print(lotteryItem.openTime)
        print(len(reslutList))
        return reslutList



if __name__ == '__main__':
    manager = Worm()
    
    #http://www.cwl.gov.cn/ygkj/wqkjgg/ssq/
    #url = 'http://cwl.gov.cn/cwl_admin/front/cwlkj/search/kjxx/findDrawNotice?name=ssq&issueCount=5&issueStart=&issueEnd=&dayStart=&dayEnd=&pageNo=1&pageSize=30&week=&systemType=PC'
    #url = 'https://www.cwl.gov.cn/'
    # url = 'https://datachart.500.com/ssq/history/newinc/history.php?start=03001'
    # print(url)
    # manager.requestURl(url)
    dataList = manager.requests_data(1)
    db = DataBaseManager()
    db.insertData(dataList)
    
    
