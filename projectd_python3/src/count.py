from time import sleep
import mysql.connector

def main():
    # コネクション作成
    conn = mysql.connector.connect(
        host='host.docker.internal',
        port='3306',
        user='user',
        password='password',
        database='laravel_project'
    )
    # DB接続
    cur = conn.cursor(buffered=True)
    cur.execute("SELECT * FROM cameras")
    db_lis = cur.fetchall()

    spots_id_lis = [] 
    for i in range(len(db_lis)):
        if not db_lis[i][1] in spots_id_lis:
            spots_id_lis.append(db_lis[i][1])

    # 1日(1時間に1回定期処理)
    for i2 in range(len(spots_id_lis)):
        count_day1 = 0
        count_day1 = int(count_day1)
        for i3 in range(len(db_lis)):
            if db_lis[i3][1] == spots_id_lis[i2]:
                count_day1 = count_day1 + int(db_lis[i3][5])
        cur = conn.cursor(buffered=True)
        sql = ("SELECT spots_count_day1 FROM spots WHERE spots_id = %s" % spots_id_lis[i2])
        cur.execute(sql)
        db_day1 = cur.fetchall()
        db_day1 = db_day1[0][0]
        db_day_lis = db_day1.split(',')
        if db_day1 == "None":
            new_day1 = ("%s" % str(count_day1))
        else:
            new_day1 = ("%s,%s" % (db_day1,str(count_day1)))
        sql = ("UPDATE spots SET spots_count_day1 = %s WHERE spots_id = %s")
        param = (new_day1,spots_id_lis[i2])
        cur.execute(sql,param)
        # 25時間目の処理
        print(len(db_day_lis) + 1)
        if len(db_day_lis) >= 24:
            sql = ("UPDATE spots SET spots_count_day1 = %s WHERE spots_id = %s")
            param = (str(count_day1),spots_id_lis[i2])
            cur.execute(sql,param)
            day_ave = sum([int(s) for s in db_day_lis])/len(db_day_lis)
            print("day1を更新")
            # 1週間(1日の平均を7日間)
            sql = ("SELECT spots_count_week1 FROM spots WHERE spots_id = %s" % spots_id_lis[i2])
            cur.execute(sql)
            sql = ("SELECT spots_count_week1 FROM spots WHERE spots_id = %s" % spots_id_lis[i2])
            cur.execute(sql)
            db_week1 = cur.fetchall()
            db_week1 = db_week1[0][0]
            db_week_lis = db_week1.split(',')
            if db_week1 == "None":
                new_week1 = ("%s" % str(day_ave))
            else:
                new_week1 = ("%s,%s" % (db_week1,str(day_ave)))
            sql = ("UPDATE spots SET spots_count_week1 = %s WHERE spots_id = %s")
            param = (new_week1,spots_id_lis[i2])
            cur.execute(sql,param)
            if len(db_week_lis) >= 7:
                db_week_lis.pop(0)
                sql = ("UPDATE spots SET spots_count_week1 = %s WHERE spots_id = %s")
                db_week_lis.append(str(day_ave))
                new_week_lis = ",".join(db_week_lis)
                new_week1 = ("%s" % (new_week_lis))
                param = (new_week1,spots_id_lis[i2])
                cur.execute(sql,param)
                print("weekを更新") 
            # 1か月(30日間で固定)
            sql = ("SELECT spots_count_month1 FROM spots WHERE spots_id = %s" % spots_id_lis[i2])
            cur.execute(sql)
            db_month1 = cur.fetchall()
            db_month1 = db_month1[0][0]
            db_month1_lis = db_month1.split(',')
            if db_month1 == "None":
                new_month1 = ("%s" % str(day_ave))
            else:
                new_month1 = ("%s,%s" % (db_month1,str(day_ave)))
            sql = ("UPDATE spots SET spots_count_month1 = %s WHERE spots_id = %s")
            param = (new_month1,spots_id_lis[i2])
            cur.execute(sql,param)
            # 30日に１回更新
            if len(db_month1_lis) >= 30:
                db_month1_lis.pop(0)
                sql = ("UPDATE spots SET spots_count_month1 = %s WHERE spots_id = %s")
                db_month1_lis.append(str(day_ave))
                new_month1_lis = ",".join(db_month1_lis)
                new_month1 = ("%s" % (new_month1_lis))
                param = (new_month1,spots_id_lis[i2])
                cur.execute(sql,param)             
                print("month1を更新")
            # 3か月(90日間で固定)
            sql = ("SELECT spots_count_month3 FROM spots WHERE spots_id = %s" % spots_id_lis[i2])
            cur.execute(sql)
            db_month3 = cur.fetchall()
            db_month3 = db_month3[0][0]
            db_month3_lis = db_month3.split(',')
            if db_month3 == "None":
                new_month3 = ("%s" % str(day_ave))
            else:
                new_month3 = ("%s,%s" % (db_month3,str(day_ave)))
            sql = ("UPDATE spots SET spots_count_month3 = %s WHERE spots_id = %s")
            param = (new_month3,spots_id_lis[i2])
            cur.execute(sql,param)
            # 90日に１回更新
            if len(db_month3_lis) >= 90:
                db_month3_lis.pop(0)
                sql = ("UPDATE spots SET spots_count_month3 = %s WHERE spots_id = %s")
                db_month3_lis.append(str(day_ave))
                new_month3_lis = ",".join(db_month3_lis)
                new_month3 = ("%s" % (new_month3_lis))
                param = (new_month3,spots_id_lis[i2])
                cur.execute(sql,param)             
                print("month3を更新")
        conn.commit()
        cur.close()

# 定期実行
def time_cycle():
    # sleepで定期実行、デプロイ時に定期実行用プラグインに移す。
    while True:
        main()       
        print("update")
        sleep(3600)

time_cycle()