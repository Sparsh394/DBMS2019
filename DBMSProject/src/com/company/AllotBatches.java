package com.company;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;
import java.util.ArrayList;

public class AllotBatches  extends JFrame{
 JComboBox students;
 JComboBox Batches;
 JButton Enroll;

    public String getStudents() {
        return students.getSelectedItem().toString();
    }

    public String getBatches() {
        return Batches.getSelectedItem().toString();
    }

    public AllotBatches() throws SQLException {   Connection conn=DatabaseConnector.getConnect();
     String getStudents="select FirstName from student";
     String getBatches="select Name from batch";
     PreparedStatement gettingStudents=conn.prepareStatement(getStudents);
     PreparedStatement gettingBatches=conn.prepareStatement(getBatches);
     ResultSet student=gettingStudents.executeQuery();
     ResultSet batch=gettingBatches.executeQuery();
     ArrayList<String> studentList=new ArrayList<String>();
     ArrayList<String> batchlist=new ArrayList<String>();
     students=new JComboBox(studentList.toArray());
     Batches=new JComboBox(batchlist.toArray());
     Enroll=new JButton("Enroll");
     Enroll.addActionListener(new ActionListener() {
         @Override
         public void actionPerformed(ActionEvent e) {
            String enrollString="call enroll(?,?)";
             try {
                 CallableStatement callEnroll=conn.prepareCall(enrollString);
                 callEnroll.setString(1,getBatches());
                 callEnroll.setString(2,getStudents());
                 callEnroll.executeUpdate();
             } catch (SQLException e1) {
                 e1.printStackTrace();
             }
         }
     });
     add(Batches);
     add(students);
     add(Enroll);
     setLayout(new GridLayout(3,1));
     setSize(600,100);
     setLocationRelativeTo(null);
     setVisible(true);
 }
}
