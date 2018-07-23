import pymysql
class Connect(object):
    def __init__(self):
        self.db = pymysql.connect(host='localhost', user='haha', password='haha', db='music', charset='utf8')
        self.cursor = self.db.cursor()
        # 使用 execute()  方法执行 SQL 查询
        self.cursor.execute("SELECT VERSION()")

        # 使用 fetchone() 方法获取单条数据.
        self.data = self.cursor.fetchone()
            
        print ("Database version : %s " % self.data)

Connect()
            


