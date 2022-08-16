//SPDX.License.Identifier:MIT

pragma solidity ^0.8.0;

contract Logic{
    uint public num;

    function changeNum(uint _num) public{
        num = _num;
    }

    function addNum(uint _num) public{
        num += _num;
    }

    function mulNum(uint _num) public{
        num *= _num;
    }
}