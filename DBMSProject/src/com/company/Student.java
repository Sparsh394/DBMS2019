package com.company;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import net.proteanit.sql.DbUtils;

import javax.swing.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Student extends JFrame {

    JTable classes;
    int Student_ID;
    JComboBox BatchIDs;
    JButton FindSlots;
    Integer[] tempArray;
    ResultSet allclasses;
    ArrayList<Integer> BatchIDArray;
    JLabel testLabel;
    JScrollPane jScrollPane1;

    public Student(int ID) throws SQLException {
        try {
            Connection conn = DatabaseConnector.getConnect();
            String getStudentID = "select ID from student where User_ID=?";
            PreparedStatement getStudent = conn.prepareStatement(getStudentID);
            getStudent.setInt(1, ID);
            ResultSet students = getStudent.executeQuery();
            while (students.next()) {
                Student_ID = students.getInt("ID");
            }
            System.out.println("Student ID" + Student_ID);
            String batchstudentstatement = "Select distinct  Batch_ID from batchstudents where Student_ID= ?";
            PreparedStatement statementbatchstudent = conn.prepareStatement(batchstudentstatement);
            statementbatchstudent.setInt(1, Student_ID);
            ResultSet BatchIDset = statementbatchstudent.executeQuery();
            BatchIDs = new JComboBox();
            FindSlots = new JButton("Timetable");
            classes = new JTable();
            BatchIDArray = new ArrayList<Integer>();
            if (!BatchIDset.isBeforeFirst()) {
                JOptionPane.showMessageDialog(null, "No Batch Allotted!");
            } else {
                while (BatchIDset.next()) {
                    BatchIDArray.add(BatchIDset.getInt("Batch_ID"));
                }
                tempArray = BatchIDArray.toArray(new Integer[BatchIDArray.size()]);
                String[] tempArrayString = new String[tempArray.length];
                for (int i = 0; i < tempArray.length; i++) {
                    tempArrayString[i] = Integer.toString(tempArray[i]);
                }
                BatchIDs = new JComboBox(tempArrayString);
                FindSlots.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        String batchslotstatement = "Select ID,Date,Time,RoomNumber,Batch from studentview where ID=?";
                        PreparedStatement statementbatchslot;
                        try {
                            statementbatchslot = conn.prepareStatement(batchslotstatement);
                            statementbatchslot.setInt(1, getBatchIDs());
                            allclasses = statementbatchslot.executeQuery();
                            classes.setModel(DbUtils.resultSetToTableModel(allclasses));
                        } catch (SQLException ex) {
                            Logger.getLogger(Student.class.getName()).log(Level.SEVERE, null, ex);
                        }

                    }
                });

                testLabel = new JLabel("Batches: ");
                jScrollPane1 = new JScrollPane();
                jScrollPane1.setViewportView(classes);

                javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
                getContentPane().setLayout(layout);
                layout.setHorizontalGroup(
                        layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                        .addGap(0, 52, Short.MAX_VALUE)
                                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 940, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addGap(50, 50, 50))
                                .addGroup(layout.createSequentialGroup()
                                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                                .addGroup(layout.createSequentialGroup()
                                                        .addGap(414, 414, 414)
                                                        .addComponent(testLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 88, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                        .addGap(18, 18, 18)
                                                        .addComponent(BatchIDs, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE))
                                                .addGroup(layout.createSequentialGroup()
                                                        .addGap(459, 459, 459)
                                                        .addComponent(FindSlots, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)))
                                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                );
                layout.setVerticalGroup(
                        layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                .addGroup(layout.createSequentialGroup()
                                        .addGap(28, 28, 28)
                                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 148, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addGap(27, 27, 27)
                                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                                .addComponent(testLabel)
                                                .addComponent(BatchIDs, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                                        .addGap(36, 36, 36)
                                        .addComponent(FindSlots, javax.swing.GroupLayout.PREFERRED_SIZE, 50, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addContainerGap(53, Short.MAX_VALUE))
                );

                pack();

                /*add(BatchIDs);
                add(FindSlots);
                add(classes);*/
                setVisible(true);
                setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
                //setSize(600,100);
                setLocationRelativeTo(null);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public int getBatchIDs() {
        return Integer.parseInt((BatchIDs.getSelectedItem().toString()));
    }
}