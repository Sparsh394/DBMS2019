package com.company;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;

public class AddUsers extends JFrame {
    JTextField ID;
    JTextField username;
    JTextField password;
    JTextField FirstName;
    JTextField LastName;
    JTextField EnrollmentNumber;
    JTextField phone;
    JTextField email;
    JTextField Address;
    JTextField Type;
    int Usr_ID;
    JButton checkID;
    JButton insertorupdate;
    JButton delete;
    String type;
    public AddUsers()
    {
        ID=new JTextField();
        FirstName=new JTextField();
        LastName=new JTextField();
        EnrollmentNumber=new JTextField();
        phone=new JTextField();
        email=new JTextField();
        Address=new JTextField();
        username=new JTextField();
        password=new JTextField();
        insertorupdate=new JButton("Insert or update?");
        checkID=new JButton("Check UserName");
        delete=new JButton("Delete?");
        checkID.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

                try  {
                    String checkforID="select userExists(?)";
                    Connection conn = DatabaseConnector.getConnect();
                    CallableStatement checkerStatement=conn.prepareCall(checkforID);
                    checkerStatement.registerOutParameter(1,"");
                    checkerStatement.setString(1,username.getText());
                    ResultSet checkFor=checkerStatement.executeQuery();
                    if(!checkFor.isBeforeFirst())
                        JOptionPane.showMessageDialog(null,"There is no user with this Username. Please insert a new user with all details.");
                    else
                    {
                        Usr_ID=setUserFields(username.getText());
                        String typeChecker="typeOfUser(?)";
                        PreparedStatement CheckerType=conn.prepareStatement(typeChecker);
                        CheckerType.setString(1,username.getText());
                        ResultSet typecheck=CheckerType.executeQuery();
                        while(typecheck.next())
                        {
                            type=typecheck.getString(1,"")

                        }
                    }
                }
                catch(SQLException ex)
                {
                    JOptionPane.showMessageDialog(null,"There was an error in the database. Please try again.");
                }
            }
        });


    }
    public int setUserFields(String username) throws SQLException {
        Connection conn1=DatabaseConnector.getConnect();
        String UserFieldsSetter="Select ID,password from user where username=?";
        PreparedStatement SetuserFields=conn1.prepareStatement(UserFieldsSetter);
        SetuserFields.setString(1,username);
        int User_ID=-1;
        ResultSet UserFields=SetuserFields.executeQuery();
        while(UserFields.next()) {
            User_ID=UserFields.getInt("ID");
            ID.setText(Integer.toString(User_ID));
            password.setText(UserFields.getString("password"));
        }
        conn1.close();
        return User_ID;
    }
}
