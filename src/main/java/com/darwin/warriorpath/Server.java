package com.darwin.warriorpath;
import java.sql. * ;
import java.util.Arrays;
import java.util.Date;
import java.util.Objects;
public class Server {
    private static final String url = "jdbc:mysql://localhost:3306/";
    private static final String UnP = "root";
    private static final String mainDB = "_cities";
    private static Connection[] servers;
    private static Connection mainServ;
    private static Statement mainStatement;
    private static Statement[] statements;
    private static ResultSet rs;
    public static void main(String[] args) {
        String query = "SELECT Count(*) FROM servers";
        try {
            mainServ = DriverManager.getConnection(url + mainDB, UnP, UnP);

            mainStatement = mainServ.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
            rs = mainStatement.executeQuery(query);
            int d = 0;
            while (rs.next()) {
                d = rs.getInt(1);
            }
            rs.close();
            servers = new Connection[d];
            statements = new Statement[d];
            for (int i = 0; i < d; i++) {
                query = "SELECT db FROM servers WHERE (num=" + (i + 1) + ")";
                rs = mainStatement.executeQuery(query);
                String dbToConnect = "";
                while (rs.next()) {
                    dbToConnect = rs.getString(1);
                }

                servers[i] = DriverManager.getConnection(url + dbToConnect, UnP, UnP);

                statements[i] = servers[i].createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
            }
            System.out.println("Connection to all servers established successfully.");
            while (true) {
                for (int i = 0; i < statements.length; i++) {
                    rs = statements[i].executeQuery("SELECT Count(*) FROM barbs;");
                    int num = 0;
                    while (rs.next()) {
                        num = rs.getInt(1);
                    }
                    if (num < 30) {
                        for (int j = num; j < 30; j++) {
                            int x = (int)(Math.random() * 1500);
                            int y = (int)(Math.random() * 1500);
                            int level = (int)(Math.random() * 7 + 1) * 3;
                            long eta = currentTime() + 43200;
                            statements[i].executeUpdate("INSERT INTO barbs(x,y,level,disappear_eta) VALUES (" + x + ", " + y + ", " + level + ", " + eta + ");");
                        }
                    }
                    rs = statements[i].executeQuery("SELECT * FROM barbs WHERE (disappear_eta<" + currentTime() + ");");
                    while (rs.next()) {
                        int x = rs.getInt(1);
                        int y = rs.getInt(2);
                        Statement
                                tempS = servers[i].createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.
                                CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
                        ResultSet temp = tempS.executeQuery("SELECT Count(*) FROM marches WHERE (target_x=" + x + " AND target_y=" + y + ");");
                        int taken = 0;
                        while (temp.next()) {
                            taken = temp.getInt(1);
                        }
                        if (taken == 0) {
                            tempS.executeUpdate("DELETE FROM barbs WHERE x=" + x + " AND y=" + y + ";");
                        }
                    }
                    rs = statements[i].executeQuery("SELECT Count(*) FROM monsters;");
                    while (rs.next()) {
                        num = rs.getInt(1);
                    }
                    if (num < 30) {
                        for (int j = num; j < 30; j++) {
                            int x = (int)(Math.random() * 1500);
                            int y = (int)(Math.random() * 1500);
                            int level = (int)(Math.random() * 20 + 1);
                            long eta = currentTime() + 43200;
                            statements[i].executeUpdate("INSERT INTO monsters(x,y,level,disappear_eta) VALUES (" + x + ", " + y + ", " + level + ", " + eta + ");");
                        }
                    }
                    rs = statements[i].executeQuery("SELECT * FROM monsters WHERE (disappear_eta<" + currentTime() + ");");
                    while (rs.next()) {
                        int x = rs.getInt(1);
                        int y = rs.getInt(2);
                        Statement
                                tempS = servers[i].createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.
                                CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
                        ResultSet temp = tempS.executeQuery("SELECT Count(*) FROM marches WHERE (target_x=" + x + " AND target_y=" + y + ");");
                        int taken = 0;
                        while (temp.next()) {
                            taken = temp.getInt(1);
                        }
                        if (taken == 0) tempS.executeUpdate("DELETE FROM monsters WHERE x=" + x + " AND y=" + y + ";");
                    }
                    rs = statements[i].executeQuery("SELECT Count(*) FROM tiles;");
                    while (rs.next()) {
                        num = rs.getInt(1);
                    }
                    if (num < 30) {
                        for (int j = num; j < 30; j++) {
                            int x = (int)(Math.random() * 1500);
                            int y = (int)(Math.random() * 1500);
                            int level = (int)(Math.random() * 5 + 1);
                            long eta = currentTime() + 43200;
                            int temp = (int)(Math.random() * 3.5) + 1;
                            char type = 'e';
                            switch (temp) {
                                case 2:
                                {
                                    type = 'w';
                                    break;
                                }
                                case 3:
                                {
                                    type = 'i';
                                    break;
                                }
                                case 4:
                                {
                                    type = 's';
                                    break;
                                }
                                default:
                                    type = 'f';
                            }
                            int amount = 20000 * level;
                            if (type == 's') amount /= 20;
                            if (type == 'i') amount /= 5;
                            statements[i].executeUpdate("INSERT INTO tiles(x,y,type,amount,level,disappear_eta) VALUES (" + x + ", " + y + ", '" + type + "', " + amount + ", " + level + ", " + eta + ");");
                        }
                    }
                    rs = statements[i].executeQuery("SELECT * FROM tiles WHERE (disappear_eta<" + currentTime() + " AND owner IS NULL);");
                    while (rs.next()) {
                        int x = rs.getInt(1);
                        int y = rs.getInt(2);
                        Statement
                                tempS = servers[i].createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.
                                CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
                        ResultSet temp = tempS.executeQuery("SELECT Count(*) FROM marches WHERE (target_x=" + x + " AND target_y=" + y + ");");
                        int taken = 0;
                        while (temp.next()) {
                            taken = temp.getInt(1);
                        }
                        if (taken == 0) tempS.executeUpdate("DELETE FROM tiles WHERE (x=" + x + " AND y=" + y + ");");
                    }
                    rs = statements[i].executeQuery("SELECT * FROM tiles WHERE (owner IS NOT NULL);");
                    while (rs.next()) {
                        Statement
                                tempS = servers[i].createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.
                                CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
                        int x = rs.getInt("x");
                        int y = rs.getInt("y");
                        int amount = rs.getInt("amount");
                        int gathered = rs.getInt("gathered_amount");
                        String type = rs.getString("type");
                        int owner = rs.getInt("owner");
                        int speed;
                        if (Objects.equals(type, "f") || Objects.equals(type, "w")) speed = 20;
                        else if (Objects.equals(type, "i")) speed = 4;
                        else speed = 1;
                        if (amount > gathered) {
                            long gather_start_time = 0;
                            ResultSet temp = tempS.executeQuery("SELECT eta FROM marches WHERE (target_x=" + rs.getInt("x") + " AND target_y=" + rs.getInt("y") + " AND player=" + owner + ");");
                            while (temp.next())
                                gather_start_time = temp.getLong(1);
                            tempS.executeUpdate("UPDATE tiles SET gathered_amount=" + ((currentTime() - gather_start_time) * speed) + ";");
                        } else {
                            Statement
                                    tempS_main = mainServ.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
                            String col;
                            switch (type) {
                                case "f":
                                {
                                    col = "food";
                                    break;
                                }
                                case "w":
                                {
                                    col = "wood";
                                    break;
                                }
                                case "i":
                                {
                                    col = "iron";
                                    break;
                                }
                                default:
                                {
                                    col = "silver";
                                }
                            }
                            tempS_main.executeUpdate("UPDATE buildings SET " + col + "=" + col + "+" + amount + " WHERE (id=" + owner + ");");
                            rewards_tile(owner, amount);
                            tempS.executeUpdate("UPDATE marches SET status='returning' WHERE (target_x=" + rs.getInt("x") + " AND target_y=" + rs.getInt("y") + " AND player=" + owner + ");");
                            ResultSet temp = tempS.executeQuery("SELECT marchtime FROM marches WHERE (target_x=" + rs.getInt("x") + " AND target_y=" + rs.getInt("y") + " AND player=" + owner + ");");
                            int marchtime = 0;
                            while (temp.next()) marchtime = temp.getInt(1);
                            tempS.executeUpdate("UPDATE marches SET eta=eta+" + marchtime + " WHERE (target_x=" + rs.getInt("x") + " AND target_y=" + rs.getInt("y") + " AND player=" + owner + ");");
                            tempS.executeUpdate("DELETE from tiles WHERE (x=" + x + " AND y=" + y + ");");
                        }
                    }
                    rs = statements[i].executeQuery("SELECT * FROM kvktowers WHERE (next_kvk_start<" + currentTime() + " AND next_kvk_end>=" + currentTime() + " AND throne_lead_m IS NOT NULL);");
                    while (rs.next()) {
                        int march = rs.getInt("throne_lead_m");
                        Statement
                                tempS = servers[i].createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.
                                CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
                        ResultSet temp = tempS.executeQuery("SELECT player FROM marches WHERE (march_id=" + march + ");");
                        int playerid = -1;
                        while (temp.next()) playerid = temp.getInt(1);
                        temp = tempS.executeQuery("SELECT alliance FROM players WHERE (id=" + playerid + ");");
                        String allianceId = "---";
                        while (temp.next()) allianceId = temp.getString(1);
                        temp = tempS.executeQuery("SELECT Count(*) FROM kvk WHERE (alliance='" + allianceId + "');");
                        int already = 0;
                        while (temp.next()) already = temp.getInt(1);
                        if (already != 0) {
                            temp = tempS.executeQuery("SELECT start_hold FROM kvk WHERE (alliance='" + allianceId + "');");
                            long time_of_start = currentTime();
                            while (temp.next()) time_of_start = temp.getLong(1);
                            tempS.executeUpdate("UPDATE kvk SET seconds_held=seconds_held+" + (currentTime() - time_of_start) + " WHERE (alliance='" + allianceId + "');");
                            tempS.executeUpdate("UPDATE kvk SET seconds_in_row=" + (currentTime() - time_of_start) + " WHERE (alliance='" + allianceId + "');");
                        } else {
                            tempS.executeUpdate("INSERT INTO kvk (alliance, seconds_held, seconds_in_row, start_hold) VALUES ('" + allianceId + "', 1, 1, " + currentTime() + ");");
                        }
                    }
                    rs = statements[i].executeQuery("SELECT * FROM kvktowers WHERE (next_kvk_end<" + currentTime() + ");");
                    while (rs.next()) {
                        Statement
                                tempS = servers[i].createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.
                                CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
                        long startTime = rs.getLong(1) + 1209600;
                        long endTime = rs.getLong(2) + 1209600;
                        ResultSet temp = tempS.executeQuery("SELECT Max(seconds_held) FROM kvk;");
                        int maxSecs = 0;
                        while (temp.next()) maxSecs = temp.getInt(1);
                        temp = tempS.executeQuery("SELECT alliance FROM kvk WHERE (seconds_held=" + maxSecs + ");");
                        String alliance = "---";
                        while (temp.next()) {
                            alliance = temp.getString(1);
                            break;
                        }
                        if (Objects.equals(alliance, "---")) {
                            temp = tempS.executeQuery("SELECT Max(level) FROM alliances WHERE (alliance_id!='---');");
                            int maxLevel = 0;
                            while (temp.next()) maxLevel = temp.getInt(1);
                            temp = tempS.executeQuery("SELECT alliance_id FROM alliances WHERE (alliance_id!='---' AND level=" + maxLevel + ");");
                            while (temp.next()) {
                                alliance = temp.getString(1);
                                break;
                            }
                        }
                        tempS.executeUpdate("UPDATE kvktowers SET kvk_winner='" + alliance + "';");
                        temp = tempS.executeQuery("SELECT id FROM players WHERE (alliance='" + alliance + "');");
                        while (temp.next()) {
                            Statement tempS_main = mainServ.createStatement();
                            tempS_main.executeUpdate("UPDATE buildings SET gold=gold+1000 WHERE (id=" + temp.getInt(1) + ");");
                            tempS_main.executeUpdate("INSERT INTO mail (id,sender,content,time) VALUES (" + temp.getInt(1) + ", -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', " + currentTime() + ");");
                        }
                        int leader = 0;
                        temp = tempS.executeQuery("SELECT leader FROM alliances WHERE (alliance_id='" + alliance + "');");
                        while (temp.next()) leader = temp.getInt(1);
                        temp = tempS.executeQuery("SELECT * FROM serverinfo WHERE (current=1);");
                        while (temp.next()) {
                            Statement
                                    temp3 = servers[i].createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.
                                    CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
                            temp3.executeUpdate("UPDATE serverinfo SET current=0 WHERE (current=1);");
                            temp3.executeUpdate("INSERT INTO serverinfo (num, current, leader) VALUES (" + (temp.getInt(1)+1) + ", 1, " + leader + ");");
                        }
                        tempS.executeUpdate("UPDATE marches SET status='returning', eta=" + currentTime() + "+marchtime WHERE (marchtype='kvk');");
                        tempS.executeUpdate("DELETE FROM rallies WHERE (target_type='kvk');");
                        tempS.executeUpdate("DELETE FROM kvk;");
                        tempS.executeUpdate("DELETE FROM kvktowers");
                        tempS.executeUpdate("INSERT INTO kvktowers(next_kvk_start,next_kvk_end) VALUES (" + startTime + ", " + endTime + ");");
                    }
                    rs = statements[i].executeQuery("SELECT spell_id FROM spells WHERE (eta<" + currentTime() + ");");
                    while (rs.next()) {
                        Statement
                                tempS = servers[i].createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.
                                CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
                        tempS.executeUpdate("DELETE FROM spells WHERE (spell_id=" + rs.getInt(1) + ");");
                    }
                    rs = statements[i].executeQuery("SELECT * FROM marches WHERE (eta<" + currentTime() + ");");
                    while (rs.next()) {
                        Statement
                                tempS = servers[i].createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.
                                CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
                        Statement
                                tempS_main = mainServ.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
                        if (Objects.equals(rs.getString("status"), "returning")) {
                            int id = rs.getInt("player");
                            int[] inf = {
                                    rs.getInt("t1i"),
                                    rs.getInt("t2i"),
                                    rs.getInt("t3i"),
                                    rs.getInt("t4i"),
                                    rs.getInt("t5i")
                            };
                            int[] cav = {
                                    rs.getInt("t1c"),
                                    rs.getInt("t2c"),
                                    rs.getInt("t3c"),
                                    rs.getInt("t4c"),
                                    rs.getInt("t5c")
                            };
                            int[] bow = {
                                    rs.getInt("t1b"),
                                    rs.getInt("t2b"),
                                    rs.getInt("t3b"),
                                    rs.getInt("t4b"),
                                    rs.getInt("t5b")
                            };
                            for (int j = 0; j < 5; j++) {
                                String one = "t" + (j + 1) + "inf";
                                String two = "t" + (j + 1) + "cav";
                                String three = "t" + (j + 1) + "bow";
                                tempS_main.executeUpdate("UPDATE troops SET " + one + "=" + one + "+" + inf[j] + " WHERE (id=" + id + ");");
                                tempS_main.executeUpdate("UPDATE troops SET " + two + "=" + two + "+" + cav[j] + " WHERE (id=" + id + ");");
                                tempS_main.executeUpdate("UPDATE troops SET " + three + "=" + three + "+" + bow[j] + " WHERE (id=" + id + ");");
                            }
                            if (rs.getString("hero1") != null) {
                                tempS_main.executeUpdate("UPDATE heroes SET is_h" + rs.getInt("hero1") + "_present=1 WHERE (id=" + id + ");");
                            }
                            if (rs.getString("hero2") != null) {
                                tempS_main.executeUpdate("UPDATE heroes SET is_h" + rs.getInt("hero2") + "_present=1 WHERE (id=" + id + ");");
                            }
                            if (rs.getInt("dragon") == 1) {
                                tempS_main.executeUpdate("UPDATE troops SET isdragonhome=1 WHERE (id=" + id + ");");
                            }
                            int id_rem = rs.getInt("march_id");
                            tempS.executeUpdate("DELETE FROM marches WHERE (march_id=" + id_rem + ");");
                        }
                        if (Objects.equals(rs.getString("status"), "standby") && Objects.equals(rs.getString("marchtype"), "rally")) {
                            int m_id = rs.getInt("march_id");
                            ResultSet temp = tempS.executeQuery("SELECT id FROM rallies WHERE (starter_march=" + m_id + " OR joiner1_march=" + m_id + " OR joiner2_march=" + m_id + " OR joiner3_march=" + m_id + " OR joiner4_march=" + m_id + " OR joiner5_march=" + m_id + ");");
                            int rally_id = -1;
                            while (temp.next()) rally_id = temp.getInt(1);
                            temp = tempS.executeQuery("SELECT starter_march, joiner1_march, joiner2_march, joiner3_march, joiner4_march, joiner5_march FROM rallies WHERE (id=" + rally_id + ");");
                            while (temp.next()) {
                                if (temp.getString(2) == null) {
                                    int player = rs.getInt("player");
                                    tempS_main.executeUpdate("INSERT INTO mail(id,sender,content,time) VALUES (" + player + ", -1, 'Your rally has been cancelled because no one joined it.', " + currentTime() + ");");
                                    Statement
                                            temp3 = servers[i].createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.
                                            CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
                                    temp3.executeUpdate("DELETE FROM rallies WHERE (id=" + rally_id + ");");
                                    temp3.executeUpdate("UPDATE marches SET status='returning' WHERE (march_id=" + m_id + ");");
                                } else {
                                    Statement
                                            temp3 = servers[i].createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.
                                            CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
                                    int[] marches = {
                                            temp.getInt(1),
                                            temp.getInt(2),
                                            -1,
                                            -1,
                                            -1,
                                            -1
                                    };
                                    if (temp.getString(3) != null) marches[2] = temp.getInt(3);
                                    if (temp.getString(4) != null) marches[3] = temp.getInt(3);
                                    if (temp.getString(5) != null) marches[4] = temp.getInt(3);
                                    if (temp.getString(6) != null) marches[5] = temp.getInt(3);
                                    ResultSet rs2 = temp3.executeQuery("SELECT marchtime FROM marches WHERE (march_id=" + marches[0] + ");");
                                    int time = 0;
                                    while (rs2.next()) time = rs2.getInt(1);
                                    long new_eta = currentTime() + time;
                                    for (int j: marches) {
                                        if (j != -1) temp3.executeUpdate("UPDATE marches SET eta=" + new_eta + ", status='marching' WHERE (march_id=" + j + ");");
                                    }
                                }
                            }
                        }
                        if (Objects.equals(rs.getString("status"), "marching")) {
                            if (Objects.equals(rs.getString("marchtype"), "monster")) {
                                if (pve_monster(rs.getInt("march_id"), rs.getInt("target_x"), rs.getInt("target_y"), i)) {
                                    tempS.executeUpdate("UPDATE marches SET status='returning' WHERE (march_id=" + rs.getInt("march_id") + ");");
                                    tempS.executeUpdate("DELETE FROM monsters WHERE (x=" + rs.getInt("target_x") + " AND y=" + rs.getInt("target_y") + ");");
                                } else {
                                    tempS.executeUpdate("UPDATE marches SET status='returning' WHERE (march_id=" + rs.getInt("march_id") + ");");
                                }
                            } else if (Objects.equals(rs.getString("marchtype"), "tile")) {
                                ResultSet temp = tempS.executeQuery("SELECT owner FROM tiles WHERE (x=" + rs.getInt("target_x") + " AND y=" + rs.getInt("target_y") + ");");
                                temp.next();
                                if (temp.getString(1) == null) {
                                    tempS.executeUpdate("UPDATE tiles SET owner=" + rs.getInt("player") + " WHERE (x=" + rs.getInt("target_x") + " AND y=" + rs.getInt("target_y") + ");");
                                    tempS.executeUpdate("UPDATE marches SET status='standby' WHERE (march_id=" + rs.getInt("march_id") + ");");
                                } else {
                                    tempS.executeUpdate("UPDATE marches SET status='returning' WHERE (march_id=" + rs.getInt("march_id") + ");");
                                    tempS.executeUpdate("UPDATE marches SET eta=eta+marchtime WHERE (march_id=" + rs.getInt("march_id") + ");");
                                }
                            } else if (Objects.equals(rs.getString("marchtype"), "camp")) {
                                tempS.executeUpdate("UPDATE marches SET status='standby' WHERE (march_id=" + rs.getInt("march_id") + ");");
                            } else if (Objects.equals(rs.getString("marchtype"), "rally")) {
                                int m_id = rs.getInt("march_id");
                                ResultSet temp = tempS.executeQuery("SELECT id FROM rallies WHERE (starter_march=" + m_id + " OR joiner1_march=" + m_id + " OR joiner2_march=" + m_id + " OR joiner3_march=" + m_id + " OR joiner4_march=" + m_id + " OR joiner5_march=" + m_id + ");");
                                int rally_id = -1;
                                while (temp.next()) rally_id = temp.getInt(1);
                                temp = tempS.executeQuery("SELECT starter_march, joiner1_march, joiner2_march, joiner3_march, joiner4_march, joiner5_march, barb_level, target_x, target_y FROM rallies WHERE (id=" + rally_id + ");");
                                while (temp.next()) {
                                    int x = temp.getInt("target_x");
                                    int y = temp.getInt("target_y");
                                    Statement
                                            temp3 = servers[i].createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.
                                            CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
                                    int[] marches = {
                                            temp.getInt(1),
                                            temp.getInt(2),
                                            -1,
                                            -1,
                                            -1,
                                            -1
                                    };
                                    if (temp.getString(3) != null) marches[2] = temp.getInt(3);
                                    if (temp.getString(4) != null) marches[3] = temp.getInt(3);
                                    if (temp.getString(5) != null) marches[4] = temp.getInt(3);
                                    if (temp.getString(6) != null) marches[5] = temp.getInt(3);
                                    ResultSet rs3 = temp3.executeQuery("SELECT level FROM barbs WHERE (x=" + x + " AND y=" + y + ");");
                                    int barb_camp_lv = 0;
                                    while (rs3.next())
                                        barb_camp_lv = rs3.getInt(1);
                                    int lv_slain = 3 - (barb_camp_lv-temp.getInt("barb_level"));
                                    if (pve_barb(rally_id, i)) {
                                        temp3.executeUpdate("UPDATE barbs SET slain_" + lv_slain + "=1 WHERE (x=" + x + " AND y=" + y + ");");
                                        temp3.executeUpdate("UPDATE barbs SET disappear_eta=disappear_eta-10800 WHERE (x=" + x + " AND y=" + y + ");");
                                    }
                                    for (int j: marches) {
                                        if (j != -1) temp3.executeUpdate("UPDATE marches SET eta=eta+marchtime, status='returning' WHERE (march_id=" + j + ");");
                                    }
                                }
                            } else if (Objects.equals(rs.getString("marchtype"), "kvk")) {
                                int x = rs.getInt("target_x");
                                int y = rs.getInt("target_y");
                                String target;
                                if (x == 750 && y == 750) target = "throne";
                                else if (x == 750 && y == 700) target = "towerN";
                                else if (x == 750 && y == 800) target = "towerS";
                                else if (x == 700 && y == 750) target = "towerW";
                                else target = "towerE";
                                ResultSet temp = tempS.executeQuery("SELECT alliance FROM players WHERE (id=" + rs.getInt("player"));
                                String joiner_alliance = "---";
                                while (temp.next())
                                    joiner_alliance = temp.getString(1);
                                if (Objects.equals(joiner_alliance, "---")) {
                                    tempS.executeUpdate("UPDATE marches SET status='returning', eta=eta+marchtime WHERE (march_id=" + rs.getInt("march_id") + ");");
                                } else {
                                    temp = tempS.executeQuery("SELECT * FROM kvktowers;");
                                    temp.next();
                                    if (temp.getString(target + "_lead_m") == null) {
                                        Statement
                                                temp3 = servers[i].createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.
                                                CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
                                        temp3.executeUpdate("UPDATE kvktowers SET " + target + "_lead_m=" + rs.getInt("march_id") + ";");
                                        temp3.executeUpdate("UPDATE marches SET status='standby' WHERE (march_id=" + rs.getInt("march_id") + ");");
                                    } else {
                                        Statement
                                                temp3 = servers[i].createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.
                                                CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
                                        int m_id_leader = 0;
                                        ResultSet
                                                rs3 = temp3.executeQuery("SELECT " + target + "_lead_m FROM kvktowers;");
                                        while (rs3.next())
                                            m_id_leader = rs3.getInt(1);
                                        rs3 = temp3.executeQuery("SELECT player FROM marches WHERE (march_id=" + m_id_leader + ");");
                                        int id_leader = 0;
                                        while (rs3.next())
                                            id_leader = rs3.getInt(1);
                                        rs3 = temp3.executeQuery("SELECT alliance FROM players WHERE (id=" + id_leader + ");");
                                        String alliance_lead = "---";
                                        while (rs3.next())
                                            alliance_lead = rs3.getString(1);
                                        if (!Objects.equals(alliance_lead, joiner_alliance)) {
                                            tempS.executeUpdate("UPDATE marches SET status='returning', eta=eta+marchtime WHERE (march_id=" + rs.getInt("march_id") + ");");
                                        } else {
                                            rs3 = temp3.executeQuery("SELECT " + target + "_j1_m, " + target + "_j2_m, " + target + "_j3_m, " + target + "_j4_m, " + target + "_j5_m FROM kvktowers;");
                                            rs3.next();
                                            boolean marchEstablished = false;
                                            for (int j = 1; j <= 5; j++) {
                                                String
                                                        col = target + "_j" + j + "_m";
                                                if (rs3.getString(j) == null) {
                                                    marchEstablished = true;
                                                    temp3.executeUpdate("UPDATE kvktowers SET " + col + "=" + rs.getInt("march_id") + ";");
                                                    break;
                                                }
                                            }
                                            if (marchEstablished) {
                                                temp3.executeUpdate("UPDATE marches SET status='standby' WHERE (march_id=" + rs.getInt("march_id") + ");");
                                            } else {
                                                temp3.executeUpdate("UPDATE marches SET status='returning', eta=eta=marchtime WHERE (march_id=" + rs.getInt("march_id") + ");");
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                rs = mainStatement.executeQuery("SELECT * FROM buildings WHERE (building_eta<" + currentTime() + ");");
                while (rs.next()) {
                    Statement
                            tempS = mainServ.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
                    String building = rs.getString("building_under_upgrade");
                    int id = rs.getInt("id");
                    tempS.executeUpdate("UPDATE buildings SET lv_" + building + "=lv_" + building + "+1, building_under_upgrade=NULL, building_eta=NULL WHERE (id=" + id + ");");
                }
                rs = mainStatement.executeQuery("SELECT * FROM hosp WHERE (started=1 AND eta<" + currentTime() + ");");
                while (rs.next()) {
                    int[] healing_inf = {
                            rs.getInt("t1ih"),
                            rs.getInt("t2ih"),
                            rs.getInt("t3ih"),
                            rs.getInt("t4ih"),
                            rs.getInt("t5ih")
                    };
                    int[] healing_cav = {
                            rs.getInt("t1ch"),
                            rs.getInt("t2ch"),
                            rs.getInt("t3ch"),
                            rs.getInt("t4ch"),
                            rs.getInt("t5ch")
                    };
                    int[] healing_bow = {
                            rs.getInt("t1bh"),
                            rs.getInt("t2bh"),
                            rs.getInt("t3bh"),
                            rs.getInt("t4bh"),
                            rs.getInt("t5bh")
                    };
                    int id = rs.getInt("id");
                    Statement
                            tempS = mainServ.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
                    tempS.executeUpdate("UPDATE hosp SET started=0, eta=NULL, t1i=t1i-t1ih, t1c=t1c-t1ch, t1b=t1b-t1bh, t2i=t2i-t2ih, t2c=t2c-t2ch, t2b=t2b-t2bh, t3i=t3i-t3ih, t3c=t3c-t3ch, t3b=t3b-t3bh, t4i=t4i-t4ih, t4c=t4c-t4ch, t4b=t4b-t4bh, t5i=t5i-t5ih, t5c=t5c-t5ch, t5b=t5b-t5bh, t1ih=0, t1ch=0, t1bh=0, t2ih=0, t2ch=0, t2bh=0, t3ih=0, t3ch=0, t3bh=0, t4ih=0, t4ch=0, t4bh=0, t5ih=0, t5ch=0, t5bh=0 WHERE (id=" + id + ");");
                    tempS.executeUpdate("UPDATE troops SET t1inf=t1inf+" + healing_inf[0] + ", t1cav=t1cav+" + healing_cav[0] + ", t1bow=t1bow+" + healing_bow[0] + " WHERE (id=" + id + ");");
                    tempS.executeUpdate("UPDATE troops SET t2inf=t2inf+" + healing_inf[1] + ", t2cav=t2cav+" + healing_cav[1] + ", t2bow=t2bow+" + healing_bow[1] + " WHERE (id=" + id + ");");
                    tempS.executeUpdate("UPDATE troops SET t3inf=t3inf+" + healing_inf[2] + ", t3cav=t3cav+" + healing_cav[2] + ", t3bow=t3bow+" + healing_bow[2] + " WHERE (id=" + id + ");");
                    tempS.executeUpdate("UPDATE troops SET t4inf=t4inf+" + healing_inf[3] + ", t4cav=t4cav+" + healing_cav[3] + ", t4bow=t4bow+" + healing_bow[3] + " WHERE (id=" + id + ");");
                    tempS.executeUpdate("UPDATE troops SET t5inf=t5inf+" + healing_inf[4] + ", t5cav=t5cav+" + healing_cav[4] + ", t5bow=t5bow+" + healing_bow[4] + " WHERE (id=" + id + ");");
                }
            }
        } catch(SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                rs.close();
            } catch(Exception _) {}
            try {
                for (Connection server: servers) {
                    server.close();
                }
                mainServ.close();
            } catch(Exception _) {}
            try {
                for (Statement statement: statements) {
                    statement.close();
                }
                mainStatement.close();
            } catch(Exception _) {}
        }
    }
    public static long currentTime() {
        Date xxx = new Date();
        return xxx.getTime() / 1000;
    }
    public static boolean pve_monster(int march, int x, int y, int
            num_of_server) throws SQLException {
        Statement
                stmt_srv = servers[num_of_server].createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
        Statement
                stmt_main = mainServ.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
        ResultSet temp = stmt_srv.executeQuery("SELECT level FROM monsters WHERE (x=" + x + " AND y=" + y + ");");
        int level = 0;
        while (temp.next()) level = temp.getInt(1);
        temp = stmt_srv.executeQuery("SELECT * FROM marches WHERE (march_id=" + march + ");");
        int player = -1;
        int[] infantry = {
                0,
                0,
                0,
                0,
                0
        };
        int[] cavalry = {
                0,
                0,
                0,
                0,
                0
        };
        int[] bowmen = {
                0,
                0,
                0,
                0,
                0
        };
        boolean dragon = false;
        int hero1 = 0;
        int hero2 = 0;
        while (temp.next()) {
            player = temp.getInt("player");
            for (int i = 1; i <= 5; i++) {
                infantry[i - 1] = temp.getInt("t" + i + "i");
                cavalry[i - 1] = temp.getInt("t" + i + "c");
                bowmen[i - 1] = temp.getInt("t" + i + "b");
            }
            if (temp.getInt("dragon") == 1) dragon = true;
            if (temp.getString("hero1") != null) hero1 = temp.getInt("hero1");
            if (temp.getString("hero2") != null) hero2 = temp.getInt("hero2");
        }
        int attack_boost = 0;
        int defense_boost = 0;
        int health_boost = 0;
        int inf_att = 0;
        int inf_def = 0;
        int inf_hel = 0;
        int cav_att = 0;
        int cav_def = 0;
        int cav_hel = 0;
        int bow_att = 0;
        int bow_def = 0;
        int bow_hel = 0;
        temp = stmt_main.executeQuery("SELECT * FROM equipment WHERE (used=1 AND id=" + player + ");");
        while (temp.next()) {
            switch (temp.getString("geartype")) {
                case "helmet":
                {

                    defense_boost += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                    inf_def += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                    cav_def += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                    bow_def += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");
                    break;
                }
                case "armor":
                {

                    defense_boost += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                    inf_def += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                    cav_def += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                    bow_def += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");
                    break;
                }
                case "sword":
                {

                    attack_boost += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                    inf_att += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                    cav_att += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                    bow_att += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");
                    break;
                }
                case "boots":
                {

                    attack_boost += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                    inf_att += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                    cav_att += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                    bow_att += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");
                    break;
                }
                default:
                {

                    health_boost += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                    inf_hel += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                    cav_hel += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                    bow_hel += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");
                    break;
                }
            }
        }
        if (dragon) {
            temp = stmt_main.executeQuery("SELECT * FROM dragon WHERE (id=" + player + ");");
            while (temp.next()) {
                attack_boost += 2 * temp.getInt("skill2") + 5 * temp.getInt("lvl");
                if (Arrays.stream(infantry).sum() > 0) inf_att += 2 * temp.getInt("skill3");
                if (Arrays.stream(cavalry).sum() > 0) cav_att += 2 * temp.getInt("skill4");
                if (Arrays.stream(bowmen).sum() > 0) bow_att += 2 * temp.getInt("skill5");
                defense_boost += 2 * temp.getInt("skill2") + 5 * temp.getInt("lvl");
                if (Arrays.stream(infantry).sum() > 0) inf_def += 2 * temp.getInt("skill3");
                if (Arrays.stream(cavalry).sum() > 0) cav_def += 2 * temp.getInt("skill4");
                if (Arrays.stream(bowmen).sum() > 0) bow_def += 2 * temp.getInt("skill5");
                health_boost += 2 * temp.getInt("skill2") + 5 * temp.getInt("lvl");
                if (Arrays.stream(infantry).sum() > 0) inf_hel += 2 * temp.getInt("skill3");
                if (Arrays.stream(cavalry).sum() > 0) cav_hel += 2 * temp.getInt("skill4");
                if (Arrays.stream(bowmen).sum() > 0) bow_hel += 2 * temp.getInt("skill5");
            }
        }
        if (hero1 != 0) {
            if (hero1 == 1) {
                temp = stmt_main.executeQuery("SELECT hero1_skill1, hero1_skill2, hero1_skill3, hero1 FROM heroes WHERE (id=" + player + ");");
                while (temp.next()) {
                    attack_boost += temp.getInt(1) * 5 + 10 * temp.getInt(4);
                    defense_boost += temp.getInt(2) * 5 + 10 * temp.getInt(4);
                    health_boost += temp.getInt(3) * 5 + 10 * temp.getInt(4);
                }
            } else if (hero1 == 2 && Arrays.stream(infantry).sum() > 0) {
                temp = stmt_main.executeQuery("SELECT hero2_skill1, hero2_skill2, hero2_skill3, hero2 FROM heroes WHERE (id=" + player + ");");
                while (temp.next()) {
                    inf_att += temp.getInt(1) * 5 + 10 * temp.getInt(4);
                    inf_def += temp.getInt(2) * 5 + 10 * temp.getInt(4);
                    inf_hel += temp.getInt(3) * 5 + 10 * temp.getInt(4);
                }
            } else if (hero1 == 3 && Arrays.stream(cavalry).sum() > 0) {
                temp = stmt_main.executeQuery("SELECT hero3_skill1, hero3_skill2, hero3_skill3, hero3 FROM heroes WHERE (id=" + player + ");");
                while (temp.next()) {
                    cav_att += temp.getInt(1) * 5 + 10 * temp.getInt(4);
                    cav_def += temp.getInt(2) * 5 + 10 * temp.getInt(4);
                    cav_hel += temp.getInt(3) * 5 + 10 * temp.getInt(4);
                }
            } else if (hero1 == 4 && Arrays.stream(bowmen).sum() > 0) {
                temp = stmt_main.executeQuery("SELECT hero4_skill1, hero4_skill2, hero4_skill3, hero4 FROM heroes WHERE (id=" + player + ");");
                while (temp.next()) {
                    bow_att += temp.getInt(1) * 5 + 10 * temp.getInt(4);
                    bow_def += temp.getInt(2) * 5 + 10 * temp.getInt(4);
                    bow_hel += temp.getInt(3) * 5 + 10 * temp.getInt(4);
                }
            }
        }
        if (hero2 != 0) {
            if (hero2 == 1) {
                temp = stmt_main.executeQuery("SELECT hero1_skill1, hero1_skill2, hero1_skill3, hero1 FROM heroes WHERE (id=" + player + ");");
                while (temp.next()) {
                    attack_boost += temp.getInt(1) * 5 + 10 * temp.getInt(4);
                    defense_boost += temp.getInt(2) * 5 + 10 * temp.getInt(4);
                    health_boost += temp.getInt(3) * 5 + 10 * temp.getInt(4);
                }
            } else if (hero2 == 2 && Arrays.stream(infantry).sum() > 0) {
                temp = stmt_main.executeQuery("SELECT hero2_skill1, hero2_skill2, hero2_skill3, hero2 FROM heroes WHERE (id=" + player + ");");
                while (temp.next()) {
                    inf_att += temp.getInt(1) * 5 + 10 * temp.getInt(4);
                    inf_def += temp.getInt(2) * 5 + 10 * temp.getInt(4);
                    inf_hel += temp.getInt(3) * 5 + 10 * temp.getInt(4);
                }
            } else if (hero2 == 3 && Arrays.stream(cavalry).sum() > 0) {
                temp = stmt_main.executeQuery("SELECT hero3_skill1, hero3_skill2, hero3_skill3, hero3 FROM heroes WHERE (id=" + player + ");");
                while (temp.next()) {
                    cav_att += temp.getInt(1) * 5 + 10 * temp.getInt(4);
                    cav_def += temp.getInt(2) * 5 + 10 * temp.getInt(4);
                    cav_hel += temp.getInt(3) * 5 + 10 * temp.getInt(4);
                }
            } else if (hero2 == 4 && Arrays.stream(bowmen).sum() > 0) {
                temp = stmt_main.executeQuery("SELECT hero4_skill1, hero4_skill2, hero4_skill3, hero4 FROM heroes WHERE (id=" + player + ");");
                while (temp.next()) {
                    bow_att += temp.getInt(1) * 5 + 10 * temp.getInt(4);
                    bow_def += temp.getInt(2) * 5 + 10 * temp.getInt(4);
                    bow_hel += temp.getInt(3) * 5 + 10 * temp.getInt(4);
                }
            }
        }
        String alliance = "---";
        temp = stmt_srv.executeQuery("SELECT alliance FROM players WHERE (id=" + player + ");");
        while (temp.next()) alliance = temp.getString(1);
        temp = stmt_srv.executeQuery("SELECT * FROM spells WHERE (alliance_id=" + alliance + ");");
        while (temp.next()) {
            int type = temp.getInt("type");
            if (type == 1) {
                attack_boost += 50;
                defense_boost += 50;
                health_boost += 50;
            } else if (type == 2) {
                attack_boost -= 25;
                defense_boost -= 25;
                health_boost -= 25;
            }
        }
        double attack_monster = level * level * level;
        double health_monster = level * level * level;
        int[] wounded_inf = {
                0,
                0,
                0,
                0,
                0
        };
        int[] wounded_cav = {
                0,
                0,
                0,
                0,
                0
        };
        int[] wounded_bow = {
                0,
                0,
                0,
                0,
                0
        };

        while (attack_monster > 0 && Arrays.stream(infantry).sum() + Arrays.stream(cavalry).
                sum() + Arrays.stream(bowmen).sum() > 0) {
            for (int i = 0; i < 5; i++) {
                if (infantry[i] == 0) continue;
                double
                        max_health = (health_boost + inf_hel) / 100.0 * 12 * infantry[i] * (i + 1);
                double
                        max_defense = (defense_boost + inf_def) / 100.0 * 50 * infantry[i] * (i + 1);
                if (attack_monster > max_health + max_defense) {
                    wounded_inf[i] += infantry[i];
                    infantry[i] = 0;
                    attack_monster -= max_health + max_defense;
                } else {
                    double wounded_unit = (max_health + max_defense) / infantry[i];
                    int num_of_wounded = (int)(attack_monster / wounded_unit);
                    attack_monster = 0.0;
                    wounded_inf[i] += num_of_wounded;
                    infantry[i] -= num_of_wounded;
                }
            }
            for (int i = 0; i < 5; i++) {
                if (cavalry[i] == 0) continue;
                double
                        max_health = (health_boost + cav_hel) / 100.0 * 30 * cavalry[i] * (i + 1);
                double
                        max_defense = (defense_boost + cav_def) / 100.0 * 10 * cavalry[i] * (i + 1);
                if (attack_monster > max_health + max_defense) {
                    wounded_cav[i] += cavalry[i];
                    cavalry[i] = 0;
                    attack_monster -= max_health + max_defense;
                } else {
                    double wounded_unit = (max_health + max_defense) / cavalry[i];
                    int num_of_wounded = (int)(attack_monster / wounded_unit);
                    attack_monster = 0.0;
                    wounded_cav[i] += num_of_wounded;
                    cavalry[i] -= num_of_wounded;
                }
            }
            for (int i = 0; i < 5; i++) {
                if (bowmen[i] == 0) continue;
                double
                        max_health = (health_boost + bow_hel) / 100.0 * 50 * bowmen[i] * (i + 1);
                double
                        max_defense = (defense_boost + bow_def) / 100.0 * 15 * bowmen[i] * (i + 1);
                if (attack_monster > max_health + max_defense) {
                    wounded_bow[i] += bowmen[i];
                    bowmen[i] = 0;
                    attack_monster -= max_health + max_defense;
                } else {
                    double wounded_unit = (max_health + max_defense) / bowmen[i];
                    int num_of_wounded = (int)(attack_monster / wounded_unit);
                    attack_monster = 0.0;
                    wounded_bow[i] += num_of_wounded;
                    bowmen[i] -= num_of_wounded;
                }
            }
        }
        double overall_attack = 0.0;
        for (int i = 0; i < 5; i++) {

            overall_attack += (attack_boost + inf_att) / 100.0 * 10 * infantry[i] * (i + 1);
            overall_attack += (attack_boost + cav_att) / 100.0 * 30 * cavalry[i] * (i + 1);
            overall_attack += (attack_boost + bow_att) / 100.0 * 45 * bowmen[i] * (i + 1);
        }
        boolean won = false;
        if (health_monster <= overall_attack) {
            won = true;
            stmt_main.executeUpdate("INSERT INTO mail(id,sender,content,time) VALUES (" + player + ", -1, 'Victory! You have successfully defeated level " + level + " monster at " + x + ":" + y + " with " + (Arrays.stream(wounded_inf).sum() + Arrays.stream(wounded_cav).sum() + Arrays.stream(wounded_bow).sum()) + " troops wounded.', " + currentTime() + ");");
            rewards_monster(player, level);
            for (int i = 1; i <= 5; i++) {
                String inf = "t" + i + "i";
                String cav = "t" + i + "c";
                String bow = "t" + i + "b";
                stmt_main.executeUpdate("UPDATE hosp SET " + inf + "=" + inf + "+" + wounded_inf[i - 1] + " WHERE (id=" + player + ");");
                stmt_main.executeUpdate("UPDATE hosp SET " + cav + "=" + cav + "+" + wounded_cav[i - 1] + " WHERE (id=" + player + ");");
                stmt_main.executeUpdate("UPDATE hosp SET " + bow + "=" + bow + "+" + wounded_bow[i - 1] + " WHERE (id=" + player + ");");
                stmt_srv.executeUpdate("UPDATE marches SET " + inf + "=" + infantry[i - 1] + ", " + cav + "=" + cavalry[i - 1] + ", " + bow + "=" + bowmen[i - 1] + " WHERE (march_id=" + march + ");");
            }
        } else {
            stmt_main.executeUpdate("INSERT INTO mail(id,sender,content,time) VALUES (" + player + ", -1, 'Defeat! The level " + level + " monster at " + x + ":" + y + " proved too strong for your troops. You have just got " + (Arrays.stream(wounded_inf).sum() + Arrays.stream(wounded_cav).sum() + Arrays.stream(wounded_bow).sum()) + " troops wounded.', " + currentTime() + ");");
            for (int i = 1; i <= 5; i++) {
                String inf = "t" + i + "i";
                String cav = "t" + i + "c";
                String bow = "t" + i + "b";
                stmt_main.executeUpdate("UPDATE hosp SET " + inf + "=" + inf + "+" + wounded_inf[i - 1] + " WHERE (id=" + player + ");");
                stmt_main.executeUpdate("UPDATE hosp SET " + cav + "=" + cav + "+" + wounded_cav[i - 1] + " WHERE (id=" + player + ");");
                stmt_main.executeUpdate("UPDATE hosp SET " + bow + "=" + bow + "+" + wounded_bow[i - 1] + " WHERE (id=" + player + ");");
                stmt_srv.executeUpdate("UPDATE marches SET " + inf + "=" + infantry[i - 1] + ", " + cav + "=" + cavalry[i - 1] + ", " + bow + "=" + bowmen[i - 1] + " WHERE (march_id=" + march + ");");
            }
        }
        return won;
    }
    public static boolean pve_barb(int rally, int num_of_server) throws
            SQLException {
        Statement
                stmt_srv = servers[num_of_server].createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
        Statement
                stmt_main = mainServ.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
        String[] order = {
                "joiner5",
                "joiner4",
                "joiner3",
                "joiner2",
                "joiner1",
                "starter"
        };
        boolean won = false;
        ResultSet temp = stmt_srv.executeQuery("SELECT barb_level FROM rallies WHERE (id=" + rally + ");");
        int level = 0;
        while (temp.next()) level = temp.getInt(1);
        double attack_monster = 5 * level * level * level;
        double health_monster = 5 * level * level * level;
        for (String participant: order) {
            temp = stmt_srv.executeQuery("SELECT " + participant + "_march FROM rallies WHERE (id=" + rally + ");");
            int march = 0;
            while (temp.next()) if (temp.getString(1) != null) march = temp.getInt(1);
            if (march == 0) continue;
            temp = stmt_srv.executeQuery("SELECT * FROM marches WHERE (march_id=" + march + ");");
            int player = -1;
            int[] infantry = {
                    0,
                    0,
                    0,
                    0,
                    0
            };
            int[] cavalry = {
                    0,
                    0,
                    0,
                    0,
                    0
            };
            int[] bowmen = {
                    0,
                    0,
                    0,
                    0,
                    0
            };
            boolean dragon = false;
            int hero1 = 0;
            int hero2 = 0;
            while (temp.next()) {
                player = temp.getInt("player");
                for (int i = 1; i <= 5; i++) {
                    infantry[i - 1] = temp.getInt("t" + i + "i");
                    cavalry[i - 1] = temp.getInt("t" + i + "c");
                    bowmen[i - 1] = temp.getInt("t" + i + "b");
                }
                if (temp.getInt("dragon") == 1) dragon = true;
                if (temp.getString("hero1") != null) hero1 = temp.getInt("hero1");
                if (temp.getString("hero2") != null) hero2 = temp.getInt("hero2");
            }
            int attack_boost = 0;
            int defense_boost = 0;
            int health_boost = 0;
            int inf_att = 0;
            int inf_def = 0;
            int inf_hel = 0;
            int cav_att = 0;
            int cav_def = 0;
            int cav_hel = 0;
            int bow_att = 0;
            int bow_def = 0;
            int bow_hel = 0;
            temp = stmt_main.executeQuery("SELECT * FROM equipment WHERE (used=1 AND id=" + player + ");");
            while (temp.next()) {
                switch (temp.getString("geartype")) {
                    case "helmet":
                    {

                        defense_boost += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                        inf_def += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                        cav_def += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                        bow_def += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");
                        break;
                    }
                    case "armor":
                    {

                        defense_boost += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                        inf_def += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                        cav_def += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                        bow_def += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");
                        break;
                    }
                    case "sword":
                    {

                        attack_boost += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                        inf_att += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                        cav_att += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                        bow_att += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");
                        break;
                    }
                    case "boots":
                    {

                        attack_boost += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                        inf_att += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                        cav_att += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                        bow_att += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");
                        break;
                    }
                    default:
                    {

                        health_boost += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                        inf_hel += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                        cav_hel += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");

                        bow_hel += 30 * temp.getInt("geargrade") + 5 * temp.getInt("gearlevel");
                        break;
                    }
                }
            }
            if (dragon) {
                temp = stmt_main.executeQuery("SELECT * FROM dragon WHERE (id=" + player + ");");
                while (temp.next()) {

                    attack_boost += 2 * temp.getInt("skill2") + 5 * temp.getInt("lvl");
                    if (Arrays.stream(infantry).sum() > 0) inf_att += 2 * temp.getInt("skill3");
                    if (Arrays.stream(cavalry).sum() > 0) cav_att += 2 * temp.getInt("skill4");
                    if (Arrays.stream(bowmen).sum() > 0) bow_att += 2 * temp.getInt("skill5");

                    defense_boost += 2 * temp.getInt("skill2") + 5 * temp.getInt("lvl");
                    if (Arrays.stream(infantry).sum() > 0) inf_def += 2 * temp.getInt("skill3");
                    if (Arrays.stream(cavalry).sum() > 0) cav_def += 2 * temp.getInt("skill4");
                    if (Arrays.stream(bowmen).sum() > 0) bow_def += 2 * temp.getInt("skill5");

                    health_boost += 2 * temp.getInt("skill2") + 5 * temp.getInt("lvl");
                    if (Arrays.stream(infantry).sum() > 0) inf_hel += 2 * temp.getInt("skill3");
                    if (Arrays.stream(cavalry).sum() > 0) cav_hel += 2 * temp.getInt("skill4");
                    if (Arrays.stream(bowmen).sum() > 0) bow_hel += 2 * temp.getInt("skill5");
                }
            }
            if (hero1 != 0) {
                if (hero1 == 1) {
                    temp = stmt_main.executeQuery("SELECT hero1_skill1, hero1_skill2, hero1_skill3, hero1 FROM heroes WHERE (id=" + player + ");");
                    while (temp.next()) {
                        attack_boost += temp.getInt(1) * 5 + 10 * temp.getInt(4);
                        defense_boost += temp.getInt(2) * 5 + 10 * temp.getInt(4);
                        health_boost += temp.getInt(3) * 5 + 10 * temp.getInt(4);
                    }
                } else if (hero1 == 2 && Arrays.stream(infantry).sum() > 0) {
                    temp = stmt_main.executeQuery("SELECT hero2_skill1, hero2_skill2, hero2_skill3, hero2 FROM heroes WHERE (id=" + player + ");");
                    while (temp.next()) {
                        inf_att += temp.getInt(1) * 5 + 10 * temp.getInt(4);
                        inf_def += temp.getInt(2) * 5 + 10 * temp.getInt(4);
                        inf_hel += temp.getInt(3) * 5 + 10 * temp.getInt(4);
                    }
                } else if (hero1 == 3 && Arrays.stream(cavalry).sum() > 0) {
                    temp = stmt_main.executeQuery("SELECT hero3_skill1, hero3_skill2, hero3_skill3, hero3 FROM heroes WHERE (id=" + player + ");");
                    while (temp.next()) {
                        cav_att += temp.getInt(1) * 5 + 10 * temp.getInt(4);
                        cav_def += temp.getInt(2) * 5 + 10 * temp.getInt(4);
                        cav_hel += temp.getInt(3) * 5 + 10 * temp.getInt(4);
                    }
                } else if (hero1 == 4 && Arrays.stream(bowmen).sum() > 0) {
                    temp = stmt_main.executeQuery("SELECT hero4_skill1, hero4_skill2, hero4_skill3, hero4 FROM heroes WHERE (id=" + player + ");");
                    while (temp.next()) {
                        bow_att += temp.getInt(1) * 5 + 10 * temp.getInt(4);
                        bow_def += temp.getInt(2) * 5 + 10 * temp.getInt(4);
                        bow_hel += temp.getInt(3) * 5 + 10 * temp.getInt(4);
                    }
                }
            }
            if (hero2 != 0) {
                if (hero2 == 1) {
                    temp = stmt_main.executeQuery("SELECT hero1_skill1, hero1_skill2, hero1_skill3, hero1 FROM heroes WHERE (id=" + player + ");");
                    while (temp.next()) {
                        attack_boost += temp.getInt(1) * 5 + 10 * temp.getInt(4);
                        defense_boost += temp.getInt(2) * 5 + 10 * temp.getInt(4);
                        health_boost += temp.getInt(3) * 5 + 10 * temp.getInt(4);
                    }
                } else if (hero2 == 2 && Arrays.stream(infantry).sum() > 0) {
                    temp = stmt_main.executeQuery("SELECT hero2_skill1, hero2_skill2, hero2_skill3, hero2 FROM heroes WHERE (id=" + player + ");");
                    while (temp.next()) {
                        inf_att += temp.getInt(1) * 5 + 10 * temp.getInt(4);
                        inf_def += temp.getInt(2) * 5 + 10 * temp.getInt(4);
                        inf_hel += temp.getInt(3) * 5 + 10 * temp.getInt(4);
                    }
                } else if (hero2 == 3 && Arrays.stream(cavalry).sum() > 0) {
                    temp = stmt_main.executeQuery("SELECT hero3_skill1, hero3_skill2, hero3_skill3, hero3 FROM heroes WHERE (id=" + player + ");");
                    while (temp.next()) {
                        cav_att += temp.getInt(1) * 5 + 10 * temp.getInt(4);
                        cav_def += temp.getInt(2) * 5 + 10 * temp.getInt(4);
                        cav_hel += temp.getInt(3) * 5 + 10 * temp.getInt(4);
                    }
                } else if (hero2 == 4 && Arrays.stream(bowmen).sum() > 0) {
                    temp = stmt_main.executeQuery("SELECT hero4_skill1, hero4_skill2, hero4_skill3, hero4 FROM heroes WHERE (id=" + player + ");");
                    while (temp.next()) {
                        bow_att += temp.getInt(1) * 5 + 10 * temp.getInt(4);
                        bow_def += temp.getInt(2) * 5 + 10 * temp.getInt(4);
                        bow_hel += temp.getInt(3) * 5 + 10 * temp.getInt(4);
                    }
                }
            }
            String alliance = "---";
            temp = stmt_srv.executeQuery("SELECT alliance FROM players WHERE (id=" + player + ");");
            while (temp.next()) alliance = temp.getString(1);
            temp = stmt_srv.executeQuery("SELECT * FROM spells WHERE (alliance_id=" + alliance + ");");
            while (temp.next()) {
                int type = temp.getInt("type");
                if (type == 1) {
                    attack_boost += 50;
                    defense_boost += 50;
                    health_boost += 50;
                } else if (type == 2) {
                    attack_boost -= 25;
                    defense_boost -= 25;
                    health_boost -= 25;
                }
            }
            int[] wounded_inf = {
                    0,
                    0,
                    0,
                    0,
                    0
            };
            int[] wounded_cav = {
                    0,
                    0,
                    0,
                    0,
                    0
            };
            int[] wounded_bow = {
                    0,
                    0,
                    0,
                    0,
                    0
            };

            while (attack_monster > 0 && Arrays.stream(infantry).sum() + Arrays.stream(cavalry).
                    sum() + Arrays.stream(bowmen).sum() > 0) {
                for (int i = 0; i < 5; i++) {
                    if (infantry[i] == 0) continue;
                    double
                            max_health = (health_boost + inf_hel) / 100.0 * 12 * infantry[i] * (i + 1);
                    double
                            max_defense = (defense_boost + inf_def) / 100.0 * 50 * infantry[i] * (i + 1);
                    if (attack_monster > max_health + max_defense) {
                        wounded_inf[i] += infantry[i];
                        infantry[i] = 0;
                        attack_monster -= max_health + max_defense;
                    } else {
                        double
                                wounded_unit = (max_health + max_defense) / infantry[i];
                        int num_of_wounded = (int)(attack_monster / wounded_unit);
                        attack_monster = 0.0;
                        wounded_inf[i] += num_of_wounded;
                        infantry[i] -= num_of_wounded;
                    }
                }
                for (int i = 0; i < 5; i++) {
                    if (cavalry[i] == 0) continue;
                    double
                            max_health = (health_boost + cav_hel) / 100.0 * 30 * cavalry[i] * (i + 1);
                    double
                            max_defense = (defense_boost + cav_def) / 100.0 * 10 * cavalry[i] * (i + 1);
                    if (attack_monster > max_health + max_defense) {
                        wounded_cav[i] += cavalry[i];
                        cavalry[i] = 0;
                        attack_monster -= max_health + max_defense;
                    } else {
                        double
                                wounded_unit = (max_health + max_defense) / cavalry[i];
                        int num_of_wounded = (int)(attack_monster / wounded_unit);
                        attack_monster = 0.0;
                        wounded_cav[i] += num_of_wounded;
                        cavalry[i] -= num_of_wounded;
                    }
                }
                for (int i = 0; i < 5; i++) {
                    if (bowmen[i] == 0) continue;
                    double
                            max_health = (health_boost + bow_hel) / 100.0 * 50 * bowmen[i] * (i + 1);
                    double
                            max_defense = (defense_boost + bow_def) / 100.0 * 15 * bowmen[i] * (i + 1);
                    if (attack_monster > max_health + max_defense) {
                        wounded_bow[i] += bowmen[i];
                        bowmen[i] = 0;
                        attack_monster -= max_health + max_defense;
                    } else {
                        double
                                wounded_unit = (max_health + max_defense) / bowmen[i];
                        int num_of_wounded = (int)(attack_monster / wounded_unit);
                        attack_monster = 0.0;
                        wounded_bow[i] += num_of_wounded;
                        bowmen[i] -= num_of_wounded;
                    }
                }
            }
            double overall_attack = 0.0;
            for (int i = 0; i < 5; i++) {

                overall_attack += (attack_boost + inf_att) / 100.0 * 10 * infantry[i] * (i + 1);

                overall_attack += (attack_boost + cav_att) / 100.0 * 30 * cavalry[i] * (i + 1);

                overall_attack += (attack_boost + bow_att) / 100.0 * 45 * bowmen[i] * (i + 1);
            }
            for (int i = 1; i <= 5; i++) {
                String inf = "t" + i + "i";
                String cav = "t" + i + "c";
                String bow = "t" + i + "b";
                stmt_main.executeUpdate("UPDATE hosp SET " + inf + "=" + inf + "+" + wounded_inf[i - 1] + " WHERE (id=" + player + ");");
                stmt_main.executeUpdate("UPDATE hosp SET " + cav + "=" + cav + "+" + wounded_cav[i - 1] + " WHERE (id=" + player + ");");
                stmt_main.executeUpdate("UPDATE hosp SET " + bow + "=" + bow + "+" + wounded_bow[i - 1] + " WHERE (id=" + player + ");");
                stmt_srv.executeUpdate("UPDATE marches SET " + inf + "=" + infantry[i - 1] + ", " + cav + "=" + cavalry[i - 1] + ", " + bow + "=" + bowmen[i - 1] + " WHERE (march_id=" + march + ");");
            }
            health_monster -= overall_attack;
            if (health_monster < 0.0) {
                won = true;
                break;
            }
        }
        for (String participant: order) {
            temp = stmt_srv.executeQuery("SELECT target_x, target_y, " + participant + "_march FROM rallies WHERE (id=" + rally + ");");
            int march = 0;
            int x = 0;
            int y = 0;
            while (temp.next()) {
                if (temp.getString(3) != null) march = temp.getInt(3);
                x = temp.getInt(1);
                y = temp.getInt(2);
            }
            if (march == 0) continue;
            temp = stmt_srv.executeQuery("SELECT * FROM marches WHERE (march_id=" + march + ");");
            int player = -1;
            while (temp.next()) player = temp.getInt("player");
            if (!won) {
                stmt_main.executeUpdate("INSERT INTO mail(id,sender,content,time) VALUES (" + player + ", -1, 'Defeat! The level " + level + " barbarian at " + x + ":" + y + " proved too strong for your rally.', " + currentTime() + ");");
            } else {
                stmt_main.executeUpdate("INSERT INTO mail(id,sender,content,time) VALUES (" + player + ", -1, 'Victory! You have successfully defeated the level " + level + " barbarian at " + x + ":" + y + ".', " + currentTime() + ");");
                rewards_barb(player, level);
            }
        }
        return won;
    }
    public static void rewards_tile(int playerID, int gatheredAmount) throws
            SQLException {
        int hero_500_exp = gatheredAmount / 1000;
        int hero_skill_100_exp = gatheredAmount / 5000;
        int hero_num = (int)(Math.random() * 3.4 + 1);
        int num_of_fragments = gatheredAmount / 30000;
        Statement
                stmt_main = mainServ.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
        ResultSet rz = stmt_main.executeQuery("SELECT Count(*) FROM inventory WHERE (id=" + playerID + " AND itemtype='hero_500_exp');");
        rz.next();
        int used = rz.getInt(1);
        if (used == 0) {
            stmt_main.executeUpdate("INSERT INTO inventory(id,itemtype,itemcount) VALUES (" + playerID + ", 'hero_500_exp', " + hero_500_exp + ");");
        } else {
            stmt_main.executeUpdate("UPDATE inventory SET itemcount=itemcount+" + hero_500_exp + " WHERE (id=" + playerID + " AND itemtype='hero_500_exp');");
        }
        rz = stmt_main.executeQuery("SELECT Count(*) FROM inventory WHERE (id=" + playerID + " AND itemtype='hero_skill_100_exp');");
        rz.next();
        used = rz.getInt(1);
        if (used == 0) {
            stmt_main.executeUpdate("INSERT INTO inventory(id,itemtype,itemcount) VALUES (" + playerID + ", 'hero_skill_100_exp', " + hero_skill_100_exp + ");");
        } else {
            stmt_main.executeUpdate("UPDATE inventory SET itemcount=itemcount+" + hero_skill_100_exp + " WHERE (id=" + playerID + " AND itemtype='hero_skill_100_exp');");
        }
        String fragmentName = "hero" + hero_num + "_fragment";
        rz = stmt_main.executeQuery("SELECT Count(*) FROM inventory WHERE (id=" + playerID + " AND itemtype='" + fragmentName + "');");
        rz.next();
        used = rz.getInt(1);
        if (used == 0) {
            stmt_main.executeUpdate("INSERT INTO inventory(id,itemtype,itemcount) VALUES (" + playerID + ", '" + fragmentName + "', " + num_of_fragments + ");");
        } else {
            stmt_main.executeUpdate("UPDATE inventory SET itemcount=itemcount+" + num_of_fragments + " WHERE (id=" + playerID + " AND itemtype='" + fragmentName + "');");
        }
        stmt_main.executeUpdate("INSERT INTO mail(id,sender,content,time) VALUES (" + playerID + ", -1, 'For gathering resources you have been awarded: 500 Hero exp x" + hero_500_exp + ", 100 Hero skill exp x" + hero_skill_100_exp + ", Hero#" + hero_num + " Fragments x" + num_of_fragments + ".', " + currentTime() + ");");
    }
    public static void rewards_barb(int playerID, int level) throws
            SQLException {
        int forging_steel_2000 = level * 100;
        int equipment_grade = (level - 1) / 5 + 1;
        if (equipment_grade == 5) equipment_grade = 4;
        int equipment_frags = (int)(Math.random() * 5);
        Statement
                stmt_main = mainServ.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
        ResultSet rz = stmt_main.executeQuery("SELECT Count(*) FROM inventory WHERE (id=" + playerID + " AND itemtype='forging_steel_2000');");
        rz.next();
        int used = rz.getInt(1);
        if (used == 0) {
            stmt_main.executeUpdate("INSERT INTO inventory(id,itemtype,itemcount) VALUES (" + playerID + ", 'forging_steel_2000', " + forging_steel_2000 + ");");
        } else {
            stmt_main.executeUpdate("UPDATE inventory SET itemcount=itemcount+" + forging_steel_2000 + " WHERE (id=" + playerID + " AND itemtype='forging_steel_2000');");
        }
        String name = "grade" + equipment_grade + "_frags";
        rz = stmt_main.executeQuery("SELECT Count(*) FROM inventory WHERE (id=" + playerID + " AND itemtype='" + name + "');");
        rz.next();
        used = rz.getInt(1);
        if (used == 0) {
            stmt_main.executeUpdate("INSERT INTO inventory(id,itemtype,itemcount) VALUES (" + playerID + ", '" + name + "', " + equipment_frags + ");");
        } else {
            stmt_main.executeUpdate("UPDATE inventory SET itemcount=itemcount+" + equipment_frags + " WHERE (id=" + playerID + " AND itemtype='" + name + "');");
        }
        stmt_main.executeUpdate("INSERT INTO mail(id,sender,content,time) VALUES (" + playerID + ", -1, 'For slaying a barbarian you have been awarded: 2000 Forging steel x" + forging_steel_2000 + ", Grade " + equipment_grade + " equipment fragments x" + equipment_frags + ".', " + currentTime() + ");");
    }
    public static void rewards_monster(int playerID, int level) throws
            SQLException {
        int dragon_exp_1000 = level * 100;
        int dragon_skill = (level - 1) / 5 + 1;
        if (dragon_skill == 5) dragon_skill = 4;
        int skill_frags = (int)(Math.random() * 5);
        Statement
                stmt_main = mainServ.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
        ResultSet rz = stmt_main.executeQuery("SELECT Count(*) FROM inventory WHERE (id=" + playerID + " AND itemtype='dragon_exp_1000');");
        rz.next();
        int used = rz.getInt(1);
        if (used == 0) {
            stmt_main.executeUpdate("INSERT INTO inventory(id,itemtype,itemcount) VALUES (" + playerID + ", 'dragon_exp_1000', " + dragon_exp_1000 + ");");
        } else {
            stmt_main.executeUpdate("UPDATE inventory SET itemcount=itemcount+" + dragon_exp_1000 + " WHERE (id=" + playerID + " AND itemtype='dragon_exp_1000');");
        }
        String name = "skill" + dragon_skill + "_frags";
        rz = stmt_main.executeQuery("SELECT Count(*) FROM inventory WHERE (id=" + playerID + " AND itemtype='" + name + "');");
        rz.next();
        used = rz.getInt(1);
        if (used == 0) {
            stmt_main.executeUpdate("INSERT INTO inventory(id,itemtype,itemcount) VALUES (" + playerID + ", '" + name + "', " + skill_frags + ");");
        } else {
            stmt_main.executeUpdate("UPDATE inventory SET itemcount=itemcount+" + skill_frags + " WHERE (id=" + playerID + " AND itemtype='" + name + "');");
        }
        stmt_main.executeUpdate("INSERT INTO mail(id,sender,content,time) VALUES (" + playerID + ", -1, 'For slaying a monster you have been awarded: 1000 Dragon XP x" + dragon_exp_1000 + ", Skill #" + dragon_skill + " fragments x" + skill_frags + ".', " + currentTime() + ");");
    }
}