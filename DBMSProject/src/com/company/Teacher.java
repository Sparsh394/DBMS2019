package com.company;

import net.proteanit.sql.DbUtils;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class Teacher extends JFrame {
    JTable slotable;
    JComboBox slotdate;
    JComboBox slottime;
    String[] dates;
    JLabel datelabel;
    JLabel timelabel;
    ArrayList<String> times;
    LocalTime[] formattime;
    JButton update;
    int Teacher_ID;

    public String getSlotdate() {
        return slotdate.getSelectedItem().toString();
    }

    public LocalTime getSlottime() {
        return (LocalTime) slottime.getSelectedItem();
    }

    public Teacher(int ID) throws SQLException{
       try{
           Connection conn=DatabaseConnector.getConnect();
           String getTeacherID="select ID from student where User_ID=?";
           PreparedStatement getTeacher=conn.prepareStatement(getTeacherID);
           getTeacher.setInt(1,ID);
           ResultSet teachers=getTeacher.executeQuery();
           Teacher_ID=0;
           while(teachers.next())
               Teacher_ID=teachers.getInt("ID");
           String editbatchslot="insert into batchslot(teacher_ID,date,StartTime,ApprovedByTeacher,ModifiedOn) values(?,?,?,?,now())";
           PreparedStatement batchslotedit=conn.prepareStatement(editbatchslot);
           String getslots="select date,StartTime from batchslot where Teacher_ID=?";
           PreparedStatement slotget=conn.prepareStatement(getslots);
           slotget.setInt(1,Teacher_ID);
           ResultSet slots=slotget.executeQuery();
           Calendar calendar= Calendar.getInstance();
           SimpleDateFormat df=new SimpleDateFormat("dd-MM-yyyy");
           slotable=new JTable();
           if(!slots.isBeforeFirst())
               System.out.println("No data");
           else
           slotable.setModel(DbUtils.resultSetToTableModel(slots));
           dates=new String[7];
           for (int i = 0; i < 7; i++) {
               Date dt = calendar.getTime();
               // now format it using SimpleDateFormat
               String val =df.format(dt) ;
               dates[i]=val;
               calendar.add (Calendar.DAY_OF_WEEK, 1);
           }
           times=new ArrayList<String>();
           times.add(0,"10:00 AM");
           times.add(1,"11:00 AM");
           times.add(2,"12:00 PM");
           times.add(3,"01:00 PM");
           times.add(4,"02:00 PM");
           times.add(5,"03:00 PM");
           times.add(6,"04:00 PM");
           times.add(7,"05:00 PM");
           DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("hh:mm a", Locale.ENGLISH);
           formattime=new LocalTime[7];
           for(int i=0;i<7;i++) {
               LocalTime time = LocalTime.parse(times.get(i), inputFormatter);
               formattime[i]=time;
           }
           slotdate=new JComboBox(dates);
           slottime=new JComboBox(formattime);
           update=new JButton("Add slot");
           update.addActionListener(new ActionListener() {
               @Override
               public void actionPerformed(ActionEvent e) {
                   try {
                       String dateselected=getSlotdate();
                       LocalTime timeselected=getSlottime();
                       java.util.Date date = df.parse(dateselected);
                       java.sql.Date sqlDate = new java.sql.Date(date.getTime());
                       batchslotedit.setInt(1, Teacher_ID);
                       batchslotedit.setDate(2,sqlDate);
                       batchslotedit.setTime(3,Time.valueOf(timeselected));
                       batchslotedit.setInt(4,1);
                       batchslotedit.executeUpdate();

                   }
                   catch(SQLException e1)
                   {
                       e1.printStackTrace();

                   } catch (ParseException e1) {
                       e1.printStackTrace();
                   }
               }
           });
           datelabel=new JLabel("Select a date");
           timelabel=new JLabel("Select a time");

           setLayout(new GridLayout(5,1));
           add(slotable);
           add(datelabel);
           add(slotdate);
           add(timelabel);
           add(slottime);
           add(update);
           setDefaultCloseOperation(EXIT_ON_CLOSE);
           setSize(600,100);
           setVisible(true);
           setLocationRelativeTo(null);






       }
       catch (SQLException ex)
       {
            ex.printStackTrace();
       }



    }
}
