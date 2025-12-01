package com.darwin.warriorpath;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.sql.*;
import java.net.*;
import java.nio.CharBuffer;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.Date;
import java.util.Objects;
import jakarta.xml.bind.DatatypeConverter;

public class Client {
    JFrame login;
    JTextField mail;
    JPasswordField pass;
    JFrame reg;
    JTextField new_mail;
    JPasswordField new_pass;
    JPasswordField password_confirmation;
    private static final String url="jdbc:mysql://localhost:3306/";
    private static final String UnP="root";
    private static final String mainDB="_cities";
    private static Connection serv_conn;
    private static Connection mainServ;
    private static Statement mainStatement;
    private static Statement stmt_srv;
    private static ResultSet rs;
    static JLabel captcha;
    static String captcha_answer;
    static JTextField captcha_field;
    private static int player_id;
    private int server_id;
    private JLabel avatar;
    private String nickname;
    private boolean premium;
    static JFrame mainFrame;
    JFrame f_forgot=new JFrame("Сброс пароля");
    JTextField f_email=new JTextField(20);
    JPanel forgotP=new JPanel();
    JButton recover=new JButton("Проверить");
    JPanel reg_panel=new JPanel();
    public static void main(String[] args) {
        new Client().go();
    }
    public void go(){
        try {
            mainServ=DriverManager.getConnection(url+mainDB,UnP,UnP);
            mainStatement=mainServ.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE,ResultSet.HOLD_CURSORS_OVER_COMMIT);
        } catch(Exception ex){
            ex.printStackTrace();
            System.exit(1);
        }
        login=new JFrame("Путь витязя ALPHA");
        login.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        JPanel bbb=new JPanel();
        JLabel aaa=new JLabel("Введите учётные данные для входа:");
        bbb.add(aaa);
        login.add(bbb,BorderLayout.NORTH);
        JPanel mailPass=new JPanel();
        mail=new JTextField(20);
        pass=new JPasswordField(20);
        mail.setMaximumSize(new Dimension(150,20));
        pass.setMaximumSize(new Dimension(150,20));
        mailPass.add(mail);
        mailPass.add(pass);
        mailPass.setLayout(new BoxLayout(mailPass, BoxLayout.Y_AXIS));
        login.add(mailPass,BorderLayout.CENTER);
        JButton enter=new JButton("Вход");
        enter.addActionListener(new LoginL());
        JButton forgot=new JButton("Забыл пароль");
        forgot.addActionListener(new ForgotL());
        JButton regis=new JButton("Регистрация");
        regis.addActionListener(new RegistrationL());
        JPanel buttons=new JPanel();
        buttons.add(enter);
        buttons.add(forgot);
        buttons.add(regis);
        login.add(buttons,BorderLayout.SOUTH);
        login.setSize(350,150);
        login.setResizable(false);
        login.setVisible(true);
        reg=new JFrame("Регистрация");
        reg.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        new_mail=new JTextField(20);
        new_pass=new JPasswordField(20);
        password_confirmation=new JPasswordField(20);
        captcha_field=new JTextField(20);
        new_mail.setMaximumSize(new Dimension(150,20));
        new_pass.setMaximumSize(new Dimension(150,20));
        password_confirmation.setMaximumSize(new Dimension(150,20));
        captcha_field.setMaximumSize(new Dimension(150,20));
        reg_panel.add(new JLabel("Адрес почты:"));
        reg_panel.add(new_mail);
        reg_panel.add(new JLabel("Пароль:"));
        reg_panel.add(new_pass);
        reg_panel.add(new JLabel("Подтверждение пароля:"));
        reg_panel.add(password_confirmation);
        reg_panel.add(new JLabel("Код с картинки:"));
        try{
            int captcha_count=0;
            rs=mainStatement.executeQuery("SELECT Count(*) FROM captchas;");
            rs.next();
            captcha_count=rs.getInt(1);
            int choose=(int)(Math.random()*captcha_count)+1;
            String url="";
            rs=mainStatement.executeQuery("SELECT picture,rightanswer FROM captchas WHERE (id="+choose+");");
            rs.next();
            url=rs.getString(1);
            captcha_answer=rs.getString(2);
            captcha=new JLabel(new ImageIcon(new URL(url)));
        }catch (Exception ex){ex.printStackTrace();}
        reg_panel.add(captcha);
        reg_panel.add(captcha_field);
        JButton goReg=new JButton("Зарегистрировать");
        goReg.addActionListener(new RegisterL());
        reg_panel.add(goReg);
        reg.add(reg_panel);
        reg.setSize(275,350);
        reg.setResizable(false);
        JLabel f_emailL=new JLabel("Введите e-mail: ");
        forgotP.add(f_emailL);
        forgotP.add(f_email);
        f_forgot.add(forgotP);
        f_forgot.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        f_forgot.setSize(300, 450);
        forgotP.add(new JLabel("Код с картинки:"));
        forgotP.add(captcha);
        forgotP.add(captcha_field);
        forgotP.add(recover);
        recover.addActionListener(new CheckL());
    }
    class RegistrationL implements ActionListener{
        public void actionPerformed(ActionEvent e) {
            reg_panel.add(captcha);
            reg_panel.add(captcha_field);
            reg.setVisible(true);
            login.setVisible(false);
        }
    }
    class LoginL implements ActionListener{
        public void actionPerformed(ActionEvent e) {
            int exists=0;
            try{
                MessageDigest md=MessageDigest.getInstance("MD5");
                md.update(toBytes(pass.getPassword()));
                byte[] temp=md.digest();
                String
                        pass_hash=DatatypeConverter.printHexBinary(temp).toLowerCase();
                rs=mainStatement.executeQuery("SELECT Count(*) FROM logins WHERE (email='"+mail.getText()+"' AND pass='"+pass_hash+"');");
                rs.next();
                exists=rs.getInt(1);
                if(exists==0){
                    JOptionPane.showMessageDialog(login, "Неверный e-mail или пароль.","Ошибка",JOptionPane.ERROR_MESSAGE);
                } else {
                    rs=mainStatement.executeQuery("SELECT * FROM logins WHERE (email='"+mail.getText()+"' AND pass='"+pass_hash+"');");
                    rs.next();
                    player_id=rs.getInt(1);
                    server_id=rs.getInt(7);
                    nickname=rs.getString(6);
                    premium=rs.getInt(8) == 1;
                    if(rs.getString(5)==null) avatar=new JLabel("Нет фото");
                    else avatar=new JLabel(new ImageIcon(new URL(rs.getString(5))));

                    serv_conn=DriverManager.getConnection(url+"_"+server_id,UnP,UnP);

                    stmt_srv=serv_conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE,ResultSet.HOLD_CURSORS_OVER_COMMIT);
                    JOptionPane.showMessageDialog(login,"Успешный вход!","Вы вошли",JOptionPane.INFORMATION_MESSAGE);
                    login.setVisible(false);
                    game();
                }
            }catch(SQLException ex){
                ex.printStackTrace();
                JOptionPane.showMessageDialog(login,"Ошибка SQL, см. консоль разработчика.","Ошибка подключения",JOptionPane.ERROR_MESSAGE);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
    }
    class RegisterL implements ActionListener{
        public void actionPerformed(ActionEvent e) {
            if(!Objects.equals(captcha_field.getText(), captcha_answer)){
                JOptionPane.showMessageDialog(reg,"Неверный код с картинки.","Ошибка",JOptionPane.ERROR_MESSAGE);
            }else if(!Arrays.equals(new_pass.getPassword(),
                    password_confirmation.getPassword())){
                JOptionPane.showMessageDialog(reg,"Проверьте правильность введения пароля.","Ошибка",JOptionPane.ERROR_MESSAGE);
            }else{
                try{
                    rs=mainStatement.executeQuery("SELECT Count(*) FROM logins WHERE (email='"+new_mail+"');");
                    rs.next();
                    int taken=rs.getInt(1);
                    if(taken!=0){
                        JOptionPane.showMessageDialog(reg,"Аккаунт с указанным e-mail уже существует.","Ошибка",JOptionPane.ERROR_MESSAGE);
                    } else {
                        MessageDigest md=MessageDigest.getInstance("MD5");
                        md.update(toBytes(new_pass.getPassword()));
                        byte[] temp=md.digest();
                        String pass_hash=DatatypeConverter.printHexBinary(temp).toLowerCase();
                        rs=mainStatement.executeQuery("SELECT Count(*) FROM servers;");
                        rs.next();
                        server_id=rs.getInt(1);
                        player_id=(int)(Math.random()*100000000);
                        avatar=new JLabel("Нет фото");
                        premium=false;
                        nickname="Prince#"+player_id;
                        mainStatement.executeUpdate("INSERT INTO logins (id, email, pass, nickname, servernum) VALUES ("+player_id+", '"+new_mail.getText()+"', '"+pass_hash+"', '"+nickname+"', "+server_id+");");
                        mainStatement.executeUpdate("INSERT INTO buildings(id) VALUES ("+player_id+");");
                        mainStatement.executeUpdate("INSERT INTO dragon(id) VALUES ("+player_id+");");
                        mainStatement.executeUpdate("INSERT INTO heroes(id) VALUES ("+player_id+");");
                        mainStatement.executeUpdate("INSERT INTO hosp(id) VALUES ("+player_id+");");
                        mainStatement.executeUpdate("INSERT INTO troops(id) VALUES ("+player_id+");");

                        serv_conn=DriverManager.getConnection(url+"_"+server_id,UnP,UnP);

                        stmt_srv=serv_conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE,ResultSet.HOLD_CURSORS_OVER_COMMIT);
                        int x=(int)(Math.random()*1499)+1;
                        int y=(int)(Math.random()*1499)+1;
                        stmt_srv.executeUpdate("INSERT INTO players(id,x,y) VALUES ("+player_id+", "+x+", "+y+");");
                        JOptionPane.showMessageDialog(login,"Успешная регистрация!","Успех",JOptionPane.INFORMATION_MESSAGE);
                        reg.setVisible(false);
                        game();
                    }
                }catch(Exception ex){
                    ex.printStackTrace();
                }
            }
        }
    }
    class ForgotL implements ActionListener{
        public void actionPerformed(ActionEvent e) {
            login.setVisible(false);
            f_forgot.setVisible(true);
        }
    }
    class CheckL implements ActionListener{
        public void actionPerformed(ActionEvent e) {
            if(!Objects.equals(captcha_field.getText(), captcha_answer)){
                JOptionPane.showMessageDialog(reg,"Неверный код с картинки.","Ошибка",JOptionPane.ERROR_MESSAGE);
            }else{
                try{
                    rs=mainStatement.executeQuery("SELECT Count(*) FROM logins WHERE (email='"+f_email.getText()+"');");
                    rs.next();
                    int exist=rs.getInt(1);
                    if(exist==0){
                        JOptionPane.showMessageDialog(reg,"Аккаунт с указанным e-mail не существует.","Ошибка",JOptionPane.ERROR_MESSAGE);
                    }else{
                        forgotP.remove(recover);
                        forgotP.add(new JLabel("Пароль:"));
                        forgotP.add(new_pass);
                        forgotP.add(new JLabel("Подтверждение пароля:"));
                        forgotP.add(password_confirmation);
                        JButton change=new JButton("Сбросить");
                        forgotP.add(change);
                        change.addActionListener(new ChangePassL());
                        forgotP.repaint();
                    }
                }catch(Exception ex){ex.printStackTrace();}
            }
        }
    }
    class ChangePassL implements ActionListener{
        public void actionPerformed(ActionEvent e) {
            if(!Arrays.equals(new_pass.getPassword(),
                    password_confirmation.getPassword())){
                JOptionPane.showMessageDialog(reg,"Проверьте правильность введения пароля.","Ошибка",JOptionPane.ERROR_MESSAGE);
            }else{
                try{
                    MessageDigest md=MessageDigest.getInstance("MD5");
                    md.update(toBytes(new_pass.getPassword()));
                    byte[] temp=md.digest();
                    String
                            pass_hash=DatatypeConverter.printHexBinary(temp).toLowerCase();
                    mainStatement.executeUpdate("UPDATE logins SET pass='"+pass_hash+"' WHERE (email='"+f_email.getText()+"');");
                    f_forgot.setVisible(false);
                    login.setVisible(true);
                }catch(Exception ex){ex.printStackTrace();}
            }
        }
    }
    byte[] toBytes(char[] chars) {
        CharBuffer charBuffer = CharBuffer.wrap(chars);
        ByteBuffer byteBuffer = StandardCharsets.UTF_8.encode(charBuffer);
        byte[] bytes = Arrays.copyOfRange(byteBuffer.array(),
                byteBuffer.position(), byteBuffer.limit());
        Arrays.fill(byteBuffer.array(), (byte) 0);
        return bytes;
    }
    static void game() throws SQLException, IOException {
        mainFrame=new JFrame("Путь витязя ALPHA");
        mainFrame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        JButton stronghold=new JButton("Цитадель");
        stronghold.addActionListener(new BuildingL("stronghold"));
        JButton lair=new JButton("Логово дракона");
        lair.addActionListener(new BuildingL("draglair"));
        JButton inf=new JButton("Казармы");
        inf.addActionListener(new BuildingL("infantry"));
        JButton cav=new JButton("Конюшни");
        cav.addActionListener(new BuildingL("horses"));
        JButton bow=new JButton("Стрельбище");
        bow.addActionListener(new BuildingL("bow"));
        JButton camp=new JButton("Тренировочный лагерь");
        camp.addActionListener(new BuildingL("traincamp"));
        JButton hospital=new JButton("Лазарет");
        hospital.addActionListener(new BuildingL("hospital"));
        JButton storehouse=new JButton("Кладовая");
        storehouse.addActionListener(new BuildingL("storehouse"));
        JButton rally=new JButton("Зал коопераций");
        rally.addActionListener(new BuildingL("rally"));
        rs=mainStatement.executeQuery("SELECT lv_stronghold FROM buildings WHERE (id="+player_id+");");
        rs.next();
        int sh_level=rs.getInt(1);
        if(sh_level<2) cav.setEnabled(false);
        if(sh_level<3) bow.setEnabled(false);
        if(sh_level<4) hospital.setEnabled(false);
        if(sh_level<7) rally.setEnabled(false);
        JPanel mmainFrame=new JPanel();
        mmainFrame.add(stronghold);
        mmainFrame.add(lair);
        mmainFrame.add(inf);
        mmainFrame.add(cav);
        mmainFrame.add(bow);
        mmainFrame.add(camp);
        mmainFrame.add(hospital);
        mmainFrame.add(storehouse);
        mmainFrame.add(rally);
        mainFrame.add(mmainFrame,BorderLayout.WEST);
        JPanel south=new JPanel();
        JButton heroes=new JButton("Герои");
        JButton equipment=new JButton("Экиперовка");
        heroes.addActionListener(new HeroesL());
        equipment.addActionListener(new EquipmentL());
        south.add(heroes);
        south.add(equipment);
        mainFrame.add(south,BorderLayout.SOUTH);
        rs=mainStatement.executeQuery("SELECT Count(*) FROM ad;");
        rs.next();
        int num_of_ads=rs.getInt(1);
        int adToShow=(int)(Math.random()*num_of_ads)+1;
        rs=mainStatement.executeQuery("SELECT html FROM ad WHERE (id="+adToShow+");");
        rs.next();
        JEditorPane ad_panel=new JEditorPane(rs.getString(1));
        ad_panel.setEditable(false);
        ad_panel.setMaximumSize(new Dimension(1000,150));
        mainFrame.add(ad_panel,BorderLayout.NORTH);
        mainFrame.setSize(1500, 900);
        mainFrame.setVisible(true);
    }
    static class BuildingL implements ActionListener{
        String type_of_building;
        public BuildingL(String t){
            type_of_building=t;
        }
        public void actionPerformed(ActionEvent e) {
            JFrame building=new JFrame("Информация о здании");
            JPanel building_p=new JPanel();
            building_p.setLayout(new BoxLayout(building_p,
                    BoxLayout.Y_AXIS));
            JLabel levelL=new JLabel("Уровень: ");
            try{
                rs=mainStatement.executeQuery("SELECT lv_"+type_of_building+", building_under_upgrade, building_eta FROM buildings WHERE (id="+player_id+");");
                rs.next();
                int level=rs.getInt(1);
                levelL=new JLabel(levelL.getText()+level);
                building_p.add(levelL);
                String building_under_upgrade=rs.getString(2);
                JButton upgrade=new JButton("Обновить здание");
                upgrade.addActionListener(new
                        UpgradeL(type_of_building,level+1));
                if(Objects.equals(building_under_upgrade, type_of_building)){
                    building_p.add(new JLabel("Обновляется до уровня "+(level+1)+", оставшееся время: "+(rs.getLong(3)-currentTime())+" сек."));
                    upgrade.setEnabled(false);
                } else if(building_under_upgrade!=null){
                    upgrade.setEnabled(false);
                    upgrade.setToolTipText("Другое здание уже обновляется.");
                }
                rs=mainStatement.executeQuery("SELECT lv_stronghold FROM buildings WHERE (id="+player_id+");");
                rs.next();
                int sh_level=rs.getInt(1);
                if(!Objects.equals(type_of_building, "stronghold")
                        &&level==sh_level){
                    upgrade.setEnabled(false);
                    upgrade.setToolTipText("Нельзя обновить здание выше, чем уровень цитадели.");
                }
                building_p.add(upgrade);
                if(Objects.equals(type_of_building, "draglair")){
                    JButton dragon=new JButton("Дракон");
                    dragon.addActionListener(new DragonL());
                    building_p.add(dragon);
                } else if(Objects.equals(type_of_building, "infantry")){
                    JButton training=new JButton("Тренировка пехоты");
                    training.addActionListener(new TrainingL("inf"));
                    building_p.add(training);
                } else if(Objects.equals(type_of_building, "horses")){
                    JButton training=new JButton("Тренировка кавалерии");
                    training.addActionListener(new TrainingL("cav"));
                    building_p.add(training);
                } else if(Objects.equals(type_of_building, "bow")){
                    JButton training=new JButton("Тренировка стрелков");
                    training.addActionListener(new TrainingL("bow"));
                    building_p.add(training);
                } else if(Objects.equals(type_of_building, "hospital")){
                    JButton hosp=new JButton("Лазарет");
                    hosp.addActionListener(new HospitalL());
                    building_p.add(hosp);
                }
                building.add(building_p);
            }catch(Exception ex){ex.printStackTrace();}
            building.setDefaultCloseOperation(WindowConstants.HIDE_ON_CLOSE);
            building.setSize(400,400);
            building.setVisible(true);
        }
    }
    static class UpgradeL implements ActionListener{
        String type;
        int level;
        public UpgradeL(String t, int l){
            type=t;
            level=l;
        }
        public void actionPerformed(ActionEvent e) {
            JFrame upgrade=new JFrame("Обновление здания");
            JPanel upgrade_p=new JPanel();
            int needed_food;
            int needed_wood;
            int needed_iron;
            int needed_silver;
            int needed_time;
            switch(type){
                case "stronghold":{
                    needed_food=10000*level*level;
                    needed_wood=needed_food/2;
                    needed_iron=needed_wood/4;
                    needed_silver=needed_wood/20;
                    needed_time=1800*level;
                    break;
                }
                case "infantry":
                case "bow":
                case "horses": {
                    needed_food=3000*level*level;
                    needed_wood=needed_food/2;
                    needed_iron=needed_wood/4;
                    needed_silver=needed_wood/20;
                    needed_time=900*level;
                    break;
                }
                default:{
                    needed_food=1000*level*level;
                    needed_wood=needed_food/2;
                    needed_iron=needed_wood/4;
                    needed_silver=needed_wood/20;
                    needed_time=300*level;
                }
            }
            if(level<7) needed_iron=0;
            if(level<12) needed_silver=0;
            try {
                rs=mainStatement.executeQuery("SELECT food,wood,iron,silver FROM buildings WHERE (id="+player_id+");");
                rs.next();
                int food=rs.getInt(1);
                int wood=rs.getInt(2);
                int iron=rs.getInt(3);
                int silver=rs.getInt(4);
                JButton upgradeIt=new JButton("Начать обновление");
                upgradeIt.addActionListener(new SendUpgrade(type,level,needed_time,needed_food,needed_wood,needed_iron,needed_silver));

                if(needed_food>food||needed_silver>silver||needed_iron>iron||needed_wood>wood
                ) upgradeIt.setEnabled(false);
                upgrade_p.add(new JLabel("Пища: "+food+"/"+needed_food));
                upgrade_p.add(new JLabel("Древесина: "+wood+"/"+needed_wood));
                upgrade_p.add(new JLabel("Железо: "+iron+"/"+needed_iron));
                upgrade_p.add(new JLabel("Серебро: "+silver+"/"+needed_silver));
                upgrade_p.add(upgradeIt);
                upgrade.add(upgrade_p);

                upgrade.setDefaultCloseOperation(WindowConstants.HIDE_ON_CLOSE);
                upgrade.setSize(200,200);
                upgrade.setVisible(true);
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
    static class DragonL implements ActionListener{
        @Override
        public void actionPerformed(ActionEvent e) {
        }
    }
    static class HospitalL implements ActionListener{
        @Override
        public void actionPerformed(ActionEvent e) {
        }
    }
    static class TrainingL implements ActionListener{
        String kind;
        public TrainingL(String k){
            kind=k;
        }
        @Override
        public void actionPerformed(ActionEvent e) {
        }
    }
    static class HeroesL implements ActionListener{
        @Override
        public void actionPerformed(ActionEvent e) {
        }
    }
    static class EquipmentL implements ActionListener{
        @Override
        public void actionPerformed(ActionEvent e) {
        }
    }
    static class SendUpgrade implements ActionListener{
        String type;
        int level;
        long eta;
        int food;
        int wood;
        int iron;
        int silver;
        public SendUpgrade(String t, int l, long e, int f, int w, int i, int
                s){
            type=t;
            level=l;
            eta=e;
            food=f;
            wood=w;
            iron=i;
            silver=s;
        }
        @Override
        public void actionPerformed(ActionEvent e) {
            try{
                mainStatement.executeUpdate("UPDATE buildings SET food=food-"+food+", wood=wood-"+wood+", iron=iron-"+iron+", silver=silver-"+silver+", building_under_upgrade='"+type+"', building_eta="+(currentTime()+eta)+" WHERE (id="+player_id+");");
            }catch(Exception ex){ex.printStackTrace();}
        }
    }
    public static long currentTime(){
        java.util.Date xxx=new Date();
        return xxx.getTime()/1000;
    }
}