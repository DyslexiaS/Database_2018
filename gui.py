import tkinter as tk
from tkinter import ttk
import pymysql
from prettytable import PrettyTable

class GUI(object):
    def __init__(self):

        self._connect()
        self._gui()
# 創建GUI
    def _gui(self):
        self.window = tk.Tk()
        self.window.title('Database')
        self.window.geometry('910x850')
        tk.Label(self.window, text='MYSQL Query', bg='Wheat', font=('Arial', 16), width=75, height=3).grid(row=0,columnspan=3, sticky='W')
        tk.Label(self.window, text='Query Tool', bg='SkyBlue', font=('Arial', 12), width=30, height=3).grid(row=1, column=0, sticky='W', pady=1)
        tk.Label(self.window, text='Query Keywords', bg='SkyBlue', font=('Arial', 12), width=30, height=5).grid(row=2, column=0, sticky='W', pady=1)
        tk.Label(self.window, text='Result', bg='Wheat', font=('Arial', 16), width=75, height=3).grid(row=5,columnspan=3, sticky='W')

        self.number = tk.StringVar()
        self.Chosen = ttk.Combobox(self.window, width=75, height=50,  textvariable=self.number)
        self.Chosen['values'] = ('MYSQL', 'SELECT PLAYER', 'SELECT-FROM-WHERE', 'PLAYER-INSERT', 'PLAYER-UPDATE', 'PLAYER-DELETE',
                'COUNT', 'SUM', 'MAX-MIN-AVG', 'HAVING', 'IN', 'NOT IN', 'EXISTS', 'NOT EXISTS', 'JOIN')
        self.Chosen.grid(column=1, row=1, sticky='W')
        self.Chosen.current(0)
        self.Chosen.bind("<<ComboboxSelected>>", self.comboxlist) 
        self.list_command = {'MYSQL': "", 
                'SELECT PLAYER': "SELECT * FROM player",
                'SELECT-FROM-WHERE': "SELECT * FROM player WHERE age > 40;",
                'PLAYER-INSERT': "INSERT INTO player( name, role , age)values('曹穎','guitarist',21);",
                'PLAYER-UPDATE': "UPDATE player SET gender ='F' WHERE name = '曹穎';",
                'PLAYER-DELETE' : "DELETE FROM player where name = '曹穎';",
                'COUNT': "SELECT COUNT(ID) AS bassist_num FROM player WHERE role = 'bassist';",
                'SUM': "SELECT COUNT(ID) as player_num, SUM(age) FROM player;",
                'MAX-MIN-AVG': "SELECT MAX(age), MIN(age), AVG(age) FROM player;",
                'HAVING': "SELECT COUNT(ID) as Total, role FROM player GROUP BY role  HAVING COUNT(ID)> 5;",
                'IN': """SELECT * 
FROM player
WHERE player.role = 'vocal&guitarist' AND ID IN 
(   SELECT player.ID
    FROM player
    JOIN PART ON player.ID = PART.pid
    JOIN band ON band.ID = PART.bid);""",
                'NOT IN': """SELECT * 
FROM player
WHERE player.role = 'vocal&guitarist' AND ID NOT IN 
(   SELECT player.ID
    FROM player
    JOIN PART ON player.ID = PART.pid
    JOIN band ON band.ID = PART.bid);""",
                'JOIN': """SELECT player.name as player , song.name as song, event.name as event
FROM player
JOIN PERFORM ON player.ID = PERFORM.pid
JOIN song ON song.ID = PERFORM.sid
JOIN event ON event.ID = PERFORM.eid
WHERE event.name = 'FUJI ROCK FESTIVAL'""",

                'EXISTS': """SELECT *
FROM player
WHERE EXISTS(SELECT * FROM player as p
		JOIN PERFORM ON PERFORM.pid = p.ID
		JOIN event ON PERFORM.eid = event.ID
		WHERE event.name = '大團誕生' AND p.role = 'drummer' AND player.name = p.name)""",
                'NOT EXISTS': """SELECT *
FROM player
WHERE player.role = 'drummer' AND NOT EXISTS
                (SELECT * FROM player as p
		JOIN PERFORM ON PERFORM.pid = p.ID
		JOIN event ON PERFORM.eid = event.ID
		WHERE event.name = '大團誕生' AND player.name = p.name)"""
                }

        self.user_input = tk.Text(self.window, width=78, height=6)
        self.user_input.grid(row=2, column=1, columnspan=2,sticky='W', pady=1)
        tk.Button(self.window,text='Send query', font=('Arial', 14), bg='#3CB371', width=88,height=2,command=self.send).grid(row=4, columnspan=3)
        self.result = tk.Text(self.window, width=113, height=25)
        self.result.grid(row=6, columnspan=4,sticky='W', pady=5)
        
        self.window.mainloop()
# 連接資料庫
    def _connect(self):
        self.db = pymysql.connect(host='localhost', user='haha', password='haha', db='music', charset='utf8', cursorclass=pymysql.cursors.DictCursor)
        self.cursor = self.db.cursor()

    def comboxlist(self, *arg):
        self.result.delete(1.0, tk.END)
        self.result.insert('end', '\n')
        self.result.insert('end', self.list_command[self.Chosen.get()])
        self.result.insert('end', '\n')
        result = self._exc(self.list_command[self.Chosen.get()])
        if(self.Chosen.get()!='PLAYER-INSERT' and self.Chosen.get()!='PLAYER-UPDATE' and self.Chosen.get()!='PLAYER-DELETE'):
            self.print_tb(result)
# 按鈕執行
    def send(self):
        if self.Chosen.get() != 'MYSQL' :
            return
        self.result.delete(1.0, tk.END)
        query = self.user_input.get(1.0, tk.END)
        result = self._exc(query)
        self.print_tb(result)

    def print_tb(self, result):
        key = list(result[0].keys())
        table = PrettyTable(key)
        for row in result:
            table.add_row(row.values())
        print(table)
        self.result.insert('end', table)
# 使用 execute()  方法執行 SQL 查詢     
    def _exc(self, query):
        try:
            self.cursor.execute(query)
            self.db.commit()
            return self.cursor.fetchall()	# 使用 fetchone() 方法得取單行資訊.
        except:
            self.db.rollback()
            self.result.insert('end', 'ERROR QUERY')
