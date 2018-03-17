pragma solidity ^0.4.17;

contract Shard {
    struct State {
        string hashBlock;
        uint time;
    }
    
    State[] states;
    address owner;
    
    modifier isOwner() {
        require(msg.sender == owner);
        _;
    }
    
    function Shard() public{
        owner = msg.sender;
    }
    
    function saveState (string hashBlock, uint time) isOwner public{
        State memory state = State(hashBlock,time);
        states.push(state);
    }
    
    function getStateLenght() public view returns(uint256){
        return states.length;
    }
    
    function getState(uint i) public view returns(string,uint256){
        State memory state = states[i];
        return (state.hashBlock,state.time);
    }

}
