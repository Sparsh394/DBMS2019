package com.company;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Staff extends JFrame {
    JTable batchslots;
    int Staff_ID;
    JComboBox RoomNumbers;
    JComboBox Batches;
    String[] Rooms;
    String[] BatchIDs;
    JButton Update;
    ArrayList<Integer> Batchslots;
    JComboBox selectBatchSlot;
    public String getRoomNumbers() {
        return RoomNumbers.getSelectedItem().toString();
    }

    public int getBatches() {
        return Integer.parseInt(Batches.getSelectedItem().toString());
    }

    public int getSelectBatchSlot() {
        return Integer.parseInt(selectBatchSlot.getSelectedItem().toString());
    }

    public Staff(int ID) throws SQLException{
        System.out.println("Entered Staff");
        Connection conn=DatabaseConnector.getConnect();
        String getStaffID="select ID from staff where User_ID=?";
        PreparedStatement getstaff=conn.prepareStatement(getStaffID);
        getstaff.setInt(1,ID);
        ResultSet staffs=getstaff.executeQuery();
        while(staffs.next())
            Staff_ID=staffs.getInt("ID");
        String getFreeRooms="select Room.RoomNumber from Room left join batchslot on batchslot.Room_ID= Room.ID where batchslot.Room_ID is NULL";
        PreparedStatement freeRooms=conn.prepareStatement(getFreeRooms);
        ResultSet frRooms=freeRooms.executeQuery();
        Rooms=new String[8];
        int i=0;
        while(frRooms.next())
        {
            Rooms[i]=frRooms.getString(1);
            i++;
        }
        RoomNumbers=new JComboBox(Rooms);
        String getUnassignedBatches="select Batch.ID from Batch left join batchslot on batchslot.Batch_ID=Batch.ID where batchslot.ID is NULL";
        String getBatchSlots="select * from batchslot";
        Batchslots=new ArrayList<Integer>();
        PreparedStatement BatchSlotget=conn.prepareStatement(getBatchSlots);
        ResultSet batchslots=BatchSlotget.executeQuery();
        while(batchslots.next())
            Batchslots.add(batchslots.getInt("ID"));
        selectBatchSlot=new JComboBox(Batchslots.toArray());
        PreparedStatement unassignedbatches=conn.prepareStatement(getUnassignedBatches);
        ResultSet batchunassigned=unassignedbatches.executeQuery();
        BatchIDs=new String[3];
        i=0;
        while(batchunassigned.next())
        {
           BatchIDs[i]=Integer.toString(batchunassigned.getInt(1));
           i++;
        }
        Batches=new JComboBox(BatchIDs);
        Update=new JButton("Update");
        Update.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try {
                    String assignbatches = "update batchslot set Batch_ID=?,Room_ID=? where ID=?";
                    PreparedStatement assigner = conn.prepareStatement(assignbatches);
                    String findRoom="select ID from Room where RoomNumber=?";
                    int room=0;
                    PreparedStatement roomFinder=conn.prepareStatement(findRoom);
                    roomFinder.setString(1,getRoomNumbers());
                    ResultSet roomFind=roomFinder.executeQuery();
                    while(roomFind.next())
                        room=roomFind.getInt("ID");
                    assigner.setInt(1,getBatches());
                    assigner.setInt(2,room);
                    assigner.setInt(3,getSelectBatchSlot());
                    RoomNumbers.removeItem(RoomNumbers.getSelectedItem());
                    Batches.removeItem(Batches.getSelectedItem());
                    selectBatchSlot.removeItem(selectBatchSlot.getSelectedItem());
                    assigner.executeUpdate();
                }
                catch(SQLException ex1)
                {
                    ex1.printStackTrace();
                }
            }
        });
        setLayout(new GridLayout(2,2));
        add(selectBatchSlot);
        add(RoomNumbers);
        add(Batches);
        add(Update);
        setVisible(true);
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        setSize(600,100);
        setLocationRelativeTo(null);




    }
}
