// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract College{
    struct Student{
        string name;
        string email;
        string contact;
        string college;
    } 
    Student public student;

    function getData(
        string memory name,
        string memory email,
        string memory contact,
        string memory college
    ) public {
        student = Student(name, email, contact, college);
    }
}