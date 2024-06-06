#!/usr/bin/python 
# -*- coding: utf-8 -*-
import sqlite3

class DataBaseManager(object): # type: ignore
    def __init__(self):
        super(DataBaseManager,self).__init__()
        self.connectDataBase('helloDB.db','doubleColorLottery')

    def connectDataBase(self,path,tableName):
        self.conn = sqlite3.connect(path)
        c = self.conn.cursor()
        c.execute("SELECT name FROM sqlite_master WHERE type='table' AND name=?;",(tableName,))
        if c.fetchone() is None:
            c.execute('''
                CREATE TABLE %s
                (ID TEXT PRIMARY KEY ,
                issue           TEXT    ,
                openTime            TEXT    ,
                frontWinningNum        TEXT,
                backWinningNum         TEXT,
                seqFrontWinningNum      TEXT,
                seqBackWinningNum     TEXT,
                saleMoney TEXT,
                prizePoolMoney TEXT,
                week TEXT);
            '''%tableName)

    def insertData(self,dataList):
        c = self.conn.cursor()
        for item in dataList:
            print(item.openTime)
            c.execute("SELECT * FROM doubleColorLottery WHERE ID = ?", (item.openTime,))
            data = c.fetchone()
            if data is None:
                c.execute("INSERT INTO doubleColorLottery (ID,issue,openTime,frontWinningNum,backWinningNum,seqFrontWinningNum,seqBackWinningNum,saleMoney,prizePoolMoney,week) \
            VALUES (?, ?, ?,?, ?, ?,?, ?, ?, ?)",(item.openTime ,item.issue,item.openTime,item.frontWinningNum,item.backWinningNum,item.seqFrontWinningNum,item.seqBackWinningNum,item.saleMoney,item.prizePoolMoney,str(item.week)));

        self.conn.commit()


class LotteryItem(object):
    def __init__(self):
        super(LotteryItem,self).__init__()
        self.issue = ''
        self.openTime = ''
        self.frontWinningNum = ''
        self.backWinningNum = ''
        self.seqFrontWinningNum = ''
        self.seqBackWinningNum = ''
        self.saleMoney = ''
        self.prizePoolMoney = ''
        self.week = ''

if __name__ == '__main__':
    manager = DataBaseManager()