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
    JComboBox OptionSelect;
    JButton Select;

    public int getOptionSelect() {
        return OptionSelect.getSelectedIndex();
    }

    public Staff(int ID)
    {
        String[] choices={"Insert/Update/Delete users","Allot Slots","Allot batches"};
        OptionSelect=new JComboBox(choices);
        Select=new JButton("Select");
        Select.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                int selectedChoice=getOptionSelect();
                try {
                    if (selectedChoice == 0)
                        new AddUsers();
                    else if (selectedChoice == 1)
                        new AllotSlots();
                    else if (selectedChoice == 2)
                        new AllotBatches();
                }
                catch(SQLException ed){

                }

            }
        });
        add(OptionSelect);
        add(Select);
        setLayout(new GridLayout(2,1));
        setVisible(true);
        setLocationRelativeTo(null);
        setSize(300,100);

    }

}
