package com.company;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;
public class LoginScreen extends JFrame {
    JTextField ID;
    JPasswordField password;
    JLabel UID;

    public String getID() {
        return ID.getText();
    }

    public String getPassword() {
        return password.getText();
    }

    JLabel pword;
    JPanel p1;
    JButton button;
    String username;
    String pass;
    public LoginScreen() throws SQLException {
        p1=new JPanel();
        ID=new JTextField();
        UID=new JLabel("User ID: ");
        pword=new JLabel("Password: ");
        password=new JPasswordField();
        p1.setLayout(new GridLayout(4,4));
        p1.add(UID);
        p1.add(ID);
        p1.add(pword);
        p1.add(password);
        setLayout(new GridLayout(2,1));
        add(p1);

        button=new JButton("Login");
        button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                username=getID();
                pass=getPassword();

                try {
                    Connection conn=DatabaseConnector.getConnect();
                    int checker=0;
                    String loginstatement = "SELECT ID, Type_ID FROM user WHERE username = ? AND password = ?";
                    PreparedStatement validate = conn.prepareStatement(loginstatement);
                    validate.setString(1,username);
                    validate.setString(2,pass);
                    ResultSet logintable = validate.executeQuery();
                    if(!logintable.isBeforeFirst())
                        JOptionPane.showMessageDialog(null,"Incorrect Username/Password");
                    else {while(logintable.next()) {
                        checker = logintable.getInt("Type_ID");
                        int IDpasser = logintable.getInt("ID");
                        if (checker == 1) {
                            Student stuobject = new Student(IDpasser);
                        } else if (checker == 3) {
                            Teacher teachobject = new Teacher(IDpasser);
                        } else if (checker == 4) {
                            Staff staffobject = new Staff(IDpasser);
                        }
                    }
                        conn.close();

                    }

                }
                 catch (SQLException e1) {
                    e1.printStackTrace();
                }




            }
        });
        add(button);
        setSize(300,200);
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        setVisible(true);
        setLocationRelativeTo(null);

    }



}
