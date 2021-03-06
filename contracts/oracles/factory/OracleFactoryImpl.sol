pragma solidity ^0.4.18;
import "../types/MultipleOutcomeOracle.sol";
import "../types/ScalarOracle.sol";
import "./IUpgradableOracleFactoryImpl.sol";

/*
    @title OracleFactoryImpl contract - The implementation for the Oracle Factory
 */
contract OracleFactoryImpl is IUpgradableOracleFactoryImpl {

    event MultipleOutcomeOracleCreated(address indexed _creator, address indexed _newOracle);
    event ScalarOracleCreated(address indexed _creator, address indexed _newOracle);

    function OracleFactoryImpl() public {}

    /*
        @dev Create a Pool Oracle instance

        @param _name       Oracle name
    */
    function createMultipleOutcomeOracle(string _name) public {
        MultipleOutcomeOracle newOracle = new MultipleOutcomeOracle(msg.sender, _name);

        MultipleOutcomeOracleCreated(msg.sender, address(newOracle));
    }

    /*
        @dev Create a Scalar Oracle instance

        @param _name       Oracle name
    */
    function createScalarOracle(string _name) public {
        ScalarOracle newOracle = new ScalarOracle(msg.sender, _name);

        ScalarOracleCreated(msg.sender, address(newOracle));
    }
}

