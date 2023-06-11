// SPDX-License-Identifier: MIT
pragma solidity 0.8.8;

// import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract WEE is AccessControl {
    bytes32 private constant INSTITUTION = keccak256("INSTITUTION");
    bytes32 private constant INDIVIDUAL = keccak256("INDIVIDUAL");

    struct Work {
        address a_where;
        string s_where;
        string s_what;
        uint256 start_timestamp;
        uint256 end_timestamp;
        bool isverified;
    }
    struct Education {
        address a_where;
        string s_where;
        string s_what;
        uint256 start_timestamp;
        uint256 end_timestamp;
        bool isverified;
    }
    struct Experience {
        address a_where;
        string s_where;
        string s_what;
        uint256 start_timestamp;
        uint256 end_timestamp;
        bool isverified;
    }

    constructor() {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(INSTITUTION, msg.sender);
    }

    // Mapping defined
    mapping(address => Work) public Workmap;
    mapping(address => Education) public Educationmap;
    mapping(address => Experience) public Experiencemap;

    //Setter functions

    function setWork(
        address whose,
        address where,
        string memory swhere,
        string memory what,
        uint256 start,
        uint256 end
    ) public onlyRole(INDIVIDUAL) {
        Workmap[whose].a_where = where;
        Workmap[whose].s_where = swhere;
        Workmap[whose].s_what = what;
        Workmap[whose].start_timestamp = start;
        Workmap[whose].end_timestamp = end;
    }

    function setEducation(
        address whose,
        address where,
        string memory swhere,
        string memory what,
        uint256 start,
        uint256 end
    ) public onlyRole(INDIVIDUAL) {
        Educationmap[whose].a_where = where;
        Educationmap[whose].s_where = swhere;
        Educationmap[whose].s_what = what;
        Educationmap[whose].start_timestamp = start;
        Educationmap[whose].end_timestamp = end;
    }

    function setExperience(
        address whose,
        address where,
        string memory swhere,
        string memory what,
        uint256 start,
        uint256 end
    ) public onlyRole(INDIVIDUAL) {
        Experiencemap[whose].a_where = where;
        Experiencemap[whose].s_where = swhere;
        Experiencemap[whose].s_what = what;
        Experiencemap[whose].start_timestamp = start;
        Experiencemap[whose].end_timestamp = end;
    }

    //Getter functions

    function getWork(
        address whose
    )
        public
        view
        returns (
            address ad_where,
            string memory st_where,
            string memory st_what,
            uint256 start_time,
            uint256 end_time,
            bool verified
        )
    {
        ad_where = Workmap[whose].a_where;
        st_where = Workmap[whose].s_where;
        st_what = Workmap[whose].s_what;
        start_time = Workmap[whose].start_timestamp;
        end_time = Workmap[whose].end_timestamp;
        verified = Workmap[whose].isverified;
    }

    function getEducation(
        address whose
    )
        public
        view
        returns (
            address ad_where,
            string memory st_where,
            string memory st_what,
            uint256 start_time,
            uint256 end_time,
            bool verified
        )
    {
        ad_where = Educationmap[whose].a_where;
        st_where = Educationmap[whose].s_where;
        st_what = Educationmap[whose].s_what;
        start_time = Educationmap[whose].start_timestamp;
        end_time = Educationmap[whose].end_timestamp;
        verified = Educationmap[whose].isverified;
    }

    function getExperience(
        address whose
    )
        public
        view
        returns (
            address ad_where,
            string memory st_where,
            string memory st_what,
            uint256 start_time,
            uint256 end_time,
            bool verified
        )
    {
        ad_where = Experiencemap[whose].a_where;
        st_where = Experiencemap[whose].s_where;
        st_what = Experiencemap[whose].s_what;
        start_time = Experiencemap[whose].start_timestamp;
        end_time = Experiencemap[whose].end_timestamp;
        verified = Experiencemap[whose].isverified;
    }

    function verifyEducation(
        address whose
    ) public onlyRole(INSTITUTION) returns (bool) {
        require(Educationmap[whose].a_where == msg.sender);
        Educationmap[whose].isverified = true;
        return true;
    }

    function verifyWork(
        address whose
    ) public onlyRole(INSTITUTION) returns (bool) {
        require(Workmap[whose].a_where == msg.sender);
        Workmap[whose].isverified = true;
        return true;
    }

    function verifyExperience(
        address whose
    ) public onlyRole(INSTITUTION) returns (bool) {
        require(Experiencemap[whose].a_where == msg.sender);
        Experiencemap[whose].isverified = true;
        return true;
    }
}
