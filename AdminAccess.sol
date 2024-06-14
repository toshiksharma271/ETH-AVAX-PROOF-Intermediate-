// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract AdminToken{
    string public TokenName = "Baingan";
    string public Abbrev = "BG";
    uint public totalSupply = 0;
    address owner;

constructor(){
    owner=msg.sender;
}

mapping(address => uint )public balances;

modifier ownerAccess() {
    require(owner==msg.sender,"Admin permission required!");
    _;
}


function mint(address _address,uint _value)public ownerAccess{
    totalSupply+=_value;
    balances[_address]+=_value;
}

function burn(address _address,uint _value)public ownerAccess{
    totalSupply-=_value;
    balances[_address]-=_value;
}

}
