// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract College{
    struct Student{
        string name;
        string email;
        string contact;
        string college;
    } 
    Student private student;

    function setData(
        string memory name,
        string memory email,
        string memory contact,
        string memory college
    ) public {
        student = Student(name, email, contact, college);
    }

    function getName() public view returns (string memory){
        return student.name;
    }

    function getEmail() public view returns (string memory){
        return student.email;
    }

    function getContact() public view returns (string memory){
        return student.contact;
    }

    function getCollege() public view returns (string memory){
        return student.college;
    }
}