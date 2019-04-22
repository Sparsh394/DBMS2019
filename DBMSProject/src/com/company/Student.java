package com.company;

import net.proteanit.sql.DbUtils;

import javax.swing.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Student extends JFrame {
    JTable classes;
    int Student_ID;
    public Student(int ID) throws SQLException{
        try{
            Connection conn=DatabaseConnector.getConnect();
            String getStudentID="select ID from student where User_ID=?";
            PreparedStatement getStudent=conn.prepareStatement(getStudentID);
            getStudent.setInt(1,ID);
            ResultSet students=getStudent.executeQuery();
            while(students.next())
                Student_ID=students.getInt("ID");
            String batchstudentstatement="Select Batch_ID from batchstudents where Student_ID= ?";
            PreparedStatement statementbatchstudent=conn.prepareStatement(batchstudentstatement);
            statementbatchstudent.setInt(1,Student_ID);
            ResultSet BatchIDset=statementbatchstudent.executeQuery();
            int batchid;
            if(!BatchIDset.isBeforeFirst())
                JOptionPane.showMessageDialog(null,"No Batch Allotted!");
            else
            {
                batchid=BatchIDset.getInt("Batch_ID");
            }
            String batchslotstatement="Select Teacher_ID,Date,StartTime, Homework from batchslot where Batch_ID=?";
            PreparedStatement statementbatchslot=conn.prepareStatement(batchslotstatement);
            ResultSet allclasses=statementbatchslot.executeQuery();
            classes=new JTable();
            classes.setModel(DbUtils.resultSetToTableModel(allclasses));
            add(classes);
            setVisible(true);
            setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
            setSize(600,100);
            setLocationRelativeTo(null);



        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }
    }
}
