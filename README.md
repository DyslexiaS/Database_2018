# Document
## 系統架構與環境 & 介面截圖與使用說明
- 系統架構：
    - Ubuntu 18.04 LTS
    - Python 3.6.5
    - GUI: Python tkinter
    - DB: MYSQL 5.7
- 介面
![](https://i.imgur.com/2RDIL1X.png)
    - Query Tool:
        - MYSQL: can use Query Keywords by user input
        - Other: can choose other button
         ![](https://i.imgur.com/dMMaiwM.png)
        - Result: query result will print in it
        ![](https://i.imgur.com/mPhbmo2.png)
-----
## 資料庫設計
- ER diagram
    ![](https://i.imgur.com/2r4kuFK.png)
    (上面的斜線都是實線，只是因為畫質關係看起來像虛線)

- 第三正規化後的 Relation Schema
    ![](https://i.imgur.com/9ilIccK.png)

-
- 每個 table, attribute, relationship 的意義和關係
    #### **purpose：  The databases can know any information of a player, include her/his performance(what event, songs), and something about her/his band or company**
    - every entity have ID to be a primary key
    - Entity:
        - player: has his/her information like name, gender, age, role
            - name: player's name
            - gender: can use it to analyze Sex ratio of people playing music
            - age:  can use it to analyze player's age group
            - role: play what instruments
        - band: has its name and genre
            - name: band's name
            - genre: know its musical style
        - company: has its name and location
            - name: company's name
            - location: can know where it is
        - song: has its name and year
            - name: song's name
            - year: to know when it was published and which year having the most songs
        - event: has name, place,time
            - name: event's name
            - place: can know where the event taking place in
            - time: can know when holding the event and know which year having the most activities

    - Relation:
        - perform: to know someone sing what songs in the event
        - leader: to know who is a leader in a band
        - part: to know member of one band
        - work: to know someone who work on waht company

- Info about Entity
![](https://i.imgur.com/7d9RF2M.png)
![](https://i.imgur.com/hU8dkXZ.png)
![](https://i.imgur.com/9gF5FEH.png)
![](https://i.imgur.com/5FRW0G0.png)
![](https://i.imgur.com/2iLqWMN.png)
--------
- Info about Relation
![](https://i.imgur.com/8qmhBNT.png)
